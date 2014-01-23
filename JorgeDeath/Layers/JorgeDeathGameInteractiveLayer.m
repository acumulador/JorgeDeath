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
    
    CCLabelBMFont *paPrueba = [CCLabelBMFont labelWithString:@"de Prueba" fntFile:kDefaultBitmapFontForPrompts];
    
    [relog setScale:0.80f];
    [puntaje setScale:0.80f];
    
    puntaje.position = ccp(85, 295);
    relog.position = ccp(475, 295);
    
    paPrueba.position = ccp(kScreenMiddleWidth, kScreenMiddleHeight);
    
    [self addChild:relog z:kDefaultInteractiveLayerZValue+12 tag:mkTimeLabelTag];
    [self addChild:puntaje z:kDefaultInteractiveLayerZValue+13 tag:mkScoreLabelTag];
    
    [self addChild:paPrueba z:kDefaultInteractiveLayerZValue+14 tag:99];
    
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
    //NSString *mensa = [NSString stringWithFormat:@"Golpea a Jorge tantas veces como puedas en %d Seg\r\n Preparado!!", mkTiempoJuego];
    //[ModalAlert Tell:mensa onLayer:self okBlock:^{
        //[[GameManager sharedGameManager]playSFX:kSfxTap];
        //[[CDAudioManager sharedManager]playSFX:kSfxTap];
        [self iniciaJuego];
    //}];
}
     
-(void)iniciaJuego
{
    [self borrarJugadores];
    self.puntosGame = 0;
    self.tiempoGame = mkTiempoJuego;
    [self UpdatePuntos:self.puntosGame];
    
    //Agendo el metodo para actualizar el tiempo...
    [self schedule:@selector(updateGameTimer) interval:1.0f];
    
    //Agendo el metodo para mover los personajes
    [self schedule:@selector(moverPersonajes) interval:2.0f];
}

-(void)moverPersonajes
{
    //[self UpdatePuntos:_puntosGame++];
    //se obtiene posicion aleatoria de los jugadores, se animan para que aparescan
    //obtengo personaje aleatorio
    int alePersonaje = (arc4random() % 3) + 1;
    NSInteger *strPersonaje;
    switch (alePersonaje) {
        case 1:
            //david
            strPersonaje = kDefaultInteractiveLayerTag;
            break;
            
        case 2:
            //carolina
            strPersonaje = kDefaultInteractiveLayerTag+1;
            break;
            
        case 3:
            //jorge
            strPersonaje = kDefaultInteractiveLayerTag+2;
            break;
            
        case 4:
            //juanpablo
            strPersonaje = kDefaultInteractiveLayerTag+3;
            break;
    }
    
    //obtengo la poicion aleatoria de uno a 4
    int alePos = (arc4random() % 3) + 1;
    //CGFloat *posAleX;
    //CGFloat *posAleY;
    id batchPersonajes = [self getChildByTag:kDefaultInteractiveLayerTag];
    CCNode *spritePersonajeAle = [batchPersonajes getChildByTag:strPersonaje];
    switch (alePos) {
        case 1:
            spritePersonajeAle.position = ccp(mkPos1x, mkPos1y);
            
            break;
            
        case 2:
            spritePersonajeAle.position = ccp(mkPos2x, mkPos2y);
            break;
            
        case 3:
            spritePersonajeAle.position = ccp(mkPos3x, mkPos3y);
            break;
            
        case 4:
            spritePersonajeAle.position = ccp(mkPos4x, mkPos4y);
            break;
    }
    
    CCLabelTTF *pruebalabel = (CCLabelTTF*)[self getChildByTag:99];
    NSString *prueba = [NSString stringWithFormat:@"Prueba: %d", alePersonaje];
    [pruebalabel setString:prueba];
}

-(void)updateGameTimer
{
    self.tiempoGame--;
    [self updateGameClockWithSeconds:self.tiempoGame];
    if(self.tiempoGame == 0){
        [self unschedule:@selector(updateGameTimer)];
        [self stopAllActions];
        //[self removeBalloons:kBalloonGameMaxBalloons];
        //[self showGameCompletionAlert];
    } else if (self.tiempoGame == 5 ||
               self.tiempoGame == 4 ||
               self.tiempoGame == 3 ||
               self.tiempoGame == 2 ||
               self.tiempoGame == 1){
        //[[GameManager sharedGameManager] playSFX:kSfxClockTick];
    }
}

-(void)updateGameClockWithSeconds:(NSInteger)sec
{
    CCLabelTTF *time = (CCLabelTTF*)[self getChildByTag:mkTimeLabelTag];
    NSString *timeText = [NSString stringWithFormat:@"Tiempo: %d", sec];
    [time setString:timeText];
}

-(void)borrarJugadores
{
    //Reinicia la posición de los personajes
    id batchPersonajes = [self getChildByTag:kDefaultInteractiveLayerTag];
    CCNode *spriteDavid = [batchPersonajes getChildByTag:mkBaseTagPersonajes];
    spriteDavid.position = ccp(100, 0);
    
    CCNode *spriteCarolina = [batchPersonajes getChildByTag:mkBaseTagPersonajes+1];
    spriteCarolina.position = ccp(150, 0);
    
    CCNode *spriteJorge = [batchPersonajes getChildByTag:mkBaseTagPersonajes+2];
    spriteJorge.position = ccp(200, 0);
    
    CCNode *spriteJuanpablo = [batchPersonajes getChildByTag:mkBaseTagPersonajes+3];
    spriteJuanpablo.position = ccp(250, 0);
}

-(void)iniAudio
{
    [CDSoundEngine setMixerSampleRate:CD_SAMPLE_RATE_MID];
    [[CDAudioManager sharedManager] setResignBehavior:kAMRBStopPlay autoHandle:YES];
    
    [[CDAudioManager sharedManager] playBackgroundMusic: kBackgroundTrack1                                                  loop:YES];
}

@end
