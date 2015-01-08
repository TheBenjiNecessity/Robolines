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
    }
    return self;
}

- (void)animateInFromSide:(NSNumber *)side
{
    CGFloat screenHeight = [UIScreen mainScreen].bounds.size.width;
    CGFloat screenWidth = [UIScreen mainScreen].bounds.size.height;
    
    CGPoint screenCenter = CGPointMake(screenWidth/2, screenHeight/2);
    
    [self setPositionOfMainViewToCenterOfSide:side];
    
    [UIView animateWithDuration:ANIMATION_DURATION animations:^{
        [self.view setCenter:screenCenter];
//        [self.view setFrame:CGRectMake(512 - (self.view.frame.size.width / 2), 384 - (self.view.frame.size.height / 2), self.view.frame.size.width, self.view.frame.size.height)];
    } completion:^ (BOOL finished){
        isOut = YES;
    }];
}

- (void)animateOutToSide:(NSNumber *)side
{
    [UIView animateWithDuration:ANIMATION_DURATION animations:^{
        [self setPositionOfMainViewToCenterOfSide:side];
//        [self.view setFrame:CGRectMake(512 - (self.view.frame.size.width / 2), 770, self.view.frame.size.width, self.view.frame.size.height)];
    } completion:^ (BOOL finished){
        isOut = NO;
    }];
}

-(void)setPositionOfMainViewToCenterOfSide:(NSNumber *)side
{
    CGFloat screenHeight = [UIScreen mainScreen].bounds.size.width;
    CGFloat screenWidth = [UIScreen mainScreen].bounds.size.height;
    
    CGPoint screenCenter = CGPointMake(screenWidth/2, screenHeight/2);
    
    CGPoint offSideCenterPoint;
    
    if (side == [NSNumber numberWithInt:TOP])
    {
        offSideCenterPoint = CGPointMake(screenCenter.x, (0 - self.view.frame.size.height) - VIEW_OFFSET_BUFFER);
    }
    else if (side == [NSNumber numberWithInt:RIGHT])
    {
        offSideCenterPoint = CGPointMake(screenWidth + self.view.frame.size.width + VIEW_OFFSET_BUFFER, screenCenter.y);
    }
    else if (side == [NSNumber numberWithInt:BOTTOM])
    {
        offSideCenterPoint = CGPointMake(screenCenter.x, screenHeight + self.view.frame.size.height + VIEW_OFFSET_BUFFER);
    }
    else if (side == [NSNumber numberWithInt:LEFT])
    {
        offSideCenterPoint = CGPointMake((0 - self.view.frame.size.width) - VIEW_OFFSET_BUFFER, screenCenter.y);
    }
    
    [self.view setCenter:offSideCenterPoint];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
