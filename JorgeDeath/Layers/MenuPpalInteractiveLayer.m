//
//  MenuPpalInteractiveLayer.m
//  JorgeDeath
//
//  Created by Juan C Salazar on 6/01/14.
//  Copyright 2014 Juan C Salazar. All rights reserved.
//

#import "MenuPpalInteractiveLayer.h"


@implementation MenuPpalInteractiveLayer

-(id)init
{
    self = [super init];
    if(self)
    {
        [self setTouchEnabled:YES];
        [self cargarEtiquetas];
        [self loadMenuItems];
        //[self CargarAudio];
    }
    
    return self;
}

-(void)cargarEtiquetas
{
    CCLabelBMFont *labelGame = [CCLabelBMFont labelWithString:@"Jorge"
                                                      fntFile:kDefaultBitmapFontForPrompts];
    labelGame.position = ccp(kScreenMiddleWidth-50, kScreenHeight-100);
    
    [self addChild:labelGame
                 z:kDefaultInteractiveLayerZValue+1
               tag:kDefaultInteractiveLayerTag +10 ];

    CCLabelBMFont *labelGame2 = [CCLabelBMFont labelWithString:@"Death"
                                                      fntFile:kDefaultBitmapFontForPrompts];
    labelGame2.position = ccp(kScreenMiddleWidth+80, kScreenHeight-100);
    
    [self addChild:labelGame2
                 z:kDefaultInteractiveLayerZValue+2
               tag:kDefaultInteractiveLayerTag +20 ];
    
    //Particulas
    [self AgregarParticulasBackGround];
    
    //Aminacion
    id crece1 = [CCScaleTo actionWithDuration:1.7f scale:2.0f];
    id delay = [CCDelayTime actionWithDuration:0.20f];
    id decrece1 = [CCScaleTo actionWithDuration:1.7f scale:1.0f];
    id GameLabel1Sequense = [CCRepeatForever actionWithAction:[CCSequence actions:crece1, delay, decrece1,nil]];
    [labelGame runAction:GameLabel1Sequense];
    
    id crece2 = [CCScaleTo actionWithDuration:2.2f scale:2.0f];
    id delay2 = [CCDelayTime actionWithDuration:0.20f];
    id decrece2 = [CCScaleTo actionWithDuration:1.7f scale:1.0f];
    id GameLabel2Sequense = [CCRepeatForever actionWithAction:[CCSequence actions:crece2, delay2, decrece2,nil]];
    [labelGame2 runAction:GameLabel2Sequense];
}

-(void)CargarAudio
{
    [[GameManager sharedGameManager] playBackgroundMusic:kBackgroundTrack1                                        loop:YES];
}

-(void)AgregarParticulasBackGround
{
    CCParticleSystemQuad *calavera = [CCParticleSystemQuad particleWithFile:@"JorgeDeathParticle.plist"];
    calavera.position = ccp(kScreenMiddleWidth, kScreenMiddleHeight);
    [self addChild:calavera
                 z: kDefaultInteractiveLayerZValue+1
                tag:kDefaultInteractiveLayerTag +1];
}

-(void)loadMenuItems
{
    
    CCLabelBMFont *startGameLabel = [CCLabelBMFont labelWithString:@"Jugar"
                                                           fntFile:kDefaultBitmapFontForControls];
    
    CCLabelBMFont *optionsGameLabel = [CCLabelBMFont labelWithString:@"Opciones"
                                                             fntFile:kDefaultBitmapFontForControls];
    
    
    CCMenuItemLabel *menuStartGame = [CCMenuItemLabel
                                      itemWithLabel:startGameLabel
                                      block:^(id sender) {
                                          [[GameManager sharedGameManager] playSFX:kSfxTap];
                                          [[CCDirector sharedDirector] replaceScene:[CCTransitionFade
                                                                                     transitionWithDuration:1.0
                                                                                     scene:[JorgeDeathGameScene scene]]];
                                      }];
    
    CCMenuItemLabel *menuOptions = [CCMenuItemLabel
                                    itemWithLabel:optionsGameLabel
                                    block:^(id sender) {
                                        [[GameManager sharedGameManager] playSFX:kSfxTap];
                                    }];
    
    CCMenu *mainMenu = [CCMenu menuWithItems:menuStartGame, menuOptions, nil];
	[mainMenu alignItemsVertically];
    
	// add the menu to your scene
	[self addChild:mainMenu
                 z:kDefaultInteractiveLayerZValue + 2
               tag:kDefaultInteractiveLayerTag + 20];
    
}

@end
