//
//  MoveNumberModalViewController.h
//  Robolines
//
//  Created by Benjamin Wishart on 2013-06-08.
//  Copyright (c) 2013 Benjamin Wishart. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ModalViewController.h"

@class MoveNumberModalViewController;
@protocol MoveNumberDelegate <NSObject>

-(void)numberWasSelected: (int)number;

@end

@interface MoveNumberModalViewController : ModalViewController
{
    id <MoveNumberDelegate> delegate;
}

@property (strong, nonatomic) IBOutlet UIButton *plusThreeButton;
@property (strong, nonatomic) IBOutlet UIButton *plusTwoButton;
@property (strong, nonatomic) IBOutlet UIButton *plusOneButton;
@property (strong, nonatomic) IBOutlet UIButton *minusOneButton;
@property (strong, nonatomic) IBOutlet UIButton *minusTwoButton;
@property (strong, nonatomic) IBOutlet UIButton *minusThreeButton;

@end
