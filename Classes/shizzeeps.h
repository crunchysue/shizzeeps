//
//  shizzeeps.h
//  shizzeeps
//
//  Created by Sue Brown on 11/14/09.
//  Copyright 2009 House of Crunchy. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface shizzeeps : NSObject {
	
	// this will hold our shizzeeps response data, and be updated a little chunk at a time.
	NSMutableData *shizzeepsResponseData;
	NSDictionary *dict;
	NSArray *results; // this is where most of the good stuff is.
	
	// count is how many places have shizzeeps in them
	int count; 
}


@property (readwrite, assign) int count;
@property (nonatomic, retain) NSDictionary *dict;
@property (nonatomic, retain) NSArray *results;

- (void) load;

@end
