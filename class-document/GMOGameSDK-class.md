GMOGameSDK  
===========

## Overview
1. [Init function](#init-function)
2. [User function](#user-function)
3. [Payment function](#payment-function)

`GMOGameSDK` is the one and only class used to manage every action in `GMOSDK`.

Class method will support 4 features:

### 1. Init function <a name="init-function"></a>  
All init function will be called in `Appdelegate.m`
 

```
	[GMOGameSDK configure];		
```

GMO SDK init (configure) must be called once when application start

----


```
[GMOGameSDK sharedInstance].delegate = self;
```
Set callback for `GMOGameSDK`

----

`handleOpenURL:sourceApplication:annotation:` Will be called in `AppDelegate.m` handle openURL function

```
[GMOGameSDK  application:application handleOpenURL:url sourceApplication:sourceApplication annotation:annotation]
```
There are 4 functions to control SDK flows:

- `setKeepLoginSession:(BOOL)` <a name="set-keep-login-session"> </a> this function will control the GMO Login Session will be kept or deleted at app lauching (when deleted user has to login again when app start).   
**Note** If this function is not called, login session will be kept by default.
- `setAutoShowLoginDialog:(BOOL)` <a name="set-auto-show-login-dialog"> </a> this function will control the GMO Login View will be automatically show at app lauching (when user's not logged in) or you have to call [showLoginView](#show-login-view) function to show the LoginView. 
**Note** If this function is not called, login view will automatically show at app lauching (when user's not logged in).
- `setSDKButtonVisibility:(BOOL)` <a name = "set-sdk-button-visible"> </a> call this function to setting hide or show SDK floating button.
**Note** If this function is not called, the SDK floating button will automatically show at app lauching.

- `setHideWelcomeView:(BOOL)` <a name = "set-hide-wellcome-view"> </a> call this function to setting hide or show Wellcome View.
**Note** If this function is not called, the Wellcome View will automatically show at app lauching.


----
### 2. User function <a name = "user-function"> </a>

* `showLoginView`: Show login view function (when user's not logged in).

* `showRegisterView`: Show register view function (when user's not logged in).

* `logOut`: Logout function.

* `switchAccount`: Call this function when you want to  switch logged in user to other GMO User. Remember to check callback after switching successful (it'll be called in `didLoginSuccess:` again).

* `showUserInfoView`: This function will show user info view.

* `isUserLoggedIn`: This function will return user logged in state.

* ` setCharacterWithCharacterName: characterID:
               serverName: serverID:
          onCompleteBlock:
             onErrorBlock: ;
`: Set character function to support character management on web.

* `getUserInfo`: Return GMOUserLoginresult (`nil` if user not logged in).

* `showTransactionHistory`: show history of transaction.

### 3. Payment functions: <a name = "payment-function"> </a>

* `showPaymentView()`: Show payment view with default list payment packages
* `showPaymentViewWithPackageID:(NSString *)packageID`: Show a specific package depends on your in-game mechanism

-----

**Payment feature**<a name="class-method-payment-feature"></a>   

>`showPaymentView`

```
[GMOGameSDK showPaymentView]
```

-----
>`showPaymentViewWithPackageID:`

```
[GMOGameSDK showPaymentViewWithPackageID:(NSString *) package]
```
|Parameter|Description|  
|-------|-----------|  
|package|GMOPaymentPackage contains price, package id of game package about to be bought. If packageId = nil the result of this function like when call `[GMOGameSDK showPaymentView]`|

----

**Tracking method**<a name="class-tracking-method"> </a>

```
+ (void) sendEventWithCategory:(NSString*) categoryName
                      withEventAction:(NSString*) action
		                      withLabel:(NSString*) label
		                      withValue:(NSNumber*) value
```

|Parameter|Required|Description|  
|-------|-----------|----------|
|categoryName|YES|The event category|
|action|YES|The event action|
|label|NO|The event action|
|value|NO|The event value|

```
+ (void)sendEventWithCategory:(NSString *)categoryName withEventAction:(NSString *)action withLabel:(NSString *)label;
```
|Parameter|Required|Description|  
|-------|-----------|----------|
|categoryName|YES|The event category|
|action|YES|The event action|
|label|NO|The event action|

```
+ (void) sendViewWithName:(NSString*) viewName
```

|Parameter|Required|Description|  
|-------|-----------|----------|
|viewName|YES|NSString view name|

**Push notification method**<a name="push-notification-method"> </a>

>Register push notification

```
+ (void) registerPushNotificationWithGroupName:(NSString*) groupName;
```

|Parameter|Description|  
|-------|-----------|  
|groupName|Push group name is defined by you and will be recorded on `GMO Push Notification` system.(`"all"` for default)|

Register push device token data with GMO system (should be called in `application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)devTokenData` in `AppDelegate.m`)

>Configure Push notification

```
+ (NSString*) configurePushNotificationWithTokenData:(NSData*) deviceTokenData
```
Configure push notification with data call after you register push notification. You push this function in :

```
- (void)application:(UIApplication*)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData*)deviceToken
{
    [GMOGameSDK configurePushNotificationWithTokenData:deviceToken];
}
```
of your application delegate.

>Handle push notification

```
+ (void) handlePushNotification:(NSDictionary *)receiveDictionary;
``` 
You push this function in :

```
- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo{
    [GMOGameSDK handlePushNotification:userInfo];
}
```
of application delegate.

