# LunarSolarFunctionDemo
Lunar Solar  Date Transform
     常用日期的公历和农历日期显示和转化方法
     基本使用举例，其他功能参加方法类
     
     First of all , 引入工具方法类头文件: import "LunarSolarHeader.h"

     /*
      2018-03-12 14:24:21.027 农历公历模型[55783:1795442] 今天是公历：2018年3月12
 
      2018-03-12 14:24:21.028 农历公历模型[55783:1795442] 今天是农历：戊戌年正月廿五
     */
    

     NSLog(@"今天是公历：%@ \n",[NSString stringWithFormat:@"%ld年%ld月%ld", (long)solarDate.solarYear,(long)solarDate.solarMonth,(long)solarDate.solarDay]);
    
    
     NSLog(@"今天是农历：%@",[NSString stringWithFormat:@"%@%@%@",[lunarDate ganzhiYear],lunarDate.lunarFromatterMonth, lunarDate.lunarFomatterDay]);
