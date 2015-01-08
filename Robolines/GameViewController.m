//
//  GameViewController.m
//  Robolines
//
//  Created by Benjamin Wishart on 2012-09-04.
//  Copyright (c) 2012 Benjamin Wishart. All rights reserved.
//


/*  TODO
 *  create a long press for cards which would show more information for the card.
 *  
 */

/* HOW TO RESOLVE CARDS
 * keep a global variable that keeps track of the current card row.
 * keep a global variable that keeps track of the current column being resolved.
 * each time a method is done, these variables are changed to show the next card to be resolved and another function is called accordingly.
 */

#import "GameViewController.h"

#define HAND_VIEW_UP_CENTER         374.0
#define HAND_VIEW_CARD_MARGIN       10.0
#define VIEW_SIDE_MARGIN            100.0
#define VIEW_TOP_MARGIN             20.0
#define VIEW_INTER_CARD_MARGIN      8.0

@interface GameViewController ()

@end

@implementation GameViewController
@synthesize handViewController;
@synthesize previousPanningPoint;
@synthesize selectedCardView;
@synthesize selectedCard;

@synthesize cardDraggingRecognizer;
@synthesize playCardDraggingRecognizer;
@synthesize cardSelectTapGestureRecognizer;

@synthesize framesRow;
@synthesize boardRows;
@synthesize playerSidebarViews;

@synthesize psmvc;
@synthesize npvc;

@synthesize game;

/* ------------------------ INITIALIZING METHODS ------------------------ */
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

//-(void)initGame
//{
//    RoboAppDelegate *appDelegate = (RoboAppDelegate *)[[UIApplication sharedApplication] delegate];
//    game = appDelegate.game;
//}

-(void)initUI
{
    NSMutableArray *frameSlots = [[NSMutableArray alloc] initWithCapacity:NUM_COLUMNS];
    for (int i = 0; i < NUM_COLUMNS; i++)
    {
        CardView *frameslot = [[CardView alloc] initWithFrame:CGRectMake((i * (CARD_IMAGE_WIDTH/2 + VIEW_INTER_CARD_MARGIN)) + VIEW_SIDE_MARGIN, VIEW_TOP_MARGIN, CARD_IMAGE_WIDTH/2, CARD_IMAGE_HEIGHT/2)];
        
        [frameSlots addObject:frameslot];
        
        [self.view addSubview:frameslot];
    }
    framesRow = [[NSArray alloc] initWithArray:frameSlots];
    
    
    NSMutableArray *rows = [[NSMutableArray alloc] initWithCapacity:NUM_ROWS];
    for (int row = 0; row < NUM_ROWS; row++)
    {
        NSMutableArray *slots = [[NSMutableArray alloc] initWithCapacity:NUM_COLUMNS];
        for (int column = 0; column < NUM_COLUMNS; column++)
        {
            CardView *slot = [[CardView alloc] initWithFrame:CGRectMake((column * (CARD_IMAGE_WIDTH/2 + VIEW_INTER_CARD_MARGIN)) + VIEW_SIDE_MARGIN,
                                                                        (row * CARD_IMAGE_HEIGHT/2) + (VIEW_TOP_MARGIN + CARD_IMAGE_HEIGHT/2 + VIEW_INTER_CARD_MARGIN),
                                                                        CARD_IMAGE_WIDTH/2,
                                                                        CARD_IMAGE_HEIGHT/2)];
            
            [slots addObject:slot];
            
            [self.view addSubview:slot];
        }
        [rows addObject:slots];
    }
    boardRows = [[NSArray alloc] initWithArray:rows];
    
    selectedCardView = [[CardView alloc] init];
    [self.view addSubview:selectedCardView];
    [selectedCardView setAlpha:0.0];
    
    cardSelectTapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(cardViewWasTapped:)];
    [self.view addGestureRecognizer:cardSelectTapGestureRecognizer];

    cardDraggingRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(cardIsBeingDragged:)];
    [self.view addGestureRecognizer:cardDraggingRecognizer];
    
    handViewController = [[HandViewController alloc] initWithNibName:@"HandViewController" bundle:nil];
    
    [self.view addSubview:handViewController.view];
    [self.view bringSubviewToFront:selectedCardView];
}

