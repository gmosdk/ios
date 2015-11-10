# GMO SDK

## Upgrade iOS SDK
- Remove `AppotaSDK.framework` and add `GMOSDK.framework`
- Remove `AppotaBundle.bundle` and add `GMOBundle.bundle`
- `import <AppotaSDK/AppotaSDK.h>` move to `import <GMOSDK/GMOSDK.h>`
- `AppotaGameSDK` move to `GMOGameSDK` class
- In `Info.plist` rename `AppotaAPIKey` to `GMOAPIKey`

## Developer project
- Need to rename all variable with name `Appvn` and `Appota` to `GMO`

## Integrate SDK <a name = "head1-integrate-sdk"> </a>

###1.1. Prerequisites <a name = "head2-prerequisites">  </a>
To get started with the GMO Game SDK for iOS, you can set up the SDK and start building a new project, or you can integrate the SDK in an existing project. You can also run the samples to get a sense of how the SDK works.

The GMO Game SDK for iOS supports the following versions of software:

* Xcode 6 and later
* iOS 6 and later

####1.2.1. Add the GMO iOS SDK
 Open [ios/Frameworks](Frameworks/)  and add  [GMOSDK.framework](Frameworks/GMOSDK.framework), [GMOBundle.bundle](Frameworks/GMOBundle.bundle), [FBSDKCoreKit.framework](Frameworks/FBSDKCoreKit.framework),
 [FBSDKLoginKit.framework](Frameworks/FBSDKLoginKit.framework), 
[FBSDKShareKit.framework](Frameworks/FBSDKShareKit.framework) to your project. (Remember to choose **Create groups for any added folders** and select **Copy items into destination group's folder (if needed)**)

####1.2.2. Add framework dependencies and setting
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
- `SafariServices.framework`

Open **Build Settings**, find **Other Linker Flags**, add `-ObjC` then check if **Link Frameworks Automatically**, **Enable Modules (C and Objectivce-C))** are set to `YES`

####1.2.3. Configure the Info `.plist`

- Open Info `plist` section add `FacebookAppID` key with value is your [Facebook AppID](#head3-facebook-appid).
- Open Info `plist` section add `FacebookAppLinkUrl` key with value is your [Facebook App Link](#head3-facebook-app-link).
- Open Info `plist` section add `GOOGLE_CLIENT_ID` and `GOOGLE_CLIENT_SECRET` key with value is your [Google Client Id and Sceret](#head3-google-appid) in case of no client secret provided please leave `GOOGLE_CLIENT_SECRET` field blank.
- Open Info `plist` section add `TWITTER_CONSUMER_KEY` and `TWITTER_CONSUMER_SECRET` key with value is your [Twitter consumer key and twitter consumer secret](#head3-twitter-appid).
- Open Info `plist` section add `GMOAPIKey` key with value is your [GMO APIKey]
- Add url schemes:
	- Identifier Facebook, URL Schemes: `fbYOUR_FACEOOK_APP_ID`, [Facebook AppID](#head3-facebook-appid) can be retreived from Facebook App Dashboard

####1.2. Update the SDK to a Newer Version <a name="head2-update-the-sdk-to-a-newer-version"> </a>

When we release a new version of the SDK, you can pick up the changes as described below.

* In Xcode select the following frameworks, bundle and hit **delete** on your keyboard. Then select **Move to Trash**:

    * `GMOSDK.framework`
    * `GMO Bundle.bundle`
    * `FBSDKCoreKit.framework`
    * `FBSDKLoginKit.framework`
    * `FBSDKShareKit.framework`