//
//  SLLevelManager.m
//  SpaceLlamas
//
//  Created by Elsie Ng on 2014-05-09.
//  Copyright (c) 2014 Space Llama Studios. All rights reserved.
//

#import "SLLevelManager.h"

@implementation SLLevelManager

-(id)init {
	if((self = [super init])){
		_gameState = GameStateMainMenu;
	}
	return self;
};

@end
