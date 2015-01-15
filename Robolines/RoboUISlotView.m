//
//  RoboUISlotView.m
//  Robolines
//
//  Created by Benjamin Wishart on 2015-01-14.
//  Copyright (c) 2015 Benjamin Wishart. All rights reserved.
//

#import "RoboUISlotView.h"

@implementation RoboUISlotView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code

    }
    return self;
}

+(UIImage *)cardBackImage
{
    UIImage *cardBack = nil;
    
    if (cardBack == nil)
    {
        //cardBack = [UIImage imageWithContentsOfFile:@"card_cardBack.png"];
        
        NSString *path = [[NSBundle mainBundle] pathForResource:@"card_cardBack" ofType:@"png"];
        
        NSData *data = [NSData dataWithContentsOfFile:path];
        
        cardBack = [UIImage imageWithData:data];
    }
    
    return cardBack;
}

+(UIImage *)cardSlotImage
{
    UIImage *cardSlot = nil;
    
    if (cardSlot == nil)
    {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"card_cardSlot" ofType:@"png"];
        
        NSData *data = [NSData dataWithContentsOfFile:path];
        
        cardSlot = [UIImage imageWithData:data];
    }
    
    return cardSlot;
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
