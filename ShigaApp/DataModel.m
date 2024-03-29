//
//  DataModel.m
//  ShigaApp
//
//  Created by Nakanishi Toshiaki on 12/04/08.
//  Copyright 2012年 TOSHIAKI Nakanishi All rights reserved.
//

#import "DataModel.h"


@implementation DataModel

@synthesize gameLayer;
@synthesize targets;
@synthesize waypoints;
@synthesize waves;
@synthesize gestureRecognizer;

static DataModel *sharedContext = nil;

+ (DataModel*)getModel {
    if (!sharedContext) {
        sharedContext = [[self alloc] init];
    }
    
    return sharedContext;
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
    // Objectを保存する処理.
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    // シリアライズしたObjectを復元する処理.
    return self;
}

- (id)init {
    if ((self = [super init])) {
        targets = [[NSMutableArray alloc] init];
        waypoints = [[NSMutableArray alloc] init];
        waves = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)dealloc {
    self.gameLayer = nil;
    self.gestureRecognizer = nil;
    
    [targets release];
    targets = nil;
    
    [waypoints release];
    waypoints = nil;
    
    [waves release];
    waves = nil;
}

@end
