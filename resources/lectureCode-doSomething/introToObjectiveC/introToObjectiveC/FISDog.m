//
//  FISDog.m
//  introToObjectiveC
//
//  Created by Joe Burgess on 12/2/14.
//  Copyright (c) 2014 Flatiron School. All rights reserved.
//

#import "FISDog.h"

@implementation FISDog
{
    NSNumber *_age;
}

-(instancetype)initWithName:(NSString *)name
{
    self = [super init];
    if (self)
    {
        _name = name;
    }
    return self;
}

- (instancetype)init
{
    return [self initWithName:@"Clifford"];
}
- (NSString *)bark
{
    return @"Woof woof";
}
@end
