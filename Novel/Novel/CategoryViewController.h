//
//  CategoryViewController.h
//  Novel
//
//  Created by loveuu on 19/4/13.
//  Copyright (c) 2013年 loveuu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomCellImageCell.h"
#import "PlayViewController.h"
@interface CategoryViewController : UIViewController
<UITableViewDelegate,UITableViewDataSource>
{
    UITableView *table;
    NSArray *muarr;
}
@property  (retain,nonatomic) NSArray *muarr;
@end
