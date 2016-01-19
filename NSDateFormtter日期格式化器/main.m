//
//  main.m
//  NSDateFormtter日期格式化器
//
//  Created by SpiColorPendra on 16/1/19.
//  Copyright © 2016年 SpiColorPendra. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // 日期格式化器就是完成 NSDate和NSString之间的转换

        // 提供了 NSDateFormatterNoStyle、...ShortStyle、各种模板
        // 如果想自定义模板可以使用 setDateFormate方法设置日期、时间模板即可
        // NSDate转换为NSString需要调用stringFromDate方法
        // NSString转换为NSDate需要调用dateFromString方法
        
        //需要被格式化的时间
        NSDate* dt = [NSDate dateWithTimeIntervalSince1970:3600 * 24 * 366 * 20];
        //创建两个NSLocale代表 美国、中国
        NSLocale *us = [[NSLocale alloc]initWithLocaleIdentifier:@"en_US"];
        NSLocale *cn = [[NSLocale alloc]initWithLocaleIdentifier:@"zh_CN"];
        NSDateFormatter *format[2];
        //初始化
        format[0] = [[NSDateFormatter alloc]init];
        format[1] = [[NSDateFormatter alloc]init];
        //设置NSDateFormatter的日期、时间风格
        [format[0] setDateStyle:NSDateFormatterFullStyle];
        [format[0] setLocale:cn];
        NSLog(@"中国ShortStyle时间格式   %@",[format[0] stringFromDate:dt]);
        //                         90/1/16
        [format[1] setDateStyle:NSDateFormatterFullStyle];
        [format[1] setLocale:us];
        NSLog(@"美国ShortStyle时间格式   %@",[format[1] stringFromDate:dt]);
        // NSDateFormatterShortStyle 90/1/16   1/16/90
        // NSDateFormatterMediumStyle 1990年1月16日   Jan 16, 1990
        // NSDateFormatterLongStyle   1990年1月16日   January 16, 1990
        // NSDateFormatterFullStyle   1990年1月16日 星期二    Tuesday, January 16, 1990
        
        //自定义模板
        NSDateFormatter *format2 = [[NSDateFormatter alloc]init];
        [format2 setLocale:cn];
        [format2 setDateFormat:@"公元yyyy年MM月DD日 HH时mm分"];
        NSLog(@"%@",[format2 stringFromDate:dt]);//公元1990年01月16日 08时00分
        //把字符串转换为NSDate对象
        NSDateFormatter *format3 = [[NSDateFormatter alloc]init];
        NSString* dateStr = @"2016-01-19";
        [format3 setDateFormat:@"yyyy-MM-DD"];
        NSDate* date2 = [format3 dateFromString:dateStr];
        NSLog(@"%@",date2);
        //2016-01-18 16:00:00 +0000
    }
    return 0;
}
