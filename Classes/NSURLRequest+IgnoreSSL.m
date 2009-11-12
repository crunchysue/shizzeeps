//
//  NSURLRequest+IgnoreSSL.m
//  shizzeeps
//
//  Created by Sue Brown on 11/11/09.
//  Copyright 2009 House of Crunchy. All rights reserved.
//

#import "NSURLRequest+IgnoreSSL.h"


@implementation NSURLRequest (IgnoreSSL)

+ (BOOL)allowsAnyHTTPSCertificateForHost:(NSString*)host {
	// ignore certificate errors only for this domain
	if ([host hasSuffix:@"shizzow.com"]){
		return YES;
	}else {
		return NO;
	}
}

@end