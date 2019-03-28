#import <UIKit/UIKit.h>

@interface PaciolanSDKViewController : UIViewController

@property (strong, nonatomic) NSString *config;
- (id) initWithString: (NSString*) initializationConfig;
@end
