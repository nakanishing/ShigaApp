//
//  TutorialScene.h
//  ShigaApp
//
//  Created by Nakanishi Toshiaki on 12/04/14.
//  Copyright 2012年 TOSHIAKI Nakanishi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "Creep.h"
#import "Wave.h"
#import "Waypoint.h"

@interface TutorialScene : CCLayer {
    CCTMXTiledMap *_tileMap;
    CCTMXLayer *_background;
    
    int _currentLevel;
}

@property (nonatomic, retain) CCTMXTiledMap *tileMap;
@property (nonatomic, retain) CCTMXLayer *background;
@property (nonatomic, assign) int currentLevel;

+ (id)scene;
- (void)addWayPoint;

@end
