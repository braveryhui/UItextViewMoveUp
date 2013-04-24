//
//  UIWebViewViewController.h
//  UIWebView
//
//  Created by loveuu on 22/4/13.
//  Copyright (c) 2013年 loveuu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIWebViewViewController : UIViewController
<UIWebViewDelegate>
{
    UIWebView * WebView;
    UIActivityIndicatorView *activityIndicator;
}
@property (nonatomic,retain) UIWebView *WebView;
@property (nonatomic,retain) UIActivityIndicatorView *activityIndicator;
-(void)webViewDidStartLoad:(UIWebView *)webView;
@end
