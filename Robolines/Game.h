//
//  Game.h
//  Robolines
//
//  Created by Benjamin Wishart on 2012-08-29.
//  Copyright (c) 2012 Benjamin Wishart. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Player.h"
#import "Board.h"
#import "Deck.h"

#define STARTING_HAND_SIZE  5

@interface Game : NSObject
{
    int numberOfPlayers;
}

-(id)initWithRandomStartPlayerAndPlayerArray: (NSArray *)playerArray;

-(id)initWithPlayerArray: (NSArray *)playerArray startingWithPlayerAtIndex: (int)startingPlayerIndex;

-(void)rotateCurrentPlayer;

-(int)getIndexOfWinningPlayer;

-(BOOL)setCurrentPlayerByIndex: (int)index;

-(BOOL)addCard: (Card *) card toSpaceInRow: (int) row andColumn: (int) column;

-(void)drawCardForPlayer:(Player *)player;

-(NSMutableArray *)drawNumberOfCards: (int)numberOfCardsToDraw;

@property (nonatomic, retain) NSArray *players;
@property (nonatomic, retain) Board *board;
@property (nonatomic, retain) Deck *deck;
@property (nonatomic, retain, readonly) Player *currentPlayer;

@end
