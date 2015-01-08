//
//  CardAction.m
//  Robolines
//
//  Created by Benjamin Wishart on 2012-10-14.
//  Copyright (c) 2012 Benjamin Wishart. All rights reserved.
//

#import "CardAction.h"

@implementation CardAction

//@synthesize type;
@synthesize number;
@synthesize parts;
@synthesize needsInteraction;

+(int)getTypeForStringType:(NSString *)type
{
    if ([type isEqualToString:@"Add"])
    {
        return ADD;
    }
    else if ([type isEqualToString:@"Remove"])
    {
        return REMOVE;
    }
    else if ([type isEqualToString:@"Move"])
    {
        return MOVE;
    }
    else if ([type isEqualToString:@"Draw"])
    {
        return DRAW;
    }
    else if ([type isEqualToString:@"Swap"])
    {
        return SWAP;
    }
    else if ([type isEqualToString:@"Play"])
    {
        return PLAY;
    }
    else if ([type isEqualToString:@"Peek"])
    {
        return PEEK;
    }
    else if ([type isEqualToString:@"Frame"])
    {
        return FRAME;
    }
    else
    {
        return -1;
    }
}

+(NSNumber *)getEnumForStringColor:(NSString *)color
{
    if ([color isEqualToString:@"Red"])
    {
        return [NSNumber numberWithInt:RED];
    }
    else if ([color isEqualToString:@"Blue"])
    {
        return [NSNumber numberWithInt:BLUE];
    }
    else if ([color isEqualToString:@"Yellow"])
    {
        return [NSNumber numberWithInt:YELLOW];
    }
    else if ([color isEqualToString:@"Green"])
    {
        return [NSNumber numberWithInt:GREEN];
    }
    else if ([color isEqualToString:@"Purple"])
    {
        return [NSNumber numberWithInt:PURPLE];
    }
    else if ([color isEqualToString:@"Wild"])
    {
        return [NSNumber numberWithInt:WILD];
    }
    
    return nil;
}

@end
