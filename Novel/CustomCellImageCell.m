//
//  CustomCellImageCell.m
//  Novel
//
//  Created by loveuu on 19/4/13.
//  Copyright (c) 2013年 loveuu. All rights reserved.
//

#import "CustomCellImageCell.h"

@implementation CustomCellImageCell   //这里新建的的时候继承的是CustomCellImageCell这个类

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if(self==[super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        [self.contentView setBackgroundColor:[UIColor clearColor]];
    }
    return self;
}
-(void)setCellImage:(UIImage *)img{
    imageview = [[UIImageView alloc]initWithImage:img];
    imageview.frame=CGRectMake(0, 0, 320, 40);
    [self.contentView addSubview:imageview];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
    if (selected==YES) {
        imageview.alpha=1;
    }else{
        imageview.alpha=0.5;
    }
}

@end
