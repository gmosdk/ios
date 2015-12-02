------------
**Get list payment Object**

```
+ (NSArray*) getListPaymentObject;
```
-----------
 **invite facebook friends**
 
```
+ (void)inviteFacebookFriendsWithCompleteBlock:(GMOSDKDictionaryBlock) resultBlock
                                 andErorrBlock:(GMOSDKErrorBlock) errorBlock;
```

--------------------
**show facebook login**

- If use delegate:

```
+ (void) showFacebookLogin;
```
- If use block:

```
+ (void) showFacebookLoginWithCompleteBlock:(GMOSDKUserLoginResultObjectBlock) completeBlock
                              andErrorBlock:(GMOSDKErrorBlock) errorBlock
```
- use block with custom facebook login permissions:

```
+ (void) showFacebookLoginWithPermissions:(NSArray *)permissions
                     andWithCompleteBlock:(GMOSDKUserLoginResultObjectBlock) completeBlock
                            andErrorBlock:(GMOSDKErrorBlock) errorBlock
```
---------------
**show google login**

- If use delegate:

 ```
+ (void) showGoogleLogin;
```
- if use block:

 ```
+ (void) showGoogleLoginWithCompleteBlock:(GMOSDKUserLoginResultObjectBlock) completeBlock
                            andErrorBlock:(GMOSDKErrorBlock) errorBlock
```

----------------
 **show Twitter login**
 
 - If use delegate:
 
 ```
+ (void) showTwitterLogin;
```

- If use block:

 ```
+ (void) showTwitterLoginWithCompleteBlock:(GMOSDKUserLoginResultObjectBlock) completeBlock
                             andErrorBlock:(GMOSDKErrorBlock) errorBlock
```