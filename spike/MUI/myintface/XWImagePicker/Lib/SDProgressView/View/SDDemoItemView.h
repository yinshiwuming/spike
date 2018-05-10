//
//  SDDemoItemView.h
//  SDProgressView
//
//  Created by mac on 2016/11/25.
//  Copyright © 2016年 com.rongniu.caifuwang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SDBaseProgressView.h"

@interface SDDemoItemView : UIView

@property (nonatomic, assign) Class progressViewClass;

@property (nonatomic, strong) SDBaseProgressView *progressView;

+ (id)demoItemViewWithClass:(Class)class;

@end
