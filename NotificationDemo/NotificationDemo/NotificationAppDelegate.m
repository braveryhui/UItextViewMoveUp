//
//  NotificationAppDelegate.m
//  NotificationDemo
//
//  Created by loveuu on 24/4/13.
//  Copyright (c) 2013年 loveuu. All rights reserved.
//

#import "NotificationAppDelegate.h"

#import "NotificationViewController.h"

@implementation NotificationAppDelegate

- (void)dealloc
{
    [_window release];
    [_NotificationViewController release];
    [super dealloc];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    
    _view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 320,480)];
    _view.backgroundColor = [UIColor greenColor];
    [self.window addSubview:_view];
    
    
    _NotificationViewController = [[NotificationViewController alloc]init];
    _NotificationViewController.view.frame = CGRectMake(0, 0, 320, 400);
    _NotificationViewController.view.backgroundColor = [UIColor clearColor];
    _NavigationView = [[UINavigationController alloc]initWithRootViewController:_NotificationViewController];
    [_view addSubview:_NavigationView.view];
    
    _window.rootViewController = _NotificationViewController;
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
