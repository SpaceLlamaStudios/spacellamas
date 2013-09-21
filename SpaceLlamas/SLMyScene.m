//
//  SLMyScene.m
//  Space Llamas: You Only Live Thrice
//
//  Created by Elsie Ng on 2013-06-13.
//  Copyright (c) 2013 Space Llama Studios. All rights reserved.
//

#import "SLMyScene.h"
#import "SLPlayer.h"

@implementation SLMyScene


-(id)initWithSize:(CGSize)size {    
    if (self = [super initWithSize:size]) {
        /* Setup your scene here */
        
        self.backgroundColor = [SKColor colorWithRed:0 green:0 blue:0 alpha:0.8];

    }
	
	[self initPlayer];
	
    return self;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
	UITouch *touch = [[event allTouches] anyObject];
	CGPoint location = [touch locationInView:touch.view];
	NSString *touchLocation = [[NSString alloc]initWithFormat:@"%f", location.x];	
	
	for (UITouch *touch in touches)
	{
		if (location.x < self.frame.size.width/2)
		{
			NSLog(@"%@", touchLocation);
			//player.position.x = location.x;
            
		}
		else
		{
			//player.position.x = location.x;
		}
	}

}

#pragma mark - World Build
-(void)buildWorld
{
	
}

-(void)addBackground
{

}

-(void)addHUD
{

}

#pragma mark - Level Start


#pragma mark - Player
-(void) initPlayer
{
	SKSpriteNode *player = [SKSpriteNode spriteNodeWithImageNamed:@"player-spacellama-normal"];
	CGPoint startLocation = CGPointMake(self.frame.size.width/2, self.frame.size.height/8);
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

@end
