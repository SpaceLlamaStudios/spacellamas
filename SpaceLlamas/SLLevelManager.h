//
//  SLLevelManager.h
//  SpaceLlamas
//
//  Created by Elsie Ng on 2014-05-09.
//  Copyright (c) 2014 Space Llama Studios. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, GameState)
{
	GameStateMainMenu = 0,
	GameStatePlay,
	GameStateDone,
	GameStateGameOver
};

@interface SLLevelManager : NSObject

@property (assign) GameState gameState;

@end
