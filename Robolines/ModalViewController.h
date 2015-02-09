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
    
    CGFloat screenHeight;
    CGFloat screenWidth;
    
    CGFloat viewHeight;
    CGFloat viewWidth;
}

@property (nonatomic, readonly) BOOL isOut;
@property (nonatomic, readonly) LoadDirection direction;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil superView:(UIView *)superview state: (NSNumber *)modalState;

/* Appearance methods */
-(void)animateInFromSide:(NSNumber *)side;
-(void)fadeIn;
-(void)appear;

/* Disappearance methods */
-(void)animateOutToSide:(NSNumber *)side;
-(void)fadeOut;
-(void)disappear;

-(void)setPositionOfMainViewToCenterOfSide:(NSNumber *)side;

@end
