#import <UIKit/UIKit.h>

@interface PaciolanSDKViewController : UIViewController

typedef void (^TokenCallback)(NSString* token);

@property (strong, nonatomic) NSString* config;
- (id) initWithString: (NSString*) initializationConfig;
- (void)setTokenListener: (TokenCallback) finishBlock;
@end
