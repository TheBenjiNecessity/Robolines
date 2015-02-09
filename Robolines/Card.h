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
    NSString *title;
}

@property (nonatomic) NSString *filename;

-(id)initWithImageFileName:(NSString *)filename;

@end
