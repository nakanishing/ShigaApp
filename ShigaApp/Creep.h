//
//  Creep.h
//  ShigaApp
//
//  Created by Nakanishi Toshiaki on 12/04/10.
//  Copyright 2012年 FURYU CORP. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

#import "DataModel.h"
#import "WayPoint.h"

@interface Creep : CCSprite <NSCopying> {
    int curHp;
    int moveDuration;
    int curWaypoint;
}

@property (nonatomic, assign) int hp;
@property (nonatomic, assign) int moveDuration;
@property (nonatomic, assign) int curWaypoint;

- (Creep *)initWithCreep:(Creep *) copyFrom;
- (WayPoint *)getCurrentWaypoint;
- (WayPoint *)getNextWaypoint;

@end

@interface  FastRedCreep : Creep {
}
+ (id)creep;
@end

@interface StrongGreenCreep : Creep {
}
+ (id)creep;
@end