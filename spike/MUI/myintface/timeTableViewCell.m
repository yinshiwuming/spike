//
//  timeTableViewCell.m
//  spike
//
//  Created by 泽联教育 on 2018/4/16.
//  Copyright © 2018年 泽联教育. All rights reserved.
//

#import "timeTableViewCell.h"

@implementation timeTableViewCell
-(void)setCelldata:(celldata *)celldata{
    
    _celldata=celldata;
    self.textLabel.text=celldata.name;
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
