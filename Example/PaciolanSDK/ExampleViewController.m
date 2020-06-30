//
//  ExampleViewController.m
//  PaciolanSDK
//
//  Created by Daniel Escobedo on 05/04/2020.
//  Copyright (c) 2020 Daniel Escobedo. All rights reserved.
//

#import "ExampleViewController.h"
#import "PaciolanSDK/PaciolanSDKViewController.h"

@interface ExampleViewController ()

@end

@implementation ExampleViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)launchPaciolanSDK:(UIButton *)sender {
    printf("Launching PaciolanSDK ...");
    UIViewController *viewController = nil;
    viewController = [[PaciolanSDKViewController alloc] initWithString:@"{\"channelCode\":\"msdk-test\",\"sdkKey\":\"test2\",\"applicationId\":\"com.paciolan.sdk\",\"uiOptions\":{\"accentColor\":\"#036\",\"permissions\":{\"statusBar\":true,\"camera\":true},\"contactURL\":\"https://google.com\",\"privacyURL\":\"https://myaccount.google.com/privacycheckup\",\"tosURL\":\"https://termsfeed.com/blog/examples-user-agreements/\"},\"organizationId\":410,\"distributorCode\":\"IOWA\",\"route\":{\"name\":\"bestAvailableTicketPurchase\",\"params\":{\"policyCode\":\"CLASS\",\"seasonCode\":\"PP12\",\"itemCode\":\"PP05\"},\"uiOptions\":{\"itemImage\":\"https://images.unsplash.com/photo-1533923156502-be31530547c4?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&w=1000&q=80\",\"loginImage\":\"https://arizonawildcats.com/images/nav_logo.png\",\"loginDomain\":\"arizona.wildcats.com\",\"forgotPasswordUrl\":\"https://ev12.evenue.net/cgi-bin/ncommerce3/EVExecMacro?linkID=uaz-ts&evm=regf&addrReq=&phoneReq=&RSRC=&RDAT=&url=https%3A%2F%2Fev12.evenue.net%2Fcgi-bin%2Fncommerce3%2FEVExecMacro%3FlinkID%3Duaz-ts%26evm%3Dmyac%26entry%3DDisplayGroupList.html\",\"accessibleSeatingUrl\":\"tel:18008008000\",\"ticketTierImage\":\"http://www.iowaeventscenter.com/assets/img/Monster-Jam-2019_Seating-Chart-0b0e12b167.jpg\",\"ticketTierImages\":[{\"priceLevelId\":10,\"url\":\"http://www.iowaeventscenter.com/assets/img/HarlemGlobertrotters-Seating-Chart-new-01-9bf76e8a9d.jpg\"},{\"priceLevelId\":2,\"url\":\"http://www.iowaeventscenter.com/assets/img/Weezer_seating-chart-394eccd03e.jpg\"},{\"priceLevelId\":3,\"url\":\"http://www.iowaeventscenter.com/assets/img/HG-WFA19-9bf76e8a9d.jpg\"}]}},\"token\":null,\"debug\":false,\"demo\":false}"];
    [self presentModalViewController:viewController animated:YES];
}

@end
