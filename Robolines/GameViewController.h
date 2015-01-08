//
//  GameViewController.h
//  Robolines
//
//  Created by Benjamin Wishart on 2012-09-04.
//  Copyright (c) 2012 Benjamin Wishart. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

#import "RoboAppDelegate.h"
#import "Game.h"
#import "CardView.h"
#import "PlayerSidebarView.h"
#import "Card.h"
#import "HandViewController.h"
#import "MoveNumberModalViewController.h"
#import "NextPlayerViewController.h"
#import "PartSelectorModalViewController.h"

typedef enum
{
    ADDPARTS,
    REMOVEPARTS
}State;

@interface GameViewController : UIViewController <NextPlayerDelegate>
{
    //Game *game;
    CardView *highlightedBoardSlotView;
    Player *resolvingPlayer;
    
    int column_index_of_selected_view, row_index_of_selected_view;
    int hand_index_of_selected_card;
    
    int column_index_of_resolving_card, row_index_of_resolving_card;
    int number_of_parts_added_in_column;
    
    NSNumber *RESOLVESTATE;
    
    //UIView *modalView;
}

//@property (strong, nonatomic) IBOutlet UIScrollView *HandView;
@property (strong, nonatomic) Game *game;
@property (strong, nonatomic) HandViewController *handViewController;

@property (nonatomic, retain) CardView *selectedCardView;
@property (strong, nonatomic, retain) Card *selectedCard;
@property (strong, nonatomic) IBOutlet UIPanGestureRecognizer *cardDraggingRecognizer;

@property (strong, nonatomic) IBOutlet UIPanGestureRecognizer *playCardDraggingRecognizer;


@property (strong, nonatomic) IBOutlet UITapGestureRecognizer *cardSelectTapGestureRecognizer;
@property (nonatomic) CGPoint previousPanningPoint;

//@property (strong, nonatomic, retain) NSMutableArray *HandCardViews;

@property (strong, nonatomic, retain) NSArray *framesRow;
@property (strong, nonatomic, retain) NSArray *boardRows;
@property (strong, nonatomic, retain) NSArray *playerSidebarViews;

@property (strong, nonatomic, retain) PartSelectorModalViewController *psmvc;
@property (strong, nonatomic, retain) NextPlayerViewController *npvc;

@end
