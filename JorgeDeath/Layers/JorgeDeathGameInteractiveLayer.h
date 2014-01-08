//
//  JorgeDeathGameInteractiveLayer.h
//  JorgeDeath
//
//  Created by Juan C Salazar on 7/01/14.
//  Copyright 2014 Juan C Salazar. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "Constants.h"
#import "GameManager.h"
#import "CCParticleSystemQuad.h"
#import "MenuPpalScene.h"
#import "CCNode+touched.h"
#import "ModalAlert.h"

#define mkPos1x 85
#define mkPos1y 210
#define mkPos2x 500
#define mkPos2y 221
#define mkPos3x 155
#define mkPos3y 90
#define mkPos4x 410
#define mkPos4y 115

#define okScore 20
#define midScore 30
#define exScore 40

#define mkBaseTagPersonajes 100
#define mkTiempoJuego 30

#define mkScoreLabelTag 30
#define mkTimeLabelTag 31

@interface JorgeDeathGameInteractiveLayer : CCLayer {
    
}

@property (nonatomic, assign) NSInteger tiempoGame;
@property (nonatomic, assign) NSInteger puntosGame;

@end
