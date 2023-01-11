
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

static TokenCallback tokenCallback;

+ (BOOL)requiresMainQueueSetup
{
    return YES;
}

RCT_EXPORT_MODULE()

// Set self.view on the VC to be an RCTRootView
- (void)loadView
{
    BOOL integration = false;
    @try {
        NSMutableDictionary *dict=[NSJSONSerialization JSONObjectWithData:[config dataUsingEncoding:NSUTF8StringEncoding] options:kNilOptions error:nil];
        NSString *integrationTest=dict[@"integrationTest"];
        integration= [integrationTest boolValue];
        NSLog(integration ? @"Yes" : @"No");

        // avoid webview cache
        [[NSURLCache sharedURLCache] removeAllCachedResponses];
        [[NSURLCache sharedURLCache] setDiskCapacity:0];
        [[NSURLCache sharedURLCache] setMemoryCapacity:0];
    }
    @catch(NSException *exception) {
        NSLog(@"Something went wrong.");
    }
    NSString *gqlRoute;
    NSString *gqlHeader;

    if(integration) {
         NSLog(@"INTEGRATION API");
        gqlRoute = @"https://zbeiclwpbbel5gk5mweyr6xdoy.appsync-api.us-west-2.amazonaws.com/graphql";
        gqlHeader = @"da2-kf5luvu2ffcanmyum6clpz2wtm";
    } else {
        NSLog(@"PROD API");
        gqlRoute=@"https://wej6l5gcxzf73aeoe3dt4bcxpe.appsync-api.us-west-2.amazonaws.com/graphql";
        gqlHeader=@"da2-mrtjord5wzes3dlwfshrwregde";
    }

    RCTBridge *bridge = [[RCTBridge alloc] initWithDelegate:self launchOptions:@{}];
    self.view = [[RCTRootView alloc] initWithBridge:bridge
                                         moduleName:@"PaciolanSDK"
                                  initialProperties:@{@"configString":config, @"gqlRoute": gqlRoute, @"gqlHeader":gqlHeader}];
}

// Use our bundled JS for now
- (NSURL *)sourceURLForBridge:(RCTBridge *)bridge
{
    [CodePush overrideAppVersion: @"4.4"]; // if the major version changes we up this so that codepush no longer affects previous builds that dont have the latest
    return [CodePush bundleURLForResource:@"PaciolanSDK"
                                    withExtension:@"js"
                                     subdirectory:nil
                                           bundle:[NSBundle bundleForClass:PaciolanSDKViewController.class]];
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    return (UIInterfaceOrientationMaskPortrait);
}

- (id) initWithString: (NSString*) initializationConfig {
    self = [super init];
    if (self) {
        config = initializationConfig;
    }
    return self;
}

- (void) setTokenListener: (void(^)(NSString* token))callback
{
    tokenCallback = callback;
}
RCT_EXPORT_METHOD(storeToken:(NSString *)token)
{
    if (tokenCallback) {
        tokenCallback(token);
    }
};


RCT_EXPORT_METHOD(exitApp)
{
    dispatch_sync(dispatch_get_main_queue(), ^{
        [RCTPresentedViewController() dismissViewControllerAnimated:false completion:nil];
    });
};

@end
