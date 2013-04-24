//
//  NotificationViewController.h
//  NotificationDemo
//
//  Created by loveuu on 24/4/13.
//  Copyright (c) 2013年 loveuu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NotificationViewController : UIViewController
<UITextFieldDelegate>
{
    UITextField *_text1;
    UITextField *_text2;
    UIView *_textBack;
}
@property (retain,nonatomic)  UITextField *text1;
@property (retain,nonatomic)  UITextField *text2;
@property (retain,nonatomic)  UIView *textBack;
@end
