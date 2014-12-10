//
//  AppDelegate.m
//  workingWithCoreData
//
//  Created by Joe Burgess on 12/5/14.
//  Copyright (c) 2014 Flatiron School. All rights reserved.
//

#import "AppDelegate.h"
#import "CoreDataStack.h"
#import "User+methods.h"
#import "Message.h"
#import "MessagesViewController.h"

@interface AppDelegate ()

@property (strong, nonatomic) CoreDataStack *coreDataStack;

@end

@implementation AppDelegate

- (NSURL*)storeURL
{
    NSURL* documentsDirectory = [[NSFileManager defaultManager] URLForDirectory:NSDocumentDirectory inDomain:NSUserDomainMask appropriateForURL:nil create:YES error:NULL];
    return [documentsDirectory URLByAppendingPathComponent:@"db.sqlite"];
}

- (NSURL*)modelURL
{
    return [[NSBundle mainBundle] URLForResource:@"Model" withExtension:@"momd"];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.

    UINavigationController *initialVC = (UINavigationController *)self.window.rootViewController;
    self.coreDataStack = [[CoreDataStack alloc] initWithStoreURL:[self storeURL] modelURL:[self modelURL]];
    MessagesViewController *messagesVC = (MessagesViewController *)initialVC.topViewController;
    messagesVC.context = self.coreDataStack.managedObjectContext;

    

//    User *joe =[User createUserInContext:self.coreDataStack.managedObjectContext];
//    joe.firstName = @"Joe";
//    joe.lastName = @"Burgess";
//
//    Message *messageOne = [NSEntityDescription insertNewObjectForEntityForName:@"Message" inManagedObjectContext:self.coreDataStack.managedObjectContext];
//    messageOne.content = @"Hi guyz";
//
//    [joe addMessagesObject:messageOne];
//
//    NSLog(@"Message One's Recipient: %@",messageOne.recipient.firstName);
//
//    NSError *error;
//   [self.coreDataStack.managedObjectContext save:&error];
//
//    if (error) {
//        NSLog(@"There was an error: %@",error.localizedDescription);
//    }

    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.

    NSFetchRequest *userFetch = [NSFetchRequest fetchRequestWithEntityName:@"User"];

    NSError *error;
    NSArray *users = [self.coreDataStack.managedObjectContext executeFetchRequest:userFetch error:&error];

    NSLog(@"USERS: %@",users);

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
