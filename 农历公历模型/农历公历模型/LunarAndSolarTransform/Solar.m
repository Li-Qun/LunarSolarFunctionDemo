//
//  Solar.m
//  农历公历模型
//
//  Created by HF on 2018/3/12.
//  Copyright © 2018年 HF-Liqun. All rights reserved.
//

#import "Solar.h"
#import "LunarSolarTransform.h"
#import "LunarSolarPrivate.h"

@interface Solar ()

@property (nonatomic, strong, readwrite) NSDate *date;
@property (nonatomic, readwrite) NSInteger solarDay;
@property (nonatomic, readwrite) NSInteger solarMonth;
@property (nonatomic, readwrite) NSInteger solarYear;

@end

@implementation Solar

- (instancetype)initWithDate:(NSDate *)date {
    self = [super init];
    if (!self)  return nil;
    self.date = date;
    self.solarYear = [[[self calendar] components:NSCalendarUnitYear fromDate:self.date] year];
    self.solarMonth = [[[self calendar] components:NSCalendarUnitMonth fromDate:self.date] month];
    self.solarDay = [[[self calendar] components:NSCalendarUnitDay fromDate:self.date] day];
    return self;
}

- (Lunar *)lunar {
    return [LunarSolarTransform solarToLunar:self];
}

- (NSString *)constellation {
    //计算星座
    NSString *constellation=@"";
    int i_month=0;
    NSString *theMonth = [NSString stringWithFormat:@"%i", (int)self.solarMonth];
    if([[theMonth substringToIndex:0] isEqualToString:@"0"]){
        i_month = [[theMonth substringFromIndex:1] intValue];
    }else{
        i_month = [theMonth intValue];
    }
    
    int i_day=0;
    NSString *theDay = [NSString stringWithFormat:@"%i", (int)self.solarDay];
    if([[theDay substringToIndex:0] isEqualToString:@"0"]){
        i_day = [[theDay substringFromIndex:1] intValue];
    }else{
        i_day = [theDay intValue];
    }
    /*
     摩羯座 12月22日------1月19日
     水瓶座 1月20日-------2月18日
     双鱼座 2月19日-------3月20日
     白羊座 3月21日-------4月19日
     金牛座 4月20日-------5月20日
     双子座 5月21日-------6月21日
     巨蟹座 6月22日-------7月22日
     狮子座 7月23日-------8月22日
     处女座 8月23日-------9月22日
     天秤座 9月23日------10月23日
     天蝎座 10月24日-----11月21日
     射手座 11月22日-----12月21日
     */
    switch (i_month) {
        case 1:
            if(i_day>=20 && i_day<=31){
                constellation=@"水瓶座";
            }
            if(i_day>=1 && i_day<=19){
                constellation=@"摩羯座";
            }
            break;
        case 2:
            if(i_day>=1 && i_day<=18){
                constellation=@"水瓶座";
            }
            if(i_day>=19 && i_day<=31){
                constellation=@"双鱼座";
            }
            break;
        case 3:
            if(i_day>=1 && i_day<=20){
                constellation=@"双鱼座";
            }
            if(i_day>=21 && i_day<=31){
                constellation=@"白羊座";
            }
            break;
        case 4:
            if(i_day>=1 && i_day<=19){
                constellation=@"白羊座";
            }
            if(i_day>=20 && i_day<=31){
                constellation=@"金牛座";
            }
            break;
        case 5:
            if(i_day>=1 && i_day<=20){
                constellation=@"金牛座";
            }
            if(i_day>=21 && i_day<=31){
                constellation=@"双子座";
            }
            break;
        case 6:
            if(i_day>=1 && i_day<=21){
                constellation=@"双子座";
            }
            if(i_day>=22 && i_day<=31){
                constellation=@"巨蟹座";
            }
            break;
        case 7:
            if(i_day>=1 && i_day<=22){
                constellation=@"巨蟹座";
            }
            if(i_day>=23 && i_day<=31){
                constellation=@"狮子座";
            }
            break;
        case 8:
            if(i_day>=1 && i_day<=22){
                constellation=@"狮子座";
            }
            if(i_day>=23 && i_day<=31){
                constellation=@"处女座";
            }
            break;
        case 9:
            if(i_day>=1 && i_day<=22){
                constellation=@"处女座";
            }
            if(i_day>=23 && i_day<=31){
                constellation=@"天秤座";
            }
            break;
        case 10:
            if(i_day>=1 && i_day<=23){
                constellation=@"天秤座";
            }
            if(i_day>=24 && i_day<=31){
                constellation=@"天蝎座";
            }
            break;
        case 11:
            if(i_day>=1 && i_day<=21){
                constellation=@"天蝎座";
            }
            if(i_day>=22 && i_day<=31){
                constellation=@"射手座";
            }
            break;
        case 12:
            if(i_day>=1 && i_day<=21){
                constellation=@"射手座";
            }
            if(i_day>=21 && i_day<=31){
                constellation=@"摩羯座";
            }
            break;
    }
    return constellation;
}

#pragma mark - private

- (NSCalendar *)calendar {
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    calendar.timeZone = [NSTimeZone localTimeZone];
    calendar.locale = [NSLocale currentLocale];
    return calendar;
}

@end
