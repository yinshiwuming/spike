//
//  MShowGroupAllSet.h
//  QQImagePicker
//
//  Created by mac on 2016/11/25.
//  Copyright © 2016年 com.rongniu.caifuwang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AssetsLibrary/AssetsLibrary.h>
#import "JJPhotoManeger.h"
@protocol MShowGroupAllSetDelegate<NSObject>
-(void)finishSelectImg;
@end

@interface MShowGroupAllSet : UIViewController<JJPhotoDelegate>
- (id)initWithGroup:(ALAssetsGroup *)group selectedArr:(NSMutableArray *)arrSelected;

@property(nonatomic,assign)NSInteger MaxCount;
@property(nonatomic,assign) id<MShowGroupAllSetDelegate> delegate;
@property (nonatomic, strong) NSMutableArray *arrSelected;

@property(nonatomic,strong) NSMutableArray *imgViewArray;
@end
