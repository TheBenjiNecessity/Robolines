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


-(void)test
{
    int playerHandCount = 10;
    [HandView setContentSize:CGSizeMake((SMALL_CARD_IMAGE_WIDTH + HAND_VIEW_CARD_MARGIN) * playerHandCount, HandView.frame.size.height)];
    
    NSArray *viewsToRemove = [HandView subviews];
    for (UIView *view in viewsToRemove)
    {
        [view removeFromSuperview];
    }
    
    HandCardViews = [[NSMutableArray alloc] init];
    for (int i = 0; i < playerHandCount; i++) {
        CGFloat xorigin = i * (SMALL_CARD_IMAGE_WIDTH + HAND_VIEW_CARD_MARGIN);
        CardView *cv = [[CardView alloc] initWithFrame:CGRectMake(xorigin, 0.0, SMALL_CARD_IMAGE_WIDTH, SMALL_CARD_IMAGE_HEIGHT)];
        Card *currentCard = [[Card alloc] initWithImageFileName:@"card_cardBack"];
        [cv setCard:currentCard];
        
        [HandView addSubview:cv];
        [HandCardViews addObject:cv];
    }

}

-(void)setupHandForPlayer: (Player *)player
{
    int playerHandCount = player.hand.count;
    [HandView setContentSize:CGSizeMake((SMALL_CARD_IMAGE_WIDTH + HAND_VIEW_CARD_MARGIN) * playerHandCount, HandView.frame.size.height)];

    NSArray *viewsToRemove = [HandView subviews];
    for (UIView *view in viewsToRemove)
    {
        [view removeFromSuperview];
    }
    
    HandCardViews = [[NSMutableArray alloc] init];
    for (int i = 0; i < playerHandCount; i++) {
        CGFloat xorigin = i * (SMALL_CARD_IMAGE_WIDTH + HAND_VIEW_CARD_MARGIN);
        CardView *cv = [[CardView alloc] initWithFrame:CGRectMake(xorigin, 0.0, SMALL_CARD_IMAGE_WIDTH, SMALL_CARD_IMAGE_HEIGHT)];
        Card *currentCard = [player.hand objectAtIndex:i];
        [cv setCard:currentCard];

        [HandView addSubview:cv];
        [HandCardViews addObject:cv];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [HandView setPagingEnabled:YES];
    [HandView setClipsToBounds:YES];
    
//    [self.view.layer setBorderColor:[UIColor blackColor].CGColor];
//    [self.view.layer setBorderWidth:1.0];
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
