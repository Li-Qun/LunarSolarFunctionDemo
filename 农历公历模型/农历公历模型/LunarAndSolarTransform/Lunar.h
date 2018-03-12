//
//  Lunar.h
//  MensesTracker
//
//  Created by gorry on 2017/7/26.
//  Copyright © 2017年 huofar. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Solar;

/**
 农历
 */
@interface Lunar : NSObject

@property (nonatomic, strong, readonly) NSDate *date;

- (instancetype)initWithDate:(NSDate *)date;

- (Solar *)solar;

/**
 是否有闰月
 */
@property (nonatomic, readonly) BOOL isLeap;

/**
 农历 日
 */
@property (nonatomic, readonly) NSInteger lunarDay;

/**
 农历 月 数字1~12
 */
@property (nonatomic, readonly) NSInteger lunarMonth;

/**
 农历 年 
 e.g. 2017
 */
@property (nonatomic, readonly) NSInteger lunarYear;

/**
 农历，大写的月份
 */
@property (nonatomic, copy, readonly) NSString *lunarFromatterMonth;

/**
 农历，大写的日
 */
@property (nonatomic, copy, readonly) NSString *lunarFomatterDay;

/**
 e.g. 2017-正月-十四

 @return return value description
 */
- (NSString *)formatString;


/**
 天干地支纪年法 根据农历年 算 干支年

 @return 干支年 例如：@"戊戌年"
 */
- (NSString *)ganzhiYear;

@end
