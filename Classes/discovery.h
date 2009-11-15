//
//  discovery.h
//  shizzeeps
//
//  Created by Sue Brown on 11/15/09.
//  Copyright 2009 House of Crunchy. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface discovery : NSObject {
	NSArray *theArray;
	NSDictionary *theDict;
	NSString *br;
}

@property (nonatomic, retain) NSArray *theArray;
@property (nonatomic, retain) NSDictionary *theDict;

- (void) discover;

- (void) discoverDictionary;
- (void) enumerateDictionary: (NSDictionary *) d;

- (void) discoverArray;
- (void) enumerateArray: (NSArray *) a;

@end
