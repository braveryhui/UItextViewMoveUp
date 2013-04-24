//
//  NovelAppDelegate.m
//  Novel
//
//  Created by loveuu on 19/4/13.
//  Copyright (c) 2013年 loveuu. All rights reserved.
//

#import "NovelAppDelegate.h"


@implementation NovelAppDelegate
@synthesize window=_window;
- (void)dealloc
{
    [_window release];
    [super dealloc];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    // Override point for customization after application launch.
//    self.viewController = [[[NovelViewController alloc] initWithNibName:@"NovelViewController" bundle:nil] autorelease];
//    self.window.rootViewController = self.viewController;
    //window上加view
    
    v=[[UIView alloc]initWithFrame:CGRectMake(0, 0, 320, 480)];
    v.backgroundColor = [UIColor clearColor];
    [_window addSubview:v];
    [v release];
    
   //------view上加toolbar 和 category等view
    categoryView = [[CategoryViewController alloc]init];
    categoryView.view.frame = CGRectMake(0, 0, 320, 436);
    categoryView.view.backgroundColor = [UIColor clearColor];
    nav1 = [[UINavigationController alloc]initWithRootViewController:categoryView];
    [v addSubview:nav1.view];
    //[categoryView release];
    //[nav1 release];
    
    //------viewToolBar
    viewToolBar = [[UIView alloc]initWithFrame:CGRectMake(0, 433, 320, 47)];
    viewToolBar.backgroundColor = [UIColor grayColor];
    [_window addSubview:viewToolBar];
    [viewToolBar release];
    
   //------往viewToolBar上添加一个图片的View然后自定义一个图片
    UIImageView *viewToolBarImg = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 320, 47)];
    viewToolBarImg.image= [UIImage imageNamed:@"首页_按钮底图.png"];
    viewToolBarImg.backgroundColor =[UIColor clearColor];
    [viewToolBar addSubview:viewToolBarImg];
    [viewToolBarImg release];
    
    //------ 目录按钮
    btn1 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn1.frame=CGRectMake(25, 5, 51, 37);
    btn1.tag=1;
    [btn1 setAdjustsImageWhenDisabled:YES];
    [btn1 setBackgroundImage:[UIImage imageNamed:@"目录.png"] forState:UIControlStateNormal];
    [btn1 addTarget:self action:@selector(categoryAction) forControlEvents:UIControlEventTouchDown];
    [viewToolBar addSubview:btn1];
    
    //------ 变坐标 播放按钮 跟回调方法
    btn2 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn2.frame=CGRectMake(92, 5, 51, 37);
    btn2.tag=1;
    [btn2 setAdjustsImageWhenDisabled:YES];
    [btn2 setBackgroundImage:[UIImage imageNamed:@"播放.png"] forState:UIControlStateNormal];
    [btn2 addTarget:self action:@selector(playAction) forControlEvents:UIControlEventTouchDown];
    [viewToolBar addSubview:btn2];
    
    //------定义  变坐标 定时按钮
    btn3 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn3.frame=CGRectMake(160, 5, 51, 37);
    btn3.tag=1;
    [btn3 setAdjustsImageWhenDisabled:YES];
    [btn3 setBackgroundImage:[UIImage imageNamed:@"定时.png"] forState:UIControlStateNormal];
    [btn3 addTarget:self action:@selector(timerAction) forControlEvents:UIControlEventTouchDown];
    [viewToolBar addSubview:btn3];
    
   //------定义  变坐标 关于我们按钮
    btn4 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn4.frame=CGRectMake(240, 5, 51, 37);
    btn4.tag=1;
     [btn4 setAdjustsImageWhenDisabled:YES];
    [btn4 setBackgroundImage:[UIImage imageNamed:@"关于.png"] forState:UIControlStateNormal];
    [btn4 addTarget:self action:@selector(aboutusAction) forControlEvents:UIControlEventTouchDown];
    [viewToolBar addSubview:btn4];
    
    
    self.window.rootViewController = categoryView;
    //这里不要用self如果用self.categoryView会提示有错误
    //Applications are expected to have a root view controller at the end of application launch
    [self.window makeKeyAndVisible];
    return YES;
}

#pragma mark --------四个按钮回调的方法----

