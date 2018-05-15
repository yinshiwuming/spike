//
//  myTableViewCell.m
//  cell的量
//
//  Created by 泽联教育 on 2018/4/11.
//  Copyright © 2018年 泽联教育. All rights reserved.
//

#import "myTableViewCell.h"

@implementation myTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    self.hedaimage.image=[UIImage imageNamed:@"timg"];
   self.hedaimage.layer.cornerRadius=self.hedaimage.frame.size.width/2;
   self.hedaimage.layer.masksToBounds=YES;
    
    _staview = [[WQLStarView alloc]initWithFrame:CGRectMake(110, 60, self.frame.size.width-123, 13) withTotalStar:5 withTotalPoint:10 starSpace:10];
    _staview.starAliment = StarAlimentCenter;
    _staview.commentPoint = 6;
    
    
    [self.contentView addSubview:_staview];
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
