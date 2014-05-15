//
//  SLEntity.h
//  SpaceLlamas
//
//  Created by Elsie Ng on 2014-05-13.
//  Copyright (c) 2014 Space Llama Studios. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface SLEntity : SKSpriteNode

@property (nonatomic, assign) NSInteger hp;
@property (nonatomic, assign) NSInteger maxHp;

- (instancetype)initWithImageNamed:(NSString *)name maxHp:(NSInteger)maxHp;

@end
