//
//  FISDog.h
//  introToObjectiveC
//
//  Created by Joe Burgess on 12/2/14.
//  Copyright (c) 2014 Flatiron School. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FISDog : NSObject

@property (strong, nonatomic) NSString *name;

- (NSString *)bark;
- (instancetype)initWithName:(NSString *)name;
-(void)setAge:(NSNumber *)newAge;
- (NSNumber *)age;

@end
