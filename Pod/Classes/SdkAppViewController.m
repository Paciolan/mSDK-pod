
#import "SdkAppViewController.h"
#import <React/RCTRootView.h>
#import <React/RCTBridgeDelegate.h>
#import <React/RCTBridge.h>
#import <CodePush/CodePush.h>

// Let this View Controller handle getting the URL for the JS
@interface SdkAppViewController () <RCTBridgeDelegate>
@end

@implementation SdkAppViewController

// Set self.view on the VC to be an RCTRootView
- (void)loadView
{
    RCTBridge *bridge = [[RCTBridge alloc] initWithDelegate:self launchOptions:@{}];
    self.view = [[RCTRootView alloc] initWithBridge:bridge
                                         moduleName:@"SdkApp"
                                  initialProperties:@{@"daniel": @"escobedo"}];
}

// Use our bundled JS for now
- (NSURL *)sourceURLForBridge:(RCTBridge *)bridge
{
    // NSBundle *sdkAppBundle = [NSBundle bundleForClass:SdkAppViewController.class];
    // return [sdkAppBundle URLForResource:@"SdkApp" withExtension:@"js"];
    return [CodePush URLForResource:@"SdkApp" withExtension:@"js"]
}

@end
