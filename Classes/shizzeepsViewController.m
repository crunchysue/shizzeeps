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

}

#pragma mark -
#pragma mark Connection Callbacks

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
	NSLog (@"connectionDidReceiveResponse");
	[shizzeepsResponseData setLength:0];
}


// NOTE: This will not happen when we call shizzeeps - it will happen when we call shizzow to shout
//		However, I'm leaving it here for future reference.
- (void)connection:(NSURLConnection *)connection didReceiveAuthenticationChallenge:(NSURLAuthenticationChallenge *)challenge {
		
	// Just to make sure this is not happening in the call to shizzeeps
	NSLog(@"THIS SHOULD NOT HAPPEN: connectionDidReceiveAuthenticationChallenge");
	
	// Note that username and password are in passwords.h, which is ignored by git.
	
	// from stack overflow
	// http://stackoverflow.com/questions/1487874/securing-wcf-rest-service-for-use-with-iphone-application
	NSURLCredential *newCredential; 
	newCredential=[NSURLCredential credentialWithUser:username
											 password:password 
										  persistence:NSURLCredentialPersistenceNone]; 
	[[challenge sender] useCredential:newCredential 
		   forAuthenticationChallenge:challenge]; 
	
	// end stack overflow		
		
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
	//NSLog(@"THE RESPONSE STRING IS: %@",responseString);
    [shizzeepsResponseData release];
    
	
	
	// the JSON library adds a category to NSString, which gives us new methods, like JSONValue.
	NSDictionary *responseDictionary = [responseString JSONValue];	
	//NSLog(@"THE DICTIONARY IS: %@", [responseDictionary description]);
	
	// description always returns a string, which is required by the text of the label
	//NSLog(@"THE REQUEST IS: %@", [[responseDictionary objectForKey:@"request"] description]);
	
	//NSArray *request = [responseDictionary objectForKey:@"request"];
	//NSLog(@"THE LIMIT IS: %@", [[request valueForKey:@"limit"] description]);
	
	NSArray *results = [responseDictionary objectForKey:@"results"];
	NSLog(@"THE COUNT IS: %@", [[results valueForKey:@"count"] description]);
	
	
	
}


#pragma mark Table view methods

//- (NSInteger)numberOfSectionsInTableView:(UITableView *)shizzeepsTable {
//    return 1;
//}
//
//
//// Customize the number of rows in the table view.
//- (NSInteger)shizzeepsTable:(UITableView *)shizzeepsTable numberOfRowsInSection:(NSInteger)section {
//    return 0;
//}
//
//
//// Customize the appearance of table view cells.
//- (UITableViewCell *)shizzeepsTable:(UITableView *)theTable cellForRowAtIndexPath:(NSIndexPath *)indexPath {
//    
//    static NSString *CellIdentifier = @"Cell";
//    
//    UITableViewCell *cell = [theTable dequeueReusableCellWithIdentifier:CellIdentifier];
//    if (cell == nil) {
//        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
//    }
//    
//	// Configure the cell.
//	
//    return cell;
//}







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
}

@end
