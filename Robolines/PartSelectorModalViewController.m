//
//  PartSelectorModalViewController.m
//  Robolines
//
//  Created by Benjamin Wishart on 2013-05-28.
//  Copyright (c) 2013 Benjamin Wishart. All rights reserved.
//

#import "PartSelectorModalViewController.h"


@interface PartSelectorModalViewController ()

@end

@implementation PartSelectorModalViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil superview:(UIView *)superview state: (NSNumber *) modalState
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil superView:superview state:modalState];
    if (self) {
        // Custom initialization
        partsArray = [[NSMutableArray alloc] init];
    }
    return self;
}

- (IBAction)partButtonPress:(id)sender {
    RoboPartButton *button = (RoboPartButton *)sender;
    NSNumber *part = [button partType];
    
    if (state == [NSNumber numberWithInt:SWAP] && partsArray.count == 1 && [partsArray objectAtIndex:0] == part)
    {
        //deselect the button]
        [partsArray removeAllObjects];
        [button setPartAsSelected:NO];
    }
    else
    {
        [partsArray addObject:part];
    }
    
    if ((state == [NSNumber numberWithInt:SWAP] && [partsArray count] >= 2) || (state == [NSNumber numberWithInt:ADD] || state == [NSNumber numberWithInt:REMOVE]))
    {
        [delegate partWasSelected:partsArray];
    }
    else
    {
        //highlight button that was selected
        [button setPartAsSelected:YES];
    }
}

- (void)setState:(NSNumber *)s
{
    state = s;
    NSString *message;
    switch ([state integerValue]) {
        case SWAP:
            message = @"Select two parts to swap.";
            break;
        case ADD:
            message = @"Select one part to add.";
            break;
        case REMOVE:
            message = @"Select one part to remove.";
            break;
        default:
            message = @"improper state for part selector.";
            break;
    }
    [self setHelperLabelText:message];
}

-(void)setHelperLabelText:(NSString *)text
{
    UILabel *helperLabel = (UILabel *)[self.view viewWithTag:100];
    
    [helperLabel setText:text];
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
    [super viewDidUnload];
}
@end
