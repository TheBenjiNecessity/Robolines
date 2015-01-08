//
//  ModalViewController.h
//  Robolines
//
//  Created by Benjamin Wishart on 2013-06-03.
//  Copyright (c) 2013 Benjamin Wishart. All rights reserved.
//

#import <UIKit/UIKit.h>

#define VIEW_OFFSET_BUFFER          100
#define ANIMATION_DURATION          0.25

typedef enum
{
    TOP, RIGHT, BOTTOM, LEFT
}LoadDirection;

@interface ModalViewController : UIViewController
{
    NSNumber *state;
}

@property (nonatomic, readonly) BOOL isOut;
@property (nonatomic, readonly) LoadDirection direction;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil superView:(UIView *)superview state: (NSNumber *)modalState;

- (void)animateInFromSide:(NSNumber *)side;

- (void)animateOutToSide:(NSNumber *)side;
//@property (nonatomic) NSNumber *state;

@end
