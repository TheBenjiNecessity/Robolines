//
//  RoboPlayerView.h
//  Robolines
//
//  Created by Benjamin Wishart on 2015-01-29.
//  Copyright (c) 2015 Benjamin Wishart. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Player.h"

@interface RoboPlayerView : UIView
{
    Player *player;
    NSNumber *side;
}

-(id)initWithSide:(NSNumber *)s;

@end
