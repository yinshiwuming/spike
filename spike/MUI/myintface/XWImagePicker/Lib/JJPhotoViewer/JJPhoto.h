//
//  JJPhoto.h
//  test
//
//  Created by mac on 2016/11/25.
//  Copyright © 2016年 com.rongniu.caifuwang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface JJPhoto : NSObject

/**点进来的小图片ImageView*/
@property(nonatomic,strong)UIImageView *imageView;

/**要显示的网络地址*/
@property(nonatomic,copy)NSString *urlStr;

/**holdimage*/
@property(nonatomic,assign)CGRect oldRect;

/**是不是点进来的那个ImageView*/
@property(nonatomic,assign)BOOL isSelecImageView;


@end
