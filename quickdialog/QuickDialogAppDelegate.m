//
//  QuickDialogAppDelegate.m
//  QuickDialog
//
//  Created by Nick Charlton on 19/09/2011.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "QuickDialogAppDelegate.h"

@implementation QuickDialogAppDelegate

@synthesize window = _window;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    
    QRootElement *root = [[QRootElement alloc] init];
    root.title = @"Hello World"; // view title
    root.grouped = YES; // view style
    QSection *section = [[QSection alloc] init]; // section for the first of content
    
    // a label
    QLabelElement *label = [[QLabelElement alloc] initWithTitle:@"Hello" Value:@"world!"];
    // a button
    QButtonElement *button = [[QButtonElement alloc] initWithTitle:@"Hit Me!"];
    
    [root addSection:section];
    [section addElement:label];
    [section addElement:button];
    
    // a second section
    QSection *section_two = [[QSection alloc] init];
    QButtonElement *button_two = [[QButtonElement alloc] initWithTitle:@"On my own!"];
    [root addSection:section_two];
    [section_two addElement:button_two];
    
    UINavigationController *navigation = [QuickDialogController controllerWithNavigationForRoot:root];
    //[self presentModalViewController:navigation animated:YES];
    [self.window addSubview:navigation.view];
    
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
     */
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    /*
     Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
     */
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    /*
     Called when the application is about to terminate.
     Save data if appropriate.
     See also applicationDidEnterBackground:.
     */
}

- (void)dealloc
{
    [_window release];
    [super dealloc];
}

@end
