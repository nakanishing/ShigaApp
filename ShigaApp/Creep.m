//
//  Creep.m
//  ShigaApp
//
//  Created by Nakanishi Toshiaki on 12/04/10.
//  Copyright 2012年 TOSHIAKI Nakanishi All rights reserved.
//

#import "Creep.h"


@implementation Creep

@synthesize hp = _curHp;
@synthesize moveDuration = _moveDuration;
@synthesize curWaypoint = _curWaypoint;

- (id)copyWithZone:(NSZone *)zone {
    Creep *copy = [[[self class] allocWithZone:zone] initWithCreep:self];
    return copy;
}

- (Creep *)initWithCreep:(Creep *)copyFrom {
    if ((self = [[[super alloc] initWithFile:@"Enemy1.png"] autorelease])) {
        self.hp = copyFrom.hp;
        self.moveDuration = copyFrom.moveDuration;
        self.curWaypoint = copyFrom.curWaypoint;
    }
    
    [self retain];
    return self;
}

- (Waypoint *)getCurrentWaypoint {
    DataModel *m = [DataModel getModel];
    Waypoint *waypoint = (Waypoint *)[m.waypoints objectAtIndex:self.curWaypoint];
    
    return waypoint;
}

- (Waypoint *)getNextWaypoint {
    DataModel *m = [DataModel getModel];
    int lastWaypoint = m.waypoints.count;
    
    self.curWaypoint++;
    if (self.curWaypoint > lastWaypoint) {
        self.curWaypoint = lastWaypoint - 1;
    }
    
    Waypoint *waypoint = (Waypoint *) [m.waypoints objectAtIndex:self.curWaypoint];
    
    return waypoint;
}

@end

// TODO 別クラス
@implementation FastRedCreep

+ (id)creep {
    FastRedCreep *creep = nil;
    if ((creep = [[[super alloc] initWithFile:@"Enemy1.png"] autorelease])) {
        creep.hp = 20;
        creep.moveDuration = 9;
        creep.curWaypoint = 0;
    }
    
    return creep;
}

@end

@implementation StrongGreenCreep

+ (id)creep {
    StrongGreenCreep *creep = nil;
    if ((creep = [[[super alloc] initWithFile:@"Enemy2.png"] autorelease])) {
        creep.hp = 20;
        creep.moveDuration = 9;
        creep.curWaypoint = 0;
    }
    
    return creep;
}

@end