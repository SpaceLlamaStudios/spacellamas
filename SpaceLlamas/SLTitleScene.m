//
//  SLMyScene.m
//  Space Llamas: You Only Live Thrice
//
//  Created by Elsie Ng on 2013-06-13.
//  Copyright (c) 2013 Space Llama Studios. All rights reserved.
//

#import "SLTitleScene.h"
#import "SLPlayer.h"
#import "SLLevelManager.h"

@implementation SLTitleScene
{
	SKNode *_gameLayer;
	SKNode *_hudLayer;
	SKNode *_background;
	SKLabelNode *_titleLabel;
	SKLabelNode *_subtitleLabel;
	SKLabelNode *_startButton;
	SLLevelManager *_levelManager;
}

-(id)initWithSize:(CGSize)size {    
    if (self = [super initWithSize:size]) {
        /* Setup your scene here */
        
        self.backgroundColor = [SKColor colorWithRed:0 green:0 blue:0 alpha:0.8];

    }
	
	//[self initPlayer];
	[self setUpLayers];
	[self setUpTitle];
	[self setUpLevelManager];
	
    return self;
}

//Manage game layers
-(void)setUpLayers{
	_gameLayer = [SKNode node];
	[self addChild:_gameLayer];
	_hudLayer = [SKNode node];
	[self addChild:_hudLayer];
}

#pragma mark - Helper methods
- (CGFloat)fontSizeForDevice:(CGFloat)fontSize {
	if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
		return fontSize * 2;
	}
	else
	{
		return fontSize;
	}
}
//Manage Title Screen
- (void)setUpTitle {
	_background = [SKSpriteNode spriteNodeWithImageNamed:@"title-background"];
	_background.position = CGPointMake(self.size.width/2, self.size.height/2 + 50);
	[_gameLayer addChild:_background];

	NSString *fontName = @"Helvetica";
	// Title Label 1
	_titleLabel = [SKLabelNode labelNodeWithFontNamed:fontName];
	_titleLabel.text = @"Space Llamas";
	_titleLabel.fontSize = [self fontSizeForDevice:48.0];
	_titleLabel.fontColor = [SKColor colorWithRed:1.0 green:0.0 blue:0.0 alpha:1.0];
	_titleLabel.position = CGPointMake(self.size.width/2, self.size.height * 0.5);
	_titleLabel.verticalAlignmentMode = SKLabelVerticalAlignmentModeCenter;
	[_hudLayer addChild:_titleLabel];
	// Title Label 2
	_subtitleLabel = [SKLabelNode labelNodeWithFontNamed:fontName];
	_subtitleLabel.text = @"Llamas in Spaaaaaaace";
	_subtitleLabel.fontSize = [self fontSizeForDevice:20.0];
	_subtitleLabel.fontColor = [SKColor colorWithRed:1.0 green:0.0 blue:0.0 alpha:1.0];
	_subtitleLabel.position = CGPointMake(self.size.width/2, self.size.height * 0.3);
	_subtitleLabel.verticalAlignmentMode = SKLabelVerticalAlignmentModeCenter;
	[_hudLayer addChild:_subtitleLabel];
	
	//button
	_startButton = [SKLabelNode labelNodeWithFontNamed:fontName];
	_startButton.text = @"Tap anywhere to Play";
	_startButton.fontSize = [self fontSizeForDevice:12.0];
	_startButton.fontColor = [SKColor colorWithRed:1.0 green:0.0 blue:0.0 alpha:1.0];
	_startButton.position = CGPointMake(self.size.width/2, self.size.height * 0.3);
	_startButton.verticalAlignmentMode = SKLabelVerticalAlignmentModeCenter;
	[_hudLayer addChild:_startButton];
	
	//Animations
	[_titleLabel setAlpha:0.0];
	[_subtitleLabel setAlpha:0.0];
	[_background setAlpha:0.0];
	
	SKAction *delay = [SKAction waitForDuration:1.0];
	SKAction *fadeIn = [SKAction fadeInWithDuration:1.0];
	SKAction *slideUpTitle = [SKAction moveTo: CGPointMake(_titleLabel.position.x, _titleLabel.position.y + 50) duration: 2.0];
	SKAction *slideUpSubtitle = [SKAction moveTo: CGPointMake(_subtitleLabel.position.x, _subtitleLabel.position.y + 50) duration: 2.0];
	SKAction *slideDownBackground = [SKAction moveTo: CGPointMake(_background.position.x, _background.position.y - 50) duration: 2.0];
	SKAction *fadeInAndSlideUpTitle = [SKAction group:@[slideUpTitle, fadeIn]];
	SKAction *fadeInAndSlideUpSubtitle = [SKAction group:@[slideUpSubtitle, fadeIn]];
	SKAction *fadeInAndSlideDownBackground = [SKAction group:@[slideDownBackground, fadeIn]];
	
	[_titleLabel runAction:[SKAction sequence:@[delay, fadeInAndSlideUpTitle]]];
	[_subtitleLabel runAction:[SKAction sequence:@[delay, fadeInAndSlideUpSubtitle]]];
	[_background runAction: [SKAction sequence:@[delay, fadeInAndSlideDownBackground]]];
}
- (void)setUpLevelManager {
	_levelManager = [[SLLevelManager alloc] init];
}
#pragma mark - World Build


#pragma mark - Game Start
- (void) startGame {
	_levelManager.gameState = GameStatePlay;
	
	NSArray *nodes = @[_titleLabel, _subtitleLabel, _startButton, _background];
	for (SKNode *node in nodes) {
		SKAction *fadeOut = [SKAction fadeOutWithDuration:0.2];
		SKAction *removeNode = [SKAction removeFromParent];
		[node runAction: [SKAction sequence:@[fadeOut, removeNode]]];
	}
}

#pragma mark - Player
-(void) initPlayer
{
	SKSpriteNode *player = [SKSpriteNode spriteNodeWithImageNamed:@"player-spacellama-normal"];
	CGPoint startLocation = CGPointMake(self.frame.size.width/2, self.frame.size.height/2);
	player.position = startLocation;
	[self addChild: player];
}

-(void) fireMissile
{
	NSLog(@"FIRE ZE MISSILES");
}

-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
}

#pragma mark - Touch Listeners
- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
	if (_levelManager.gameState == GameStateMainMenu){
		[self startGame];
		return;
	}
}

@end
