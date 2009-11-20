//
//  shizzeeps.h
//  shizzeeps
//
//  Created by Sue Brown on 11/14/09.
//  Copyright 2009 House of Crunchy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "place.h"


@interface shizzeeps : NSObject {
	
	NSMutableData	*shizzeepsResponseData;
	NSDictionary	*dict;
	NSArray			*results; // this is where most of the good stuff is.
	NSMutableArray	*places;  // an array of place objects
	
	
	// count is how many places have shizzeeps in them
	int count; 
	
	// the callbacks, so we can send the data to the caller when it's ready
	id				 delegate;
	SEL				 callback;
	SEL				 errorCallback;
}


@property (nonatomic, retain) NSDictionary	 * dict;
@property (nonatomic, retain) NSArray		 * results;
@property (nonatomic, retain) NSMutableArray * places;
@property (readwrite, assign) int			   count;
@property(nonatomic, retain)  id			   delegate;
@property(nonatomic)		  SEL			   callback;
@property(nonatomic)		  SEL			   errorCallback;

- (void) init:(id)requestDelegate requestSelector:(SEL)requestSelector;

@end
