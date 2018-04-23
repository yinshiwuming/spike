//
//  mydata.h
//  spike
//
//  Created by 泽联教育 on 2018/4/13.
//  Copyright © 2018年 泽联教育. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface mydata : NSObject
@property(nonatomic,copy) NSString * onelab;
@property(nonatomic ,strong)NSString *twolab;


-(instancetype)initWithDict:(NSDictionary *)dict;

/**
 *  初始化当前模型对象的类方法
 *
 *  @param dict 传入一个字典数据
 *
 *  @return 返回当前模型对象
 */
+ (instancetype)tgWithDict:(NSDictionary *)dict;


+ (NSArray *)tgWitharry:(NSArray *)myarry;

@end
