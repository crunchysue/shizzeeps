//
//  PlaceDetailsVC.h
//  shizzeeps
//
//  Created by Sue Brown on 11/27/09.
//  Copyright 2009 House of Crunchy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "place.h"

@class place;

@interface PlaceDetailsVC : UITableViewController {
	place *thePlace;
}

@property (nonatomic, retain) place *thePlace;

@end
