#import <Cordova/CDV.h>
#import "ActivityIndicator.h"
#import "MBProgressHUD.h"

@implementation ActivityIndicator
@synthesize activityIndicator;


/**
 * SIMPLE
 */
- (void)showSimple:(CDVInvokedUrlCommand *)command {
    bool dim = [[command.arguments objectAtIndex:0] boolValue];
    
    self.activityIndicator = nil;
	   self.activityIndicator = [MBProgressHUD showHUDAddedTo:self.webView.superview animated:YES];
    self.activityIndicator.mode = MBProgressHUDModeIndeterminate;
    
    // Check for dim : true ? false
    if (dim == true) {
        self.activityIndicator.dimBackground = YES;
    }
    else if (dim == false) {
        self.activityIndicator.dimBackground = NO;
    }
    
    CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@""];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}


/**
 * SIMPLE with LABEL
 */
- (void)showSimpleWithLabel:(CDVInvokedUrlCommand *)command {
    
    // add functionality for color + font
    bool dim = [[command.arguments objectAtIndex:0] boolValue];
    NSString* text = [command.arguments objectAtIndex:1];
    
    self.activityIndicator = nil;
	   self.activityIndicator = [MBProgressHUD showHUDAddedTo:self.webView.superview animated:YES];
    self.activityIndicator.mode = MBProgressHUDModeIndeterminate;
    
    self.activityIndicator.labelText = text;
    
    // Check for dim : true ? false
    if (dim == true) {
        self.activityIndicator.dimBackground = YES;
    }
    else if (dim == false) {
        self.activityIndicator.dimBackground = NO;
    }
    
    CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@""];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    
}


/**
 * SIMPLE with LABEL and DETAIL
 */
- (void)showSimpleWithLabelDetail:(CDVInvokedUrlCommand *)command   {
    bool dim = [[command.arguments objectAtIndex:0] boolValue];
    NSString* text = [command.arguments objectAtIndex:1];
    NSString* detail = [command.arguments objectAtIndex:2];
    
    
    self.activityIndicator = nil;
	   self.activityIndicator = [MBProgressHUD showHUDAddedTo:self.webView.superview animated:YES];
    self.activityIndicator.mode = MBProgressHUDModeIndeterminate;
    self.activityIndicator.labelText = text;
    self.activityIndicator.detailsLabelText = detail;
    
    
    // Check for dim : true ? false
    if (dim == true) {
        self.activityIndicator.dimBackground = YES;
    }
    else if (dim == false) {
        self.activityIndicator.dimBackground = NO;
    }
    
    CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@""];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}



/**
 * DETERMINATE
 */
-(void)showDeterminate:(CDVInvokedUrlCommand *)command {
    bool dim = [[command.arguments objectAtIndex:0] boolValue];
    int increment = [[command.arguments objectAtIndex:1] intValue];
    NSNumber* incrementValue = @(increment);
    
    self.activityIndicator = nil;
	   self.activityIndicator = [MBProgressHUD showHUDAddedTo:self.webView.superview animated:YES];
    self.activityIndicator.mode = MBProgressHUDModeDeterminate;
    
    
    // Check for dim : true ? false
    if (dim == true) {
        self.activityIndicator.dimBackground = YES;
    }
    else if (dim == false) {
        self.activityIndicator.dimBackground = NO;
    }
    
    [self.activityIndicator showWhileExecuting:@selector(progressTask:) onTarget:self withObject:incrementValue animated:YES];
    
    CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@""];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}


/**
 *  DETERMINATE with LABEL
 */
-(void)showDeterminateWithLabel:(CDVInvokedUrlCommand *)command {
    bool dim = [[command.arguments objectAtIndex:0] boolValue];
    int increment = [[command.arguments objectAtIndex:1] intValue];
    NSNumber* incrementValue = @(increment);
    NSString* text = [command.arguments objectAtIndex:2];
    
    self.activityIndicator = nil;
	   self.activityIndicator = [MBProgressHUD showHUDAddedTo:self.webView.superview animated:YES];
    self.activityIndicator.mode = MBProgressHUDModeDeterminate;
    self.activityIndicator.labelText = text;
    
    // Check for dim : true ? false
    if (dim == true) {
        self.activityIndicator.dimBackground = YES;
    }
    else if (dim == false) {
        self.activityIndicator.dimBackground = NO;
    }
    
    [self.activityIndicator showWhileExecuting:@selector(progressTask:) onTarget:self withObject:incrementValue animated:YES];
    
    
    CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@""];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}


/**
 * DETERMINATE ANNULAR
 */
