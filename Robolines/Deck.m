//
//  Deck.m
//  Robolines
//
//  Created by Benjamin Wishart on 2013-09-23.
//  Copyright (c) 2013 Benjamin Wishart. All rights reserved.
//

#import "Deck.h"


@implementation Deck

@synthesize cards;
@synthesize delegate;

-(id) init
{
    if (self = [super init])
    {
        cards = [[NSMutableArray alloc] init];
        [self parseDeckFile];
        [self shuffle];
        return self;
    }
    return nil;
}

-(void) parseDeckFile
{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"Cards" ofType:@"xml"];
    NSData *data = [[NSData alloc] initWithContentsOfFile:path];
    
    parser = [[NSXMLParser alloc] initWithData:data];
    [parser setDelegate:self];

    [parser parse];
}

-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict
{
    if ([elementName isEqualToString:@"card"])
    {
        //starting the card
        if (tempCard == nil)
            tempCard = [[Card alloc] init];
    }
    else if ([elementName isEqualToString:@"actions"])
    {
        if (cardActions == nil) {
            cardActions = [[NSMutableArray alloc] init];
        }
        
    }
    else if ([elementName isEqualToString:@"action"])
    {

    }
    else if ([elementName isEqualToString:@"parts"])
    {
        if (parts == nil) {
            parts = [[NSMutableArray alloc] init];
        }
        
    }
    
    element = [NSMutableString string];
}

-(void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
    elementName = [elementName stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    element = [NSMutableString stringWithString:[element stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]]];
    
    if ([elementName isEqualToString:@"card"])
    {
        //ending the card
        for (int i = 0; i < quantity; i++)
            [self addCard:tempCard];
        
        tempCard = nil;
    }
    else if ([elementName isEqualToString:@"title"])
    {
        
    }
    else if ([elementName isEqualToString:@"quantity"])
    {
        quantity = [element intValue];
    }
    else if ([elementName isEqualToString:@"imagename"])
    {

    }
    else if ([elementName isEqualToString:@"action"])
    {

    }
    else if ([elementName isEqualToString:@"actions"])
    {
        cardActions = nil;
    }
    else if ([elementName isEqualToString:@"type"])
    {

    }
    else if ([elementName isEqualToString:@"number"])
    {

    }
    else if ([elementName isEqualToString:@"parts"])
    {
        parts = nil;
    }
    else if ([elementName isEqualToString:@"part"])
    {
        [parts addObject:element];
    }

}

-(void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string
{
    if (element == nil)
    {
        element = [[NSMutableString alloc] init];
    }
    
    [element appendString:string];
    
}

-(void) addCard: (Card *) card
{
    [cards addObject: card];
}

-(void) shuffle
{    
    int cardsLength = cards.count;
    
    for (int i = cardsLength - 1; i > 0; i--) {
        [cards exchangeObjectAtIndex:(arc4random_uniform(cardsLength - 1))
                  withObjectAtIndex:i];
    }
}

-(Card *) draw
{
    Card *card = [cards lastObject];
    [cards removeLastObject];
    return card;
}

@end
