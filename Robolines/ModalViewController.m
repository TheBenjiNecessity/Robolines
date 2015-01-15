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
    CGFloat screenHeight = [UIScreen mainScreen].bounds.size.height;
    CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
    
    CGFloat viewHeight = self.view.frame.size.height;
    CGFloat viewWidth = self.view.frame.size.width;
    
    //CGPoint screenCenter = CGPointMake(screenWidth/2, screenHeight/2);
    
    [self setPositionOfMainViewToCenterOfSide:side];
    
    [UIView animateWithDuration:ANIMATION_DURATION animations:^{
        [self.view setFrame:CGRectMake((screenWidth - viewWidth)/2, (screenHeight - viewHeight)/2, viewWidth, viewHeight)];
        //[self.view setCenter:screenCenter];
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
    CGFloat screenHeight = [UIScreen mainScreen].bounds.size.height;
    CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
    
    CGFloat viewHeight = self.view.frame.size.height;
    CGFloat viewWidth = self.view.frame.size.width;
    
    //CGPoint screenCenter = CGPointMake(screenWidth/2, screenHeight/2);
    
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
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
