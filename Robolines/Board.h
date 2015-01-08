//
//  Board.h
//  Robolines
//
//  Created by Benjamin Wishart on 2012-10-05.
//  Copyright (c) 2012 Benjamin Wishart. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Space.h"
#import "CardAction.h"

#define NUM_ROWS        4
#define NUM_COLUMNS     8

@interface Board : NSObject
{
    NSMutableArray *columns;
    NSMutableArray *framesRow;
}

-(id)init;

-(BOOL)addCard:(Card *)newCard Row: (int) row Column: (int) column;

-(BOOL)addFrame:(Card *)newFrame Column: (int) column;

-(BOOL)moveCardAtRow:(int)oldRow Column:(int)oldCol toRow:(int)newRow toColumn:(int)newCol;

-(Card *)removeCardAtRow:(int)row Column:(int)col;

-(BOOL)hasCardAtRow:(int)row Column:(int)col;

-(BOOL)hasFrameAtColumn:(int)col;

-(Card *)getCardAtRow:(int)row Column:(int)col;

-(Card *)getFrameAtColumn:(int)column;

-(BOOL)addPart:(NSNumber *)part toFrameAtColumn:(int)column;

-(BOOL)removePart:(NSNumber *)part toFrameAtColumn:(int)column;

-(BOOL)frameisFullAtColumn:(int)column;

-(BOOL)frameAtColumn:(int)column hasPart:(NSNumber *)part;

@end