- (void)showDeterminateAnnular:(CDVInvokedUrlCommand *)command  {
    bool dim = [[command.arguments objectAtIndex:0] boolValue];
    int increment = [[command.arguments objectAtIndex:1] intValue];
    NSNumber* incrementValue = @(increment);
    
    self.activityIndicator = nil;
	   self.activityIndicator = [MBProgressHUD showHUDAddedTo:self.webView.superview animated:YES];
    self.activityIndicator.mode = MBProgressHUDModeAnnularDeterminate;
    
    // Check for dim : true ? false
    if (dim == true) {
        self.activityIndicator.dimBackground = YES;
    }
    else if (dim == false) {
        self.activityIndicator.dimBackground = NO;
    }
    
    [self.activityIndicator showWhileExecuting:@selector(progressTask:) onTarget:self withObject:incrementValue animated:YES];
    
    
    CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@""];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}



/**
 * DETERMINATE ANNULAR with LABEL
 */
- (void)showDeterminateAnnularWithLabel:(CDVInvokedUrlCommand *)command  {
    bool dim = [[command.arguments objectAtIndex:0] boolValue];
    int increment = [[command.arguments objectAtIndex:1] intValue];
    NSNumber* incrementValue = @(increment);
    NSString* text = [command.arguments objectAtIndex:2];
    
    self.activityIndicator = nil;
	   self.activityIndicator = [MBProgressHUD showHUDAddedTo:self.webView.superview animated:YES];
    self.activityIndicator.mode = MBProgressHUDModeAnnularDeterminate;
    self.activityIndicator.labelText = text;
    
    // Check for dim : true ? false
    if (dim == true) {
        self.activityIndicator.dimBackground = YES;
    }
    else if (dim == false) {
        self.activityIndicator.dimBackground = NO;
    }
    
    [self.activityIndicator showWhileExecuting:@selector(progressTask:) onTarget:self withObject:incrementValue animated:YES];
    
    
    CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@""];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}



/**
 * DETERMINATE BAR
 */

- (void)showDeterminateBar:(CDVInvokedUrlCommand *)command {
    bool dim = [[command.arguments objectAtIndex:0] boolValue];
    int increment = [[command.arguments objectAtIndex:1] intValue];
    NSNumber* incrementValue = @(increment);
    
    self.activityIndicator = nil;
	   self.activityIndicator = [MBProgressHUD showHUDAddedTo:self.webView.superview animated:YES];
    self.activityIndicator.mode = MBProgressHUDModeDeterminateHorizontalBar;
    
    
    // Check for dim : true ? false
    if (dim == true) {
        self.activityIndicator.dimBackground = YES;
    }
    else if (dim == false) {
        self.activityIndicator.dimBackground = NO;
    }
    
    [self.activityIndicator showWhileExecuting:@selector(progressTask:) onTarget:self withObject:incrementValue animated:YES];
    
    
    CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@""];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}


/**
 * DETERMINATE BAR with LABEL
 */

- (void)showDeterminateBarWithLabel:(CDVInvokedUrlCommand *)command {
    bool dim = [[command.arguments objectAtIndex:0] boolValue];
    int increment = [[command.arguments objectAtIndex:1] intValue];
    NSNumber* incrementValue = @(increment);
    NSString* text = [command.arguments objectAtIndex:2];
    
    
    self.activityIndicator = nil;
			 self.activityIndicator = [MBProgressHUD showHUDAddedTo:self.webView.superview animated:YES];
    self.activityIndicator.mode = MBProgressHUDModeDeterminateHorizontalBar;
    self.activityIndicator.labelText = text;
    
    
    // Check for dim : true ? false
    if (dim == true) {
        self.activityIndicator.dimBackground = YES;
    }
    else if (dim == false) {
        self.activityIndicator.dimBackground = NO;
    }
    
    [self.activityIndicator showWhileExecuting:@selector(progressTask:) onTarget:self withObject:incrementValue animated:YES];
    
    
    CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@""];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}


/**
 * SUCCESS
 */

-(void)showSuccess:(CDVInvokedUrlCommand *)command {
    bool dim = [[command.arguments objectAtIndex:0] boolValue];
    NSString* text = [command.arguments objectAtIndex:1];
    
    self.activityIndicator = nil;
	   self.activityIndicator = [MBProgressHUD showHUDAddedTo:self.webView.superview animated:YES];
    self.activityIndicator.mode = MBProgressHUDModeCustomView;
    self.activityIndicator.labelText = text;
    
    NSString *image = @"ActivityIndicator.bundle/37x-Checkmark.png";
    self.activityIndicator.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:image]];
    
    
    // Check for dim : true ? false
    if (dim == true) {
        self.activityIndicator.dimBackground = YES;
    }
    else if (dim == false) {
        self.activityIndicator.dimBackground = NO;
    }
    
    CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@""];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}


/**
 * HIDE
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



/**
 * PROGRESS TASK EVENT
 */

- (void)progressTask:(NSNumber *)increment{
    
    int _increment = [increment intValue];
    
    float progress = 0.0f;
				while (progress < 1.0f) {
						progress += 0.01f;
						self.activityIndicator.progress = progress;
						usleep(_increment);
				}
}

@end
