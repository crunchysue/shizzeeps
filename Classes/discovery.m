//
//  discovery.m
//  shizzeeps
//
//  Created by Sue Brown on 11/15/09.
//  Copyright 2009 House of Crunchy. All rights reserved.
//

#import "discovery.h"


@implementation discovery

@synthesize theArray;
@synthesize theDict;


/* discover
	decide whether to discover the dict, the array, or both
 -------------------------------------------------------------------------- */

- (void) discover {
	
	br = @"==========================================================\n\n";
	
	if (self.theDict)
		[self discoverDictionary];
	
	if (self.theArray)
		[self discoverArray];
	
}


#pragma mark -
#pragma mark Dictionary Methods

/* discover Dict
 print out info about the dict
 -------------------------------------------------------------------------- */

- (void) discoverDictionary {
	
	NSLog(@"%@", br);
	
	// count
	NSLog(@"Dictionary count: %i%@", [self.theDict count], br);
	NSLog(@"%@", br);
	
	// all keys
	NSLog(@"All the dictionary's keys: %@", [[self.theDict allKeys] description]);
	NSLog(@"%@", br);
	
	// enumerate
	NSLog(@"ENUMERATING THE WHOLE DICTIONARY\n");
	[self enumerateDictionary: self.theDict];
	
	
		
}


/* enumerate Dictionary
 recursively enumerates a dictionary
 -------------------------------------------------------------------------- */

- (void) enumerateDictionary: (NSDictionary *) d {
	
	NSEnumerator *enumerator = [d objectEnumerator];
	id anObject;
	int i = 0;
	while (anObject = [enumerator nextObject]) {
		if ([anObject isKindOfClass:[NSArray class]]) {
			NSLog(@"ITEM #%i IS AN ARRAY: %@", i, [anObject description]);
			[self enumerateArray:anObject];
		}else if ([anObject isKindOfClass:[NSDictionary class]]) {
			NSLog(@"ITEM %i IS A DICTIONARY: ", i);
			// all keys
			NSLog(@"All the dictionary's keys: %@", [[anObject allKeys] description]);
			NSLog(@"%@", br);
			[self enumerateDictionary:anObject];
		} else {
			NSLog(@"ITEM #%i IS A %@: %@", i, [[anObject class] description], [anObject description]);
			i++;
		}
	}
	
	[enumerator release];
	
}


#pragma mark -
#pragma mark Array Methods

/* discover Array
 print out info about the array and/or the dict
 -------------------------------------------------------------------------- */

- (void) discoverArray {
	
NSLog(@"%@", br);
	
	// count
	NSLog(@"Array count: %i%@", [self.theArray count], br);
	
	// enumerate
	NSLog(@"ENUMERATING THE WHOLE ARRAY\n");
	[self enumerateArray: self.theArray];
	
	
}


/* enumerate Array
 recursively enumerates an array
 -------------------------------------------------------------------------- */

- (void) enumerateArray: (NSArray *) a {
	
	NSEnumerator *enumerator = [a objectEnumerator];
	id anObject;
	int i = 0;
	while (anObject = [enumerator nextObject]) {
		if ([anObject isKindOfClass:[NSArray class]]) {
			NSLog(@"ITEM #%i IS AN ARRAY of %i items: ", i, [anObject count]);
			[self enumerateArray:anObject];
		}else if ([anObject isKindOfClass:[NSDictionary class]]) {
			NSLog(@"ITEM %i IS A DICTIONARY of %i items: ", i, [anObject count]);
			[self enumerateDictionary:anObject];
		} else {
			NSLog(@"ITEM #%i IS A %@: %@", i, [[anObject class] description], [anObject description]);
			i++;
		}
	}
	
	[enumerator release];
	
}




@end
