//
//  FrameModalViewController.h
//  Robolines
//
//  Created by Benjamin Wishart on 2013-05-17.
//  Copyright (c) 2013 Benjamin Wishart. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "CardAction.h"

@interface FrameModalViewController : UIViewController
{
    BOOL hasPickedFirstPart;
}

@property (strong, nonatomic) IBOutlet UIButton *headButton;
@property (strong, nonatomic) IBOutlet UIButton *rightArmButton;
@property (strong, nonatomic) IBOutlet UIButton *leftArmButton;
@property (strong, nonatomic) IBOutlet UIButton *rightLegButton;
@property (strong, nonatomic) IBOutlet UIButton *leftLegButton;

@property (nonatomic) NSNumber *state;
@property (nonatomic) NSNumber *firstPart;
@property (nonatomic) NSNumber *secondPart;
@property (nonatomic) NSNumber *selectedPart;

@end
