//
//  FrameModalViewController.m
//  Robolines
//
//  Created by Benjamin Wishart on 2013-05-17.
//  Copyright (c) 2013 Benjamin Wishart. All rights reserved.
//

#import "FrameModalViewController.h"

@interface FrameModalViewController ()

@end

@implementation FrameModalViewController

@synthesize headButton;
@synthesize leftLegButton;
@synthesize leftArmButton;
@synthesize rightLegButton;
@synthesize rightArmButton;

@synthesize state;
@synthesize firstPart;
@synthesize secondPart;
@synthesize selectedPart;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    hasPickedFirstPart = NO;
    
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    [self setHeadButton:nil];
    [self setRightArmButton:nil];
    [self setLeftArmButton:nil];
    [self setRightLegButton:nil];
    [self setLeftLegButton:nil];
    [super viewDidUnload];
}

- (IBAction)partButtonPress:(id)sender {
    NSNumber *part;
    
    if ((UIButton *)sender == headButton)
    {
        part = [NSNumber numberWithInt:BLUE];
    }
    else if ((UIButton *)sender == leftArmButton)
    {
        part = [NSNumber numberWithInt:RED];
    }
    else if ((UIButton *)sender == leftLegButton)
    {
        part = [NSNumber numberWithInt:YELLOW];
    }
    else if ((UIButton *)sender == rightArmButton)
    {
        part = [NSNumber numberWithInt:GREEN];
    }
    else if ((UIButton *)sender == rightLegButton)
    {
        part = [NSNumber numberWithInt:PURPLE];
    }
    
    if (state == [NSNumber numberWithInt:SWAP])
    {
        [self selectPartForSwap:part];
    }
    else if (state == [NSNumber numberWithInt:ADD] || [NSNumber numberWithInt:REMOVE])
    {
        selectedPart = part;
    }
}

-(void)selectPartForSwap: (NSNumber *)part
{
    if (hasPickedFirstPart)
    {
        firstPart = part;
    }
    else if (!hasPickedFirstPart)
    {
        if (firstPart == part)
        {
            hasPickedFirstPart = NO;
        }
        else
        {
            secondPart = part;
            
        }
    }
}

@end
