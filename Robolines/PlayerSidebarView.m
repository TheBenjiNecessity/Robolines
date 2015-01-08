//
//  PlayerSidebarView.m
//  Robolines
//
//  Created by Benjamin Wishart on 2013-02-02.
//  Copyright (c) 2013 Benjamin Wishart. All rights reserved.
//

#import "PlayerSidebarView.h"

@implementation PlayerSidebarView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

-(id)initWithPlayer:(Player *)p
{
    self = [super init];
    if (self) {
        // Initialization code
        [self setPlayer:p];
    }
    return self;
}

-(void)animateViewPositionToUnfocused
{
    [UIView animateWithDuration:0.5 animations:^{
        self.frame = CGRectMake(1024.0 - PLAYER_SIDEBAR_VIEW_WIDTH, self.frame.origin.y, PLAYER_SIDEBAR_VIEW_WIDTH, PLAYER_SIDEBAR_VIEW_HEIGHT);
        
    }];
}

-(void)animateViewPositionToFocused
{
    [UIView animateWithDuration:0.5 animations:^{
        self.frame = CGRectMake(1010.0, self.frame.origin.y, PLAYER_SIDEBAR_VIEW_WIDTH, PLAYER_SIDEBAR_VIEW_HEIGHT);
    }];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
