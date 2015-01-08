//
//  RoboPlayerCreatorViewController.m
//  Robolines
//
//  Created by Benjamin Wishart on 2014-04-20.
//  Copyright (c) 2014 Benjamin Wishart. All rights reserved.
//

#import "RoboPlayerCreatorViewController.h"

@interface RoboPlayerCreatorViewController ()

@end

@implementation RoboPlayerCreatorViewController

@synthesize player;
@synthesize delegate;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    playerTypeSymbols = [[NSArray alloc] initWithObjects:@"P", @"C", @"X", nil];
    [self enableButtonsBasedOnType];
    [self setPlayerFromButtons];
    // Do any additional setup after loading the view from its nib.
}

- (IBAction)playerTypeButton:(id)sender {
    UIButton *button = (UIButton *)sender;
    int indexOfSymbol = ([playerTypeSymbols indexOfObject:button.currentTitle] + 1) % 3;
    [button setTitle:[playerTypeSymbols objectAtIndex:indexOfSymbol] forState:UIControlStateNormal];
    [self enableButtonsBasedOnType];
    [self setPlayerFromButtons];
}

- (IBAction)difficultyButton:(id)sender {
    UIButton *button = (UIButton *)sender;
    int difficulty = ([button.currentTitle intValue] + 1) % (MAX_DIFFICULTY + 1);
    [button setTitle:[NSString stringWithFormat:@"%d", difficulty] forState:UIControlStateNormal];
    [self setPlayerFromButtons];
}

- (IBAction)orderButton:(id)sender {
    [delegate orderButtonWasTapped:self];
//    UIButton *button = (UIButton *)sender;
//    
//    if ([button.currentTitle isEqualToString:@"X"])
//        [button setTitle:@"" forState:UIControlStateNormal];
//    else
//        [button setTitle:@"X" forState:UIControlStateNormal];
    
    [self setPlayerFromButtons];
}

-(void)enableButtonsBasedOnType
{
    [self setPlayerButtonsEnabled:YES];
    if ([self playerTypeIsHuman])
    {
        [playerDifficultyButton setEnabled:NO];
    }
    else if ([self playerTypeIsComputer])
    {
        //do nothing
    }
    else
    {
        [playerOrderButton setEnabled:NO];
        [playerDifficultyButton setEnabled:NO];
    }
}

-(void)setPlayerOrderButtonToX
{
    [playerOrderButton setTitle:@"X" forState:UIControlStateNormal];
}

-(void)setPlayerOrderButtonToBlank
{
    [playerOrderButton setTitle:@"O" forState:UIControlStateNormal];
}

-(void)hideDifficultyButton
{
    [playerDifficultyButton setHidden:YES];
}

-(void)showDifficultyButton
{
    [playerDifficultyButton setHidden:NO];
}

-(void)setPlayerButtonsEnabled:(BOOL)enabled
{
    [playerTypeButton setEnabled:enabled];
    [playerOrderButton setEnabled:enabled];
    [playerDifficultyButton setEnabled:enabled];
}

-(void)setPlayerOrderButtonEnabled:(BOOL)enabled
{
    
    [playerOrderButton setEnabled:enabled];
}



-(BOOL)playerTypeIsHuman
{
    return [playerTypeButton.currentTitle isEqualToString:@"P"];
}

-(BOOL)playerTypeIsComputer
{
    return [playerTypeButton.currentTitle isEqualToString:@"C"];
}

-(BOOL)playerTypeIsNil
{
    return [playerTypeButton.currentTitle isEqualToString:@"X"];
}

- (BOOL)isStartingPlayer
{
    return [playerOrderButton.currentTitle isEqualToString:@"X"];
}

- (void)setPlayerFromButtons
{
    if ([playerTypeButton.currentTitle isEqualToString:@"X"])
    {
        player = nil;
        return;
    }
    else
    {
        NSNumber *playerType;
        int difficulty = 0;
        
        if ([playerTypeButton.currentTitle isEqualToString:@"P"])
        {
            playerType = [NSNumber numberWithInt:HUMAN];
            player = [[Player alloc] initWithColor:color title:@""];
        }
        else
        {
            playerType = [NSNumber numberWithInt:COMPUTER];
            difficulty = [playerDifficultyButton.currentTitle intValue];
            player = [[Computer alloc] initWithColor:color difficulty:difficulty title:@"Computer"];
        }
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
