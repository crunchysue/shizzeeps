//
//  place.h
//  shizzeeps
//
//  Created by Sue Brown on 11/15/09.
//  Copyright 2009 House of Crunchy. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface place : NSObject {
	
	NSDictionary	*placeDict;
	NSString		*population;
	NSString		*name;
	NSString		*address1;
	NSString		*address2;
	NSString		*city;
	NSString		*state;
	NSString		*zip;
	NSURL			*url;
	NSMutableArray  *shouts;
	NSString		*people;
	
}

@property (nonatomic, retain) NSDictionary * placeDict;
@property (nonatomic, retain) NSString * population;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * address1;
@property (nonatomic, retain) NSString * address2;
@property (nonatomic, retain) NSString * city;
@property (nonatomic, retain) NSString * state;
@property (nonatomic, retain) NSString * zip;
@property (nonatomic, retain) NSURL    * url;
@property (nonatomic, retain) NSArray  * shouts;


- (void) initPlace;


@end


