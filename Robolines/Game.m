//
//  Game.m
//  Robolines
//
//  Created by Benjamin Wishart on 2012-08-29.
//  Copyright (c) 2012 Benjamin Wishart. All rights reserved.
//

#import "Game.h"

@implementation Game

@synthesize players;
@synthesize board;
@synthesize deck;
@synthesize currentPlayer;

-(id)initWithRandomStartPlayerAndPlayerArray: (NSArray *) playerArray
{
    if (self = [super init])
    {
        [self initWithPlayerArray:playerArray];
        
        while (![self setCurrentPlayerByIndex:(rand() % numberOfPlayers)]);        
        return self;
    }else
        return nil;
}

-(id)initWithPlayerArray:(NSArray *)playerArray startingWithPlayerAtIndex:(int)startingPlayerIndex
{
    if (self = [super init])
    {
        [self initWithPlayerArray:playerArray];
        
        [self setCurrentPlayerByIndex:startingPlayerIndex];
        return self;
    }else
        return nil;
}

-(void)initWithPlayerArray:(NSArray *)playerArray
{
    [self setPlayers:playerArray];
    numberOfPlayers = [playerArray count];
    
    board = [[Board alloc] init];
    deck = [[Deck alloc] init];
    
    for (Player *player in players)
    {
        player.hand = [self drawNumberOfCards:STARTING_HAND_SIZE];
    }
}

-(BOOL)setCurrentPlayerByIndex: (int) index
{
    if (index < 0 || index > numberOfPlayers)
    {
        return NO;
    }
    else
    {
        if ([players objectAtIndex:index] != nil)
        {
            currentPlayer = [players objectAtIndex:index];
            return YES;
        }
        else
        {
            return NO;
        }
    }
}

-(NSMutableArray *)drawNumberOfCards: (int)numberOfCardsToDraw
{
    NSMutableArray *result = [[NSMutableArray alloc] initWithCapacity:numberOfCardsToDraw];
    for (int i = 0; i < numberOfCardsToDraw; i++)
    {
        [result addObject:[deck draw]];
    }
    return result;
}

-(void)drawCardForPlayer:(Player *)player
{
    [player addToHandCard:[deck draw]];
}

-(void)rotateCurrentPlayer
{
    int nextPlayerIndex = ([players indexOfObject:currentPlayer] + 1) % [players count];
    
    while ([players objectAtIndex:nextPlayerIndex] == nil) {
        nextPlayerIndex = (nextPlayerIndex + 1) % [players count];
    }
    
    currentPlayer = [players objectAtIndex:nextPlayerIndex];
    
//    if (currentPlayer == players )
//    {
//        if (playerTwo != nil)
//        {
//            currentPlayer = playerTwo;
//        }
//        else if (playerThree != nil)
//        {
//            currentPlayer = playerThree;
//        }
//        else if (playerFour != nil)
//        {
//            currentPlayer = playerFour;
//        }
//    }
//    else if (currentPlayer == playerTwo)
//    {
//        if (playerThree != nil)
//        {
//            currentPlayer = playerThree;
//        }
//        else if (playerFour != nil)
//        {
//            currentPlayer = playerFour;
//        }
//        else if (playerOne != nil)
//        {
//            currentPlayer = playerOne;
//        }
//    }
//    else if (currentPlayer == playerThree)
//    {
//        if (playerFour != nil)
//        {
//            currentPlayer = playerFour;
//        }
//        else if (playerOne != nil)
//        {
//            currentPlayer = playerOne;
//        }
//        else if (playerTwo != nil)
//        {
//            currentPlayer = playerTwo;
//        }
//    }
//    else if (currentPlayer == playerFour)
//    {
//        if (playerOne != nil)
//        {
//            currentPlayer = playerOne;
//        }
//        else if (playerTwo != nil)
//        {
//            currentPlayer = playerTwo;
//        }
//        else if (playerThree != nil)
//        {
//            currentPlayer = playerThree;
//        }
//    }
}

-(int)getIndexOfWinningPlayer//this would be called every time a frame leaves the track.
{
    // in order to know if a player has won, you need to know:
    //      * if the instance is nil or not
    //      * if the player has 0 or fewer parts
    //      * if all of their parts are off the board.
    //what about tie breakers? What if multiple players lose all of their pieces at the same time?
    //if (playerOne != nil && playerOne.numberOfPartsLeft == 0 && )//
    
    return -1;
}

-(BOOL)addCard:(Card *)card toSpaceInRow:(int)row andColumn:(int)Column
{
    BOOL result = [board addCard:card Row:row Column:Column];
    
    //do something with result
    
    return result;
}


@end
