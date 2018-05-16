//
//  myTableViewCell.h
//  cell的量
//
//  Created by 泽联教育 on 2018/4/11.
//  Copyright © 2018年 泽联教育. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WQLStarView.h"
@interface myTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *hedaimage;
@property (weak, nonatomic) IBOutlet UIView *commentslab;
@property (nullable,strong) WQLStarView*staview;
@property(nonatomic, strong)UIImageView *hedview;
@end
