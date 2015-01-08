//
//  NextPlayerViewController.h
//  Robolines
//
//  Created by Benjamin Wishart on 2014-06-13.
//  Copyright (c) 2014 Benjamin Wishart. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ModalViewController.h"

@class NextPlayerViewController;
@protocol NextPlayerDelegate <NSObject>

-(void)okayButtonWasTapped:(NextPlayerViewController *)sender;

@end

@interface NextPlayerViewController : ModalViewController
{
    id <NextPlayerDelegate> delegate;
}

@property (nonatomic, strong) id delegate;

-(void)animateIn;

-(void)animateOut;

@end