/* ------------------------ OUTLET METHODS ------------------------ */
- (IBAction)Back:(id)sender {
    [self.navigationController popViewControllerAnimated:TRUE];
}

- (IBAction)ToggleHand:(id)sender {
    npvc = [[NextPlayerViewController alloc] initWithNibName:@"NextPlayerViewController" bundle:nil superView:self.view state:nil];
    [npvc animateIn];
    
//    psmvc = [[PartSelectorModalViewController alloc] initWithNibName:@"PartSelectorModalViewController" bundle:nil superView:self.view state:[NSNumber numberWithInt:SWAP]];
//    [psmvc animateInFromSide:[NSNumber numberWithInt:BOTTOM]];
//
//    [self showModalViewController:mnmvc fromStartingPoint:CGPointMake(300.0, 768.0) toEndingPoint:CGPointMake(300.0, 300.0)];
    
//    if ([self isHandViewUp])
//    {
//        [self animateHandViewDown];
//    }
//    else
//    {
//        [self animateHandViewUp];
//    }
}

-(void)okayButtonWasTapped:(NextPlayerViewController *)sender
{
    [npvc animateOutToSide:[NSNumber numberWithInt:LEFT]];
}

-(void)startGame
{
    [self initUI];
    //[self initGame];
    
    [self setUpPlayerSidebarViews];
    [self setupSceneForCurrentPlayer];
    
    //[self animateHandViewUp];
    
}

-(void)dealAllPlayers
{
    for (int c = 0; c < game.players.count; c++)
        [self dealCardToPlayer:[game.players objectAtIndex:c]];
}

-(void)dealCardToPlayer:(Player *)player
{
    //[player addToHandCard:[deck ];
}

- (void)animateOutPlayerSideBarViewOfCurrentPlayer
{
    //if the current player's sidebar view is already out then don't do anything
    [UIView beginAnimations:@"movePlayerSidebarViews" context:nil];
    [UIView setAnimationDuration:0.4];
    for (int i = 0; i < playerSidebarViews.count; i++)
    {
        PlayerSidebarView *sidebarview = [playerSidebarViews objectAtIndex:i];
        if (sidebarview.player == game.currentPlayer)
        {
            sidebarview.frame = CGRectMake(1024.0 - sidebarview.frame.size.width, sidebarview.frame.origin.y, sidebarview.frame.size.width, sidebarview.frame.size.height);
        }
        else
        {
            sidebarview.frame = CGRectMake(1010.0, sidebarview.frame.origin.y, sidebarview.frame.size.width, sidebarview.frame.size.height);
        }
    }
    [UIView commitAnimations];
}

-(void)animateHandViewDown
{
    [handViewController animateOutToSide:[NSNumber numberWithInt:BOTTOM]];
}

-(void)animateHandViewUp
{
    [handViewController animateInFromSide:[NSNumber numberWithInt:BOTTOM]];
}

-(BOOL)isHandViewUp
{
    return handViewController.isOut;
}

-(void)setUpPlayerSidebarViews
{
    NSMutableArray *sidebarviews = [[NSMutableArray alloc] initWithCapacity:game.players.count];
    for (int i = 0; i < game.players.count; i++)
    {
        PlayerSidebarView *sidebarview = [[PlayerSidebarView alloc] initWithPlayer:[game.players objectAtIndex:i]];
        sidebarview.frame = CGRectMake(1024.0 - PLAYER_SIDEBAR_VIEW_WIDTH, (i * (PLAYER_SIDEBAR_VIEW_HEIGHT + 20.0)) + 100.0, PLAYER_SIDEBAR_VIEW_WIDTH, PLAYER_SIDEBAR_VIEW_HEIGHT);
        sidebarview.backgroundColor = [UIColor blueColor];
        [self.view addSubview:sidebarview];
        [sidebarviews addObject:sidebarview];
    }
    playerSidebarViews = [[NSArray alloc] initWithArray:sidebarviews];
}

