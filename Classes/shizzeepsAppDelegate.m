//
//  shizzeepsAppDelegate.m
//  shizzeeps
//
//  Created by Sue Brown on 11/25/09.
//  Copyright House of Crunchy 2009. All rights reserved.
//

#import "shizzeepsAppDelegate.h"


@implementation shizzeepsAppDelegate

@synthesize window;
@synthesize tabBarController;
@synthesize navigationController;


- (void)applicationDidFinishLaunching:(UIApplication *)application {
    
    // Add the tab bar controller's current view as a subview of the window
    [window addSubview:tabBarController.view];
}


/*
// Optional UITabBarControllerDelegate method
- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController {
}
*/

/*
// Optional UITabBarControllerDelegate method
- (void)tabBarController:(UITabBarController *)tabBarController didEndCustomizingViewControllers:(NSArray *)viewControllers changed:(BOOL)changed {
}
*/


- (void)dealloc {
    [tabBarController release];
    [window release];
    [super dealloc];
}

@end

