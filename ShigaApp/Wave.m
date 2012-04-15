//
//  Wave.m
//  ShigaApp
//
//  Created by Nakanishi Toshiaki on 12/04/14.
//  Copyright 2012年 TOSHIAKI Nakanishi. All rights reserved.
//

#import "Wave.h"


@implementation Wave

@synthesize spawnRate = _spawnRate;
@synthesize totalCreeps = _totalCreeps;
@synthesize creepType = _creepType;

- (id)init {
    if ((self = [super init])) {
        
    }
    
    return self;
}

- (id)initWithCreep:(Creep *)creep SpawnRate:(float)spawnRate TotalCreeps:(int)totalCreeps {
    NSAssert(creep != nil, @"Invalid creep for wave.");
    
    if ((self = [self init])) {
        _creepType = creep;
        _spawnRate = spawnRate;
        _totalCreeps = totalCreeps;
    }
    
    return self;
}

@end
