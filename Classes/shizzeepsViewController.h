//
//  shizzeepsViewController.h
//  shizzeeps
//
//  Created by Sue Brown on 11/7/09.
//  Copyright House of Crunchy 2009. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface shizzeepsViewController : UIViewController <UITableViewDelegate, UITableViewDataSource> {
	
	// this will hold our shizzeeps response data, and be updated a little chunk at a time.
	NSMutableData *shizzeepsResponseData;
	NSDictionary *shizzeepsDictionary;
	NSArray *shizzeepsResults; // this is where most of the good stuff is.
	IBOutlet UITableView *shizzeepsTable;
}

- (void) loadShizzeeps;

@end

