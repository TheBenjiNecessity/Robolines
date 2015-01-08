//
//  HandViewController.m
//  Robolines
//
//  Created by Benjamin Wishart on 2013-06-11.
//  Copyright (c) 2013 Benjamin Wishart. All rights reserved.
//

#import "HandViewController.h"

@interface HandViewController ()

@end

@implementation HandViewController

@synthesize HandView;
//@synthesize superView;
//@synthesize parent;
@synthesize HandCardViews;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil superview:(UIView *)superview state: (NSNumber *) modalState
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil superView:superview state:modalState];
    if (self) {
        // Custom initialization
        
    }
    return self;
}

-(void)setupHandForPlayer: (Player *)player
{
    NSLog(@"setup hand for player");
    //[self animateOutToSide:[NSNumber numberWithInt:BOTTOM]];
    int playerHandCount = player.hand.count;
    [HandView setContentSize:CGSizeMake((CARD_IMAGE_WIDTH/2 + HAND_VIEW_CARD_MARGIN) * playerHandCount, HandView.frame.size.height)];

    NSArray *viewsToRemove = [HandView subviews];
    for (UIView *view in viewsToRemove)
    {
        [view removeFromSuperview];
    }
    
    HandCardViews = [[NSMutableArray alloc] init];
    for (int i = 0; i < playerHandCount; i++) {
        CGFloat xorigin = i * (CARD_IMAGE_WIDTH/2 + HAND_VIEW_CARD_MARGIN);
        CardView *cv = [[CardView alloc] initWithFrame:CGRectMake(xorigin, 0.0, CARD_IMAGE_WIDTH/2, CARD_IMAGE_HEIGHT/2)];
        Card *currentCard = [player.hand objectAtIndex:i];
        [cv setCard:currentCard];
        //[cv setImageFromFileName:currentCard.imageFileName];
        [HandView addSubview:cv];
        [HandCardViews addObject:cv];
    }
}

//-(void)setState:(NSNumber *)s
//{
//    [super setState:s];
//}

- (void)viewDidLoad
{
    [super viewDidLoad];
    //cardDragRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:parent action:@selector(cardIsBeingDragged:)];
    //[self.view addGestureRecognizer:cardDragRecognizer];
    
    [HandView setPagingEnabled:YES];
    [HandView setClipsToBounds:YES];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    [self setHandView:nil];
    //cardDragRecognizer = nil;
    //[self setSuperView:nil];
    [super viewDidUnload];
}
@end
