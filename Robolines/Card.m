//
//  Card.m
//  Robolines
//
//  Created by Benjamin Wishart on 2012-09-23.
//  Copyright (c) 2012 Benjamin Wishart. All rights reserved.
//

#import "Card.h"

@implementation Card
@synthesize filename;

-(id)initWithImageFileName:(NSString *)fname
{
    if (self = [super init])
    {
        filename = fname;
        return self;
    }
    
    return nil;
}

@end
