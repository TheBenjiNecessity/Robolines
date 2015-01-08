//
//  Player.m
//  Robolines
//
//  Created by Benjamin Wishart on 2012-08-28.
//  Copyright (c) 2012 Benjamin Wishart. All rights reserved.
//

#import "Player.h"

@implementation Player

@synthesize name;
@synthesize numberOfPartsLeft;
@synthesize color;
@synthesize hand;

-(id)initWithColor: (int)col title:(NSString *)title
{
    if (self = [super init])
    {
        numberOfPartsLeft = MAX_NUM_ROBOT_PARTS;
        name = title;
        color = col;
        return self;
    }
    
    return nil;
}

-(void)print
{
    for(Card *card in hand)
    {
//        NSLog(@"Card: %@ image file: %@", [card title], [card imageFileName]);
//        for (CardAction *cardAction in [card cardActions])
//        {
//            NSLog(@"Action - type: %d", cardAction.type);
//        }
    }
}

-(void)removeCardFromHandAtIndex: (NSUInteger)index
{
    [hand removeObjectAtIndex:index];
}

-(void)addToHandCard:(Card *)card
{
    [hand addObject:card];
}

@end
