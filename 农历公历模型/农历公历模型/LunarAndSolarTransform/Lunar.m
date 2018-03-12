//
//  Lunar.m
//  农历公历模型
//
//  Created by HF on 2018/3/12.
//  Copyright © 2018年 HF-Liqun. All rights reserved.
//

#import "Lunar.h"
#import "Solar.h"
#import "LunarSolarTransform.h"

@interface Lunar ()

@property (nonatomic, strong, readwrite) NSDate *date;
@property (nonatomic, readwrite) BOOL isLeap;
@property (nonatomic, readwrite) NSInteger lunarDay;
@property (nonatomic, readwrite) NSInteger lunarMonth;
@property (nonatomic, readwrite) NSInteger lunarYear;

@end

@implementation Lunar

- (instancetype)initWithDate:(NSDate *)date {
    self = [super init];
    if (!self)  return nil;
    self.date = date;
    self.lunarYear = [[[self calendar] components:NSCalendarUnitYear fromDate:self.date] year];
    self.lunarMonth = [[[self calendar] components:NSCalendarUnitMonth fromDate:self.date] month];
    self.lunarDay = [[[self calendar] components:NSCalendarUnitDay fromDate:self.date] day];
    return self;
}

- (Solar *)solar {
    return [LunarSolarTransform lunarToSolar:self];
}

- (NSString *)lunarFromatterMonth {
    NSString *str = nil;
    NSArray *chineseMonths = @[@"正月", @"二月", @"三月", @"四月", @"五月", @"六月", @"七月", @"八月",
                            @"九月", @"十月", @"冬月", @"腊月"];
    if (self.lunarMonth >= 0 && self.lunarMonth <= 12) {
        str = chineseMonths[self.lunarMonth - 1];
    }
    return str;
}

- (NSString *)lunarFomatterDay {
    NSString *str = nil;
    NSArray *chineseDays = @[
                          @"初一", @"初二", @"初三", @"初四", @"初五", @"初六", @"初七", @"初八", @"初九", @"初十",
                          @"十一", @"十二", @"十三", @"十四", @"十五", @"十六", @"十七", @"十八", @"十九", @"二十",
                          @"廿一", @"廿二", @"廿三", @"廿四", @"廿五", @"廿六", @"廿七", @"廿八", @"廿九", @"三十"];
    if (self.lunarDay >= 1 && self.lunarDay <= 30) {
        str = chineseDays[self.lunarDay - 1];
    }
    return str;
}

- (NSString *)formatString {
    //结果返回
    return [NSString stringWithFormat:@"%i-%@-%@", (int)self.lunarYear, self.lunarFromatterMonth, self.lunarFomatterDay];
}

- (NSString *)ganzhiYear
{
    //干指天干，共有10个符号
    NSArray *ganArray = @[@"甲",@"乙",@"丙",@"丁",@"戊",@"己",@"庚",@"辛",@"壬",@"癸"];
    //支指地支，共有12个符号：
    NSArray *zhiArray = @[@"子",@"丑",@"寅",@"卯",@"辰",@"巳",@"午",@"未",@"申",@"酉",@"戌",@"亥"];
    //天干计算法：年减去3再除以10得到的余数对应的天干字就是干
    //地支计算法：年减去3再除以12得到的余数对应的地支字就是支
    NSInteger ganIndex = (self.lunarYear - 3) % 10;
    NSInteger zhiIndex = (self.lunarYear - 3) % 12 ;
    ganIndex = (ganIndex == 0) ? 10 - 1 : ganIndex - 1;
    zhiIndex = (zhiIndex == 0) ? 12 - 1 : zhiIndex - 1;
    return [NSString stringWithFormat:@"%@%@年",ganArray[ganIndex],zhiArray[zhiIndex]];
}


#pragma mark - private

- (NSCalendar *)calendar {
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    calendar.timeZone = [NSTimeZone localTimeZone];
    calendar.locale = [NSLocale currentLocale];
    return calendar;
}

@end
