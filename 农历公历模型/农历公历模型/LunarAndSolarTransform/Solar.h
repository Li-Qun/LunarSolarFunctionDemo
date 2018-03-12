//
//  Solar.h
//  农历公历模型
//
//  Created by HF on 2018/3/12.
//  Copyright © 2018年 HF-Liqun. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Lunar;

/**
 公历
 */
@interface Solar : NSObject

- (instancetype)initWithDate:(NSDate *)date;

@property (nonatomic, strong, readonly) NSDate *date;

/**
  日
 */
@property (nonatomic, readonly) NSInteger solarDay;

/**
  月
 */
@property (nonatomic, readonly) NSInteger solarMonth;

/**
  年
 */
@property (nonatomic, readonly) NSInteger solarYear;


- (Lunar *)lunar;

//对应的星座计算
- (NSString *)constellation;

@end
