//
//  CardAction.h
//  Robolines
//
//  Created by Benjamin Wishart on 2012-10-14.
//  Copyright (c) 2012 Benjamin Wishart. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum
{
    ADD, REMOVE, SWAP, MOVE, DRAW, PLAY, PEEK, FRAME
}Action;

typedef enum
{
    BLUE, GREEN, PURPLE, YELLOW, RED, WILD
}Part;

@interface CardAction : NSObject
{
    int type;
}

//@property (nonatomic) int type;
@property (nonatomic) int number;
@property (nonatomic) BOOL needsInteraction;
@property (nonatomic) NSMutableArray *parts;
@property (nonatomic, assign) Action actions;



+(int)getTypeForStringType:(NSString *)type;

+(NSNumber *)getEnumForStringColor:(NSString *)color;

@end
