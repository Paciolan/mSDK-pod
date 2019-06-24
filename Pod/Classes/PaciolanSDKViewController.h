#import <UIKit/UIKit.h>

@interface PaciolanSDKViewController : UIViewController

@property (strong, nonatomic) NSString *config;
@property (strong, nonatomic) NSString *paciolanJWT;
- (id) initWithString: (NSString*) initializationConfig;
@end
