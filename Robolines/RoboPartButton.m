//
//  RoboPartButton.m
//  Robolines
//
//  Created by Benjamin Wishart on 2014-04-18.
//  Copyright (c) 2014 Benjamin Wishart. All rights reserved.
//

#import "RoboPartButton.h"

@implementation RoboPartButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        selectedBackgroundImage = [[UIImage alloc] initWithContentsOfFile:@"selectedPartBackgroundImage.png"];
        isSelected = NO;
    }
    return self;
}

- (void)setPartAsSelected:(BOOL)selected
{
    isSelected = selected;
    if (selected)
    {
        [self setBackgroundImage:selectedBackgroundImage forState:UIControlStateNormal];
    }
    else
    {
        [self setBackgroundImage:nil forState:UIControlStateNormal];
    }
}

- (BOOL)isSelected
{
    return isSelected;
}

-(void)setPartType:(NSNumber *)partType
{
    if(_partType == nil)
        _partType = partType;
}

@end
