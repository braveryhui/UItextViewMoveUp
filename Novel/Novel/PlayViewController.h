//
//  PlayViewController.h
//  Novel
//
//  Created by loveuu on 19/4/13.
//  Copyright (c) 2013年 loveuu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import  <AVFoundation/AVFoundation.h>
#import <AudioToolbox/AudioToolbox.h>

@interface PlayViewController : UIViewController
<AVAudioPlayerDelegate>
{
    UISlider *slider1;
    UISlider *slider2;
    SystemSoundID ID;
    NSUInteger _arr_objindex;
    NSString *_str;
}
@property (retain,nonatomic) AVAudioPlayer *player;
@property (nonatomic, assign) BOOL isPlaying;
@property (retain,nonatomic) UISlider *slider1;
@property (retain,nonatomic)  UISlider *slider2;
@property (nonatomic) NSUInteger arr_objindex;
@property (nonatomic,retain) NSString *str;

//nsuinterger是不用retain
-(IBAction)sliderChange:(id)sender;
@end
