//
//  shizzeepsViewController.m
//  shizzeeps
//
//  Created by Sue Brown on 11/7/09.
//  Copyright House of Crunchy 2009. All rights reserved.
//

#import "shizzeepsViewController.h"
#import "passwords.h"
#import "CJSONDeserializer.h"


@implementation shizzeepsViewController


- (void) loadShizzeeps {
	
	NSString *shizzowAPI = @"https://v0.api.shizzow.com/places?populated=true&cities=Portland&states=OR&countries=US";
	
	
	NSURL *url = [[NSURL alloc] initWithString: shizzowAPI]; 
	NSURLRequest *request = [[NSURLRequest alloc] initWithURL: url]; 
	NSURLConnection *connection = [[NSURLConnection alloc]
								   initWithRequest:request delegate:self];
	

	[connection release];
	[request release];

}

// callbacks
- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
	NSLog (@"connectionDidReceiveResponse");
}

- (void)connection:(NSURLConnection *)connection didReceiveAuthenticationChallenge:(NSURLAuthenticationChallenge *)challenge {
		
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



- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
	NSLog (@"connectionDidReceiveData");
	NSString *newText = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
	
	if (newText != NULL) {
		
		NSString *jsonString = newText;
		NSData *jsonData = [jsonString dataUsingEncoding:NSUTF32BigEndianStringEncoding];
		NSError *error = nil;
		NSDictionary *dictionary = [[CJSONDeserializer deserializer] deserializeAsDictionary:jsonData error:&error];
	
		[self displayShizzeeps:dictionary];
		

	}
}


// Iterate through the JSON and build a web page out of it, then display it in the webview
- (void) displayShizzeeps:(NSDictionary *)JSONDictionary {
	
	NSLog(@"request is %@", [JSONDictionary objectForKey:@"request"]);
	
	for (id key in JSONDictionary) {
		NSLog(@"key: %@, value: %@", key, [JSONDictionary objectForKey:key]);
		
	}
	
}



#pragma mark Table view methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)shizzeepsTable {
    return 1;
}


// Customize the number of rows in the table view.
- (NSInteger)shizzeepsTable:(UITableView *)shizzeepsTable numberOfRowsInSection:(NSInteger)section {
    return 0;
}


// Customize the appearance of table view cells.
- (UITableViewCell *)shizzeepsTable:(UITableView *)theTable cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [theTable dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    
	// Configure the cell.
	
    return cell;
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
}

@end
