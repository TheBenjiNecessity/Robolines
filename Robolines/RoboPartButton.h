//
//  RoboPartButton.h
//  Robolines
//
//  Created by Benjamin Wishart on 2014-04-18.
//  Copyright (c) 2014 Benjamin Wishart. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RoboPartButton : UIButton
{
    UIImage *selectedBackgroundImage;
    BOOL isSelected;
}

@property (nonatomic) NSNumber *partType;

- (void)setPartAsSelected:(BOOL)selected;
- (void)setPartType:(NSNumber *)partType;

@end
