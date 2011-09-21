//
//  QuickDialogAppDelegate.h
//  QuickDialog
//
//  Created by Nick Charlton on 19/09/2011.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QuickDialogAppDelegate : NSObject <UIApplicationDelegate>

@property (nonatomic, retain) IBOutlet UIWindow *window;

- (QSection *)createSampleControls;

@end
