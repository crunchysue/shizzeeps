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
	NSString		*placeID;
	NSString		*address1;
	NSString		*address2;
	NSString		*city;
	NSString		*state;
	NSString		*zip;
	NSString		*website;
	NSArray			*messages;
	NSArray			*people;
	NSString		*peopleList;
	NSDictionary	*shouts;
}

@property (nonatomic, retain) NSDictionary * placeDict;
@property (nonatomic, retain) NSString * population;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * placeID;
@property (nonatomic, retain) NSString * address1;
@property (nonatomic, retain) NSString * address2;
@property (nonatomic, retain) NSString * city;
@property (nonatomic, retain) NSString * state;
@property (nonatomic, retain) NSString * zip;
@property (nonatomic, retain) NSString * website;
@property (nonatomic, retain) NSArray  * messages;
@property (nonatomic, retain) NSArray  * people;
@property (nonatomic, retain) NSString * peopleList;
@property (nonatomic, retain) NSDictionary *shouts;

- (void) initPlace;


@end


