//
//  Computer.m
//  Robolines
//
//  Created by Benjamin Wishart on 2012-09-02.
//  Copyright (c) 2012 Benjamin Wishart. All rights reserved.
//

#import "Computer.h"

@implementation Computer

-(id)initWithColor:(int)col difficulty:(int)diff title:(NSString *)title
{
    if (self = [super initWithColor:col title:title])
    {
        difficulty = diff;
        return self;
    }
    return nil;
}

@synthesize difficulty;

@end
