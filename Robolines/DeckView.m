//
//  UIDeckView.m
//  Robolines
//
//  Created by Benjamin Wishart on 2014-11-18.
//  Copyright (c) 2014 Benjamin Wishart. All rights reserved.
//

#import "DeckView.h"

@implementation DeckView

- (id)initWithPosition:(CGPoint)position deckOrNil:(Deck *)deck
{
    self = [super initWithFrame:CGRectMake(position.x, position.y, SMALL_CARD_IMAGE_WIDTH, SMALL_CARD_IMAGE_HEIGHT)];
    if (self) {
        // Initialization code
        if (deck == nil)
            [self setImage:[RoboUISlotView cardSlotImage]];
        else
            [self setImage:[RoboUISlotView cardBackImage]];
    }
    return self;
}

-(void)dealCard:(Deck *)sender
{
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
