//
//  ViewController.m
//  hittingAPIS
//
//  Created by Joe Burgess on 12/4/14.
//  Copyright (c) 2014 Flatiron School. All rights reserved.
//

#import "ViewController.h"
#import "FISDoSomethingAPIClient.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *numOfCampaignsLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

//    NSURLSession *session = [NSURLSession sharedSession];
//
//    NSURL *doSomethingURL = [NSURL URLWithString:@"https://beta.dosomething.org/api/v1/users/get_member_count"];
//
//    NSMutableURLRequest *myRequest = [[NSMutableURLRequest alloc] initWithURL:doSomethingURL];
//    myRequest.HTTPMethod = @"POST";
//
//    NSURLSessionDataTask *getCampaigns = [session dataTaskWithRequest:myRequest completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
//        NSDictionary *myInfo = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
//        NSLog(@"%@",myInfo);
//
//    }];
//
//    [getCampaigns resume];

    NSString *intro = @"The number of campaigns is:";

    [FISDoSomethingAPIClient getActiveCampaignsWithCompletionHandler:^(NSArray *campaigns) {

        self.numOfCampaignsLabel.text = [NSString stringWithFormat:@"%@%li",intro,[campaigns count]];

    }];
    

    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
