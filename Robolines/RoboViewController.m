//
//  RoboViewController.m
//  Robolines
//
//  Created by Benjamin Wishart on 2012-08-12.
//  Copyright (c) 2012 Benjamin Wishart. All rights reserved.
//

#import "RoboViewController.h"

@interface RoboViewController ()

@end

@implementation RoboViewController

- (IBAction)New:(id)sender {
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.navigationController.navigationBar.hidden = true;
    
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return YES;
}

@end
