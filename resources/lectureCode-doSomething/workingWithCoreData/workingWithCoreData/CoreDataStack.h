//
//  CoreDataStack.h
//  workingWithCoreData
//
//  Created by Joe Burgess on 12/5/14.
//  Copyright (c) 2014 Flatiron School. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@interface CoreDataStack : NSObject

@property (nonatomic,strong,readonly) NSManagedObjectContext* managedObjectContext;
- (id)initWithStoreURL:(NSURL*)storeURL modelURL:(NSURL*)modelURL;
@end
