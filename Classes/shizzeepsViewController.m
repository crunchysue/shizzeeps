//
//  shizzeepsViewController.m
//  shizzeeps
//
//  Created by Sue Brown on 11/7/09.
//  Copyright House of Crunchy 2009. All rights reserved.
//

#import "shizzeepsViewController.h"
#import "passwords.h"
#import "JSON.h"


@implementation shizzeepsViewController


- (void) loadShizzeeps {
	
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

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
	NSLog (@"connectionDidReceiveResponse");
	[shizzeepsResponseData setLength:0];
}


// NOTE: This will not happen when we call shizzeeps - it will happen when we call shizzow to shout
//		However, I'm leaving it here for future reference.
//- (void)connection:(NSURLConnection *)connection didReceiveAuthenticationChallenge:(NSURLAuthenticationChallenge *)challenge {
//		
//	// Just to make sure this is not happening in the call to shizzeeps
//	NSLog(@"THIS SHOULD NOT HAPPEN: connectionDidReceiveAuthenticationChallenge");
//	
//	// Note that username and password are in passwords.h, which is ignored by git.
//	
//	// from stack overflow
//	// http://stackoverflow.com/questions/1487874/securing-wcf-rest-service-for-use-with-iphone-application
//	NSURLCredential *newCredential; 
//	newCredential=[NSURLCredential credentialWithUser:username
//											 password:password 
//										  persistence:NSURLCredentialPersistenceNone]; 
//	[[challenge sender] useCredential:newCredential 
//		   forAuthenticationChallenge:challenge]; 
//	
//	// end stack overflow		
//		
//}

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
	shizzeepsDictionary = [[responseString JSONValue] retain];	
	
	//NSLog(@"THE RESPONSE STRING IS: %@",responseString);	
	//NSLog(@"THE DICTIONARY IS: %@", [responseDictionary description]);
	//NSLog(@"THE REQUEST IS: %@", [[responseDictionary objectForKey:@"request"] description]);
	
	shizzeepsResults = [[shizzeepsDictionary objectForKey:@"results"] retain];
	NSLog(@"THE COUNT IS: %@", [[shizzeepsResults valueForKey:@"count"] description]);
	
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
	
	
	[shizzeepsTable reloadData];
	

	// memory cleanup
	[responseString release];
}


#pragma mark -
#pragma mark TableView methods



// fill the cells
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	
	// boilerplate
	static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil)
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault 
									   reuseIdentifier:CellIdentifier] autorelease];
    
	// Configure the cell.
	
	
	NSArray	*curplace = [[shizzeepsResults valueForKey:@"places"] objectAtIndex:indexPath.row];		
	NSString *places_name = [[curplace valueForKey:@"places_name"] description];
	NSString *population = [[curplace valueForKey:@"population"] description];
	cell.textLabel.text = [NSString stringWithFormat:@"%@: %@", population, places_name];
	cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
	
    return cell;
}

// a required callback
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	
	NSArray *results = [shizzeepsDictionary objectForKey:@"results"];
	int numRows = [[[results valueForKey:@"count"] description] intValue];
	NSLog(@"I am a table and I have %i rows.", numRows);
	return numRows;
	
}







// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	
	[self loadShizzeeps];
}



/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
	[shizzeepsResponseData release];
	[shizzeepsTable release];
	[shizzeepsDictionary release];
	[shizzeepsResults release];
}

@end
