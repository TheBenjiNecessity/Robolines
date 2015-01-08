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
@synthesize origin;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        //[self setImageFromFileName:@"cardslotbackground.png"];
    }
    return self;
}

-(id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self){
        //[self setImageFromFileName:@"cardslotbackground.png"];
    }
    
    return self;
}

-(id)initWithCard:(Card *)c;
{
    self = [super init];
    if (self)
    {
        card = c;
    }
    return self;
}

-(void)setState:(State)state
{
    switch (state) {
        case EMPTY:

            break;
            
        default:
            break;
    }
}
                          
+(void)cardBackImage
{
    UIImage *cardBack = nil;
    
    if (cardBack == nil)
    {
        cardBack = [UIImage imageWithContentsOfFile:@"card_cardBack.png"];
    }
    
    image = cardBack;
}

+(void)cardSlotImage
{
    UIImage *cardBack = nil;
    
    if (cardBack == nil)
    {
        cardBack = [UIImage imageWithContentsOfFile:@"card_cardSlot.png"];
    }
    
    return cardBack;
}


-(void)setCard: (Card *) c withImage: (UIImage *)image
{
    [self setCard:c];
    [self setImage:image];
}

-(void)setImageFromFileName: (NSString *)filename
{
    //self.image = [[UIImage alloc] initWithContentsOfFile:filename];
    self.image = [UIImage imageNamed:filename];
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
