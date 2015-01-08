//
//  RoboCard.h
//  Robolines
//
//  Created by Benjamin Wishart on 2014-08-31.
//  Copyright (c) 2014 Benjamin Wishart. All rights reserved.
//

/*
 * template
 * <card>
 *      <title>text</title> - Anything
 *      <actions>
 *          <action group="#"> - 2 means interaction required
 *              <type>text</type>
 *              <parts>
 *                  <part>text</part> - Wild, Red, Blue, Green, Purple
 *              </parts>
 *              <number>#</number>
 *         </action>
 *      </actions>
 *      <quantity>#</quantity>
 *      <imagename>text</imagename>
 * </card>
 */

#import "Card.h"
#import "CardAction.h"

#define CARD_IMAGE_WIDTH        192.0
#define CARD_IMAGE_HEIGHT       256.0

@interface RoboCard : Card
{
    CardAction *cardActions;
}

//-(id)initWithImageFileName:(NSString *)filename;

@end
