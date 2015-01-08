//
//  NextPlayerViewController.m
//  Robolines
//
//  Created by Benjamin Wishart on 2014-06-13.
//  Copyright (c) 2014 Benjamin Wishart. All rights reserved.
//

#import "NextPlayerViewController.h"

@interface NextPlayerViewController ()

@end

@implementation NextPlayerViewController

@synthesize delegate;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil superview:(UIView *)superview state: (NSNumber *) modalState
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil superView:superview state:modalState];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (IBAction)okayButton:(id)sender {
    [self animateOut];
    //[delegate okayButtonWasTapped:self];
}

-(void)animateIn
{
    [self animateInFromSide:[NSNumber numberWithInt:RIGHT]];
}

-(void)animateOut
{
    [self animateOutToSide:[NSNumber numberWithInt:LEFT]];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
