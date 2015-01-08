//
//  PlayerSidebarView.h
//  Robolines
//
//  Created by Benjamin Wishart on 2013-02-02.
//  Copyright (c) 2013 Benjamin Wishart. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Player.h"

#define PLAYER_SIDEBAR_VIEW_WIDTH  92.0
#define PLAYER_SIDEBAR_VIEW_HEIGHT 92.0

@interface PlayerSidebarView : UIView

@property (nonatomic, retain) Player *player;
@property (nonatomic, retain) UILabel *numberOfPartsLeft;

-(id)initWithPlayer:(Player *)p;

- (void)animateViewPositionToUnfocused;

- (void)animateViewPositionToFocused;

@end
