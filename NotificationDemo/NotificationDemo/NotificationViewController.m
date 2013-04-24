//
//  NotificationViewController.m
//  NotificationDemo
//
//  Created by loveuu on 24/4/13.
//  Copyright (c) 2013年 loveuu. All rights reserved.
//

#import "NotificationViewController.h"
#define kOFFSET_FOR_KEYBOARD 100

@interface NotificationViewController ()

@end

@implementation NotificationViewController
@synthesize text1=_text1;
@synthesize text2=_text2;
@synthesize textBack=_textBack;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    _textBack = [[UIView alloc]initWithFrame:CGRectMake(20, 170, 280, 100)];
    _textBack.backgroundColor = [UIColor blueColor];
    _textBack.alpha = 0.5f;
    [self.view addSubview:_textBack];
    [_textBack release];
    _text1 = [[UITextField alloc]initWithFrame:CGRectMake(25, 180, 260, 30)];
    _text1.backgroundColor = [UIColor whiteColor];
    _text2 = [[UITextField alloc]initWithFrame:CGRectMake(25, 220, 260, 30)];
    _text2.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_text1];
    [self.view addSubview:_text2];
    self.text1.delegate = self;
    self.text2.delegate = self;
    self.title = @"Notification Demo";
    //必须有这行才能掉uitextfielddelegate里的函数 否者的话函数调用不了
   
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark ------textFieldDelegate Function -----

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self.text1 resignFirstResponder];
    [self.text2 resignFirstResponder];
    [self setviewMoveUp:NO];
    return YES;
}
- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    if([textField isEqual:_text1])
    {
        if (self.view.frame.origin.y >=0) {
            [self setviewMoveUp:YES];
        }
    }
}
-(void)setviewMoveUp:(BOOL)moveUp
{
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.5];
    CGRect rect = self.view.frame;
    if(moveUp)
    {
        NSLog(@"rect.origin.y=%f",rect.origin.y);
        NSLog(@"rect.size.height=%f",rect.size.height);
        rect.origin.y -= kOFFSET_FOR_KEYBOARD;
        rect.size.height += kOFFSET_FOR_KEYBOARD;
    }else{
        rect.origin.y += kOFFSET_FOR_KEYBOARD;
        rect.size.height -= kOFFSET_FOR_KEYBOARD;
    }
    self.view.frame = rect;
    [UIView commitAnimations];
}
-(void)keyboardWillShow:(NSNotification *)notice
{
    if(([_text1 isFirstResponder] || [_text2 isFirstResponder]) && self.view.frame.origin.y>0)
    {
        [self setviewMoveUp:YES];
    }else if((![_text1 isFirstResponder] && ![_text2 isFirstResponder]) && self.view.frame.origin.y<0){
        [self setviewMoveUp:NO];
    }
}

#pragma mark ---UIViewController里的函数控制视图的加载和显示---

- (void)viewWillAppear:(BOOL)animated{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:self.view.window];
}
- (void)viewWillDisappear:(BOOL)animated{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillShowNotification object:nil];
}
@end
