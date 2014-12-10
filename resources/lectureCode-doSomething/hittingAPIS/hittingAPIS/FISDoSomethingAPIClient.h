//
//  FISDoSomethingAPIClient.h
//  hittingAPIS
//
//  Created by Joe Burgess on 12/4/14.
//  Copyright (c) 2014 Flatiron School. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FISDoSomethingAPIClient : NSObject

+ (void) getActiveCampaignsWithCompletionHandler:(void (^)(NSArray *campaigns))completionHandler;

@end
