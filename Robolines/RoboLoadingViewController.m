//
//  RoboLoadingViewController.m
//  Robolines
//
//  Created by Benjamin Wishart on 2015-01-27.
//  Copyright (c) 2015 Benjamin Wishart. All rights reserved.
//

#import "RoboLoadingViewController.h"

@interface RoboLoadingViewController ()

@end

@implementation RoboLoadingViewController

- (void) viewWillAppear:(BOOL)animated {
    [self.view.layer setCornerRadius:15.0];
    [self.view setAlpha:0.5];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
