//
//  shizzeepsViewController.h
//  shizzeeps
//
//  Created by Sue Brown on 11/7/09.
//  Copyright House of Crunchy 2009. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface shizzeepsViewController : UIViewController {
	IBOutlet UIWebView *webView;
	IBOutlet UITextView *urlContentsView;
}

- (void) loadShizzeeps;
- (void) displayShizzeeps: (NSDictionary *)JSONDictionary;

@end

