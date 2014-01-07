//
//  MenuPpalScene.m
//  JorgeDeath
//
//  Created by Juan C Salazar on 6/01/14.
//  Copyright 2014 Juan C Salazar. All rights reserved.
//

#import "MenuPpalScene.h"


@implementation MenuPpalScene

+(CCScene *) scene
{
    CCScene *scene = [CCScene node];
    MenuPpalBackGroundLayer *backGroundLayer = [MenuPpalBackGroundLayer node];
    MenuPpalInteractiveLayer *interactiveLayer = [MenuPpalInteractiveLayer node];
    
    [scene addChild:backGroundLayer
                  z:kDefaultBackgroundLayerZValue
                tag:kDefaultBackgroundLayerTag ];
    [scene addChild:interactiveLayer
                  z:kDefaultBackgroundLayerZValue
                tag:kDefaultInteractiveLayerTag ];
    
    return scene;
}

@end
