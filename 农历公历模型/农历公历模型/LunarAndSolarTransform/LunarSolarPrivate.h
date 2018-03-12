//
//  LunarSolarPrivate.h
//  农历公历模型
//
//  Created by HF on 2018/3/12.
//  Copyright © 2018年 HF-Liqun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Solar.h"
#import "Lunar.h"

@interface Solar (Private)

@property (nonatomic, readwrite) NSInteger solarDay;
@property (nonatomic, readwrite) NSInteger solarMonth;
@property (nonatomic, readwrite) NSInteger solarYear;

@end

@interface Lunar (Private)

@property (nonatomic, readwrite) BOOL isLeap;
@property (nonatomic, readwrite) NSInteger lunarDay;
@property (nonatomic, readwrite) NSInteger lunarMonth;
@property (nonatomic, readwrite) NSInteger lunarYear;

@end
