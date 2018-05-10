//
//  MImaCell.h
//  QQImagePicker
//
//  Created by mac on 2016/11/25.
//  Copyright © 2016年 com.rongniu.caifuwang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ImagePickerDefine.h"

@protocol MImaCellDelegate

- (BOOL)arrayIsfulled;

@end

static NSString *MImaCellClassName = @"MImaCell";

@interface MImaCell : UICollectionViewCell

@property(nonatomic,assign) id<MImaCellDelegate> delegate;

@property (weak, nonatomic) IBOutlet UIImageView *imavHead;
@property (weak, nonatomic) IBOutlet UIButton *btnCheckMark;


@property(nonatomic,strong) UIImageView *BigImgView;

- (void)setBtnSelectedHandle:(MBoolBlock)block;

- (void)setBigImgViewWithImage:(UIImage *)img;
@end
