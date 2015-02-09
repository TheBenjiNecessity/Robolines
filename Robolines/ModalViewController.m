//
//  ModalViewController.m
//  Robolines
//
//  Created by Benjamin Wishart on 2013-06-03.
//  Copyright (c) 2013 Benjamin Wishart. All rights reserved.
//

#import "ModalViewController.h"

@interface ModalViewController ()

@end

@implementation ModalViewController

@synthesize isOut;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil superView:(UIView *)superview state:(NSNumber *)modalState
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        state = modalState;
        [superview addSubview:self.view];
        isOut = NO;
    }
    return self;
}

- (void)animateInFromSide:(NSNumber *)side
{
    [self setPositionOfMainViewToCenterOfSide:side];
    
    [UIView animateWithDuration:ANIMATION_DURATION animations:^{
        [self.view setFrame:CGRectMake((screenWidth - viewWidth)/2, (screenHeight - viewHeight)/2, viewWidth, viewHeight)];
    } completion:^ (BOOL finished){
        isOut = YES;
    }];
}

- (void)animateOutToSide:(NSNumber *)side
{
    [UIView animateWithDuration:ANIMATION_DURATION animations:^{
        [self setPositionOfMainViewToCenterOfSide:side];
    } completion:^ (BOOL finished){
        isOut = NO;
    }];
}

-(void)fadeIn
{
    [self.view setAlpha:0.0];
    [self.view setFrame:CGRectMake((screenWidth - viewWidth)/2, (screenHeight - viewHeight)/2, viewWidth, viewHeight)];
    
    [UIView animateWithDuration:ANIMATION_DURATION animations:^{
        [self.view setAlpha:1.0];
    } completion:^ (BOOL finished){
        isOut = YES;
    }];
}

-(void)fadeOut
{
    [UIView animateWithDuration:ANIMATION_DURATION animations:^{
        [self.view setAlpha:0.0];
    } completion:^ (BOOL finished){
        isOut = NO;
    }];
}

-(void)appear
{
    [self.view setFrame:CGRectMake((screenWidth - viewWidth)/2, (screenHeight - viewHeight)/2, viewWidth, viewHeight)];
    [self.view setAlpha:1.0];
    isOut = YES;
}

-(void)disappear
{
    [self.view setAlpha:0.0];
    isOut = NO;
}

-(void)setPositionOfMainViewToCenterOfSide:(NSNumber *)side
{
    CGPoint offSideOrigin;
    
    if (side == [NSNumber numberWithInt:TOP])
    {
        offSideOrigin = CGPointMake((screenWidth - viewWidth)/2, (0 - viewHeight) - VIEW_OFFSET_BUFFER);
    }
    else if (side == [NSNumber numberWithInt:RIGHT])
    {
        offSideOrigin = CGPointMake(screenWidth + VIEW_OFFSET_BUFFER, (screenHeight - viewHeight)/2);
    }
    else if (side == [NSNumber numberWithInt:BOTTOM])
    {
        offSideOrigin = CGPointMake((screenWidth - viewWidth)/2, screenHeight + viewHeight + VIEW_OFFSET_BUFFER);
    }
    else if (side == [NSNumber numberWithInt:LEFT])
    {
        offSideOrigin = CGPointMake((0 - viewWidth) - VIEW_OFFSET_BUFFER, (screenHeight - viewHeight)/2);
    }
    
    [self.view setFrame:CGRectMake(offSideOrigin.x, offSideOrigin.y, viewWidth, viewHeight)];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    screenHeight = [UIScreen mainScreen].bounds.size.height;
    screenWidth = [UIScreen mainScreen].bounds.size.width;
    
    viewHeight = self.view.frame.size.height;
    viewWidth = self.view.frame.size.width;
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
