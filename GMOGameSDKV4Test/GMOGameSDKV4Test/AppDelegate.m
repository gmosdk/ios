//
//  AppDelegate.m
//  GMOGameSDKV4Test
//
//  Created by Hieu on 3/13/15.
//  Copyright (c) 2015 Hieu. All rights reserved.
//

#import "AppDelegate.h"
#import <GMOSDK/GMOSDK.h>
#import <CoreTelephony/CTTelephonyNetworkInfo.h>
#import <CoreTelephony/CTCarrier.h>
#import <FBSDKCoreKit/FBSDKCoreKit.h>

@interface AppDelegate ()<CrashlyticsDelegate>

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    [GMOGameSDK configure];
    [[GMOGameSDK sharedInstance] setAutoShowLoginDialog:YES];
    [[GMOGameSDK sharedInstance] setIsHideWelcomeView:NO];
    [[GMOGameSDK sharedInstance] setKeepLoginSession:YES];
    [[GMOGameSDK sharedInstance] setSDKButtonVisibility:YES];
    [[GMOGameSDK sharedInstance] setDelegate:self];
    [GMOGameSDK  registerPushNotificationWithGroupName:@"IOS"];
//    CTTelephonyNetworkInfo *netinfo = [[CTTelephonyNetworkInfo alloc] init];
//    CTCarrier *carrier = [netinfo subscriberCellularProvider];
//    NSLog(@"Carrier Name: %@", [carrier carrierName]);
//    NSLog(@"Mobile Country Code: %@", [carrier mobileCountryCode]);
//    NSLog(@"Mobile Network Code: %@", [carrier mobileNetworkCode]);
//    NSLog(@"Mobile IOS countryCode %@",[carrier isoCountryCode]);
    NSString *carry = [[[GMOGameSDK sharedInstance] trackObject] getCarrierNameFromCountryCodeType];
    NSLog(@"carry ==%@",carry);
    [Crashlytics startWithAPIKey:@"3b3d4e166890fbe24295abe34dfaffd97d4bf446" delegate:self];
    [[Crashlytics sharedInstance] setUserName:@"HieuTest"];
    [Fabric with:@[CrashlyticsKit]];
    
//    [Crashlytics startWithAPIKey:@"3b3d4e166890fbe24295abe34dfaffd97d4bf446"];
//    [[Crashlytics sharedInstance] setUserName:@"HieuTest"];
//    [[Crashlytics sharedInstance] setUserEmail:@"boy.ice.tea@gmail.com"];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    [FBSDKAppEvents activateApp];
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

- (BOOL) application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation {
    
    return [GMOGameSDK application:application handleOpenURL:url sourceApplication:sourceApplication annotation:annotation];
}

- (void)application:(UIApplication*)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData*)deviceToken
{
    NSLog(@"My token is: %@", deviceToken);
    [GMOGameSDK configurePushNotificationWithTokenData:deviceToken];
}

- (void)application:(UIApplication*)application didFailToRegisterForRemoteNotificationsWithError:(NSError*)error
{
    NSLog(@"Failed to get token, error: %@", error);
}

- (void)application:(UIApplication *)application didRegisterUserNotificationSettings:(UIUserNotificationSettings *)notificationSettings{
    
}

#pragma mark - SDK callback

- (void) didLoginSuccess:(GMOUserLoginResult *)userLoginResult{
      NSLog(@"USerInfor Dict ==%@",userLoginResult.objectDict);
}
- (void)didLogOut:(NSString *)userName{
    
}

- (void)didPaymentSuccessWithResult:(GMOPaymentResult *)paymentResult withPackage:(NSString *)packageID{
    
}
- (void)didPaymentErrorWithMessage:(NSString *)message withError:(NSError *)error{
    
    
}

- (NSString *)getPaymentStateWithPackageID:(NSString *)packageID{
    return @"Test_game_state";
}

- (void)didLoginErrorWithMessage:(NSString *)message withError:(NSError *)error{
    
}

@end
