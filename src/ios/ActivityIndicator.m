#import <Cordova/CDV.h>
#import "ActivityIndicator.h"
#import "MBProgressHUD.h"

@implementation ActivityIndicator
@synthesize activityIndicator;

/**
 * Show Activity Indicator
 */

- (void)show:(CDVInvokedUrlCommand*)command
{
	NSString* type = [command.arguments objectAtIndex:0];
    bool dim = [[command.arguments objectAtIndex:1] boolValue];
    NSString* text = [command.arguments objectAtIndex:2];
    NSString* detail = [command.arguments objectAtIndex:3];
    
    self.activityIndicator = nil;
	self.activityIndicator = [MBProgressHUD showHUDAddedTo:self.webView.superview animated:YES];
    
    
    // Check for dim : true ? false
    
    if (dim == true) {
        self.activityIndicator.dimBackground = YES;
    }
    else if (dim == false) {
        self.activityIndicator.dimBackground = NO;
    }
    
    
    
    // Check for types
    
    if ([type isEqual: @"indeterminate-simple"]) {
        self.activityIndicator.mode = MBProgressHUDModeIndeterminate;
    }
    
    else if ([type isEqual: @"indeterminate-label"] && [label length] != 0) {
        self.activityIndicator.mode = MBProgressHUDModeIndeterminate;
        self.activityIndicator.labelText = text;
    }
    
    else if ([type isEqual: @"indeterminate-label-detail"] && [label length] != 0 && [detail length] != 0) {
        self.activityIndicator.mode = MBProgressHUDModeIndeterminate;
        self.activityIndicator.labelText = text;
        self.activityIndicator.detailsLabelText = detail;
        self.activityIndicator.square = YES;
    }
    
    else if ([type isEqual: @"determinate"]) {
        self.activityIndicator.mode = MBProgressHUDModeDeterminate;
    }
    
    else if ([type isEqual: @"determinate-label"] && [label length] != 0) {
        self.activityIndicator.mode = MBProgressHUDModeDeterminate;
        self.activityIndicator.labelText = text;
    }
    
    else if ([type isEqual: @"determinate-annular"]) {
        self.activityIndicator.mode = MBProgressHUDModeAnnularDeterminate;
    }
    
    else if ([type isEqual: @"determinate-annular-label"] && [label length] != 0) {
        self.activityIndicator.mode = MBProgressHUDModeAnnularDeterminate;
        self.activityIndicator.labelText = text;
    }
    
    else if ([type isEqual: @"determinate-bar"]) {
        self.activityIndicator.mode = MBProgressHUDModeDeterminateHorizontalBar;
    }
    
    else if ([type isEqual: @"determinate-bar-label"] && [label length] != 0) {
        self.activityIndicator.mode = MBProgressHUDModeDeterminateHorizontalBar;
        self.activityIndicator.labelText = text;
    }
    
    else if ([type isEqual: @"success"]) {
        self.activityIndicator.mode = MBProgressHUDModeIndeterminate;
    }
    
    else {
        CDVPluginResult * pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"invalid duration. valid options are 'short' and 'long'"];
        [self writeJavascript:[pluginResult toErrorCallbackString:command.callbackId]];
        return;
    }
    
    
    
    CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@""];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}



/**
 * This hide the ProgressDialog
 */
- (void)hide:(CDVInvokedUrlCommand*)command
{
	if (!self.activityIndicator) {
		CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR];
		[self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
		return;
	}
	[self.activityIndicator hide:YES];
    CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@""];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

@end
