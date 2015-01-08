//
//  HandViewController.h
//  Robolines
//
//  Created by Benjamin Wishart on 2013-06-11.
//  Copyright (c) 2013 Benjamin Wishart. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Player.h"
#import "Card.h"
#import "CardView.h"
#import "ModalViewController.h"

#define HAND_VIEW_UP_CENTER         374.0
#define HAND_VIEW_CARD_MARGIN       10.0
#define VIEW_SIDE_MARGIN            100.0
#define VIEW_TOP_MARGIN             20.0
#define VIEW_INTER_CARD_MARGIN      8.0

@class HandViewController;
@protocol HandDelegate <NSObject>

-(void)cardWasTappedAtIndex: (int)index;

-(void)card: (Card *)card isPanningWithCurrentPoint: (CGPoint)point;

-(void)cardHasPannedWithCardView: (CardView *)cardView;

-(void)cardDidFinishPanningToPoint: (CGPoint)point;

@end

@interface HandViewController : ModalViewController
{
    id <HandDelegate> delegate;
    //UIPanGestureRecognizer *cardDragRecognizer;
    CGPoint previousPanningPoint;
    //NSMutableArray *HandCardViews;
    CardView *selectedCardView;
}

@property (strong, nonatomic) IBOutlet UIScrollView *HandView;
//@property (strong, nonatomic) IBOutlet UIView *superView;

@property (strong, nonatomic) NSMutableArray *HandCardViews;

//@property (weak) UIViewController *parent;

-(void)setupHandForPlayer: (Player *)player;

@end
