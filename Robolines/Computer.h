//
//  Computer.h
//  Robolines
//
//  Created by Benjamin Wishart on 2012-09-02.
//  Copyright (c) 2012 Benjamin Wishart. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Player.h"

#define MAX_DIFFICULTY  3

@interface Computer : Player
{
    int difficulty;
}

-(id)initWithColor: (int)col difficulty: (int)diff title: (NSString *)title;


@property (nonatomic, readonly) int difficulty;

@end
