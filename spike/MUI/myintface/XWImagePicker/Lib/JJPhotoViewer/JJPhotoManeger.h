//
//  JJPhotoManeger.h
//  test
//
//  Created by mac on 2016/11/25.
//  Copyright © 2016年 com.rongniu.caifuwang. All rights reserved.
//




#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
//view
#import "JJMainScrollView.h"


@interface JJPhotoManeger : NSObject
/**
 *  创建
 */
+(instancetype)maneger;

/**
    代理
 */
@property(nonatomic,weak)id<JJPhotoDelegate> delegate;




#pragma mark - ❤️俩核心功能

/**
 *  本地图片放大浏览    
 */
-(void)showLocalPhotoViewer:(NSArray *)imageViews selecImageindex:(NSInteger)selecImageindex;


/**
 *  放大浏览网络图片
 */
-(void)showNetworkPhotoViewer:(NSArray *)imageViews urlStrArr:(NSArray *)urlStrArr selecImageindex:(NSInteger)selecImageindex;




@end
