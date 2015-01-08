//
//  Space.m
//  Robolines
//
//  Created by Benjamin Wishart on 2012-09-30.
//  Copyright (c) 2012 Benjamin Wishart. All rights reserved.
//

#import "Space.h"

@implementation Space

@synthesize card;

-(BOOL)hasCard
{
    return (card != nil);
}

-(BOOL)addCard: (Card *) c
{
    if (![self hasCard])
    {
        card = c;
        return true;
    }
    return false;
}

-(Card *)removeCard
{
    Card *cardToReturn;
    cardToReturn = card;
    card = nil;
    return cardToReturn;
}

@end
