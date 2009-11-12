//
//  shizzeepsAppDelegate.h
//  shizzeeps
//
//  Created by Sue Brown on 11/7/09.
//  Copyright House of Crunchy 2009. All rights reserved.
//

#import <UIKit/UIKit.h>

@class shizzeepsViewController;

@interface shizzeepsAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    shizzeepsViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet shizzeepsViewController *viewController;

@end

