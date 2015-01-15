//
//  Card.m
//  Robolines
//
//  Created by Benjamin Wishart on 2012-09-23.
//  Copyright (c) 2012 Benjamin Wishart. All rights reserved.
//

#import "Card.h"

@implementation Card

-(id)initWithImageFileName:(NSString *)filename
{
    if (self = [super init])
    {
        _filename = filename;
        return self;
    }
    
    return nil;
}

+(UIImage *)cardBackImage
{
    UIImage *cardBack = nil;
    
    if (cardBack == nil)
    {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"card_cardBack" ofType:@"png"];
        
        NSData *data = [NSData dataWithContentsOfFile:path];
        
        cardBack = [UIImage imageWithData:data];
    }
    
    return cardBack;
}

-(UIImage *)cardFrontImage
{
    if (cardImage == nil)
    {
        NSString *path = [[NSBundle mainBundle] pathForResource:_filename ofType:@"png"];
        
        NSData *data = [NSData dataWithContentsOfFile:path];
        
        cardImage = [UIImage imageWithData:data];
    }
    
    return cardImage;
}

@end
