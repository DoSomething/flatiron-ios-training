//
//  FISDoSomethingAPIClient.m
//  hittingAPIS
//
//  Created by Joe Burgess on 12/4/14.
//  Copyright (c) 2014 Flatiron School. All rights reserved.
//

#import "FISDoSomethingAPIClient.h"
#import <AFNetworking.h>

@implementation FISDoSomethingAPIClient

+(void)getActiveCampaignsWithCompletionHandler:(void(^)(NSArray *))completionHandler
{
    AFHTTPSessionManager *session = [AFHTTPSessionManager manager];

    [session GET:@"https://www.dosomething.org/api/v1/campaigns.json" parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {

        completionHandler(responseObject);

    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        
        NSLog(@"ERROR! %@",error.localizedDescription);
    }];
}
@end
