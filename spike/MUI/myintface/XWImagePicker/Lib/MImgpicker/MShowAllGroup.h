//
//  MShowAllGroup.h
//  QQImagePicker
//
//  Created by mac on 2016/11/25.
//  Copyright © 2016年 com.rongniu.caifuwang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MShowGroupAllSet.h"

@protocol MShowAllGroupDelegate<NSObject>
-(void)finishSelectImg;
@end

@interface MShowAllGroup : UIViewController<MShowGroupAllSetDelegate>

@property(nonatomic,assign) id<MShowAllGroupDelegate> delegate;

- (id)initWithArrGroup:(NSArray *)arrGroup arrSelected:(NSMutableArray *)arrSelected;
@property (nonatomic, strong) NSMutableArray *arrSeleted;

@property(nonatomic,strong) MShowGroupAllSet *mvc;

//图片总数量限制
@property(nonatomic,assign)NSInteger maxCout;

@end
