//
//  Card.h
//  Robolines
//
//  Created by Benjamin Wishart on 2012-09-23.
//  Copyright (c) 2012 Benjamin Wishart. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Card : NSObject
{
    UIImage *cardImage;
    NSString *title;
    NSString *_filename;
}

@property (nonatomic) NSString *filename;

+(UIImage *)cardBackImage;

-(id)initWithImageFileName:(NSString *)filename;

-(UIImage *)cardFrontImage;

@end
