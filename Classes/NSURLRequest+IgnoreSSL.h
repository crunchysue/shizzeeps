//
//  NSURLRequest+IgnoreSSL.h
//  shizzeeps
//
//  Created by Sue Brown on 11/11/09.
//  Copyright 2009 House of Crunchy. All rights reserved.
//
//  This code and it's accompanying implementation file came from:
//  http://www.drobnik.com/touch/2009/11/ignoring-certificate-errors-on-nsurlrequest/

#import <Foundation/Foundation.h>


@interface NSURLRequest (IgnoreSSL)
	+ (BOOL)allowsAnyHTTPSCertificateForHost:(NSString*)host;
@end