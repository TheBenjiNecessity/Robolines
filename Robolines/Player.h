//
//  Player.h
//  Robolines
//
//  Created by Benjamin Wishart on 2012-08-28.
//  Copyright (c) 2012 Benjamin Wishart. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"
#define MAX_NUM_ROBOT_PARTS     15

typedef enum {
    HUMAN,
    COMPUTER,
    NONE
}types;

@interface Player : NSObject

-(id)initWithColor: (int)col title: (NSString *)title;
-(void)print;
-(void)removeCardFromHandAtIndex: (NSUInteger)index;
-(void)addToHandCard:(Card *)card;

@property (nonatomic, readonly) NSString *name;
@property (nonatomic, readwrite) int numberOfPartsLeft;
@property (nonatomic, readonly) int color;
@property (nonatomic) NSMutableArray *hand;

@end
