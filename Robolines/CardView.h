//
//  CardView.h
//  Robolines
//
//  Created by Benjamin Wishart on 2012-12-12.
//  Copyright (c) 2012 Benjamin Wishart. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Card.h"

typedef enum
{
    EMPTY, BACK, FRONT
}State;

@interface CardView : UIImageView
{
    NSString *_filename;
}

@property (nonatomic, retain) Card *card;
@property (nonatomic) CGPoint origin;

+(void)cardBackImage;
+(void)cardSlotImage;

-(id)initWithCardFileName;

-(void)setState:(State) state;



-(void)setImageFromFileName: (NSString *)filename;
-(void)setCard: (Card*) c withImage: (UIImage *) image;

@end
