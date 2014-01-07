//
//  IntroLayer.m
//  JorgeDeath
//
//  Created by Juan C Salazar on 6/01/14.
//  Copyright Juan C Salazar 2014. All rights reserved.
//


// Import the interfaces
#import "IntroLayer.h"
#import "Constants.h"
#import "MenuPpalScene.h"


#pragma mark - IntroLayer

// HelloWorldLayer implementation
@implementation IntroLayer

// Helper class method that creates a Scene with the HelloWorldLayer as the only child.
+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	IntroLayer *layer = [IntroLayer node];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}

// 
-(void) onEnter
{
	[super onEnter];
    
    //CGSize size = [[CCDirector sharedDirector] winSize];
    
    CCSprite *backgroundImage;
    if(IS_IPHONE_5())
    {
        backgroundImage = [CCSprite spriteWithFile:@"JorgeDeathBackground-568h@2x.png"];
    }
    else
    {
        backgroundImage = [CCSprite spriteWithFile:@"JorgeDeathBackground.png"];
    }
    
    [backgroundImage setPosition:CGPointMake(kScreenMiddleWidth, kScreenMiddleHeight)];
    //backgroundImage.position = ccp(size.height/2, size.width/2);
    
	// add the label as a child to this Layer
	[self addChild: backgroundImage];
	
	// In one second transition to the new scene
	[self scheduleOnce:@selector(makeTransition:) delay:1];
}

-(void) makeTransition:(ccTime)dt
{
	[[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:1.0 scene:[MenuPpalScene scene] ]];
}
@end
