//
//  ViewController.m
//  农历公历模型
//
//  Created by HF on 2018/3/12.
//  Copyright © 2018年 HF-Liqun. All rights reserved.
//

#import "ViewController.h"
#import "LunarSolarHeader.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSDate *date = [NSDate date];
    Solar *solarDate = [[Solar alloc] initWithDate:date];
    Lunar *lunarDate = solarDate.lunar;
    
    /*
     2018-03-12 14:24:21.027 农历公历模型[55783:1795442] 今天是公历：2018年3月12
     2018-03-12 14:24:21.028 农历公历模型[55783:1795442] 今天是农历：戊戌年正月廿五
     */
    NSLog(@"今天是公历：%@ \n",[NSString stringWithFormat:@"%ld年%ld月%ld", (long)solarDate.solarYear,(long)solarDate.solarMonth,(long)solarDate.solarDay]);
    NSLog(@"今天是农历：%@",[NSString stringWithFormat:@"%@%@%@",[lunarDate ganzhiYear],lunarDate.lunarFromatterMonth, lunarDate.lunarFomatterDay]);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
