//
//  DataModel.h
//  ShigaApp
//
//  Created by Nakanishi Toshiaki on 12/04/08.
//  Copyright 2012年 TOSHIAKI Nakanishi All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

/*
 データの永続化を実現するためのクラス.
 */
@interface DataModel : NSObject <NSCoding> {
    CCLayer *gameLayer;
    
    NSMutableArray *targets;
    NSMutableArray *wayPoints;
    NSMutableArray *waves;
    
    // ジェスチャーを検知する為のクラス
    UIPanGestureRecognizer *gestureRecognizer;
}

@property (nonatomic, retain) CCLayer *gameLayer;
@property (nonatomic, retain) NSMutableArray *targets;
@property (nonatomic, retain) NSMutableArray *wayPoints;
@property (nonatomic, retain) NSMutableArray *waves;
@property (nonatomic, retain) UIPanGestureRecognizer *gestureRecognizer;

+ (DataModel *)getModel;

@end
