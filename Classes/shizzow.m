//
//  shizzow.m
//  shizzeeps
//
//  Created by Sue Brown on 11/14/09.
//  Copyright 2009 House of Crunchy. All rights reserved.
//

#import "shizzow.h"
#import "passwords.h"


@implementation shizzow



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




@end
