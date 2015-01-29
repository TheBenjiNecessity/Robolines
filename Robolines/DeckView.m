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
        drawAnimationsQueue = [[NSMutableArray alloc] init];
        if (deck == nil)
            [self setImage:[RoboUISlotView cardSlotImage]];
        else
            [self setImage:[RoboUISlotView cardBackImage]];
    }
    return self;
}

-(void)drawCardToPosition:(CGPoint)position afterDelay:(CGFloat)delay
{
    
    
    UIImageView *tempDealtCardView = [[UIImageView alloc] initWithFrame:CGRectMake((-1.0 * (MEDIUM_CARD_IMAGE_WIDTH/2 + VIEW_INTER_CARD_MARGIN)) + VIEW_SIDE_MARGIN, (1.0 * MEDIUM_CARD_IMAGE_HEIGHT/2) + (VIEW_TOP_MARGIN + MEDIUM_CARD_IMAGE_HEIGHT/2 + VIEW_INTER_CARD_MARGIN), SMALL_CARD_IMAGE_WIDTH, SMALL_CARD_IMAGE_HEIGHT)];
    [UIView animateWithDuration:0.1
                          delay:delay
                        options:UIViewAnimationOptionCurveEaseOut
    animations:^{
        [tempDealtCardView setFrame:CGRectMake(position.x, position.y, SMALL_CARD_IMAGE_WIDTH, SMALL_CARD_IMAGE_HEIGHT)];
    }completion:^(BOOL finished) {
        
    }];
}

-(void)flushAnimations
{
    if (drawAnimationsQueue.count > 0)
        [self fireNextAnimation];
}

-(void)fireNextAnimation
{
    [UIView animateWithDuration:0.1
                     animations:^{
                         
                     }completion:^(BOOL finished) {
                         if (drawAnimationsQueue.count > 0)
                             [self fireNextAnimation];
                     }];

}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
