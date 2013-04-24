//
//  NotificationAppDelegate.h
//  NotificationDemo
//
//  Created by loveuu on 24/4/13.
//  Copyright (c) 2013年 loveuu. All rights reserved.
//

#import <UIKit/UIKit.h>

@class NotificationViewController;

@interface NotificationAppDelegate : UIResponder <UIApplicationDelegate>
{
    UIWindow *_window;
    UIView *_view;
    NotificationViewController *_NotificationViewcontroller;
    UINavigationController *_NavigationView;
}

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) NotificationViewController *NotificationViewController;

@end
