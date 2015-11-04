//
//  AppDelegate.h
//  GMOGameSDKV4Test
//
//  Created by Hieu on 3/13/15.
//  Copyright (c) 2015 Hieu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <GMOSDK/GMOGameSDKCallback.h>
#import <Fabric/Fabric.h>
#import <Crashlytics/Crashlytics.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate,GMOGameSDKCallback>

@property (strong, nonatomic) UIWindow *window;


@end