-(void)refreshHandView
{
    [handViewController setupHandForPlayer:game.currentPlayer];
}

-(void)setupSceneForCurrentPlayer
{
    //perform the animations of the sidebar player views to show the current player
    handViewController = [[HandViewController alloc] initWithNibName:@"HandViewController" bundle:nil];
    [handViewController setupHandForPlayer:game.currentPlayer];
    [self.view addSubview:handViewController.view];
    [self animateOutPlayerSideBarViewOfCurrentPlayer];
    
    
    //if the hand view is up, slide it down.
//    if (![self isHandViewUp])
//    {
//        [self animateHandViewUp];
//    }
    
    
    
    //while the handview is down change the cards to reflect the next player (note: don't animate this up because
    //players would hand the iPad around and you wouldn't want another player seeing the current player's hand)
}

-(void)endCurrentPlayersTurn
{
    //what does it mean to end a turn
    [game.currentPlayer removeCardFromHandAtIndex: hand_index_of_selected_card];
    [game drawCardForPlayer:game.currentPlayer];
    [self refreshHandView];
}

-(void)startNextPlayersTurn
{
    [game rotateCurrentPlayer];
    [self setupSceneForCurrentPlayer];
    
}

-(CardView *)viewAtSelectedPoint:(CGPoint)pointToPlaceSelectedCard //this methods is called outside with a width and height of the screen
{
    if (pointToPlaceSelectedCard.x >= VIEW_SIDE_MARGIN && pointToPlaceSelectedCard.x <= (1024.0 - VIEW_SIDE_MARGIN)//if the point is in the frames row
        && pointToPlaceSelectedCard.y >= VIEW_TOP_MARGIN && pointToPlaceSelectedCard.y <= (VIEW_TOP_MARGIN + CARD_IMAGE_HEIGHT/2))
    {
        return [self viewInFramesRowAtSelectedPoint:pointToPlaceSelectedCard];
    }
    else if (pointToPlaceSelectedCard.x >= VIEW_SIDE_MARGIN && pointToPlaceSelectedCard.x <= (1024.0 - VIEW_SIDE_MARGIN) && pointToPlaceSelectedCard.y >= (VIEW_TOP_MARGIN + CARD_IMAGE_HEIGHT/2 + VIEW_INTER_CARD_MARGIN)
             && pointToPlaceSelectedCard.y <= (VIEW_TOP_MARGIN + CARD_IMAGE_HEIGHT/2 + VIEW_INTER_CARD_MARGIN + (CARD_IMAGE_HEIGHT * 2)))//if the point is in one of the board rows
    {
        return [self viewInBoardRowsAtSelectedPoint:pointToPlaceSelectedCard];
    }
    else
    {
        return nil;//point is off the board
    }
}

-(CardView *)viewInFramesRowAtSelectedPoint:(CGPoint)point
{
    int index = (int)((point.x - VIEW_SIDE_MARGIN) / (CARD_IMAGE_WIDTH/2 + VIEW_INTER_CARD_MARGIN));
    if (index >= 0 && index < NUM_COLUMNS)
    {
        row_index_of_selected_view = -1;// -1 means the frames row
        column_index_of_selected_view = index;
        return [framesRow objectAtIndex:index];
    }
    else
    {
        return nil;
    }
}

