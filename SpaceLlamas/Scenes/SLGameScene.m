//
//  SLGameScene.m
//  SpaceLlamas
//
//  Created by Elsie Ng on 2014-05-12.
//  Copyright (c) 2014 Space Llama Studios. All rights reserved.
//

#import "SLGameScene.h"
#import "SLPlayer.h"
#import "SLBullet.h"

@implementation SLGameScene
{
	SKNode *_gameLayer;
	SKNode *_background;
	SKSpriteNode *_selectedNode;
	
	SKSpriteNode *_fireButton;
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
	[self setUpHud];
	
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
	_background.name = @"background";
	_background.position = CGPointMake(self.size.width/2, self.size.height/2);
	[_gameLayer addChild:_background];
}

#pragma mark - Player
- (void)setUpPlayer
{
	_player = [SLPlayer new];
	_player.position = CGPointMake(0, self.size.height * 0.5);
	_player.zPosition = 1;
	[_player setName:@"player"];
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

- (void)setUpHud
{
	_fireButton = [SKSpriteNode spriteNodeWithImageNamed:@"hud-fire-button"];
	_fireButton.name = @"fireButton";
	_fireButton.position = CGPointMake(self.frame.size.width - _fireButton.size.width, self.frame.size.height/2);
	[_gameLayer addChild:_fireButton];
}

#pragma mark - Player Controls

//Get Node for touch location
- (void)selectNodeForTouch:(CGPoint)touchLocation {
	SKSpriteNode *touchedNode = (SKSpriteNode *)[self nodeAtPoint:touchLocation];
	//if not player node reset stuff
	if(![_selectedNode isEqual:touchedNode]) {
		[_selectedNode removeAllActions];
		_selectedNode = touchedNode;
	}
}

//Create pan gesture recognizer
- (void)didMoveToView:(SKView *)view {
	UIPanGestureRecognizer *gestureRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePanFrom:)];
	[[self view] addGestureRecognizer:gestureRecognizer];
}

//Pan gesture recognizer
- (void)handlePanFrom:(UIPanGestureRecognizer *)recognizer
{
	//Start pan gesture recognizer
	if (recognizer.state == UIGestureRecognizerStateBegan)
	{
		//Get touch location and determine what node it is
        CGPoint touchLocation = [recognizer locationInView:recognizer.view];
		touchLocation = [self convertPointFromView:touchLocation];
		[self selectNodeForTouch:touchLocation];
    }
	//catch if the touch position changes (dragged)
	else if (recognizer.state == UIGestureRecognizerStateChanged) {
		//create translation
		CGPoint translation = [recognizer translationInView:recognizer.view];
		translation = CGPointMake(translation.x, -translation.y);
		[self updateNodePosition:translation];
		//set translation to recognizer origin
		[recognizer setTranslation:CGPointZero inView:recognizer.view];
    }
	//If no more touch
	else if (recognizer.state == UIGestureRecognizerStateEnded)
	{
		//if node was the player
		if ([[_selectedNode name] isEqualToString:@"player"])
		{
			//...remove all actions
			[_selectedNode removeAllActions];
		}
	}
}

//Set new position for player
- (void)updateNodePosition:(CGPoint)translation
{
	//if player, set new position plus translation on y axis
    if([[_selectedNode name] isEqualToString:@"player"])
	{
		CGPoint position = [_selectedNode position];
        [_selectedNode setPosition:CGPointMake(position.x, position.y + translation.y)];
    }
	//if not player, don't move the node
	else
	{
		CGPoint position = [_selectedNode position];
		[_selectedNode setPosition:CGPointMake(position.x, position.y)];
	}
}

//do stuff when touch moves
- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
	//get touch location and move based on previous location and new position
	
	//TODO: Top and bottom bounds
	
	UITouch *touch = [touches anyObject];
	CGPoint positionInScene = [touch locationInNode:self];
	CGPoint previousPosition = [touch previousLocationInNode:self];
	CGPoint translation = CGPointMake(positionInScene.x - previousPosition.x, positionInScene.y - previousPosition.y);
	
	//update node position
	[self updateNodePosition:translation];
}

//TODO: Fire HUD (multitouch)
- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
	[self spawnBullet];
	
}
//Fire ze lazerz!!
- (void)spawnBullet
{
	SLBullet *bullet = [SLBullet new];
	bullet.position = CGPointMake(_player.position.x +6, _player.position.y - 4);
	bullet.name = @"bullet";
	[_gameLayer addChild:bullet];
	
	bullet.alpha = 0;
	[bullet runAction: [SKAction fadeAlphaTo:1.0 duration:0.1]];
	SKAction *actionMove = [SKAction moveToX: self.size.width + bullet.size.width/2 duration: 0.75];
	SKAction *actionRemove = [SKAction removeFromParent];
	[bullet runAction:[SKAction sequence:@[actionMove, actionRemove]]];
	
}

-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
}

@end
