//
//  courTableViewCell.m
//  spike
//
//  Created by 泽联教育 on 2018/4/23.
//  Copyright © 2018年 泽联教育. All rights reserved.
//

#import "courTableViewCell.h"


@implementation courTableViewCell
-(void)setCour:(courdata *)cour{
    
    
    _cour=cour;
    self.textLabel.text=cour.name;
    
    
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
