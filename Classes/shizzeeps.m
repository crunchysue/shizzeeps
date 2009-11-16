//
//  shizzeeps.m
//  shizzeeps
//
//  Created by Sue Brown on 11/14/09.
//  Copyright 2009 House of Crunchy. All rights reserved.
//

#import "shizzeeps.h"
#import "JSON.h"
#import "place.h"

#define DEBUG 0

#if DEBUG 
	#import "discovery.h"
#endif

@implementation shizzeeps

@synthesize count;
@synthesize dict;
@synthesize results;
@synthesize places;
@synthesize delegate;
@synthesize callback;
@synthesize errorCallback;

- (void)dealloc {
    [super dealloc];
	[shizzeepsResponseData release];
	[dict release];
	[results release];
	[places release];
}


/* init
	Get the data off the Internets
	This callback pattern came from a tutorial here:
	http://brandontreb.com/objective-c-programming-tutorial-creating-a-twitter-client-part-1/
 -------------------------------------------------------------------------- */
- (void) init:(id)requestDelegate requestSelector:(SEL)requestSelector{

	// Set the delegate and selector
	self.delegate = requestDelegate;
	self.callback = requestSelector;

	
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
	
	
	self.results = [[self.dict objectForKey:@"results"] retain];
	self.count = [[[self.results valueForKey:@"count"] description] intValue];
	
	// build up an array of place objects and add them to our instance variable, places (an array)
	self.places = [[NSMutableArray alloc] initWithCapacity:self.count-1];
	for (int i=0; i<self.count; i++) {
		NSDictionary *curplace = [[self.results valueForKey:@"places"] objectAtIndex:i];
		place *oPlace = [[place alloc] init];
		oPlace.placeDict = curplace;
		[oPlace initPlace];
		[self.places insertObject:oPlace atIndex:i];
		[place release];
	}
	 
		
	
	
#if DEBUG
	discovery *disc = [[discovery alloc] init];
	disc.theArray = self.results;
	disc.discover;
	[disc release];	
	exit(1);
#endif
	
	
	if(delegate && callback) {
		if([delegate respondsToSelector:self.callback]) {
			[delegate performSelector:self.callback];
		} else {
			NSLog(@"No response from delegate");
		}
	} 
	
	// memory cleanup
	[responseString release];
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
	
    // inform the user
    NSLog(@"Connection failed! Error - %@ %@",
          [error localizedDescription],
          [[error userInfo] objectForKey:NSErrorFailingURLStringKey]);
	
	if(errorCallback) {
		[delegate performSelector:errorCallback withObject:error];
	}
}


@end
