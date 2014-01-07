//
//  JorgeDeathGameBackGroundLayer.m
//  JorgeDeath
//
//  Created by Juan C Salazar on 7/01/14.
//  Copyright 2014 Juan C Salazar. All rights reserved.
//

#import "JorgeDeathGameBackGroundLayer.h"


@implementation JorgeDeathGameBackGroundLayer

-(id)init
{
    self = [super init];
    if(self)
    {
        CCSprite *backGroundImageGame;
        if(IS_IPHONE_5())
        {
            backGroundImageGame = [CCSprite spriteWithFile:@"JorgeDeathBackgroundGame.png"];
        }
        else
        {
            backGroundImageGame = [CCSprite spriteWithFile:@"JorgeDeathBackgroundGame-hd.png"];
        }
        [backGroundImageGame setPosition:CGPointMake(kScreenMiddleWidth, kScreenMiddleHeight)];
        
        [self addChild:backGroundImageGame];
    }
    
    return self;
}

@end
