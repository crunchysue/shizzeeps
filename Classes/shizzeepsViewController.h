//
//  shizzeepsViewController.h
//  shizzeeps
//
//  Created by Sue Brown on 11/7/09.
//  Copyright House of Crunchy 2009. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "shizzeeps.h"


@interface shizzeepsViewController : UIViewController <UITableViewDelegate, UITableViewDataSource> {
	
	shizzeeps *oShizzeeps;
	IBOutlet UITableView *shizzeepsTable;
	
}

- (void) displayShizzeeps;

@end

