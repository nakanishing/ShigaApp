//
//  AppDelegate.h
//  ShigaApp
//
//  Created by Nakanishi Toshiaki on 12/04/06.
//  Copyright FURYU CORP 2012年. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RootViewController;

@interface AppDelegate : NSObject <UIApplicationDelegate> {
	UIWindow			*window;
	RootViewController	*viewController;
}

@property (nonatomic, retain) UIWindow *window;

@end
