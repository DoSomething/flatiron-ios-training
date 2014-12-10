//
//  Message.h
//  workingWithCoreData
//
//  Created by Joe Burgess on 12/5/14.
//  Copyright (c) 2014 Flatiron School. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class User;

@interface Message : NSManagedObject

@property (nonatomic, retain) NSString * content;
@property (nonatomic, retain) NSDate * dateSent;
@property (nonatomic, retain) User *recipient;

@end
