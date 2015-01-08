//
//  Space.h
//  Robolines
//
//  Created by Benjamin Wishart on 2012-09-30.
//  Copyright (c) 2012 Benjamin Wishart. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@interface Space : NSObject

@property (nonatomic, retain, readwrite) Card *card;

-(BOOL)hasCard;

-(BOOL)addCard: (Card *) c;

-(Card *)removeCard;

@end