-(void)resolveFramesBeginningAtColumn:(int)column
{
    column_index_of_resolving_card = column;
    row_index_of_resolving_card = [game.players indexOfObject:game.currentPlayer];

    number_of_parts_added_in_column = 0;
    [self resolveCardAtColumn:column_index_of_resolving_card row:row_index_of_resolving_card];
    
    //resolve this frame and then call resolveAllFrames
    //for each card in the column under the frame starting with the current player's row
    //    add the appropriate robot parts and keep track of the number of parts added
    //    remove the appropriate parts and keep track of the number of parts taken away
    //    etc...
    int number_of_parts_added = 0;
    int index_of_current_player = [game.players indexOfObject:game.currentPlayer];
    int number_of_players = game.players.count;
    
    for (int i = 0; i < number_of_players; i++)
    {
        //starting at the current players row and
        int current_index = (i + index_of_current_player) % number_of_players;
        
        //number_of_parts_added += [self resolveCardAtColumn:column row:current_index withPlayerIndex:current_index];
    }
}

-(void)resolveAllFrames
{
    
}

-(void)resolveCardAtColumn:(int)column row:(int)row
{
    
    if ([game.board hasCardAtRow:row Column:column])//group 1 means automatic, group 2 needs user interaction
    {
        Card *card = [game.board getCardAtRow:row Column:column];
//        
//        [self resolveGroupOneActionsForCard:card];
//        [self resolveGroupTwoActionsForCard:card];
    }

//-----------------------------------------------------------------------------------------
    
    Player *playerOfIndex = [game.players objectAtIndex:row];
    NSMutableArray *groupTwoCardActions = [[NSMutableArray alloc] init];
    
//    if ([game.board hasCardAtRow:row Column:column])
//    {
//        NSArray *cardActions = [[game.board getCardAtRow:row Column:column] cardActions];
//        
//        for (CardAction *action in cardActions)
//        {
//            if (action.group == 1)
//            {
//                //perform the action
//                switch (action.type) {
//                    case ADD:
//                        if (![game.board frameisFullAtColumn:column])
//                        {
//                            for (NSString *part in action.parts)
//                            {
//                                NSNumber *p = [CardAction getEnumForStringColor:part];
//                                if (p == [NSNumber numberWithInt:WILD])
//                                {
//                                    #warning prompt the user to choose which part to add
//                                    //[self showPartSelectorModalView];
//                                    //return 1;
//                                    #warning must make sure that all group 2 actions were resolved first
//                                }
//                                else
//                                {
//                                    //parts that can't be added to the frame are simply ignored and discarded.
//                                    //[game.board addPart:p toFrameAtColumn:column];
//                                    
//                                    //[self addPart:p toFrameAtColumn:column];
//                                }
//                            }
//                        }
//                        break;
//                    case REMOVE:
//                        if (![game.board frameisFullAtColumn:column])
//                        {
//                            for (NSString *part in action.parts)
//                            {
//                                NSNumber *p = [CardAction getEnumForStringColor:part];
//                                if (p == [NSNumber numberWithInt:WILD])
//                                {
//                                    #warning prompt the user to choose which part to remove
//                                    //[self showPartSelectorModalView];
//                                    //return -1;
//                                }
//                                else
//                                {
//                                    //parts that can't be added to the frame are simply ignored and discarded.
//                                    //[game.board removePart:p toFrameAtColumn:column];
//                                    //[self removePart:p toFrameAtColumn:column];
//                                }
//                            }
//                        }
//                        break;
//                    case PEEK:
//                        
//                        break;
//                    case DRAW:
//                        for (int i = 0; i < action.number; i++)
//                        {
//                            //[self drawCardForPlayer:playerOfIndex];
//                        }
//                        break;
//                    case PLAY:
//                        
//                        break;
//                    case SWAP:
//                        
//                        break;
//                    case MOVE:
//                        // i don't think there ever is a group 1 move action
//                        break;
//                    default:
//                        break;
//                }
//            }
//            else if (action.group == 2)//group 1 actions must be resolved - group 2 is a selection
//            {
//                [groupTwoCardActions addObject:action];
//            }
//        }
//    }
    
    //return 0;
}

