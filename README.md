# GMO SDK

## Upgrade iOS SDK
- Remove `AppotaSDK.framework` and add `GMOSDK.framework`
- Remove `AppotaBundle.bundle` and add `GMOBundle.bundle`
- `import <AppotaSDK/AppotaSDK.h>` move to `import <GMOSDK/GMOSDK.h>`
- `AppotaGameSDK` move to `GMOGameSDK` class
- In `Info.plist` rename `AppotaAPIKey` to `GMOAPIKey`

## Developer project
- Need to rename all variable with name `Appvn` and `Appota` to `GMO`
