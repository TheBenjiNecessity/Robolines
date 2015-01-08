//
//  Board.m
//  Robolines
//
//  Created by Benjamin Wishart on 2012-10-05.
//  Copyright (c) 2012 Benjamin Wishart. All rights reserved.
//

#import "Board.h"

@implementation Board

-(id)init
{
    if (self = [super init])
    {
        columns = [[NSMutableArray alloc] initWithCapacity:NUM_ROWS];
        for (int r = 0; r < NUM_ROWS; r++)
        {
            NSMutableArray *row = [[NSMutableArray alloc] initWithCapacity:NUM_COLUMNS];
            for (int c = 0; c < NUM_COLUMNS; c++)
            {
                Space *space = [[Space alloc] init];
                [row addObject:space];
            }
            [columns addObject:row];
        }
        framesRow = [[NSMutableArray alloc] initWithCapacity:NUM_COLUMNS];
        for (int f = 0; f < NUM_COLUMNS; f++)
        {
            Space *space = [[Space alloc] init];
            [framesRow addObject:space];
        }
        return self;
    }
    return nil;
}

-(BOOL)hasCardAtRow:(int)row Column:(int)col
{
    return [[[columns objectAtIndex:row] objectAtIndex:col] hasCard];
}

-(BOOL)hasFrameAtColumn:(int)col
{
    return [[framesRow objectAtIndex:col] hasCard];
}

-(BOOL)addFrame:(Card *)newFrame Column:(int)column
{
    //CardAction *frameAction = [newFrame.cardActions objectAtIndex:0];//frames only ever have one action which is of type FRAME
    
//    NSLog(@"%@", newFrame.title);
//    
//    if ([self hasFrameAtColumn:column] || ![newFrame.title isEqualToString:@"Frame"] || column < 3)
//        return false;
//    
    return [[framesRow objectAtIndex:column] addCard:newFrame];
}

-(BOOL)addCard:(Card *)newCard
           Row:(int)row
        Column:(int)column
{
    if (row > 0 && row < 4 && [self hasCardAtRow:row Column:column])
        return false;
    else if (row == -1)
        return [self addFrame:newCard Column:column];
    
//    CardAction *action = [newCard.cardActions objectAtIndex:0];
//    
//    switch (action.type) {
//        case ADD:
//            if ((action.parts.count == 3 && column < 5) || (action.parts.count == 2 && column < 3))
//                return false;
//            break;
//        case FRAME:
//            if (row != -1)
//                return false;
//            else
//                return [self addFrame:newCard Column:column];
//        case REMOVE:
//            break;
//        default://every other card that isn't an add, remove, or frame card
//            if ([self hasFrameAtColumn:column])
//                return false;
//            break;
//    }
    
    return [[[columns objectAtIndex:row] objectAtIndex:column] addCard: newCard];
}

-(Card *)getCardAtRow:(int)row Column:(int)col
{
    return [[[columns objectAtIndex:row] objectAtIndex:col] card];
}

-(Card *)getFrameAtColumn:(int)column
{
    return [framesRow objectAtIndex:column];
}

-(Card *)removeCardAtRow:(int)row Column:(int)col
{
    return [[[columns objectAtIndex:row] objectAtIndex:col] removeCard];
}

-(BOOL)moveCardAtRow:(int)oldRow Column:(int)oldCol toRow:(int)newRow toColumn:(int)newCol
{
    if (![self hasCardAtRow:newRow Column:newCol])
    {
        if ([self hasCardAtRow:oldRow Column:oldCol])
        {
            [self addCard:[self removeCardAtRow:oldRow Column:oldCol] Row:newRow Column:newCol];
            return true;
        }
        else
            return false;
    }
    return false;
}

-(BOOL)addPart:(NSNumber *)part toFrameAtColumn:(int)column
{
    return [self hasFrameAtColumn:column] && [[framesRow objectAtIndex:column] addPart:part];
}

-(BOOL)removePart:(NSNumber *)part toFrameAtColumn:(int)column
{
    return [self hasFrameAtColumn:column] && [[framesRow objectAtIndex:column] removePart:part];
}

-(BOOL)frameisFullAtColumn:(int)column
{
    Card *card = [[framesRow objectAtIndex:column] card];
    return nil;
    //return [card isFull];
}

-(BOOL)frameAtColumn:(int)column hasPart:(NSNumber *)part
{
    if (![self hasFrameAtColumn:column])
        return false;
    
    Card *frame = [framesRow objectAtIndex:column];
    return nil;
    //return [frame hasPart:part];
}

@end







