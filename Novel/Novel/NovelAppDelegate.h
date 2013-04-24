//
//  NovelAppDelegate.h
//  Novel
//
//  Created by loveuu on 19/4/13.
//  Copyright (c) 2013年 loveuu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CategoryViewController.h"
#import "PlayViewController.h"
#import "TimerViewController.h"
#import "AboutUsViewController.h"


@interface NovelAppDelegate : UIResponder <UIApplicationDelegate>
{
    UIWindow *_window;  //窗口最大第一级别
    UIView *v;        //第二级别
    UIView *viewToolBar;  //第三级别的
    
    UIButton *btn1;       //第三级别 viewToolBar的子item 第四级别
    UIButton *btn2;
    UIButton *btn3;
    UIButton *btn4;
    
    UINavigationController *nav1; //第三级别
    UINavigationController *nav2;
    UINavigationController *nav3;
    UINavigationController *nav4;
    
    CategoryViewController *categoryView; //第三级别
    PlayViewController *playView;
    TimerViewController *timerView;
    AboutUsViewController *aboutUsView;
    /*
     window 上加 V 然后 v的底部是viewToolBar ViewToolBar上的
     有三个按钮 点击每个按钮通过 navigationController 切换到不懂的
     ViewController上
     */
    
}
@property (strong, nonatomic) UIWindow *window;
@end
