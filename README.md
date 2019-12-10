# SdkApp

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

To install, simply add the following lines to your Podfile:

- at the top of the file:

```ruby
source 'https://github.com/CocoaPods/Specs.git'
source 'https://github.com/Paciolan/mSDK-specs'
```

- in the target(s) you want accessing the files

```ruby
pod 'SdkApp'
```

## Integration

Objective-C:
In your .m implementation file first
```objective-c
#import "PaciolanSDKViewController.h"
```
and then call 
```objective-c
UIViewController *viewController = nil;
[[PaciolanSDKViewController alloc] initWithString:@"{\"channelCode\":\"pac-sdk\",\"sdkKey\":\"test1\",\"applicationId\":\"com.paciolan.sdk\",\"uiOptions\":{\"accentColor\":\"#980A0E\",\"contactURL\":\"https://google.com\",\"privacyURL\":\"https://myaccount.google.com/privacycheckup\",\"tosURL\":\"https://termsfeed.com/blog/examples-user-agreements/\"},\"organizationId\":431,\"distributorCode\":\"IOWA\",\"route\":{\"name\":\"bestAvailableTicketPurchase\",\"params\":{\"policyCode\":\"PACSDK\",\"seasonCode\":\"FBE\",\"itemCode\":\"F07\"},\"uiOptions\":{\"itemImage\":\"https://images.unsplash.com/photo-1533923156502-be31530547c4?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&w=1000&q=80\",\"accessibleSeatingUrl\":\"https://google.com\",\"ticketTierImage\":\"http://www.iowaeventscenter.com/assets/img/Monster-Jam-2019_Seating-Chart-0b0e12b167.jpg\",\"ticketTierImages\":[{\"priceLevelId\":10,\"url\":\"http://www.iowaeventscenter.com/assets/img/HarlemGlobertrotters-Seating-Chart-new-01-9bf76e8a9d.jpg\"},{\"priceLevelId\":2,\"url\":\"http://www.iowaeventscenter.com/assets/img/Weezer_seating-chart-394eccd03e.jpg\"},{\"priceLevelId\":3,\"url\":\"http://www.iowaeventscenter.com/assets/img/HG-WFA19-9bf76e8a9d.jpg\"}]}},\"debug\":false,\"demo\":false}"];
[self presentModalViewController:viewController animated:YES];
```
 with a serialized JSON representation of the config obbject defined at http://confluence.paciolan.corp/display/MOB/mSDK+Initialization+and+inventory+GraphQL+call

Swift: 
First add 
```objective-c
#import "PaciolanSDKViewController.h"
``` 
to your swift bridging header.
then in swift run 
```swift
let vc:UIViewController = PaciolanSDKViewController(string:"{\"channelCode\":\"pac-sdk\",\"sdkKey\":\"test1\",\"applicationId\":\"com.paciolan.sdk\",\"uiOptions\":{\"accentColor\":\"#003366\",\"contactURL\":\"https://google.com\",\"privacyURL\":\"https://myaccount.google.com/privacycheckup\",\"tosURL\":\"https://termsfeed.com/blog/examples-user-agreements/\"},\"organizationId\":431,\"distributorCode\":\"IOWA\",\"route\":{\"name\":\"bestAvailableTicketPurchase\",\"params\":{\"policyCode\":\"PACSDK\",\"seasonCode\":\"FBE\",\"itemCode\":\"F07\"},\"uiOptions\":{\"itemImage\":\"https://images.unsplash.com/photo-1533923156502-be31530547c4?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&w=1000&q=80\",\"accessibleSeatingUrl\":\"https://google.com\",\"ticketTierImage\":\"http://www.iowaeventscenter.com/assets/img/Monster-Jam-2019_Seating-Chart-0b0e12b167.jpg\",\"ticketTierImages\":[{\"priceLevelId\":10,\"url\":\"http://www.iowaeventscenter.com/assets/img/HarlemGlobertrotters-Seating-Chart-new-01-9bf76e8a9d.jpg\"},{\"priceLevelId\":2,\"url\":\"http://www.iowaeventscenter.com/assets/img/Weezer_seating-chart-394eccd03e.jpg\"},{\"priceLevelId\":3,\"url\":\"http://www.iowaeventscenter.com/assets/img/HG-WFA19-9bf76e8a9d.jpg\"}]}},\"debug\":false,\"demo\":false}")
        self.present(vc, animated:false)

```
with a serialized JSON representation of the config obbject defined at http://confluence.paciolan.corp/display/MOB/mSDK+Initialization+and+inventory+GraphQL+call


## Author

Paciolan Mobile Team, pacmobile@paciolan.com

## License

See the LICENSE file for more info.
