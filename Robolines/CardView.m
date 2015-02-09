//
//  CardView.m
//  Robolines
//
//  Created by Benjamin Wishart on 2012-12-12.
//  Copyright (c) 2012 Benjamin Wishart. All rights reserved.
//

#import "CardView.h"

@implementation CardView

@synthesize card;

- (id)initWithPosition:(CGPoint)position cardOrNil:(Card *)c
{
    self = [super initWithFrame:CGRectMake(position.x, position.y,  SMALL_CARD_IMAGE_WIDTH, SMALL_CARD_IMAGE_HEIGHT)];
    if (self) {
        // Initialization code
        card = c;
        if (card == nil)
            [self setImage:[RoboUISlotView cardSlotImage]];
    }
    return self;
}

/*
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self setImage:[RoboUISlotView cardSlotImage]];
    }
    return self;
}

-(id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self){

    }
    
    return self;
}
*/

-(UIImage *)cardFrontImage
{
    UIImage *cardFront;
    
    if (cardFront == nil)
    {
        NSString *path = [[NSBundle mainBundle] pathForResource:card.filename ofType:@"png"];
        
        NSData *data = [NSData dataWithContentsOfFile:path];
        
        cardFront = [UIImage imageWithData:data];
    }
    
    return cardFront;
}


-(void)setCard:(Card *) c
{
    card = c;
    
    //NSString *path = [[NSBundle mainBundle] pathForResource:[card filename] ofType:@"png"];
    //NSData *data = [NSData dataWithContentsOfFile:path];
    [self setImage:[self cardFrontImage]];
}

-(void)removeCard
{
    [self setCard:nil];
    [self setImage:[RoboUISlotView cardSlotImage]];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
