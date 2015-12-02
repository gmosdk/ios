#Version 4 of the GMO Game SDK for iOS



##Highlights

* **GMO Login** – Support multiple login methods GMO, Google, Facebook, Twitter, Guest.
* **GMO Analytics** – A service for collecting, visualizing, and understanding users and application's data (session, active, error log, ...). 
* Support **Push Notification** on multiple platforms (iOS, Android, WP).

## Overview
1. [Integrate SDK](#head1-integrate-sdk)
	* 1.1 [Prerequisites](#head2-prerequisites)
	* 1.2 [Obtain app api key and client secret](#head2-obtain-app-api-key-and-client-key)
	* 1.3 [Configure your XCode Project](#head2-configure-your-xcode-project)
	* 1.4 [Update the SDK to a Newer Version](#head2-update-the-sdk-to-a-newer-version)
2. [Client API](#head1-client-api)
    * 2.1 [Init and configure SDK](#head2-init-sdk)
    * 2.2 [User function](#head2-user-function)
    * 2.3 [Payment function](#head2-payment-function)
    * 2.4 [Analytic function](#head2-analytic-function)
    * 2.5 [Push notification function](#head2-push-notification-function)
    * 2.6 [Set game character function](#head2-set-game-character)
    * 2.7 [Advance function](#head2-advance-function)
3. [Class document](#head1-class-document)
4. [FAQ and Glossary](#head1-faq)

##1. Integrate SDK <a name = "head1-integrate-sdk"> </a>
The [sample apps](Sample/) are standalone projects that are already set up for you. You can also integrate the SDK for iOS with an existing application.

###1.1. Prerequisites <a name = "head2-prerequisites">  </a>
To get started with the GMO Game SDK for iOS, you can set up the SDK and start building a new project, or you can integrate the SDK in an existing project. You can also run the samples to get a sense of how the SDK works.

The GMO Game SDK for iOS supports the following versions of software:

* Xcode 7 and later
* iOS 6 and later

###1.2. Obtain app api key and client secret <a name="head2-obtain-app-api-key-and-client-key"> </a>
* Retreive GMO app information `APIKey` from app dashboard. <a name="head3-gmo-appid"> </a>
* Retreive Facebook Application ID. <a name="head3-facebook-appid"> </a> [Detail about how to create ,retreive and setup Facebook app info for iOS](https://developers.facebook.com/docs/ios/getting-started).
* Create Facebook App Link. <a name = "head3-facebook-app-link"> </a> [App Link Tool](https://developers.facebook.com/quickstarts/?platform=app-links-host)
* Retreive Google Client ID and Client Secret. <a name="head3-google-appid"> </a> [Detail about create, retreive and setup Google app for iOS](https://developers.google.com/+/mobile/ios/getting-started)
* Retreive Twitter Consumer Key and Twitter Consumer Secret Key. <a name= "head3-twitter-appid"> </a> [Detail about create, retreive and setup Twitter app for iOS](https://apps.twitter.com/)

###1.3. Configure your XCode Project <a name="head2-configure-your-xcode-project"> </a>

####1.3.1. Add the GMO iOS SDK
 Open [Frameworks](Frameworks/)  and add  [GMOSDK.framework](Frameworks/GMOSDK.framework), [GMOBundle.bundle](Frameworks/GMOBundle.bundle), [FBSDKCoreKit.framework](Frameworks/FBSDKCoreKit.framework),
 [FBSDKLoginKit.framework](Frameworks/FBSDKLoginKit.framework), 
[FBSDKShareKit.framework](Frameworks/FBSDKShareKit.framework) to your project. (Remember to choose **Create groups for any added folders** and select **Copy items into destination group's folder (if needed)**)
<!--![](images/add_framework.gif)-->

####1.3.2. Add framework dependencies and setting
Select your project from the Project Navigator, and choose your application's target.  
Open **Build Phases** tab, within **Link Binary with Libraries**, add the following frameworks:  

- `StoreKit.framework`  
- `Accounts.framework`  
- `Social.framework`  
- `Twitter.framework`
- `ImageIO.framework`
- `CoreTelephony.framework`
- `AdSupport.framework`
- `SystemConfiguration.framework`
- `MessageUI.framework`
- `CoreMotion.framework`
- `Security.framework`
- `WebKit.framework`

Open **Build Settings**, find **Other Linker Flags**, add `-ObjC` then check if **Link Frameworks Automatically**, **Enable Modules (C and Objectivce-C))** are set to `YES`


####1.3.3. Configure the Info `.plist`

- Open Info `plist` section add `FacebookAppID` key with value is your [Facebook AppID](#head3-facebook-appid).
- Open Info `plist` section add `FacebookAppLinkUrl` key with value is your [Facebook App Link](#head3-facebook-app-link).
- Open Info `plist` section add `GOOGLE_CLIENT_ID` and `GOOGLE_CLIENT_SECRET` key with value is your [Google Client Id and Sceret](#head3-google-appid) in case of no client secret provided please leave `GOOGLE_CLIENT_SECRET` field blank.
- Open Info `plist` section add `TWITTER_CONSUMER_KEY` and `TWITTER_CONSUMER_SECRET` key with value is your [Twitter consumer key and twitter consumer secret](#head3-twitter-appid).
- Open Info `plist` section add `GMOAPIKey` key with value is your [GMO APIKey](#head3-gmo-appid).
- Add url schemes:
	- Identifier Facebook, URL Schemes: `fbYOUR_FACEOOK_APP_ID`, [Facebook AppID](#head3-facebook-appid) can be retreived from Facebook App Dashboard

The finished `.plist` should look like this or check the [sample apps](Sample/) for plist configuration
![](images/plist.png)

####1.4. Update the SDK to a Newer Version <a name="head2-update-the-sdk-to-a-newer-version"> </a>

When we release a new version of the SDK, you can pick up the changes as described below.

* In Xcode select the following frameworks, bundle and hit **delete** on your keyboard. Then select **Move to Trash**:

    * `GMOSDK.framework`
    * `GMOBundle.bundle`
    * `FBSDKCoreKit.framework`
    * `FBSDKLoginKit.framework`
    * `FBSDKShareKit.framework`
    
* Follow the installation process [above](#head1-integrate-sdk) to include the new version of the SDK.


##2. Client APIs <a name="head1-client-api"> </a>

###2.1 Init and configure SDK <a name = "head2-init-sdk"> </a>
Related class and function:
[GMOGameSDK class - init function](class-document/GMOGameSDK-class.md#init-function)  
GMO SDK init must be called once when application start via [GMOGameSDK](class-document/GMOGameSDK-class.md) class call `[GMOGameSDK configure]` so most of the time it will be placed in `AppDelegate's` method `application:didFinishLaunchingWithOptions:`  
In `AppDelegate.h` add import `#import <GMOSDK/GMOSDK.h>` use `AppDelegate` as protocol:

```
@interface AppDelegate : UIResponder <UIApplicationDelegate, GMOGameSDKCallback>
```

In `AppDelegate.m`:

```
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{		
	// Your code is placed above
	[GMOGameSDK configure];
 	[GMOGameSDK sharedInstance].delegate = self;	
 }
```

Add handle open URL in function `application:openURL:sourceApplication:annotation:`

```
- (BOOL) application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation {
    return [GMOGameSDK  application:application handleOpenURL:url sourceApplication:sourceApplication annotation:annotation];
}
```
There are 4 functions to control SDK follow:

- `setKeepLoginSession:(BOOL)` <a name="set-keep-login-session"> </a> this function will control the GMO Login Session will be kept or deleted at app lauching (when deleted user has to login again when app start).   
**Note** If this function is not called, login session will be kept by default.
- `setAutoShowLoginDialog:(BOOL)` <a name="set-auto-show-login-dialog"> </a> this function will control the GMO Login View will be automatically show at app lauching (when user's not logged in) or you have to call [showLoginView](#show-login-view) function to show the LoginView. 
**Note** If this function is not called, login view will automatically show at app lauching (when user's not logged in).
- `setSDKButtonVisibility:(BOOL)` <a name = "set-sdk-button-visible"> </a> call this function to setting hide or show SDK floating button.
**Note** If this function is not called, the SDK floating button will automatically show at app lauching.

- `setHideWelcomeView:(BOOL)` <a name = "set-hide-wellcome-view"> </a> call this function to setting hide or show Wellcome View.
**Note** If this function is not called, the Wellcome View will automatically show at app lauching.

###2.2. User functions <a name="head2-user-function"> </a>
Related class and function:

- [GMOGameSDK- user function](class-document/GMOGameSDK-class.md#user-function)
- [GMOUserLoginResult](class-document/GMOUserLoginResult-class.md)


Once you've implemented init SDK function, start using login features.

####2.2.1. Show login view <a name = "head2-show-login-view"> </a>
As mentioned above login dialog flow can be control by function [setAutoShowLoginDialog:](#set-auto-show-login-dialog). Automatically show login view at app launching or manual call `showLoginView` when you need:  

- **Show Login View**

```
[GMOGameSDK showLoginView];
```
<a name="show-login-view"> </a>
GMO Login Dialog contains 5 authorization methods: **Facebook**, **Google**, **Twitter**, **GMO User** and **Quick Login**  

Follow this mechanism for login function, please implement [`didLoginSuccess`](#did-login-succeed) callback to authenticate your in-game user.

####2.2.2. Show Register view 
- **Show Register View**

```
[GMOGameSDK showRegisterView];
```
Call it when you want to show register view.


####2.2.3. Logout
- **Logout function**
 
```
[GMOGameSDK logOut];
```
Call it when wanna log out. 

####2.2.4. Switch account
- **Switch account function**

Call this function when user logged in will show a login view and allow to login other account. When switch account succeed `didLoginSuccess` callback will be called again, so please logout your game account and reauthenticate with new switched account.

```
[GMOGameSDK switchAccount];
```

####2.2.5. Show User Info
- **Show User Info function**

Call this function will show user info view  

```
[GMOGameSDK showUserInfoView];
```

####2.2.6. Check user login
- **Check user login**

- This function will return user logged in state

```
[GMOGameSDK isUserLoggedIn];
```
####2.2.7. Get Logged in user info
- **Get Logged in user info**
- 
Return GMOUserLoginresult (`nil` if user not logged in)

```
[GMOGameSDK getUserInfo];
```
####2.2.8. Show history of transaction
 
- **Show history of transaction**

 This function will show history of transaction of user (When user is logged in).

```
[GMOGameSDK showTransactionHistory];
```

####2.2.9. Handle authenticaiton callbacks <a name = "login-handle-login-response"> </a>

GMOSDK provide 4 callbacks delegate for login defined in [`GMOGameSDKCallback`](class-document/GMOGameSDKCallback-class.md) , please implement these functions to `Appdelegate.m`

**Note** 2 callbacks are  `@required` : `-didLoginSuccess:` and `-didLogOut:`

----
**Login succeed callback**  <a name = "did-login-succeed"> </a>

Retreive GMO user info from `GMOUserLoginResult` then post to your server to verify and create game user.

**Note** Remember verify GMO UserID, UserName and Access token on your server before procceeding game user integration

```
- (void) didLoginSuccess:(GMOUserLoginResult*) userLoginResult
```
|Parameter|Description|  
|-------|-----------|  
|userLoginResult|`userLoginResult` is [GMOUserLoginResult](class-document/GMOUserLoginResult-class.md) object of user information (username, user_id, access token)|

----
**Login fail callback**  
Callback when login have problems

```
- (void) didLoginErrorWithMessage:(NSString *)message withError:(NSError *)error;
```

|Parameter|Description|  
|-------|-----------|  
|message|`message` is message error|
|error|`error` is error of login prblem|

----
**Logout callback**  
Callback after user logout with user name

```
- (void) didLogout:(NSString*) userName
```
|Parameter|Description|  
|-------|-----------|  
|userName|`userName` is user name logout|

----
**Close login view callback**  
Callback when user close login view at app launching

```
- (void) didCloseLoginView;
```

###2.3. Payment function <a name="head2-payment-function"> </a>

Related class and function:

- [GMOGameSDK - payment function](class-document/GMOGameSDK-class.md#payment-function)
- [GMOGameSDKCallback](class-document/GMOGameSDKCallback-class.md)
- [GMOPaymentResult](class-document/GMOPaymentResult-class.md)

Because using GMOSDK payment function you should understand GMO Payment mechanism and configuration.
####2.3.1. Show payment view <a name="head3-show-payment-view"> </a>

---------
You have 3 methods to show payment view. Each payment view represents one or list of payment package. Each package contains information of game coin amount or in-game package. 

**Show default list payment view**

You can show payment view with default list payment packages (which is configured on

```
[GMOGameSDK showPaymentView]
```

####2.3.2. Show payment view for a specific package 

You can show a specific package depends on your in-game mechanism

```
[GMOGameSDK showPaymentViewWithPackageID:];
```


####2.3.3. Show payment view from SDK floating button 


####2.3.4. Close payment View
You can close payment view by use this function:

```
[GMOGameSDK closePaymentView];
```

####2.3.5 Handle payment callback <a name="head3-handle-payment-callback"> </a>

---------
Every payment success will callback in `GMOGameSDK` delegate (setup in [init function](#head2-init-sdk)). The callback functions should be in `AppDelegate.m`
There are 2 `@required` callback function defined in [GMOGameSDKCallback](class-document/GMOGameSDKCallback-class.md)

**Callback after a successful payment**

Depends on your payment machenism (APN or IPN, please readmore about [GMO Payment](wiki), proceed payment verification or alert payment succeed for user

```
- (void) didPaymentSuccessWithResult:(GMOPaymentResult*) paymentResult withPackage:(NSString *) packageID;
```

|Parameter|Description|  
|-------|-----------|  
|`paymentResult`|`paymentResult` is [GMOPaymentResult](class-document/GMOPaymentResult-class.md) object of payment information (transaction id, amount, ...)|
|`packageID`|`packageID` is id of the package has been bought, `packageID` is defined during payment configuration process|

----
**Callback when payment have problems**

```
- (void) didPaymentErrorWithMessage:(NSString *)message withError:(NSError *)error;
```

|Parameter|Description|  
|-------|-----------|  
|`message`|`message` is message of error|
|`error`|`error` the error payment problems|

----
**Callback for payment state**

**PAYMENT_STATE** is required for our SDK to make correct payment with package. Depends on your payment package implement this function and return a correct payment state. [Detail about payment state](#head3-payment-state).  

For example packageID: com.gold.package1 - (defined in your developer page) corresponds with a package of 1000 gold and current game user is X in server Y. Then payment state can be constructed : 1000_gold_X_Y (depends on your format).

**Note** :Length of **PAYMENT_STATE** does not exceed 150 characters

For more information about payment state please view our [Sample](Sample). We implement a singleton `GlobalGameVariables` to explain how to use payment state in that callback


```
- (NSString*) getPaymentStateWithPackageID:(NSString *) packageID;
```
|Parameter|Description|  
|-------|-----------|  
|`packageID`|`packageID` is id of the package has been bought, `packageID` is defined during payment configuration process|

###2.4. Analytic function <a name= "head2-analytic-function"> </a>

GMO SDK support calling track for view and event. These track information is very useful for game advertisement and tracking.

**View tracking function**  
When enter a view send view for tracking

```
+ (void) sendViewWithName:(NSString*) viewName;
```

**Event tracking function**  
When user perform an event send event for tracking

```
+ (void) sendEventWithCategory:(NSString*) categoryName withEventAction:(NSString*) action withLabel:(NSString*) label withValue:(NSNumber*) value;
```
Define `category`, `action`, `label` detail of the action

**Event tracking function**  
When user perform an event send event for tracking

```
+ (void)sendEventWithCategory:(NSString *)categoryName withEventAction:(NSString *)action withLabel:(NSString *)label;
```

Define `category`, `action`, `label` detail of the action



###2.5. Push notification function <a name= "head2-push-notification-function"> </a>

**Register push notification with groupname**  

Register push notification (currenly only support iOS). Use group name to choose user group for easy pushing (for example only push user in server 1 then groupName = "server 1").

```
+ (void) registerPushNotificationWithGroupName:(NSString*) groupName;
```

**Configure push notification with data**

```
+ (NSString*) configurePushNotificationWithTokenData:(NSData*) deviceTokenData;
```  
Configure push notification with data call after you register push notification. You push this function in :

```
- (void)application:(UIApplication*)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData*)deviceToken
{
    [GMOGameSDK configurePushNotificationWithTokenData:deviceToken];
}
```
of your application delegate.

**Handle push notification**

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

###2.6. Set game character <a name="head2-set-game-character"> </a>
Use when you wanna to set game chacracter with parameters :
server name, server ID , character name, character ID.

```
+ (void) setCharacterWithCharacterName:(NSString *)characterName characterID:(NSString *)characterID
               serverName:(NSString *)serverName serverID:(NSString *)serverID
          onCompleteBlock:(GMOSDKDictionaryBlock ) completeBlock
             onErrorBlock:(GMOSDKErrorBlock ) errorBlock;
```
###2.7. Advance function <a name="head2-advance-function"> </a>
All advance function is locate in [GMOGameSDK+Advance-Class](class-document/GMOGameSDK+Advance-Class.md).

**Invite facebook friends**

Call [GMOGameSDK inviteFacebookFriendsWithCompleteBlock: andErorrBlock:]; to invite friends play your game
(you must login to use this function).

```
+ (void)inviteFacebookFriendsWithCompleteBlock:(GMOSDKDictionaryBlock) resultBlock
                                 andErorrBlock:(GMOSDKErrorBlock) errorBlock;
```
**Show Facebook Login**

Call [GMOGameSDK showFacebookLogin]; to show Facebook Login without GMO Login UI.

```
+ (void) showFacebookLogin;
```

**Show Google Login**

Call [GMOGameSDK showGoogleLogin]; to show Google Login without GMO Login UI.

```
+ (void) showGoogleLogin;
```
**Show Twitter Login**

Call [GMOGameSDK showTwitterLogin]; to show Twitter Login without GMO Login UI.

```
+ (void) showTwitterLogin;
```

##3. Class Document <a name="head1-class-document"> </a>
- [GMOGameSDK-class](class-document/GMOGameSDK-class.md)
- [GMOGameSDKCallback-class](class-document/GMOGameSDKCallback-class.md)
- [GMOUserLoginResult-class](class-document/GMOUserLoginResult-class.md)
- [GMOPaymentResult](class-document/GMOPaymentResult-class.md)
- [GMOGameSDK+Advance-Class](class-document/GMOGameSDK+Advance-Class.md)

##4. FAQ and Glossary <a name="head1-faq"></a>
- When using SDK in games with server and game user support. To prevent user to make payment before entering the game (actually choose server and game user). You should call `setSDKButtonVisibility:FALSE` when configure the SDK and then call `setSDKButtonVisibility:TRUE` when game user is ready.
- `IPN` is payment machenism used by GMO System to increase gold for game user. Each app in GMO system will be configured with only one `IPN` url to callback when payment.
- `PackageID` each payment package in game should be defined along with a package ID (provided by SDKTool) to identify package.
- `PaymentState` <a name = "head3-payment-state"> </a> 
Use payment state to increase gold for game user.
Payment state must be implemented in `getPaymentStateWithPackageID:` function in GMOGameSDKCallback.m . And use `PackageID` and game server information to build up `PaymentState`.   
For example packageID: `com.gold.package1` - (defined in integration process) corresponds with a package of 1000 gold and current game user is X in server Y. Then payment state can be constructed : com.gold.package1_1000_gold_X_Y (depends on your format). Detail:
in `AppDelegate.m` implements :

```
- (NSString *) getPaymentStateWithPackageID:(NSString *)packageID{
	//username :X, server Y, package of 1000 gold
	// payment state can be set:
	//Note :Length of Payment State does not exceed 150 	//characters
	
	NSString *userName = @"X";
    NSString *server = @"Y";
    return [NSString stringWithFormat:@"%@_1000_gold_%@_%@",packageID,userName,server];

}
```

For more information about payment state please view our [Sample](Sample). We implement a singleton `GlobalGameVariables` to explain how to use payment state in that callback. Flow of payment state 
![State](images/payment_state_seq.png)
- Sample about server login verification and payment IPN is in [Sample_Server](Sample_Server/)
