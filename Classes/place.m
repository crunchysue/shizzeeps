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
@synthesize population;
@synthesize address1;
@synthesize address2;
@synthesize city;
@synthesize state;
@synthesize zip;
@synthesize url;
@synthesize shouts;
	

- (void) initPlace {
	
	if (!self.placeDict) {
		NSLog(@"placeDict must be set before calling initPlace");
		exit(0);
	}
	
	
	self.name = [[placeDict valueForKey:@"places_name"] description];
	// sometimes places_name has an ampersand <rolls eyes>
	self.name = [self.name stringByReplacingOccurrencesOfString:@"&amp;" withString:@"&"];
	
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
	
	
	
	
	NSLog(@"name: %@", self.name);
	NSLog(@"population: %@", self.population);
	NSLog(@"name: %@", self.name);
	NSLog(@"name: %@", self.name);
	NSLog(@"name: %@", self.name);
	NSLog(@"name: %@", self.name);
	NSLog(@"name: %@", self.name);
	NSLog(@"name: %@", self.name);
	NSLog(@"name: %@", self.name);
	NSLog(@"name: %@", self.name);
	NSLog(@"name: %@", self.name);
	NSLog(@"name: %@", self.name);
	
	

//	NSDictionary *curplace = [[oShizzeeps.results valueForKey:@"places"] objectAtIndex:indexPath.row];		
//	NSString *places_name = [[curplace valueForKey:@"places_name"] description];
//	
//	// sometimes places_name has an ampersand <rolls eyes>
//	places_name = [places_name stringByReplacingOccurrencesOfString:@"&amp;" withString:@"&"];
//	
//	NSString *population = [[curplace valueForKey:@"population"] description];
//	
//	// get the names of the people in this place
//	
//	cell.textLabel.text = [NSString stringWithFormat:@"%@: %@", population, places_name];
//	cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
//	
//	NSDictionary *shouts = [curplace objectForKey:@"shouts"];
//	NSDictionary *s_results = [shouts objectForKey:@"results"];
//	NSArray *s_r_shouts = [s_results objectForKey:@"shouts"];	
//	NSArray *name = [s_r_shouts valueForKey:@"people_name"];
//	
//	// make the names look better
//	NSEnumerator *enumerator = [name objectEnumerator];
//	id anObject;
//	NSString *names = @"";
//	while (anObject = [enumerator nextObject]) {
//		names = [NSString stringWithFormat:@"%@ %@", names, [anObject description]];
//	}


}



@end