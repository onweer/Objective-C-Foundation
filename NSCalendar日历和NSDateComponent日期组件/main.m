//
//  main.m
//  NSCalendar日历和NSDateComponent日期组件
//
//  Created by SpiColorPendra on 16/1/19.
//  Copyright © 2016年 SpiColorPendra. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // NSCalendar 包含两个常用方法:
        // 1. (NSDateComponents*) components:fromDate: 从NSDate中提取年、月、日、时、分、秒、各个时间字段信息
        // 2. dateFromComponents:(NSDateComponents*) comps:使用comps对象包含年、月、日、时、分、秒、各个时间字段信息 来创建NSDate
        
        //创建NSCalendar
        NSCalendar *gregorian = [[NSCalendar alloc]initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
        //获取当前日期
        NSDate* dt = [NSDate date];
        //定义一个时间字段的旗标，指定将会获取指定年、月、日、时、分、秒、的信息
        unsigned unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay
        | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond | NSCalendarUnitWeekday;
        
        //获取不同时间字段的信息
        NSDateComponents* comp = [gregorian components:unitFlags fromDate:dt];
        //获取各个时间字段的值
        NSLog(@"现在是%ld年",comp.year);
        NSLog(@"现在是%ld月",comp.month);
        NSLog(@"现在是%ld日",comp.day);
        NSLog(@"现在是%ld时",comp.hour);
        NSLog(@"现在是%ld分",comp.minute);
        NSLog(@"现在是%ld秒",comp.second);
        NSLog(@"现在是星期%ld",comp.weekday);
        /*
         2016-01-19 15:21:41.398 NSCalendar日历和NSDateComponent日期组件[3039:129462] 现在是2016年
         2016-01-19 15:21:41.398 NSCalendar日历和NSDateComponent日期组件[3039:129462] 现在是1月
         2016-01-19 15:21:41.398 NSCalendar日历和NSDateComponent日期组件[3039:129462] 现在是19日
         2016-01-19 15:21:41.398 NSCalendar日历和NSDateComponent日期组件[3039:129462] 现在是15时
         2016-01-19 15:21:41.398 NSCalendar日历和NSDateComponent日期组件[3039:129462] 现在是21分
         2016-01-19 15:21:41.398 NSCalendar日历和NSDateComponent日期组件[3039:129462] 现在是41秒
         2016-01-19 15:21:41.398 NSCalendar日历和NSDateComponent日期组件[3039:129462] 现在是星期4
         */
        /*
         2016-01-19 15:24:38.534 NSCalendar日历和NSDateComponent日期组件[3080:130709] 现在是2016年
         2016-01-19 15:24:38.534 NSCalendar日历和NSDateComponent日期组件[3080:130709] 现在是1月
         2016-01-19 15:24:38.534 NSCalendar日历和NSDateComponent日期组件[3080:130709] 现在是19日
         2016-01-19 15:24:38.534 NSCalendar日历和NSDateComponent日期组件[3080:130709] 现在是15时
         2016-01-19 15:24:38.534 NSCalendar日历和NSDateComponent日期组件[3080:130709] 现在是24分
         2016-01-19 15:24:38.534 NSCalendar日历和NSDateComponent日期组件[3080:130709] 现在是38秒
         2016-01-19 15:24:58.836 NSCalendar日历和NSDateComponent日期组件[3103:131099] 现在是星期3
         */
        
        //再次创建个字段的值
        NSDateComponents *comp2 = [[NSDateComponents alloc]init];
        comp2.year = 2015;
        comp2.month = 4;
        comp2.day = 22;
        comp2.hour = 18;
        comp2.minute = 59;
        //通过NSDateComponents所包含的时间字段数字来恢复NSDate对象
        NSDate* date = [gregorian dateFromComponents:comp2];
        NSLog(@"%@",date);
    //2016-01-19 15:28:46.310 NSCalendar日历和NSDateComponent日期组件[3165:133266] 2015-04-22 10:59:00 +0000
    }
    return 0;
}
