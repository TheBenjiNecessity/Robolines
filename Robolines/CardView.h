//
//  CardView.h
//  Robolines
//
//  Created by Benjamin Wishart on 2012-12-12.
//  Copyright (c) 2012 Benjamin Wishart. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RoboUISlotView.h"
#import "Card.h"
#import "UIConstants.h"

typedef enum
{
    EMPTY, BACK, FRONT
}State;

@interface CardView : RoboUISlotView

@property (nonatomic, retain) Card *card;

- (id)initWithPosition:(CGPoint)position cardOrNil:(Card *)c;

-(void)setCard:(Card *) c;

@end
