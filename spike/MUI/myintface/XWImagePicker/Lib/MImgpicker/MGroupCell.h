//
//  MGroupCell.h
//  QQImagePicker
//
//  Created by mac on 2016/11/25.
//  Copyright © 2016年 com.rongniu.caifuwang. All rights reserved.
//

#import <UIKit/UIKit.h>

static NSString *const MGroupCellClassName = @"MGroupCell";
@interface MGroupCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imavHead;
@property (weak, nonatomic) IBOutlet UILabel *lblInfo;

@end
