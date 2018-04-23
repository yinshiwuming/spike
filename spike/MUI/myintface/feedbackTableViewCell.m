//
//  feedbackTableViewCell.m
//  spike
//
//  Created by 泽联教育 on 2018/4/13.
//  Copyright © 2018年 泽联教育. All rights reserved.
//

#import "feedbackTableViewCell.h"

@implementation feedbackTableViewCell
-(void)setData:(mydata *)data{
    _data =data;
    _onelab.text=data.onelab;
    _twolab.text=data.twolab;
    
    
    
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
