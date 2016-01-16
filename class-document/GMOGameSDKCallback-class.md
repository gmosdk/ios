** @optional **  

- (void) didCloseLoginView;

- (void) didLoginErrorWithMessage:(NSString *)message withError:(NSError *)error;

- (void) didPaymentErrorWithMessage:(NSString *)message withError:(NSError *)error;

** @required **


- (NSString*) getPaymentStateWithPackageID:(NSString *) packageID;

- (void) didLoginSuccess:(GMOUserLoginResult*) userLoginResult;

- (void) didLogOut:(NSString*) userName;

- (void) didPaymentSuccessWithResult:(GMOPaymentResult*) paymentResult withPackage:(NSString *) packageID;
