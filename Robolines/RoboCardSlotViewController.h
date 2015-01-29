//
//  RoboCardSlotViewController.h
//  Robolines
//
//  Created by Benjamin Wishart on 2015-01-29.
//  Copyright (c) 2015 Benjamin Wishart. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CardView.h"

@interface RoboCardSlotViewController : UIViewController
{
    Card *slot;
    CGPoint *position;
    int column;
    int row;
    BOOL isFrame;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil;

@end
