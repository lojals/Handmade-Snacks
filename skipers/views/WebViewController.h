//
//  WebViewController.h
//  skipers
//
//  Created by Jorge Raul Ovalle Zuleta on 3/20/14.
//  Copyright (c) 2014 jomobile.co. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WebViewController : UIViewController <UIWebViewDelegate> {
    UIActivityIndicatorView *activityIndicator;
}

@property NSString *url;
@property (strong,nonatomic) IBOutlet UIWebView *web;
@property (strong,nonatomic) IBOutlet UIActivityIndicatorView *activity;


- (void)webViewDidStartLoad:(UIWebView *)webView; //a web view starts loading
- (void)webViewDidFinishLoad:(UIWebView *)webView;//web view finishes loading
- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error;
@end
