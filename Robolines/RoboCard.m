//
//  RoboCard.m
//  Robolines
//
//  Created by Benjamin Wishart on 2014-08-31.
//  Copyright (c) 2014 Benjamin Wishart. All rights reserved.
//

#import "RoboCard.h"

@implementation RoboCard

//-(id)initWithImageFileName:(NSString *)filename title:(NSString *)t cardActions:(NSArray *)a
//{
//    if (self = [super initWithImageFileName:filename])
//    {
//        return self;
//    }
//    
//    return nil;
//}


-(id)initWithImageFileName:(NSString *)filename
{
    if (self = [super initWithImageFileName:filename])
    {
        return self;
    }
            
    return nil;
}

//-(BOOL)addPart:(NSNumber *)part
//{
//    CardAction *action = [cardActions objectAtIndex:0];
//    if (action.type != FRAME)
//        return NO;
//    
//    for (NSNumber *p in parts)
//    {
//        if (p == part)
//            return NO;
//    }
//    
//    [parts addObject:part];
//    
//    return YES;
//}
//
//
//-(BOOL)removePart:(NSNumber *)part
//{
//    CardAction *action = [cardActions objectAtIndex:0];
//    if (action.type != FRAME)
//        return NO;
//    
//    for (NSNumber *p in parts)
//    {
//        if (p == part)
//            return NO;
//    }
//    
//    [parts removeObject:part];
//    
//    return YES;
//}
//
//
//-(BOOL)hasPart:(NSNumber *)part
//{
//    CardAction *action = [cardActions objectAtIndex:0];
//    if (action.type != FRAME)
//        return YES;
//    
//    for (NSNumber *p in parts)
//    {
//        if (p == part)
//            return YES;
//    }
//    
//    return NO;
//}

+(int)getEnumTypeForStringType:(NSString *)type
{
    return [CardAction getTypeForStringType:type];
}

@end
