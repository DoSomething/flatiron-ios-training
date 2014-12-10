//
//  User+methods.h
//  workingWithCoreData
//
//  Created by Joe Burgess on 12/5/14.
//  Copyright (c) 2014 Flatiron School. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "User.h"

@interface User (methods)
+ (User *)createUserInContext:(NSManagedObjectContext *)context;
@end
