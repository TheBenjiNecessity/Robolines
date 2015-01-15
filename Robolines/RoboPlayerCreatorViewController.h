//
//  RoboPlayerCreatorViewController.h
//  Robolines
//
//  Created by Benjamin Wishart on 2014-04-20.
//  Copyright (c) 2014 Benjamin Wishart. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Player.h"
#import "Computer.h"

@class RoboPlayerCreatorViewController;
@protocol RoboPlayerCreatorDelegate <NSObject>

-(void)orderButtonWasTapped:(RoboPlayerCreatorViewController *)sender;
-(void)playerTypeButtonWasTapped:(RoboPlayerCreatorViewController *)sender;

@end

@interface RoboPlayerCreatorViewController : UIViewController
{
    id <RoboPlayerCreatorDelegate> delegate;
    
    IBOutlet UIImageView *playerImage;
    IBOutlet UIButton *playerTypeButton;
    IBOutlet UIButton *playerDifficultyButton;
    IBOutlet UIButton *playerOrderButton;
    
    NSNumber *color;
    NSArray *playerTypeSymbols;
}

@property (nonatomic) NSNumber *playerType;
@property (nonatomic) int computerDifficulty;//0 means not computer;
@property (nonatomic) BOOL isEnabled;
@property (nonatomic, readonly) Player *player;
@property (nonatomic, strong) id delegate;

- (void)setPlayerOrderButtonToX;
- (void)setPlayerOrderButtonToBlank;
- (BOOL)isStartingPlayer;
- (BOOL)playerTypeIsHuman;
- (BOOL)playerTypeIsComputer;
- (BOOL)playerTypeIsNil;
- (void)setPlayerButtonsEnabled:(BOOL)enabled;
- (void)setPlayerOrderButtonEnabled:(BOOL)enabled;
- (void)setPlayerDifficultyButtonEnabled:(BOOL)enabled;
- (void)setPlayerTypeButtonEnabled:(BOOL)enabled;
- (void)enableButtonsBasedOnType;

@end
