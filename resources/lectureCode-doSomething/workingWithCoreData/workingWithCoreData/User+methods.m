//
//  User+methods.m
//  workingWithCoreData
//
//  Created by Joe Burgess on 12/5/14.
//  Copyright (c) 2014 Flatiron School. All rights reserved.
//

#import "User+methods.h"

@implementation User (methods)

+(User *)createUserInContext:(NSManagedObjectContext *)context
{
    return [NSEntityDescription insertNewObjectForEntityForName:@"User" inManagedObjectContext:context];
}

@end
