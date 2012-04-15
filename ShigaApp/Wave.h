//
//  Wave.h
//  ShigaApp
//
//  Created by Nakanishi Toshiaki on 12/04/14.
//  Copyright 2012年 TOSHIAKI Nakanishi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "Creep.h"

@interface Wave : CCNode {
    float _spawnRate;
    int _totalCreeps;
    Creep *_creepType;
}

@property (nonatomic) float spawnRate;
@property (nonatomic) int totalCreeps;
@property (nonatomic, retain) Creep *creepType;

- (id)initWithCreep:(Creep *)creep SpawnRate:(float)spawnRate TotalCreeps:(int) totalCreeps;

@end
