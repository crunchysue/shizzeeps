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
@synthesize shouts;
	

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
	
	
	
	// loop through shouts for this place and make a dictionary of them
	// dictionary has people names for keys and dictionaries of messages & times for values
	// e.g. [crunchysue => ['hello' => '1 minute ago'], ['how r u' => '10 minutes ago']]
	// e.g. [curShouts setObject:shout_msg_dict forKey:@"crunchysue"];
	
	NSEnumerator *shouts_enumerator = [s_r_shouts objectEnumerator];
	NSMutableDictionary *curShouts = [NSMutableDictionary dictionaryWithCapacity:10];
	NSMutableDictionary *curMsgs = [NSMutableDictionary dictionaryWithCapacity:10];
	NSMutableDictionary *curPerson = [NSMutableDictionary dictionaryWithCapacity:10];
	NSArray *curPeopleImages = nil;
	NSArray *curShoutsMessages = nil;
	NSEnumerator *msg_enumerator = nil;
	id obj;
	NSString *curPersonName = nil;
	NSString *curMsg = nil;
	NSString *curMsgID = nil;
	NSString *msgsKey = nil;

	// loop through the shouts from this place
	while (anObject = [shouts_enumerator nextObject]) {
		//NSLog(@"anObject%@", [anObject description]);
		curPersonName = [anObject valueForKey:@"people_name"];
		curPeopleImages = [anObject valueForKey:@"people_images"];
		[curPerson setObject:[curPeopleImages valueForKey:@"people_image_16"] forKey:@"people_image_16"];
		
		curShoutsMessages = [anObject valueForKey:@"shouts_messages"];
		
		// if there are messages from this person
		if (![[curShoutsMessages description] isEqualToString: @"<null>"]) {
			//NSLog(@"%@ shouted %i messages.", curPersonName, [curShoutsMessages count]);
			msg_enumerator = [curShoutsMessages objectEnumerator];
			// loop through the messages from this person
			while (obj = [msg_enumerator nextObject]) {
				curMsg = [obj valueForKey:@"message"];
				curMsgID = [obj valueForKey:@"time"];
				// add this message to the current messages
				//NSLog(@"%@: %@ said %@", curMsgID, curPersonName, curMsg);
				[curMsgs setObject:curMsg forKey:curMsgID];
			}
			//NSLog(@"Messages from %@:%@", curPersonName,[curMsgs description]);
			// add the current messages to the person
			NSDictionary *tmpMsgs = [[NSDictionary alloc] initWithDictionary:curMsgs copyItems:YES];
			//NSLog(@"Messages being added to %@: %@", curPersonName, [tmpMsgs description]);
			msgsKey = [NSString stringWithFormat:@"messages_from_%@", curPersonName];
			
			[curPerson setObject:tmpMsgs forKey:msgsKey];
			[curMsgs removeAllObjects];
			
			//NSLog(@"\n\n%@: %@",curPersonName, [curPerson description]);
		}
		// add the person to the shouts
		[curShouts setObject:curPerson forKey:curPersonName];
	}
	
	self.shouts = curShouts;
//	NSLog(@"\n\n-----------------------\nself.shouts from %@: %@", self.name, [self.shouts description]);
//	NSLog(@"shouts->results->shouts: %@", [s_r_shouts description]);

}



@end