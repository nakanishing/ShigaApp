//
//  TutorialScene.m
//  ShigaApp
//
//  Created by Nakanishi Toshiaki on 12/04/14.
//  Copyright 2012年 TOSHIAKI Nakanishi. All rights reserved.
//

#import "TutorialScene.h"
#import "DataModel.h"

@implementation TutorialScene

@synthesize tileMap = _tileMap;
@synthesize background = _background;
@synthesize  currentLevel = _currentLevel;

+ (id)scene {
    CCScene *scene = [CCScene node];
    TutorialScene *layer = [TutorialScene node];
    [scene addChild:layer z:1];
    
    DataModel *m = [DataModel getModel];
    m.gameLayer = layer;
    
    return scene;
}

- (id)init {
    if ((self = [super init])) {
        self.tileMap = [CCTMXTiledMap tiledMapWithTMXFile:@"TileMap.tmx"];
        self.background = [_tileMap layerNamed:@"Background"];
        self.background.anchorPoint = ccp(0, 0);
        
        [self addChild:_tileMap z:0];
        [self addWayPoint];
        [self addWaves];
        
        // ここがゲームを呼び出す箇所
        [self schedule:@selector(update:)];
        [self schedule:@selector(gameLogic:) interval:1.0];
        
        self.currentLevel = 0;
        self.position = ccp(-228, -122);
    }
    
    return self;
}

- (void)addWaves {
    DataModel *m = [DataModel getModel];
    
    Wave *wave = nil;
    wave = [[Wave alloc] initWithCreep:[FastRedCreep creep] SpawnRate:1.0  TotalCreeps:20];
    [m.waves addObject:wave];
    wave = nil;
}

- (Wave *)getNextWave {
    DataModel *m = [DataModel getModel];
    
    self.currentLevel++;
    if (self.currentLevel > 1) {
        self.currentLevel = 0;
    }
    
    Wave *wave = (Wave *)[m.waves objectAtIndex:self.currentLevel];
    return wave;
}

- (void)addWayPoint {
    DataModel *m = [DataModel getModel];
    
    CCTMXObjectGroup *objects = [self.tileMap objectGroupNamed:@"Objects"];
    Waypoint *wp = nil;
    
    int spawnPointCounter = 0;
    NSMutableDictionary *spawnPoint;
    while ((spawnPoint = [objects objectNamed:[NSString stringWithFormat:@"Waypoint%d", spawnPointCounter]])) {
        int x = [[spawnPoint valueForKey:@"x"] intValue];
        int y = [[spawnPoint valueForKey:@"y"] intValue];
        
        wp = [Waypoint node];
        wp.position = ccp(x, y);
        [m.waypoints addObject:wp];
        
        spawnPointCounter++;
    }
    
    NSAssert([m.waypoints count] > 0, @"Waypoint objects missing.");
    wp = nil;
}

- (void)addTarget {
    DataModel *m = [DataModel getModel];
    Wave *wave = [self getCurrentWave];
    if (wave.totalCreeps < 0) {
        // [self getNextWave];
        return;
    }
    
    wave.totalCreeps--;
    
    Creep *target = nil;
    if ((arc4random() % 2) == 0) {
        target = [FastRedCreep creep];
    } else {
        target = [StrongGreenCreep creep];
    }
    
    Waypoint *waypoint = [target getCurrentWaypoint];
    target.position = waypoint.position;
    waypoint = [target getNextWaypoint];
    
    [self addChild:target z:1];
    
    int moveDuration = target.moveDuration;
    id actionMove = [CCMoveTo actionWithDuration:moveDuration position:waypoint.position];
    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(FollowPath:)];
    [target runAction:[CCSequence actions:actionMove, actionMoveDone, nil]];
    
    target.tag = 1;
    [m.targets addObject:target];
}

- (void)FollowPath:(id)sender {
    Creep *creep = (Creep *)sender;
    Waypoint *waypoint = [creep getNextWaypoint];
    
    int moveDuration = creep.moveDuration;
    id actionMove = [CCMoveTo actionWithDuration:moveDuration position:waypoint.position];
    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(FollowPath:)];
    [creep stopAllActions];
    [creep runAction:[CCSequence actions:actionMove, actionMoveDone, nil]];
}





@end
