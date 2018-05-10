//
//  JJOneScrollView.h
//  test
//
//  Created by mac on 2016/11/25.
//  Copyright © 2016年 com.rongniu.caifuwang. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol JJOneScrollViewDelegate <NSObject>

-(void)goBack;

-(void)willGoBack:(NSInteger)seletedIndex;

@optional

@end
@interface JJOneScrollView : UIScrollView


//代理
@property(nonatomic,weak)id<JJOneScrollViewDelegate> mydelegate;

/**浏览器中我是第几个图片?*/
@property(nonatomic,assign)NSInteger myindex;



//❤️本地加载图
-(void)setLocalImage:(UIImageView *)imageView ;

//❤️网络加载图
-(void)setNetWorkImage:(UIImageView *)imageView urlStr:(NSString *)urlStr ;


//回复放大缩小前的原状
-(void)reloadFrame;




@end
