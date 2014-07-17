#import <Cordova/CDV.h>
#import "ActivityIndicator.h"
#import "MBProgressHUD.h"

@implementation ActivityIndicator
@synthesize activityIndicator;


/**
 * SIMPLE
 */

- (void)showSimple:(CDVInvokedUrlCommand *)command {
    
    // obtain commands
    bool dim = [[command.arguments objectAtIndex:0] boolValue];
    UIColor* color = [command.arguments objectAtIndex:1];

    // initialize indicator with options, text, detail
    self.activityIndicator = nil;
    self.activityIndicator = [MBProgressHUD showHUDAddedTo:self.webView.superview animated:YES];
    self.activityIndicator.mode = MBProgressHUDModeIndeterminate;
    
    // Check if dim : true ? false
    if (dim == true) {
        self.activityIndicator.dimBackground = YES;
    }
    
    // Cordova success
    CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@""];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}



/**
 * SIMPLE with LABEL
 */

- (void)showSimpleWithLabel:(CDVInvokedUrlCommand *)command {
    
    // obtain commands
    bool dim = [[command.arguments objectAtIndex:0] boolValue];
    NSString* text = [command.arguments objectAtIndex:1];
    UIColor* color = [command.arguments objectAtIndex:2];
    
    // initialize indicator with options, text, detail
    self.activityIndicator = nil;
    self.activityIndicator = [MBProgressHUD showHUDAddedTo:self.webView.superview animated:YES];
    self.activityIndicator.mode = MBProgressHUDModeIndeterminate;
    self.activityIndicator.labelText = text;
    self.activityIndicator.color =  [UIColor color:color];
    //HUD.color = [UIColor colorWithRed:0.23 green:0.50 blue:0.82 alpha:0.90];
    
    // Check if dim : true ? false
    if (dim == true) {
        self.activityIndicator.dimBackground = YES;
    }
    
    CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@""];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    
}



/**
 * SIMPLE with LABEL and DETAIL
 */
- (void)showSimpleWithLabelDetail:(CDVInvokedUrlCommand *)command   {
    // obtain commands
    bool dim = [[command.arguments objectAtIndex:0] boolValue];
    NSString* text = [command.arguments objectAtIndex:1];
    NSString* detail = [command.arguments objectAtIndex:2];
    UIColor* color = [command.arguments objectAtIndex:3];
    
    // initialize indicator with options, text, detail
    self.activityIndicator = nil;
    self.activityIndicator = [MBProgressHUD showHUDAddedTo:self.webView.superview animated:YES];
    self.activityIndicator.mode = MBProgressHUDModeIndeterminate;
    self.activityIndicator.labelText = text;
    self.activityIndicator.detailsLabelText = detail;
    self.activityIndicator.color =  [UIColor color:color];
    //HUD.color = [UIColor colorWithRed:0.23 green:0.50 blue:0.82 alpha:0.90];
    
    // Check for dim : true ? false
    if (dim == true) {
        self.activityIndicator.dimBackground = YES;
    }
    
    CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@""];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}




/**
 * TEXT ONLY
 */

- (void)showText:(CDVInvokedUrlCommand *)command {
    
    // obtain commands
    bool dim = [[command.arguments objectAtIndex:0] boolValue];
    NSString* text = [command.arguments objectAtIndex:1];
    UIColor* color = [command.arguments objectAtIndex:2];


    // initialize indicator with options, text, detail
    self.activityIndicator = nil;
    self.activityIndicator = [MBProgressHUD showHUDAddedTo:self.webView.superview animated:YES];
    self.activityIndicator.mode = MBProgressHUDModeIndeterminate;
    self.activityIndicator.labelText = text;
    self.activityIndicator.color =  [UIColor color:color];
    //HUD.color = [UIColor colorWithRed:0.23 green:0.50 blue:0.82 alpha:0.90];
    
    // Check for dim : true ? false
    if (dim == true) {
        self.activityIndicator.dimBackground = YES;
    }
    
    self.activityIndicator.mode = MBProgressHUDModeText;
	self.activityIndicator.labelText = @"Some message...";
	self.activityIndicator.margin = 10.f;
	self.activityIndicator.yOffset = 150.f;
    
    CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@""];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];

}




/**
 * DETERMINATE
 */

-(void)showDeterminate:(CDVInvokedUrlCommand *)command {
    
    // obtain commands
    bool dim = [[command.arguments objectAtIndex:0] boolValue];
    int increment = [[command.arguments objectAtIndex:1] intValue];
    NSNumber* incrementValue = @(increment);
    
    // initialize indicator with options, text, detail
    self.activityIndicator = nil;
    self.activityIndicator = [MBProgressHUD showHUDAddedTo:self.webView.superview animated:YES];
    self.activityIndicator.mode = MBProgressHUDModeDeterminate;
    
    
    // Check for dim : true ? false
    if (dim == true) {
        self.activityIndicator.dimBackground = YES;
    }
    
    // Load Progress bar with ::incrementValue
    [self.activityIndicator showWhileExecuting:@selector(progressTask:) onTarget:self withObject:incrementValue animated:YES];
    
    CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@""];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}



/**
 *  DETERMINATE with LABEL
 */

-(void)showDeterminateWithLabel:(CDVInvokedUrlCommand *)command {
    
    // obtain commands
    bool dim = [[command.arguments objectAtIndex:0] boolValue];
    int increment = [[command.arguments objectAtIndex:1] intValue];
    NSNumber* incrementValue = @(increment);
    NSString* text = [command.arguments objectAtIndex:2];
    
    // initialize indicator with options, text, detail
    self.activityIndicator = nil;
    self.activityIndicator = [MBProgressHUD showHUDAddedTo:self.webView.superview animated:YES];
    self.activityIndicator.mode = MBProgressHUDModeDeterminate;
    self.activityIndicator.labelText = text;
    
    // Check for dim : true ? false
    if (dim == true) {
        self.activityIndicator.dimBackground = YES;
    }
    
    // Load Progress bar with ::incrementValue
    [self.activityIndicator showWhileExecuting:@selector(progressTask:) onTarget:self withObject:incrementValue animated:YES];
    
    CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@""];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}



