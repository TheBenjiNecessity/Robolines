//
//  Deck.h
//  Robolines
//
//  Created by Benjamin Wishart on 2013-09-23.
//  Copyright (c) 2013 Benjamin Wishart. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@class Deck;
@protocol DeckDelegate <NSObject>

-(void)dealCard:(Deck *)sender;

@end

@interface Deck : NSObject <NSXMLParserDelegate>
{
    NSXMLParser *parser;
    NSMutableString *element;
    NSMutableArray *cardActions;
    NSMutableArray *parts;

    Card *tempCard;
    int quantity;
    
    id <DeckDelegate> delegate;
}

-(id) init;
-(void) shuffle;
-(void) parseDeckFile;

-(void) addCard: (Card *) card;
-(Card *) draw;

@property (nonatomic, retain, readwrite) NSMutableArray *cards;
@property (nonatomic, strong) id delegate;

@end
