//
//  SLEntity.m
//  SpaceLlamas
//
//  Created by Elsie Ng on 2014-05-13.
//  Copyright (c) 2014 Space Llama Studios. All rights reserved.
//

#import "SLEntity.h"

@implementation SLEntity

- (instancetype)initWithImageNamed:(NSString *)name maxHp:(NSInteger)maxHp
{
	if ((self = [super initWithImageNamed:name]))
	{
		_maxHp = maxHp;
		_hp = maxHp;
	}
	return self;
}

@end
