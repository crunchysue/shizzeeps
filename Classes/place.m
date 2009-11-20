//
//  place.m
//  shizzeeps
//
//  Created by Sue Brown on 11/15/09.
//  Copyright 2009 House of Crunchy. All rights reserved.
//

#import "place.h"


@implementation place

@synthesize placeDict;
@synthesize name;
@synthesize placeID;
@synthesize population;
@synthesize address1;
@synthesize address2;
@synthesize city;
@synthesize state;
@synthesize zip;
@synthesize url;
@synthesize shouts;
@synthesize people;
	

- (void) initPlace {
	
	if (!self.placeDict) {
		NSLog(@"placeDict must be set before calling initPlace");
		exit(0);
	}
		
	self.name = [[placeDict valueForKey:@"places_name"] description];
	self.name = [self.name stringByReplacingOccurrencesOfString:@"&amp;" withString:@"&"];
	self.name = [self.name stringByReplacingOccurrencesOfString:@"&#039;" withString:@"'"];
	
	self.placeID = [[placeDict valueForKey:@"places_key"] description];
	
	self.population = [[placeDict valueForKey:@"population"] description];
	
	NSDictionary *l_shouts = [self.placeDict objectForKey:@"shouts"];
	NSDictionary *s_results = [l_shouts objectForKey:@"results"];
	NSArray *s_r_shouts = [s_results objectForKey:@"shouts"];	
	NSArray *l_name = [s_r_shouts valueForKey:@"people_name"];
	
	// make the names look better
	NSEnumerator *enumerator = [l_name objectEnumerator];
	id anObject;
	NSString *names = @"";
	while (anObject = [enumerator nextObject]) {
		names = [NSString stringWithFormat:@"%@ %@", names, [anObject description]];
	}
	self.people = names;	
	

}



@end