-(void)resolveGroupOneActionsForCard:(Card *) card//no user intervention
{
//    for (CardAction *action in card.cardActions)
//    {
//        if (action.group == 1)
//        {
//            switch (action.type) {
//                case ADD:
//                    if (![game.board frameisFullAtColumn:column_index_of_resolving_card])
//                    {
//                        for (NSString *part in action.parts)
//                        {
//                            NSNumber *p = [CardAction getEnumForStringColor:part];
//                            
//                                //parts that can't be added to the frame are simply ignored and discarded.
//                            //[self addPart:p toFrameAtColumn:column_index_of_resolving_card];
//                        }
//                    }
//                    break;
//                case REMOVE:
//                    if (![game.board frameisFullAtColumn:column_index_of_resolving_card])
//                    {
//                        for (NSString *part in action.parts)
//                        {
//                            NSNumber *p = [CardAction getEnumForStringColor:part];
//                                //parts that can't be added to the frame are simply ignored and discarded.
//                            //[self removePart:p toFrameAtColumn:column_index_of_resolving_card];
//                        }
//                    }
//                    break;
//                case PEEK:
//                    //nothing to do here
//                    break;
//                case DRAW:
//                    for (int i = 0; i < action.number; i++)
//                    {
//                        //[self drawCardForPlayer:[game.players objectAtIndex:row_index_of_resolving_card]];
//                    }
//                    break;
//                case PLAY:
//                    //nothing to do here
//                    break;
//                case SWAP:
//                    //nothing to do here
//                    break;
//                case MOVE:
//                    //this is safe because there can't be more than one number to move for a group 1 action
//                    //[self moveFrameByNumber:action.number];
//                    break;
//                default:
//                    break;
//            }
//
//        }
//    }
}

//-(int)resolveGroupTwoActionsForCard:(Card *) card//needs user intervention
//{
//    NSArray *cardActions = card.cardActions;
//    for (CardAction *action in cardActions)//this should group the actions together into a list for resolution
//    {
//        if (action.group == 2)
//        {
//            switch (action.type) {
//                case ADD:
//                    if (![game.board frameisFullAtColumn:column_index_of_resolving_card] && [CardAction getEnumForStringColor:[action.parts objectAtIndex:0]] == [NSNumber numberWithInt:WILD])
//                    {
//                        RESOLVESTATE = [NSNumber numberWithInt:ADDPARTS];
//                        //[//self showPartSelectorModalViewForFrame:[game.board getFrameAtColumn:column_index_of_resolving_card]];
//                    }
//                    else
//                    {
//#warning show that the card could not be resolved
//                    }
//                    break;
//                case REMOVE:
//                    if (![game.board frameisFullAtColumn:column_index_of_resolving_card] && [CardAction getEnumForStringColor:[action.parts objectAtIndex:0]] == [NSNumber numberWithInt:WILD])
//                    {
//                        RESOLVESTATE = [NSNumber numberWithInt:REMOVEPARTS];
//                        //[self showPartSelectorModalViewForFrame:[game.board getFrameAtColumn:column_index_of_resolving_card]];
//                    }
//                    else
//                    {
//#warning show that the card could not be resolved
//                    }
//                    break;
//                case PEEK:
//                    
//                    break;
//                case DRAW:
//                    //there is nothing to do here
//                    break;
//                case PLAY:
//                    
//                    break;
//                case SWAP:
//                    
//                    break;
//                case MOVE:
//                    
//                    break;
//                default:
//                    break;
//            }
//
//        }
//    }
//    return 0;
//}

-(void)showModalViewController:(UIViewController *)viewController fromStartingPoint:(CGPoint)startpoint toEndingPoint:(CGPoint)endpoint
{
    [viewController.view setFrame:CGRectMake(startpoint.x, startpoint.y, viewController.view.frame.size.width, viewController.view.frame.size.height)];
    [self.view addSubview:viewController.view];
    [UIView animateWithDuration:0.5 animations:^{
        [viewController.view setFrame:CGRectMake(endpoint.x, endpoint.y, viewController.view.frame.size.width, viewController.view.frame.size.height)];
    }];
}

-(void)moveFrameByNumber:(int)number
{
    //move the frame x number of spaces
}

