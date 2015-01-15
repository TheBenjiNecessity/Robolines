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

@interface DeckView : RoboUISlotView <DeckDelegate>

@property (nonatomic) Deck *deck;

- (id)initWithPosition:(CGPoint)position deckOrNil:(Deck *)deck;

@end
