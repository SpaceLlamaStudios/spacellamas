//
//  SLGameScene.m
//  SpaceLlamas
//
//  Created by Elsie Ng on 2014-05-10.
//  Copyright (c) 2014 Space Llama Studios. All rights reserved.
//

#import "SLGameScene.h"

@implementation SLGameScene
{
	SKNode *_gameLayer;
	SKNode *_background;
	
}

-(id)initWithSize:(CGSize)size
{
	if (self = [super initWithSize:size]) {
        /* Setup your scene here */
        
        self.backgroundColor = [SKColor colorWithRed:0 green:0 blue:0 alpha:0.8];

    }
	
	[self setUpLayers];
	[self setUpGame];
	
    return self;

}

-(void)setUpLayers
{
	_gameLayer = [SKNode node];
	[self addChild:_gameLayer];
}

-(void)setUpGame
{
	_background = [SKSpriteNode spriteNodeWithImageNamed:@"title-background"];
	_background.position = CGPointMake(self.size.width/2, self.size.height/2 + 50);
	[_gameLayer addChild:_background];
}

@end