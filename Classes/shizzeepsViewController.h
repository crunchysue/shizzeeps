//
//  shizzeepsViewController.h
//  shizzeeps
//
//  Created by Sue Brown on 11/7/09.
//  Copyright House of Crunchy 2009. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface shizzeepsViewController : UIViewController <UITableViewDelegate, UITableViewDataSource> {
	IBOutlet UITableView *shizzeepsTable;
}

- (void) loadShizzeeps;
- (void) displayShizzeeps: (NSDictionary *)JSONDictionary;

@end

