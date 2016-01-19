//
//  main.m
//  日期与时间
//
//  Created by SpiColorPendra on 16/1/19.
//  Copyright © 2016年 SpiColorPendra. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        //NSDate对象代表时间与日期，提供了大量init开头的方法来创建NSData对象
        //获取当前日期、时间的NSData
        NSDate* date1 = [[NSDate alloc]init];
        //NSData* date1 = [NSDate date];  和上面结果一样，区别目前还不清楚
        NSLog(@"%@",date1);
        //获取一天之后的时间
        NSDate* date2 = [[NSDate alloc]initWithTimeIntervalSinceNow:3600*24];
        NSLog(@"%@",date2);
        //获取3天之前的时间
        NSDate* date3 = [[NSDate alloc]initWithTimeIntervalSinceNow:3600*24*-3];
        NSLog(@"%@",date3);
        //获取从1970年1月1日开始，20年之后的日期
        NSDate *date4 = [[NSDate alloc]initWithTimeIntervalSince1970:3600*24*366*20];
        NSLog(@"%@",date4);
        //获取当前的Locale
        NSLocale* cn = [NSLocale currentLocale];
        //获取NSDate在当前Locale对应的字符串
        NSLog(@"%@",[date1 descriptionWithLocale:cn]);
        //2016年1月19日 星期二 中国标准时间 下午2:21:27
        //获取两个日期之间较早的日期
        NSDate* earlier = [date1 earlierDate:date2];
        NSDate* later = [date1 laterDate:date2];
        //比较两个日期  compare:方法返回NSComparisonResult枚举值，
        //该枚举值包含NSOrderedAscending、NSOrderedSame和NSOrderedDescending 三个值
        // 分别代表 调用compare：的日期位于被比日期之前 相同 之后
        switch ([date1 compare:date3]) {
            case NSOrderedAscending:
                NSLog(@"date1位于date3之前");
                break;
            case NSOrderedSame:
                NSLog(@"date1位于date3相等");
                break;
            case NSOrderedDescending:
                NSLog(@"date1位于date3之后");
                break;
        }
        //获取两个时间之差的时间差
        NSLog(@"date1与date3之间相差 %g 秒",[date1 timeIntervalSinceDate:date3]);
        //获取与指定时间与现在时间差
        NSLog(@"date2与现在时间差 %g 秒",[date2 timeIntervalSinceNow]);
        //类方法以date开头 实例方法以init开头
        //NSLocale 代表一个语言 国际环境 同一个时间在不同语言 国家环境显示出的字符串是不一样的
    }
    return 0;
}
