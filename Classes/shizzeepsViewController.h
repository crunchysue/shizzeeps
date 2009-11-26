//
//  shizzeepsViewController.h
//  shizzeeps
//
//  Created by Sue Brown on 11/25/09.
//  Copyright 2009 House of Crunchy. All rights reserved.
//

#import <UIKit/UIKit.h>
#include "shizzeeps.h"


@interface shizzeepsViewController : UITableViewController {
	IBOutlet UITableView *shizzeepsTable;
	shizzeeps *oShizzeeps;
}

@property (nonatomic, retain) shizzeeps *oShizzeeps;

- (void) displayShizzeeps;


@end