/**
 * DETERMINATE ANNULAR
 */

- (void)showDeterminateAnnular:(CDVInvokedUrlCommand *)command  {
    
    // obtain commands
    bool dim = [[command.arguments objectAtIndex:0] boolValue];
    int increment = [[command.arguments objectAtIndex:1] intValue];
    NSNumber* incrementValue = @(increment);
    
    // initialize indicator with options, text, detail
    self.activityIndicator = nil;
    self.activityIndicator = [MBProgressHUD showHUDAddedTo:self.webView.superview animated:YES];
    self.activityIndicator.mode = MBProgressHUDModeAnnularDeterminate;
    
    // Check for dim : true ? false
    if (dim == true) {
        self.activityIndicator.dimBackground = YES;
    }
    
    // Load Progress bar with ::incrementValue
    [self.activityIndicator showWhileExecuting:@selector(progressTask:) onTarget:self withObject:incrementValue animated:YES];
    
    CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@""];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}



/**
 * DETERMINATE ANNULAR with LABEL
 */
- (void)showDeterminateAnnularWithLabel:(CDVInvokedUrlCommand *)command  {
    
    // obtain commands
    bool dim = [[command.arguments objectAtIndex:0] boolValue];
    int increment = [[command.arguments objectAtIndex:1] intValue];
    NSNumber* incrementValue = @(increment);
    NSString* text = [command.arguments objectAtIndex:2];
    
    // initialize indicator with options, text, detail
    self.activityIndicator = nil;
    self.activityIndicator = [MBProgressHUD showHUDAddedTo:self.webView.superview animated:YES];
    self.activityIndicator.mode = MBProgressHUDModeAnnularDeterminate;
    self.activityIndicator.labelText = text;
    
    // Check for dim : true ? false
    if (dim == true) {
        self.activityIndicator.dimBackground = YES;
    }
    
    // Load Progress bar with ::incrementValue
    [self.activityIndicator showWhileExecuting:@selector(progressTask:) onTarget:self withObject:incrementValue animated:YES];
    
    CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@""];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}



/**
 * DETERMINATE BAR
 */

- (void)showDeterminateBar:(CDVInvokedUrlCommand *)command {
    
    // obtain commands
    bool dim = [[command.arguments objectAtIndex:0] boolValue];
    int increment = [[command.arguments objectAtIndex:1] intValue];
    NSNumber* incrementValue = @(increment);
    
    // initialize indicator with options, text, detail
    self.activityIndicator = nil;
    self.activityIndicator = [MBProgressHUD showHUDAddedTo:self.webView.superview animated:YES];
    self.activityIndicator.mode = MBProgressHUDModeDeterminateHorizontalBar;
    
    
    // Check for dim : true ? false
    if (dim == true) {
        self.activityIndicator.dimBackground = YES;
    }
    
    // Load Progress bar with ::incrementValue
    [self.activityIndicator showWhileExecuting:@selector(progressTask:) onTarget:self withObject:incrementValue animated:YES];
    
    CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@""];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}



/**
 * DETERMINATE BAR with LABEL
 */

- (void)showDeterminateBarWithLabel:(CDVInvokedUrlCommand *)command {
    
    // obtain commands
    bool dim = [[command.arguments objectAtIndex:0] boolValue];
    int increment = [[command.arguments objectAtIndex:1] intValue];
    NSNumber* incrementValue = @(increment);
    NSString* text = [command.arguments objectAtIndex:2];
    
    // initialize indicator with options, text, detail
    self.activityIndicator = nil;
    self.activityIndicator = [MBProgressHUD showHUDAddedTo:self.webView.superview animated:YES];
    self.activityIndicator.mode = MBProgressHUDModeDeterminateHorizontalBar;
    self.activityIndicator.labelText = text;
    
    
    // Check for dim : true ? false
    if (dim == true) {
        self.activityIndicator.dimBackground = YES;
    }
    
    // Load Progress bar with ::incrementValue
    [self.activityIndicator showWhileExecuting:@selector(progressTask:) onTarget:self withObject:incrementValue animated:YES];
    
    CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@""];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}


/**
 * SUCCESS
 */

-(void)showSuccess:(CDVInvokedUrlCommand *)command {
    
    // obtain commands
    bool dim = [[command.arguments objectAtIndex:0] boolValue];
    NSString* text = [command.arguments objectAtIndex:1];
    
    // initialize indicator with options, text, detail
    self.activityIndicator = nil;
    self.activityIndicator = [MBProgressHUD showHUDAddedTo:self.webView.superview animated:YES];
    self.activityIndicator.mode = MBProgressHUDModeCustomView;
    self.activityIndicator.labelText = text;
    
    // custom success image from bundle
    NSString *image = @"ActivityIndicator.bundle/37x-Checkmark.png";
    self.activityIndicator.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:image]];
    
    
    // Check for dim : true ? false
    if (dim == true) {
        self.activityIndicator.dimBackground = YES;
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
    
    // get increment value
    int _increment = [increment intValue];
    
    float progress = 0.0f;
    while (progress < 1.0f) {
        progress += 0.01f;
        self.activityIndicator.progress = progress;
        
        // increment in microseconds (100000mms = 1s)
        usleep(_increment);
    }
}

@end
