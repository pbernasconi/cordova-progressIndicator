#import <Cordova/CDV.h>
#import "ActivityIndicator.h"
#import "MBProgressHUD.h"

@implementation ActivityIndicator
@synthesize activityIndicator;

/**
 * Show Activity Indicator
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


-(void)showSuccess:(CDVInvokedUrlCommand *)command {
    bool dim = [[command.arguments objectAtIndex:0] boolValue];
    NSString* text = [command.arguments objectAtIndex:1];
    
    self.activityIndicator = nil;
	self.activityIndicator = [MBProgressHUD showHUDAddedTo:self.webView.superview animated:YES];
    
    self.activityIndicator.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"37x-Checkmark.png"]];

    
    self.activityIndicator.mode = MBProgressHUDModeCustomView;
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
