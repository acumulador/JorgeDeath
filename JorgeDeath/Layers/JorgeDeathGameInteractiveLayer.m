//
//  JorgeDeathGameInteractiveLayer.m
//  JorgeDeath
//
//  Created by Juan C Salazar on 7/01/14.
//  Copyright 2014 Juan C Salazar. All rights reserved.
//

#import "JorgeDeathGameInteractiveLayer.h"


@implementation JorgeDeathGameInteractiveLayer

-(id)init
{
    self = [super init];
    if(self)
    {
        [self setTouchEnabled:YES];
        [self CargarRelog_Puntos];
        [self CargarSprites];
        [self iniAudio];
    }
    
    return self;
}

-(void)CargarRelog_Puntos
{
    CCLabelBMFont *relog = [CCLabelBMFont labelWithString:@"Tiempo" fntFile:kDefaultBitmapFontForPrompts];
    CCLabelBMFont *puntaje = [CCLabelBMFont labelWithString:@"Puntaje" fntFile:kDefaultBitmapFontForPrompts];
    
    [relog setScale:0.80f];
    [puntaje setScale:0.80f];
    
    puntaje.position = ccp(85, 295);
    relog.position =ccp(475, 295);
    
    [self addChild:relog z:kDefaultInteractiveLayerZValue+12 tag:mkTimeLabelTag];
    [self addChild:puntaje z:kDefaultInteractiveLayerZValue+13 tag:mkScoreLabelTag];
    [self UpdatePuntos:0];
}

-(void)UpdatePuntos:(NSInteger)puntos
{
    CCLabelBMFont *labelPuntos = (CCLabelBMFont *)[self getChildByTag:mkScoreLabelTag];
    NSString *puntosTexto = [NSString stringWithFormat:@"Puntos: %d",puntos];
    [labelPuntos setString:puntosTexto];
}

-(void)CargarSprites
{
    CCSpriteBatchNode *JorgeDeathSpriteBachNode;
    [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"imagesListas.plist"];
    JorgeDeathSpriteBachNode = [CCSpriteBatchNode batchNodeWithFile:@"imagesListas.png"];
    
    //agrego personajes
    CCSprite *spriteDavid = [CCSprite spriteWithSpriteFrameName:@"david.png"];
    spriteDavid.position = ccp(mkPos1x, mkPos1y);
    [JorgeDeathSpriteBachNode addChild:spriteDavid
                                     z:kDefaultButtonZValue
                                   tag:mkBaseTagPersonajes];    
    
    CCSprite *spriteCarolina = [CCSprite spriteWithSpriteFrameName:@"carolina.png"];
    spriteCarolina.position = ccp(mkPos2x, mkPos2y);
    [JorgeDeathSpriteBachNode addChild:spriteCarolina
                                     z:kDefaultButtonZValue
                                   tag:mkBaseTagPersonajes+1];
    
    CCSprite *spriteJorge = [CCSprite spriteWithSpriteFrameName:@"jorgeDeath.png"];
    spriteJorge.position = ccp(mkPos3x, mkPos3y);
    [JorgeDeathSpriteBachNode addChild:spriteJorge
                                     z:kDefaultButtonZValue
                                   tag:mkBaseTagPersonajes+2];
    
    CCSprite *spriteJuanpab = [CCSprite spriteWithSpriteFrameName:@"juanpablo.png"];
    spriteJuanpab.position = ccp(mkPos4x, mkPos4y);
    [JorgeDeathSpriteBachNode addChild:spriteJuanpab
                                     z:kDefaultButtonZValue
                                   tag:mkBaseTagPersonajes+3];
    
    [self addChild:JorgeDeathSpriteBachNode
                 z:kDefaultInteractiveLayerZValue+1
               tag:kDefaultInteractiveLayerTag];
    
}

-(void)onEnterTransitionDidFinish
{
    [super onEnterTransitionDidFinish];
    [self loadGame];
}

-(void)loadGame
{
    NSString *mensa = [NSString stringWithFormat:@"Golpea a Jorge tantas veces como puedas en %d Seg\r\n Preparado!!", mkTiempoJuego];
    [ModalAlert Tell:mensa onLayer:self okBlock:^{
        //[[GameManager sharedGameManager]playSFX:kSfxTap];
        [self iniciaJuego];
    }];
}
     
-(void)iniciaJuego
{
    
}

-(void)iniAudio
{
    [CDSoundEngine setMixerSampleRate:CD_SAMPLE_RATE_MID];
    [[CDAudioManager sharedManager] setResignBehavior:kAMRBStopPlay autoHandle:YES];
}

@end
