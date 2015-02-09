//
//  RoboPlayerView.m
//  Robolines
//
//  Created by Benjamin Wishart on 2015-01-29.
//  Copyright (c) 2015 Benjamin Wishart. All rights reserved.
//

#import "RoboPlayerView.h"

@implementation RoboPlayerView

-(id)initWithSide:(NSNumber *)s
{
    self = [super init];
    if (self) {
        // Custom initialization
        side = s;
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
