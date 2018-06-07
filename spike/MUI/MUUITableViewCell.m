//
//  MUUITableViewCell.m
//  spike
//
//  Created by 泽联教育 on 2018/4/12.
//  Copyright © 2018年 泽联教育. All rights reserved.
//

#import "MUUITableViewCell.h"


@implementation MUUITableViewCell
-(void)setMuudata:(muuidata *)muudata{
    
    _muudata=muudata;
    _mydata.text=muudata.useDate;
    _mytitle.text=muudata.title;
    _mytime.text=muudata.period;
    _mytopy.text=muudata.name;
    
    
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
