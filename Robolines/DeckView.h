//
//  UIDeckView.h
//  Robolines
//
//  Created by Benjamin Wishart on 2014-11-18.
//  Copyright (c) 2014 Benjamin Wishart. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RoboUISlotView.h"
#import "Deck.h"
#import "UIConstants.h"


@class DeckView;
@protocol DeckViewDelegate <NSObject>

-(void)showDealCardAnimation:(UIImageView *)animatingView;

@end

@interface DeckView : RoboUISlotView
{
    NSMutableArray *drawAnimationsQueue;
    id <DeckViewDelegate> delegate;
}

@property (nonatomic) Deck *deck;
@property (nonatomic, strong) id delegate;

-(id)initWithPosition:(CGPoint)position deckOrNil:(Deck *)deck;
-(void)drawCardToPosition:(CGPoint)position afterDelay:(CGFloat)delay;
-(void)flushAnimations;

@end