-(void)addPart:(NSNumber *)p toFrameAtColumn:(int)column
{
    if ([game.board addPart:p toFrameAtColumn:column])
    {
        //only do graphical stuff in this if statement
    }
}

-(void)removePart:(NSNumber *)p toFrameAtColumn:(int)column
{
    if ([game.board removePart:p toFrameAtColumn:column])
    {
        //only do graphical stuff in this if statement
    }
}

-(void)drawCardForPlayer:(Player *)player
{
    [game drawCardForPlayer:player];
    
    
}

-(CardView *)viewInBoardRowsAtSelectedPoint:(CGPoint)point
{
    int index = (int)((point.x - VIEW_SIDE_MARGIN) / (CARD_IMAGE_WIDTH/2 + VIEW_INTER_CARD_MARGIN));
    int row = (int)((point.y - (VIEW_TOP_MARGIN + CARD_IMAGE_HEIGHT/2 + VIEW_INTER_CARD_MARGIN))/(CARD_IMAGE_HEIGHT/2));
    
    if (index >= 0 && index < NUM_COLUMNS && row >= 0 && row < NUM_ROWS)
    {
        row_index_of_selected_view = row;
        column_index_of_selected_view = index;
        return [[boardRows objectAtIndex:row] objectAtIndex:index];
    }
    else
    {
        return nil;
    }
}

-(void)drawCardForCurrentPlayer
{
    [self drawCardForPlayer:game.currentPlayer];
}

-(void)cardIsBeingDragged: (UIPanGestureRecognizer *)sender
{
    NSLog(@"card is being dragged in game controller.");
    if (sender.state == UIGestureRecognizerStateBegan)
    {
        previousPanningPoint = [sender locationInView:self.view];
        CGPoint pointInView = [handViewController.HandView convertPoint:previousPanningPoint fromView:self.view];
        
        hand_index_of_selected_card = 0;
        for (CardView *handcardview in handViewController.HandCardViews)
        {
            if (CGRectContainsPoint(handcardview.frame, pointInView))
            {
                [handViewController.HandView setScrollEnabled:NO];
        
                //make a copy of handcardview and give it to selectedCardView
                [selectedCardView setCard:handcardview.card];
                [selectedCardView setFrame:handcardview.frame];
                //[selectedCardView setOrigin: [self.view convertPoint:handcardview.origin fromView:HandView]];
                [selectedCardView setCenter: [self.view convertPoint:handcardview.center fromView:handViewController.HandView]];
                //[selectedCardView setImageFromFileName:handcardview.card.imageFileName];
                
                [selectedCardView setAlpha:1.0];
                [self.view bringSubviewToFront:selectedCardView];
                [handcardview setAlpha:0.0];
                [self animateHandViewDown];
                break;
            }
            hand_index_of_selected_card++;
        }
        
        [self animateHandViewDown];
    }
    
    CGPoint currentPoint = [sender locationInView:self.view];
    //currentPoint = CGPointMake(currentPoint.x, currentPoint.y - 512.0);
	//float diffx = currentPoint.x - previousPanningPoint.x;
	//float diffy = currentPoint.y - previousPanningPoint.y;
    
	CGPoint centre = selectedCardView.center;
	centre.x += (currentPoint.x - previousPanningPoint.x);
	centre.y += (currentPoint.y - previousPanningPoint.y);
	selectedCardView.center = centre;
    
    previousPanningPoint = currentPoint;
    
    /* hide styling for old space */
    [highlightedBoardSlotView.layer setBorderWidth:0.0];
    [highlightedBoardSlotView.layer setBorderColor:nil];
    
    /* Get a reference to the view under the panning card */
    highlightedBoardSlotView = [self viewAtSelectedPoint:centre];
    
    /* show styling for new cell */
    [highlightedBoardSlotView.layer setBorderWidth:1.0];
    [highlightedBoardSlotView.layer setBorderColor:[UIColor blueColor].CGColor];
    
    /* Snap the card back to origin */
    if (sender.state == UIGestureRecognizerStateEnded)
    {
        [handViewController.HandView setScrollEnabled:YES];
        [[handViewController.HandCardViews objectAtIndex:hand_index_of_selected_card] setAlpha:1.0];

        if (highlightedBoardSlotView != nil && [game.board addCard:selectedCardView.card Row:row_index_of_selected_view Column:column_index_of_selected_view])
        {
            [UIView animateWithDuration:0.05
                             animations:^{
                                 selectedCardView.center = CGPointMake(highlightedBoardSlotView.center.x, highlightedBoardSlotView.center.y);
                             }
                             completion:^(BOOL finished){
                                 [selectedCardView setAlpha:0.0];
                                 selectedCardView.center = CGPointMake(10000.0, 10000.0);
                                 
                                 
                                 [highlightedBoardSlotView setCard:selectedCardView.card withImage:selectedCardView.image];
                                 
                                 //CardAction *action = [selectedCardView.card.cardActions objectAtIndex:0];
                                 
                                 //if you place a frame in the frames row or you place a card under a frame on the board then resolve that current frame
//                                 if (action.type == FRAME || [game.board hasFrameAtColumn:column_index_of_selected_view])
//                                 {
//                                     [self resolveCardAtColumn:column_index_of_selected_view row:row_index_of_selected_view];
//                                 }
                                 
                                 [self endCurrentPlayersTurn];
                                 [self startNextPlayersTurn];
                             }];
        }
        else
        {   
            [UIView animateWithDuration:0.15
                             animations:^{
                                 selectedCardView.center = CGPointMake(512.0, 820.0);
                             }
                             completion:^(BOOL finished){
                                 [selectedCardView setAlpha:0.0];
                             }];
            
            
        }
        //63 954 12078
        //if the selectedCardView doesn't make it to the desired location (bad location, canceled move) then don't do anything
        
        //check to see that the card got to it's destination
        
        //find out which card slot the card is closest to.
        //NSLog(@"x: %f, y: %f", self.center.x, self.center.y);//convertPoint?
        //[[self delegate] giveCoordinates:self];
        //self.center = origin;
    }
    
    //drag the duplicate card around
}

