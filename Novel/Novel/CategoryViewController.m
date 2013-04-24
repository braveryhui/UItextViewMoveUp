//
//  CategoryViewController.m
//  Novel
//
//  Created by loveuu on 19/4/13.
//  Copyright (c) 2013年 loveuu. All rights reserved.
//

#import "CategoryViewController.h"

@interface CategoryViewController ()

@end

@implementation CategoryViewController
@synthesize muarr;
//让导航的bar消失掉
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    self.navigationController.navigationBarHidden=YES;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title=@"category";
    UIImageView *backImg = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 320, 436)];
    backImg.image = [UIImage imageNamed:@"back3.png"];
    table=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, 320, 436) style:UITableViewStylePlain];
    table.scrollEnabled=YES;
    table.dataSource=self;
    table.delegate=self;
    table.backgroundColor = [UIColor clearColor];
    table.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:backImg];  //先把背景图加进去
    [self.view addSubview:table];
    //把table的background=clearcolor就显示出背景图了
    
    muarr = [[NSArray alloc]initWithObjects:@"two carilac",@"没有离开",@"倾城",@"flying",@"rolling in the deep",@"moonlight",@"talking to the mon",@"two calilacs",@"loveing stranger",@"矜持",@"banderui", nil];
    //定义player视图返回按钮上的文字
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc]init];
    backButton.title=@"返回目录";
    self.navigationItem.backBarButtonItem=backButton;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [muarr count];
}


//导入CustomCellImage.h然后使用这个类这个类是来实现cell的自定义的图片和选中时的样式的
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
   NSString static *cellIdentifier = @"cell";
    CustomCellImageCell *cell = [table dequeueReusableCellWithIdentifier:cellIdentifier];
    if(cell==nil)
    {
        cell=[[CustomCellImageCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    [cell setCellImage:[UIImage imageNamed:@"条纹高光.png"]];
    cell.textLabel.backgroundColor=[UIColor whiteColor];
    cell.textLabel.text=[muarr objectAtIndex:[indexPath row]];
    cell.tag=[indexPath row];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    return cell;
}
//设置行高
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 40;
}
//当选中哪一个cell的时候执行传过去indexpath
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

    PlayViewController *playerController = [[PlayViewController alloc]init];
    playerController.arr_objindex = [indexPath row]+1;
    [self.navigationController pushViewController:playerController animated:YES];
    //[playerController release],playerController=nil;
    
}

@end
