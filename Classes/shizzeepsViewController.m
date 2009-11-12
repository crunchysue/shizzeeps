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
	[url release];

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
	
	
	NSURL *baseURL = [[NSURL alloc] initWithString: @"http://shizzeps.com"];
	
	for (id key in JSONDictionary) {
		NSLog(@"key: %@, value: %@", key, [JSONDictionary objectForKey:key]);
		[webView loadHTMLString:key baseURL:baseURL];
	}
}





	
	
/*
// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        // Custom initialization
    }
    return self;
}
*/

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/



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
