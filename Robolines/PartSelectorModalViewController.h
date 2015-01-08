//
//  PartSelectorModalViewController.h
//  Robolines
//
//  Created by Benjamin Wishart on 2013-05-28.
//  Copyright (c) 2013 Benjamin Wishart. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "Card.h"
#import "CardAction.h"
#import "ModalViewController.h"
#import "RoboPartButton.h"

@class PartSelectorModalViewController;
@protocol PartSelectorDelegate <NSObject>

-(void)partWasSelected: (NSMutableArray *)parts;

@end

@interface PartSelectorModalViewController :  ModalViewController
{
    NSMutableArray *partsArray;
    id <PartSelectorDelegate> delegate;
}

@end
