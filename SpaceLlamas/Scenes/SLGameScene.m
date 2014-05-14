//
//  SLGameScene.m
//  SpaceLlamas
//
//  Created by Elsie Ng on 2014-05-12.
//  Copyright (c) 2014 Space Llama Studios. All rights reserved.
//

#import "SLGameScene.h"
#import "SLPlayer.h"

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
	[self setUpPlayer];
	[self spawnPlayer];
	
    return self;

}

-(void)setUpLayers
{
	_gameLayer = [SKNode node];
	[self addChild:_gameLayer];
}

-(void)setUpGame
{
	_background = [SKSpriteNode spriteNodeWithImageNamed:@"level-background-01"];
	_background.position = CGPointMake(self.size.width/2, self.size.height/2);
	[_gameLayer addChild:_background];
}

#pragma mark - Player
- (void)setUpPlayer
{
	_player = [[SLPlayer alloc] init];
	_player.position = CGPointMake(0, self.size.height * 0.5);
	_player.zPosition = 1;
	_player.name = @"player";
	[_gameLayer addChild:_player];
}

- (void)spawnPlayer
{
	SKAction *moveAction1 = [SKAction moveBy:CGVectorMake(_player.size.width/2 + self.size.width * 0.3, 0) duration:0.5];
	moveAction1.timingMode = SKActionTimingEaseOut;
	SKAction *moveAction2 = [SKAction moveBy: CGVectorMake(-self.size.width * 0.2, 0) duration:0.5];
	moveAction2.timingMode = SKActionTimingEaseInEaseOut;
	[_player runAction:[SKAction sequence:@[moveAction1, moveAction2]]];
}

#pragma mark - Game
-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
}

@end
