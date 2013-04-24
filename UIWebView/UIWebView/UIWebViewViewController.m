//
//  UIWebViewViewController.m
//  UIWebView
//
//  Created by loveuu on 22/4/13.
//  Copyright (c) 2013年 loveuu. All rights reserved.
//

#import "UIWebViewViewController.h"

@interface UIWebViewViewController ()

@end

@implementation UIWebViewViewController
@synthesize  WebView;
@synthesize activityIndicator;
- (void)viewDidLoad
{
    [super viewDidLoad];
    //创建UIWebView
    WebView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 44, 320, 400)];
    [WebView setUserInteractionEnabled:NO];
    [WebView setBackgroundColor:[UIColor clearColor]];
    [WebView setDelegate:self];
    [WebView setOpaque:NO];//使网页透明
    
    NSString *path = @"http://www.youku.com";
    NSURL *url = [NSURL URLWithString:path];
    [WebView loadRequest:[NSURLRequest requestWithURL:url]];
    
    //创建UIActivityIndicatorView背底半透明View
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 480)];
    [view setTag:103];
    [view setBackgroundColor:[UIColor blackColor]];
    [view setAlpha:0.8];
    [self.view addSubview:view];
    
    activityIndicator = [[UIActivityIndicatorView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 32.0f, 32.0f)];
    [activityIndicator setCenter:view.center];
    [activityIndicator setActivityIndicatorViewStyle:UIActivityIndicatorViewStyleWhite];
    [view addSubview:activityIndicator];
    [self.view addSubview:WebView];
    [view release];
    [WebView release];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//开始加载数据
- (void)webViewDidStartLoad:(UIWebView *)webView {
    [activityIndicator startAnimating];
}

//数据加载完
- (void)webViewDidFinishLoad:(UIWebView *)webView {
    [activityIndicator stopAnimating];
    UIView *view = (UIView *)[self.view viewWithTag:103];
    [view removeFromSuperview];
}

@end
