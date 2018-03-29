//
//  HavTableViewCell.m
//  spike
//
//  Created by 泽联教育 on 2018/3/28.
//  Copyright © 2018年 泽联教育. All rights reserved.
//

#import "HavTableViewCell.h"

@implementation HavTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // 初始化子视图
        [self initLayout];
    }
    return self;
}

- (void)initLayout
{
    _leftLabel=[[UILabel alloc]initWithFrame:CGRectMake(25, 15, 110, 14)];
    [self.contentView addSubview:_leftLabel];
    
    
    
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
