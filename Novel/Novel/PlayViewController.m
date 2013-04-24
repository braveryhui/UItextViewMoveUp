//
//  PlayViewController.m
//  Novel
//
//  Created by loveuu on 19/4/13.
//  Copyright (c) 2013年 loveuu. All rights reserved.
//

#import "PlayViewController.h"
#import "SoundManager.h"

@interface PlayViewController ()

@end

@implementation PlayViewController

@synthesize player,slider1,slider2;
@synthesize isPlaying=_isPlaying;
@synthesize arr_objindex=_arr_objindex;
@synthesize str=_str;



- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
//让导航的bar显示
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    self.navigationController.navigationBarHidden=NO;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.title=@"play";
    //设置背景图
    UIImageView *playerBackImage = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 320, 480)];
    playerBackImage.image=[UIImage imageNamed:@"back3.png"];
    [self.view addSubview:playerBackImage];
    [playerBackImage release];
    //设置两个slider的北京图
    UIImageView *sliderBackImage =[[UIImageView alloc]initWithFrame:CGRectMake(10, 265, 300, 96)];
    sliderBackImage.image = [UIImage imageNamed:@"首页_时间与进度轴.png"];
    [self.view addSubview:sliderBackImage];
    [sliderBackImage release];
    
    //设置两个Slider的效果图 
    UISlider *mySlider = [[UISlider alloc]initWithFrame:CGRectMake(40, 280, 240, 0)];
    mySlider.backgroundColor = [UIColor clearColor];
    mySlider.maximumValue = 50.0f;
    mySlider.minimumValue = 10.0f;
    [mySlider setMaximumTrackImage:[UIImage imageNamed:@"max.png"] forState:UIControlStateNormal];
    [mySlider setMinimumTrackImage:[UIImage imageNamed:@"min.png"] forState:UIControlStateNormal];
    [mySlider setThumbImage:[UIImage imageNamed:@"thumb.png"] forState:UIControlStateNormal];
    [mySlider addTarget:self action:@selector(ProgressChange:) forControlEvents:UIControlEventValueChanged];
    mySlider.value=10.0f;
    [self.view addSubview:mySlider];
    [mySlider release];
    
    
    UISlider *mySlider2 = [[UISlider alloc]initWithFrame:CGRectMake(40, 310, 240, 50)];
    mySlider2.backgroundColor = [UIColor clearColor];
    mySlider2.maximumValue = 50.0f;
    mySlider2.minimumValue = 10.0f;
    [mySlider2 setMaximumTrackImage:[UIImage imageNamed:@"max.png"] forState:UIControlStateNormal];
    [mySlider2 setMinimumTrackImage:[UIImage imageNamed:@"min.png"] forState:UIControlStateNormal];
    [mySlider2 setThumbImage:[UIImage imageNamed:@"thumb.png"] forState:UIControlStateNormal];
    [mySlider2 addTarget:self action:@selector(sliderChange:) forControlEvents:UIControlEventValueChanged];
    mySlider2.value=10.0f;
    [self.view addSubview:mySlider2];
    [mySlider2 release];
    
    //拿到CategoryController.m传过来的_arr_objinde播放不同的歌曲
    if(_arr_objindex >= 10)
    {
        _str = [NSString stringWithFormat:@"0%d",_arr_objindex];
    }else{
        _str = [NSString stringWithFormat:@"00%d",_arr_objindex];
    }
    
    NSData *data =[NSData dataWithContentsOfFile:[[NSBundle mainBundle] pathForResource:_str ofType:@"mp3"]];  //注意这里的data是没有init跟retain的所以不用release
    
    //利用单例控制的类SoundManager类控制叠加播放
    playWithData(data);   //不用释放data如果释放了Data的话就会占用野指针出错
    }

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(IBAction)sliderChange:(id)sender
{
    
}
-(IBAction)playerTimer:(id)sender
{
    
}
@end
