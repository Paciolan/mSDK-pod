
#import "PaciolanSDKViewController.h"
#import <React/RCTRootView.h>
#import <React/RCTBridgeDelegate.h>
#import <React/RCTBridge.h>
#import <React/RCTBundleURLProvider.h>
#import <CodePush/CodePush.h>
#import <React/RCTBridgeModule.h>
#import <React/RCTUtils.h>

// Let this View Controller handle getting the URL for the JS
@interface PaciolanSDKViewController () <RCTBridgeDelegate,RCTBridgeModule>
@end

@implementation PaciolanSDKViewController
@synthesize config;

+ (BOOL)requiresMainQueueSetup
{
    return YES;
}

RCT_EXPORT_MODULE()

// Set self.view on the VC to be an RCTRootView
- (void)loadView
{
    RCTBridge *bridge = [[RCTBridge alloc] initWithDelegate:self launchOptions:@{}];
    self.view = [[RCTRootView alloc] initWithBridge:bridge
                                         moduleName:@"PaciolanSDK"
                                  initialProperties:@{@"configString":config, @"gqlRoute":@"https://l43ijxugfbgy3bqpu4mr44lawu.appsync-api.us-west-2.amazonaws.com/graphql", @"gqlHeader":@"da2-z4is67k4f5dzdkt4brqgkobphe"}];
}

// Use our bundled JS for now
- (NSURL *)sourceURLForBridge:(RCTBridge *)bridge
{
    #if DEBUG
        NSBundle *sdkAppBundle = [NSBundle bundleForClass:PaciolanSDKViewController.class];
        return [sdkAppBundle URLForResource:@"PaciolanSDK" withExtension:@"js"];
    #else
        return [CodePush bundleURL];
    #endif
}

- (id) initWithString: (NSString*) initializationConfig {
    self = [super init];
    if (self) {
        config = initializationConfig;
    }
    return self;
}

RCT_EXPORT_METHOD(exitApp)
{
    dispatch_sync(dispatch_get_main_queue(), ^{
        [RCTPresentedViewController() dismissViewControllerAnimated:false completion:nil];
    });
};

@end
