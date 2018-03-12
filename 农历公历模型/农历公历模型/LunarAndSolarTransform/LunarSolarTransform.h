//
//  LunarSolarTransform.h
//  农历公历模型
//
//  Created by HF on 2018/3/12.
//  Copyright © 2018年 HF-Liqun. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Lunar;
@class Solar;

@interface LunarSolarTransform : NSObject

/**
 农历转公历model,农历模型中，年，月，日必须有值

 @param lunar 农历model
 @return 公历model
 */
+ (Solar *)lunarToSolar:(Lunar *)lunar;

/**
 公历转农历model,公历模型中，年，月，日必须有值

 @param solar 公历model
 @return 农历model
 */
+ (Lunar *)solarToLunar:(Solar *)solar;

@end
