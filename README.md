# GMO SDK

## Upgrade iOS SDK
- Remove `AppotaSDK.framework` and add `GMOSDK.framework`
- Remove `AppotaBundle.bundle` and add `GMOBundle.bundle`
- `import <AppotaSDK/AppotaSDK.h>` move to `import <GMOSDK/GMOSDK.h>
- `AppotaGameSDK` move to `GMOGameSDK` class
