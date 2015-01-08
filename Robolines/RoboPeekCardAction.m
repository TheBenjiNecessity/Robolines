//
//  RoboPeekCardAction.m
//  Robolines
//
//  Created by Benjamin Wishart on 2014-08-31.
//  Copyright (c) 2014 Benjamin Wishart. All rights reserved.
//

#import "RoboPeekCardAction.h"

@implementation RoboPeekCardAction

-(id)init
{
    if (self == [super init])
    {
        type = [NSNumber numberWithInt:PEEK];
        
        return self;
    }
    
    return nil;
}

@end