-(void)categoryAction
{
    NSLog(@"categroy action output");
    //这样可以设置选中的时候的图片背景 其他的不变 这里的目录应该是另一种状态
    //比如目录是未选中状态 目录选中.png为选中状态
    if(categoryView ==nil)
    {
        categoryView = [[CategoryViewController alloc]init];
        categoryView.view.frame = CGRectMake(0, 0, 320, 436);
        categoryView.view.backgroundColor = [UIColor clearColor];
        nav1 = [[UINavigationController alloc]initWithRootViewController:categoryView];
        [v addSubview:nav1.view];
    }
    [btn1 setBackgroundImage:[UIImage imageNamed:@"目录.png"] forState:UIControlStateNormal];
    [btn2 setBackgroundImage:[UIImage imageNamed:@"播放.png"] forState:UIControlStateNormal];
    [btn3 setBackgroundImage:[UIImage imageNamed:@"定时.png"] forState:UIControlStateNormal];
    [btn4 setBackgroundImage:[UIImage imageNamed:@"关于.png"] forState:UIControlStateNormal];
    nav1.view.hidden=NO;
    nav2.view.hidden=YES;
    nav3.view.hidden=YES;
    nav4.view.hidden=YES;
   
    
}
-(void)playAction
{
    NSLog(@"play action output");
    //因为playview不是rootviewcontroller 所以要把PlayviewController加里面
    
    if(playView ==nil)
    {
        playView = [[PlayViewController alloc]init];
        playView.view.frame = CGRectMake(0, 0, 320, 436);
        playView.view.backgroundColor = [UIColor clearColor];
        nav2 = [[UINavigationController alloc]initWithRootViewController:playView];
        [v addSubview:nav2.view];
    }
    [btn1 setBackgroundImage:[UIImage imageNamed:@"目录.png"] forState:UIControlStateNormal];
    [btn2 setBackgroundImage:[UIImage imageNamed:@"播放.png"] forState:UIControlStateNormal];
    [btn3 setBackgroundImage:[UIImage imageNamed:@"定时.png"] forState:UIControlStateNormal];
    [btn4 setBackgroundImage:[UIImage imageNamed:@"关于.png"] forState:UIControlStateNormal];
    nav2.view.hidden=NO;
    nav1.view.hidden=YES;
    nav3.view.hidden=YES;
    nav4.view.hidden=YES;
}
-(void)timerAction
{
    NSLog(@"timer action output");
    if(timerView ==nil)
    {
        timerView = [[TimerViewController alloc]init];
        timerView.view.frame = CGRectMake(0, 0, 320, 436);
        timerView.view.backgroundColor = [UIColor clearColor];
        nav3 = [[UINavigationController alloc]initWithRootViewController:timerView];
        [v addSubview:nav3.view];
    }
    [btn1 setBackgroundImage:[UIImage imageNamed:@"目录.png"] forState:UIControlStateNormal];
    [btn2 setBackgroundImage:[UIImage imageNamed:@"播放.png"] forState:UIControlStateNormal];
    [btn3 setBackgroundImage:[UIImage imageNamed:@"定时.png"] forState:UIControlStateNormal];
    [btn4 setBackgroundImage:[UIImage imageNamed:@"关于.png"] forState:UIControlStateNormal];
   
    nav1.view.hidden=YES;
    nav2.view.hidden=YES;
    nav3.view.hidden=NO;
    nav4.view.hidden=YES;
}
-(void)aboutusAction
{
    NSLog(@"aboutus action output");
    if(aboutUsView==nil)
    {
        aboutUsView = [[AboutUsViewController alloc]init];
        aboutUsView.view.frame = CGRectMake(0, 0, 320, 436);
        aboutUsView.view.backgroundColor = [UIColor clearColor];
        nav4 = [[UINavigationController alloc]initWithRootViewController:aboutUsView];
        [v addSubview:nav4.view];
    }
    [btn1 setBackgroundImage:[UIImage imageNamed:@"目录.png"] forState:UIControlStateNormal];
    [btn2 setBackgroundImage:[UIImage imageNamed:@"播放.png"] forState:UIControlStateNormal];
    [btn3 setBackgroundImage:[UIImage imageNamed:@"定时.png"] forState:UIControlStateNormal];
    [btn4 setBackgroundImage:[UIImage imageNamed:@"关于.png"] forState:UIControlStateNormal];
    
    nav1.view.hidden=YES;
    nav2.view.hidden=YES;
    nav3.view.hidden=YES;
    nav4.view.hidden=NO;
    
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
