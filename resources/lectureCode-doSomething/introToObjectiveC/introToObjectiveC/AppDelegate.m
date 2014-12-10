//
//  AppDelegate.m
//  introToObjectiveC
//
//  Created by Joe Burgess on 12/2/14.
//  Copyright (c) 2014 Flatiron School. All rights reserved.
//

#import "AppDelegate.h"
#import "FISDog.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (NSMutableArray *)createTestArray:(NSString *)helloString {
    NSMutableArray *myArray = [[NSMutableArray alloc] init];
    [myArray addObject:helloString];
    
    [myArray insertObject:@"World"
                  atIndex:1];
    [myArray addObject:@87];
    return myArray;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.


    NSLog(@"Hello, World!");

    CGFloat myFloat = 5.2;
    NSInteger myInteger = 4;

    CGFloat sum = myFloat+myInteger;

    NSString *helloString = @"Hello,";
    NSString *stringB = @"World!";

    //myString = stringA+stringB returns "Hello, World!"

    NSString *concatedString = [self appendWithStringA:@"Hello," andStringB:@"World!"];

    NSLog(@"%@",concatedString);

    NSMutableArray *myArray;
    myArray = [self createTestArray:helloString];

    NSDictionary *myDictionary = @{@"Height": @17,
                                   @"Name": @"Joe"};
    NSLog(@"my Array %@",myArray);

//    NSLog(@"My String is %@",concatenatedString);
//    NSLog(@"My Sum is: %f",sum);



    NSMutableString *myString = [[NSMutableString alloc] initWithString:@"Hello!"];
    FISDog *fido = [[FISDog alloc] initWithName:@"Fido"];
//    [fido setName:@"Fido"];
//    fido.name = @"Fido";

//    fido.age=@20;
//    NSLog(@"%@ says: %@ and is %@ yrs old",fido.name , [fido bark], fido.age);

    return YES;
}

- (NSString *)appendWithStringA: (NSString *)james andStringB: (NSString *)frank
{
    NSMutableString *result = [[NSMutableString alloc] initWithString:james];
    [result appendString:frank];

    return result;
}
- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.

}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.

}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.

}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
