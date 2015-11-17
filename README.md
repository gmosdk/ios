# GMO SDK

## Upgrade iOS SDK
- **Important**
- Remove `AppotaSDK.framework` and add `GMOSDK.framework`
- Remove `AppotaBundle.bundle` and add `GMOBundle.bundle`
- Remove all old facebook framework `FBSDKCoreKit.framework`, `FBSDKLoginKit.framework`, `FBSDKShareKit.framework` by the new frameworks in `Frameworks` folder
- `import <AppotaSDK/AppotaSDK.h>` move to `import <GMOSDK/GMOSDK.h>`
- Remove `AppotaClientId` key in `Info.plist`
- `AppotaGameSDK` move to `GMOGameSDK` class
- In `Info.plist` rename `AppotaAPIKey` to `GMOAPIKey`
- Replace appota{AppotaClientKey} by gmo{AppotaClientKey} in URL Schemes. Eg: appota990aefcc3c68d74a6bd7b4e859ea7e150557a8d35 replace to gmo990aefcc3c68d74a6bd7b4e859ea7e150557a8d35

- Add two extra framework:
	- `WebKit.framework`
	- `SafariServices.framework`
