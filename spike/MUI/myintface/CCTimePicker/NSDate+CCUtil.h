//
//  NSDate+CCUtil.h
//  CCTimePickerDemo
//
//  Created by eHome on 17/4/1.
//  Copyright © 2017年 Bref. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (CCUtil)


- (NSString *)stringForDateWithFormat:(NSString *)format;

+ (NSDate *)dateWithDateString:(NSString *)dateString format:(NSString *)dateFormat;


@end
