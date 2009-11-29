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
@synthesize website;
@synthesize messages;
@synthesize people;
@synthesize peopleList;
	

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
	self.address1 = [[placeDict valueForKey:@"address1"] description];
	self.address2 = [[placeDict valueForKey:@"address2"] description];
	self.city = [[placeDict valueForKey:@"city"] description];
	self.state = [[placeDict valueForKey:@"state"] description];
	self.zip = [[placeDict valueForKey:@"zip"] description];
	self.website = [[placeDict valueForKey:@"website"] description];	
	
	NSDictionary *l_shouts = [self.placeDict objectForKey:@"shouts"];
	NSDictionary *s_results = [l_shouts objectForKey:@"results"];
	NSArray *s_r_shouts = [s_results objectForKey:@"shouts"];	
	NSArray *l_name = [s_r_shouts valueForKey:@"people_name"];
	self.people = l_name;
	
	// make the names into a nice string
	NSEnumerator *enumerator = [l_name objectEnumerator];
	id anObject;
	NSString *names = @"";
	while (anObject = [enumerator nextObject]) {
		names = [NSString stringWithFormat:@"%@ %@", names, [anObject description]];
	}
	self.peopleList = names;	
	
	NSArray *shout_messages = [s_r_shouts valueForKey:@"shout_messages"];
	NSArray *theMessages = [shout_messages valueForKey:@"messages"];
	
	NSLog(@"shouts messages: %@", [shout_messages description]);
	NSLog(@"messages: %@", [theMessages description]);
	

}



@end