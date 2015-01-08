//
//  MoveNumberModalViewController.m
//  Robolines
//
//  Created by Benjamin Wishart on 2013-06-08.
//  Copyright (c) 2013 Benjamin Wishart. All rights reserved.
//

#import "MoveNumberModalViewController.h"

@interface MoveNumberModalViewController ()

@end

@implementation MoveNumberModalViewController

@synthesize plusOneButton;
@synthesize plusThreeButton;
@synthesize plusTwoButton;
@synthesize minusOneButton;
@synthesize minusThreeButton;
@synthesize minusTwoButton;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil superview:(UIView *)superview state: (NSNumber *) modalState
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil superView:superview state:modalState];
    if (self) {
        // Custom initialization
    }
    return self;
}
- (IBAction)moveButtonPress:(id)sender {
    int number_of_spaces_to_move = 0;
    if ((UIButton *)sender == plusThreeButton)
    {
        number_of_spaces_to_move = 3;
    }
    else if ((UIButton *)sender == plusTwoButton)
    {
        number_of_spaces_to_move = 2;
    }
    else if ((UIButton *)sender == plusOneButton)
    {
        number_of_spaces_to_move = 1;
    }
    else if ((UIButton *)sender == minusThreeButton)
    {
        number_of_spaces_to_move = -3;
    }
    else if ((UIButton *)sender == minusTwoButton)
    {
        number_of_spaces_to_move = -2;
    }
    else if ((UIButton *)sender == minusOneButton)
    {
        number_of_spaces_to_move = -1;
    }
    
    [delegate numberWasSelected:number_of_spaces_to_move];
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

- (void)viewDidUnload {
    [self setPlusThreeButton:nil];
    [self setPlusTwoButton:nil];
    [self setPlusOneButton:nil];
    [self setMinusOneButton:nil];
    [self setMinusTwoButton:nil];
    [self setMinusThreeButton:nil];
    [super viewDidUnload];
}
@end
