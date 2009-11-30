//
//  shizzeepsAppDelegate.h
//  shizzeeps
//
//  Created by Sue Brown on 11/25/09.
//  Copyright House of Crunchy 2009. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "shizzeepsNavigationController.h"
#import "shizzeeps.h"


@interface shizzeepsAppDelegate : NSObject <UIApplicationDelegate, UITabBarControllerDelegate> {
    UIWindow *window;
    IBOutlet UITabBarController *tabBarController;
	IBOutlet UINavigationController *navigationController;
	
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UITabBarController *tabBarController;
@property (nonatomic, retain) IBOutlet UINavigationController *navigationController;

@end