-(void) presentModalActionView:(ModalViewController *)modalViewController withState: (NSNumber *)state
{
    
}

-(void)cardViewWasTapped:(UITapGestureRecognizer *)sender
{
//    CGPoint pointInView = [handViewController.HandView convertPoint:[cardSelectTapGestureRecognizer locationInView:self.view] fromView:self.view];
//    int i = 0;
//    for (CardView *handcardview in HandCardViews)
//    {
//        if (CGRectContainsPoint(handcardview.frame, pointInView))
//        {
//            NSLog(@"found card: %d", i);
//            //show a blown up view of the card with a button at the bottom to dismiss it
//            
//            break;
//        }
//        i++;
//    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self startGame];
}

- (void)viewDidUnload
{
    //[self setHandView:nil];
    [self setCardDraggingRecognizer:nil];
    [self setCardSelectTapGestureRecognizer:nil];
//    [self setRightLegButton:nil];
//    [self setLeftLegButton:nil];
//    [self setRightArmButton:nil];
//    [self setLeftArmButton:nil];
//    [self setHeadButton:nil];
//    [self setActionModalView:nil];
//    [self setHeadButton:nil];
//    [self setRightArmButton:nil];
//    [self setLeftArmButton:nil];
//    [self setLeftLegButton:nil];
//    [self setRightLegButton:nil];
//    [self setModalHandView:nil];
//    [self setPlusThreeButton:nil];
//    [self setPlusTwoButton:nil];
//    [self setPlusOneButton:nil];
//    [self setMinusOneButton:nil];
//    [self setMinusTwoButton:nil];
//    [self setMinusThreeButton:nil];
//    [self setFrameImageView:nil];
//    [self setPassDeviceOkayButton:nil];
//    [self setModalTitleLabel:nil];
    [self setPlayCardDraggingRecognizer:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

@end
