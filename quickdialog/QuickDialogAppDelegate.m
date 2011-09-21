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
@synthesize navigation = _navigation;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.    
    QRootElement *root = [[QRootElement alloc] init];
    root.title = @"Hello World"; // view title
    root.grouped = YES; // view style
    
    [root addSection:[self createSampleControls]];
    
    self.navigation = [QuickDialogController controllerWithNavigationForRoot:root];
    
    // once it has been setup as the root for the controller, we can safely release it
    [root release];
    
    // add as a subview
    [self.window addSubview:self.navigation.view];
    
    [self.window makeKeyAndVisible];
    return YES;
}

- (QSection *)createSampleControls {
    QSection *controls = [[[QSection alloc] initWithTitle:@"Change something"] autorelease];
    
    QLabelElement *element1 = [[QLabelElement alloc] initWithTitle:@"Label" Value:@"element"];
    
    NSArray *radioElementItems = [[NSArray alloc] initWithObjects:@"Option 1", @"Option 2", @"Option 3", nil];
    QRadioElement *radioElement = [[QRadioElement alloc] initWithItems:radioElementItems selected:0 title:@"Radio"];
	radioElement.key = @"radio1";
    
    QBooleanElement *boolElement = [[QBooleanElement alloc] initWithTitle:@"Boolean Element" BoolValue:YES];
	boolElement.key = @"bool1";
	
    QEntryElement *entryElement = [[QEntryElement alloc] initWithTitle:@"Entry Element" Value:nil Placeholder:@"type here"];
	entryElement.key = @"entry1";
	
    controls.footer = @"More controls will be added.";
    [controls addElement:element1];
    [element1 release];
    
    [controls addElement:radioElement];
    [radioElement release];
//    [radioElementItems release];
    
    [controls addElement:entryElement];
    [entryElement release];
	
    [controls addElement:boolElement];
    [boolElement release];
	QDateTimeInlineElement *dateElement = [[QDateTimeInlineElement alloc] initWithTitle:@"DateTime" date:[NSDate date]];
	dateElement.key = @"date1";
    [controls addElement:dateElement];
    [dateElement release];
    
    QFloatElement *slider = [[QFloatElement alloc] initWithTitle:@"Float Element" value:0.5];
	slider.key = @"slider1";
    [controls addElement:slider];
    [slider release];
    
    QDecimalElement *decimal = [[QDecimalElement alloc] initWithTitle:@"Decimal Element" value:0.5];
    decimal.key = @"decimal1";
    decimal.fractionDigits = 3;
    [controls addElement:decimal];
    [decimal release];
    
    return controls;
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
    [_navigation release];
    [_window release];
    [super dealloc];
}

@end
