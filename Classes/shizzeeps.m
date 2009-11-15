//
//  shizzeeps.m
//  shizzeeps
//
//  Created by Sue Brown on 11/14/09.
//  Copyright 2009 House of Crunchy. All rights reserved.
//

#import "shizzeeps.h"
#import "JSON.h"


@implementation shizzeeps

@synthesize count;
@synthesize dict;
@synthesize results;

- (void)dealloc {
    [super dealloc];
	[shizzeepsResponseData release];
	[dict release];
	[results release];
}


/* load
	Get the data off the Internets
 -------------------------------------------------------------------------- */
- (void) load {
	
	NSString *shizzeepsURL = @"http://shizzeeps.com/bin/ajax.php?f=shizzeepsstatic&city=pdx";
	
	shizzeepsResponseData = [[NSMutableData alloc] init];
	NSURL *url = [[NSURL alloc] initWithString: shizzeepsURL]; 
	NSURLRequest *request = [[NSURLRequest alloc] initWithURL: url]; 
	NSURLConnection *connection = [[NSURLConnection alloc]
								   initWithRequest:request delegate:self];
	
	
	[connection release];
	[request release];
	[url release];
	
}

#pragma mark -
#pragma mark Connection Callbacks


/* connection callbacks
 -------------------------------------------------------------------------- */

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
	NSLog (@"connectionDidReceiveResponse");
	[shizzeepsResponseData setLength:0];
}
- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
	NSLog (@"connectionDidReceiveData");
	[shizzeepsResponseData appendData:data];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
	
	NSLog (@"connectionDidFinishLoading");  	
    
	NSString *responseString = [[NSString alloc] initWithData:shizzeepsResponseData encoding:NSUTF8StringEncoding];
	
	// the JSON library adds a category to NSString, which gives us new methods, like JSONValue.
	self.dict = [[responseString JSONValue] retain];	
	
	//NSLog(@"THE RESPONSE STRING IS: %@",responseString);	
	//NSLog(@"THE DICTIONARY IS: %@", [self.dict description]);
	//NSLog(@"THE REQUEST IS: %@", [[self.dict objectForKey:@"request"] description]);
	
	
	// set the count property
	self.results = [[self.dict objectForKey:@"results"] retain];
	self.count = [[[self.results valueForKey:@"count"] description] intValue];
	
	NSLog(@"in shizzeeps.m, count is %i", self.count);
	
	//NSLog(@"THE COUNT IS: %@", [[shizzeepsResults valueForKey:@"count"] description]);
	
	// let's see if we can get the first place name
	//NSArray *places = [results valueForKey:@"places"];
	//
	//	NSArray	*curplace = [[shizzeepsResults valueForKey:@"places"] objectAtIndex:0];	
	//	
	//	NSString *places_name = [[curplace valueForKey:@"places_name"] description];
	//	NSString *population = [[curplace valueForKey:@"population"] description];
	//	NSString *address1 = [[curplace valueForKey:@"address1"] description];
	//	NSString *city = [[curplace valueForKey:@"city"] description];
	
	//	NSLog(@"%@ shizzeeps at %@", population, places_name);
	
	
	//[shizzeepsTable reloadData];
	
	
	// memory cleanup
	[responseString release];
}


@end
