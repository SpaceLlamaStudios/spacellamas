//
//  SLGameScene.m
//  SpaceLlamas
//
//  Created by Elsie Ng on 2014-05-10.
//  Copyright (c) 2014 Space Llama Studios. All rights reserved.
//

#import "SLLevelSelectScene.h"
#import "SLGameScene.h"

#define kLevelsNum 7

@implementation SLLevelSelectScene
{
	SKNode *_gameLayer;
	SKNode *_background;
	NSString *_levelNum;
}

-(id)initWithSize:(CGSize)size
{
	if (self = [super initWithSize:size]) {
        /* Setup your scene here */
        
        self.backgroundColor = [SKColor colorWithRed:0 green:0 blue:0 alpha:0.8];

    }
	
	[self setUpLayers];
	[self setUpGame];
	[self setUpLevels];
	
    return self;

}

-(void)setUpLayers
{
	_gameLayer = [SKNode node];
	[self addChild:_gameLayer];
}

-(void)setUpLevels
{
	for (NSUInteger level = 1; level < kLevelsNum; ++level)
	{
		SKLabelNode* levelNum = [SKLabelNode labelNodeWithFontNamed:@"Helvetica"];
		_levelNum = [NSString stringWithFormat:@"%lu",(unsigned long)level];
		levelNum.name = @"levelButtonNode";
		levelNum.text = _levelNum;
		levelNum.fontSize = 48;
		levelNum.fontColor = [SKColor colorWithRed:1.0 green:0.0 blue:0.0 alpha:1.0];
		levelNum.position = CGPointMake(level * (level + 50), self.size.height * 0.5);
		levelNum.verticalAlignmentMode = SKLabelVerticalAlignmentModeCenter;
		[_gameLayer addChild:levelNum];
	}
}

-(void)setUpGame
{
	_background = [SKSpriteNode spriteNodeWithImageNamed:@"title-background"];
	_background.position = CGPointMake(self.size.width/2, self.size.height/2 + 50);
	[_gameLayer addChild:_background];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint location = [touch locationInNode:self];
    SKNode *node = [self nodeAtPoint:location];

    //if fire button touched, bring the rain
    if ([node.name isEqualToString:@"levelButtonNode"]) {
         
		SKView * currentView = (SKView *)self.view;
		SKScene * scene = [SLGameScene sceneWithSize:currentView.bounds.size];
		scene.scaleMode = SKSceneScaleModeAspectFill;
	
		SKTransition *fade = [SKTransition fadeWithDuration:1.0];
		[currentView presentScene:scene transition:fade];
    }
}

@end
