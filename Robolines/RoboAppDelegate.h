//
//  RoboAppDelegate.h
//  Robolines
//
//  Created by Benjamin Wishart on 2012-08-12.
//  Copyright (c) 2012 Benjamin Wishart. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Game.h"

@interface RoboAppDelegate : UIResponder <UIApplicationDelegate>
{
    //Game *game;
}

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) Game *game;

@end
