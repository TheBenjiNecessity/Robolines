//
//  NewGameOptionsViewController.h
//  Robolines
//
//  Created by Benjamin Wishart on 2012-08-26.
//  Copyright (c) 2012 Benjamin Wishart. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RoboAppDelegate.h"
#import "Player.h"
#import "Computer.h"
#import "Game.h"
#import "GameViewController.h"
#import "RoboPlayerCreatorViewController.h"

@interface NewGameOptionsViewController : UIViewController <RoboPlayerCreatorDelegate>
{
    RoboPlayerCreatorViewController *roboPlayerCreator1;
    RoboPlayerCreatorViewController *roboPlayerCreator2;
    RoboPlayerCreatorViewController *roboPlayerCreator3;
    RoboPlayerCreatorViewController *roboPlayerCreator4;
}

@property (strong, nonatomic) Game *game;

@property (weak, nonatomic) IBOutlet UISwitch *randomStart;

@end
