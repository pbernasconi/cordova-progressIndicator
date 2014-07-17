#import <Cordova/CDV.h>
#import "MBProgressHUD.h"

@interface ActivityIndicator: CDVPlugin {
}

@property (nonatomic, assign) MBProgressHUD* activityIndicator;

- (void)showSimple:(CDVInvokedUrlCommand*)command;
- (void)showSimpleWithLabel:(CDVInvokedUrlCommand*)command;
- (void)showSimpleWithLabelDetail:(CDVInvokedUrlCommand*)command;
- (void)showDeterminate:(CDVInvokedUrlCommand*)command;
- (void)showDeterminateWithLabel:(CDVInvokedUrlCommand*)command;
- (void)showDeterminateAnnular:(CDVInvokedUrlCommand*)command;
- (void)showDeterminateAnnularWithLabel:(CDVInvokedUrlCommand*)command;
- (void)showDeterminateBar:(CDVInvokedUrlCommand*)command;
- (void)showDeterminateBarWithLabel:(CDVInvokedUrlCommand*)command;
- (void)showSuccess:(CDVInvokedUrlCommand*)command;

- (void)hide:(CDVInvokedUrlCommand*)command;

- (void)progressTask:(NSNumber*)increment;

@end
