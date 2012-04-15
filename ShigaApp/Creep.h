//
//  Creep.h
//  ShigaApp
//
//  Created by Nakanishi Toshiaki on 12/04/10.
//  Copyright 2012年 TOSHIAKI Nakanishi All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

#import "DataModel.h"
#import "Waypoint.h"

@interface Creep : CCSprite <NSCopying> {
    int _curHp;
    int _moveDuration;
    int _curWaypoint;
}

@property (nonatomic, assign) int hp;
@property (nonatomic, assign) int moveDuration;
@property (nonatomic, assign) int curWaypoint;

- (Creep *)initWithCreep:(Creep *) copyFrom;
- (Waypoint *)getCurrentWaypoint;
- (Waypoint *)getNextWaypoint;

@end

@interface  FastRedCreep : Creep {
}
+ (id)creep;
@end

@interface StrongGreenCreep : Creep {
}
+ (id)creep;
@end