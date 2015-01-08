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
        cardBack = [UIImage imageWithContentsOfFile:@"card_cardBack.png"];
    }
    
    return cardBack;
}

-(UIImage *)cardFrontImage
{
    if (cardImage == nil)
    {
        cardImage = [UIImage imageWithContentsOfFile:_filename];
    }
    
    return cardImage;
}

@end
