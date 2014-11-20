//
//  WebViewController.m
//  skipers
//
//  Created by Jorge Raul Ovalle Zuleta on 3/20/14.
//  Copyright (c) 2014 jomobile.co. All rights reserved.
//

#import "WebViewController.h"

@interface WebViewController ()

@end

@implementation WebViewController
@synthesize  web,url;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)webViewDidStartLoad:(UIWebView *)webView{
    [_activity startAnimating];
   // NSLog(@"Inicio???");
}
- (void)webViewDidFinishLoad:(UIWebView *)webView{
    [_activity stopAnimating];
   // NSLog(@"Finalizo???");
}
- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error{
    [_activity stopAnimating];
   // NSLog(@"Error????");
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    [web stopLoading];
//    NSURL *url = [NSURL URLWithString:@"https://www.facebook.com/pages/Skipers/1425595487685332"];
    //url = [NSURL URLWithString:@"http://instagram.com/handmadesnacks"];
   // NSLog(url);
    NSURL *url2 = [NSURL URLWithString:url];
    NSURLRequest *request = [NSURLRequest requestWithURL:url2];
    [web loadRequest:request];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidLoad];
    [web stopLoading];
    //    NSURL *url = [NSURL URLWithString:@"https://www.facebook.com/pages/Skipers/1425595487685332"];
    //url = [NSURL URLWithString:@"http://instagram.com/handmadesnacks"];
    // NSLog(url);
    NSURL *url2 = [NSURL URLWithString:url];
    NSURLRequest *request = [NSURLRequest requestWithURL:url2];
    [web loadRequest:request];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
