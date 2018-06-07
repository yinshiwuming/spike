//
//  noticTableViewCell.m
//  spike
//
//  Created by 泽联教育 on 2018/4/14.
//  Copyright © 2018年 泽联教育. All rights reserved.
//

#import "noticTableViewCell.h"

@implementation noticTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    UIView *view=[[UIView alloc]initWithFrame:CGRectMake(0, 100, self.contentView.frame.size.width, 1)];
    view.backgroundColor=[UIColor colorWithRed:224/255.0 green:224/255.0 blue:224/255.0 alpha:1];
    //通知赋值
    [self.contentView addSubview:view];
    UIView *topview=[[UIView alloc]initWithFrame:CGRectMake(0, 0, self.contentView.frame.size.width, 9)];
    topview.backgroundColor= [UIColor colorWithRed:245/255.0 green:245/255.0 blue:245/255.0 alpha:1];
    [self.contentView addSubview:topview];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
