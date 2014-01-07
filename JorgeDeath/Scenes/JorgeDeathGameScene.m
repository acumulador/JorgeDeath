//
//  JorgeDeathGameScene.m
//  JorgeDeath
//
//  Created by Juan C Salazar on 6/01/14.
//  Copyright 2014 Juan C Salazar. All rights reserved.
//

#import "JorgeDeathGameScene.h"


@implementation JorgeDeathGameScene

+(CCScene *)scene
{
    CCScene *scene = [CCScene node];
    JorgeDeathGameBackGroundLayer *backGroundLayerGame = [JorgeDeathGameBackGroundLayer node];
    JorgeDeathGameInteractiveLayer *interactiveLayerGame = [JorgeDeathGameInteractiveLayer node];
    
    [scene addChild:backGroundLayerGame
                  z:kDefaultBackgroundLayerZValue
                tag:kDefaultBackgroundLayerTag];
    
    [scene addChild:interactiveLayerGame
                  z:kDefaultInteractiveLayerZValue
                tag:kDefaultInteractiveLayerTag];
    
    return scene;
}

@end
