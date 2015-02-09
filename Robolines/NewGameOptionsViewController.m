//
//  NewGameOptionsViewController.m
//  Robolines
//
//  Created by Benjamin Wishart on 2012-08-26.
//  Copyright (c) 2012 Benjamin Wishart. All rights reserved.
//

#import "NewGameOptionsViewController.h"

#define MAX_NUM_STATES      3
#define MAX_NUM_PLAYERS     4

@interface NewGameOptionsViewController ()

@end

@implementation NewGameOptionsViewController
@synthesize game;

@synthesize randomStart;

- (IBAction)Back:(id)sender {
    [self.navigationController popViewControllerAnimated:TRUE];
}

- (IBAction)Start:(id)sender {
    NSArray *players = [[NSArray alloc] initWithObjects:roboPlayerCreator1.player, roboPlayerCreator2.player, roboPlayerCreator3.player, roboPlayerCreator4.player, nil];
    
    if (randomStart.on)
        game = [[Game alloc] initWithRandomStartPlayerAndPlayerArray:players];
    else
        game = [[Game alloc] initWithPlayerArray:players startingWithPlayerAtIndex:[self findStartingPlayerIndex]];
    
    [self performSegueWithIdentifier:@"pushToGameFromConfigure" sender:self];
}

- (void)orderButtonWasTapped:(RoboPlayerCreatorViewController *)sender
{
    [roboPlayerCreator1 setPlayerOrderButtonToBlank];
    [roboPlayerCreator2 setPlayerOrderButtonToBlank];
    [roboPlayerCreator3 setPlayerOrderButtonToBlank];
    [roboPlayerCreator4 setPlayerOrderButtonToBlank];
    [sender setPlayerOrderButtonToX];
}

-(void)playerTypeButtonWasTapped:(RoboPlayerCreatorViewController *)sender
{
    [sender enableButtonsBasedOnType];
}

-(int)findStartingPlayerIndex
{
    int startingPlayerIndex;
    
    if ([roboPlayerCreator1 isStartingPlayer])
        startingPlayerIndex = 0;
    else if ([roboPlayerCreator2 isStartingPlayer])
        startingPlayerIndex = 1;
    else if ([roboPlayerCreator3 isStartingPlayer])
        startingPlayerIndex = 2;
    else if ([roboPlayerCreator4 isStartingPlayer])
        startingPlayerIndex = 3;
    else
        startingPlayerIndex = -1;//this should never happen
    
    return startingPlayerIndex;
}

-(int)findNumberOfNonNilPlayers
{
    int result = 0;
    if (roboPlayerCreator1.player != nil)
    {
        result++;
    }
    
    if (roboPlayerCreator2.player != nil)
    {
        result++;
    }
    
    if (roboPlayerCreator3.player != nil)
    {
        result++;
    }
    
    if (roboPlayerCreator4.player != nil)
    {
        result++;
    }
    
    return result;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    GameViewController *gvc = (GameViewController *)segue.destinationViewController;
    [gvc setGame:game];
}

-(void)viewDidLoad{
    [super viewDidLoad];
    [[UIApplication sharedApplication] setStatusBarHidden:YES];
    
    roboPlayerCreator1 = [[RoboPlayerCreatorViewController alloc] initWithNibName:@"RoboPlayerCreatorViewController" bundle:nil];
    [roboPlayerCreator1.view setFrame:CGRectMake(0.0, 0.0, roboPlayerCreator1.view.frame.size.width, roboPlayerCreator1.view.frame.size.height)];
    roboPlayerCreator2 = [[RoboPlayerCreatorViewController alloc] initWithNibName:@"RoboPlayerCreatorViewController" bundle:nil];
    [roboPlayerCreator2.view setFrame:CGRectMake(260.0, 0.0, roboPlayerCreator2.view.frame.size.width, roboPlayerCreator2.view.frame.size.height)];
    roboPlayerCreator3 = [[RoboPlayerCreatorViewController alloc] initWithNibName:@"RoboPlayerCreatorViewController" bundle:nil];
    [roboPlayerCreator3.view setFrame:CGRectMake(532.0, 0.0, roboPlayerCreator3.view.frame.size.width, roboPlayerCreator3.view.frame.size.height)];
    roboPlayerCreator4 = [[RoboPlayerCreatorViewController alloc] initWithNibName:@"RoboPlayerCreatorViewController" bundle:nil];
    [roboPlayerCreator4.view setFrame:CGRectMake(792.0, 0.0, roboPlayerCreator4.view.frame.size.width, roboPlayerCreator1.view.frame.size.height)];
    
    [self.view addSubview:roboPlayerCreator1.view];
    [self.view addSubview:roboPlayerCreator2.view];
    [self.view addSubview:roboPlayerCreator3.view];
    [self.view addSubview:roboPlayerCreator4.view];
    
    [roboPlayerCreator1 setDelegate:self];
    [roboPlayerCreator2 setDelegate:self];
    [roboPlayerCreator3 setDelegate:self];
    [roboPlayerCreator4 setDelegate:self];
    
    [roboPlayerCreator1 setPlayerOrderButtonToX];
    [roboPlayerCreator2 setPlayerOrderButtonToBlank];
    [roboPlayerCreator3 setPlayerOrderButtonToBlank];
    [roboPlayerCreator4 setPlayerOrderButtonToBlank];
}

- (void)viewDidUnload {
    
    [self setRandomStart:nil];
    [super viewDidUnload];
}
@end
