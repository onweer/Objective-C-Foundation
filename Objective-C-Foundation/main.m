//
//  main.m
//  Objective-C-Foundation
//
//  Created by SpiColorPendra on 16/1/19.
//  Copyright © 2016年 SpiColorPendra. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // Foundation框架是Cocoa编程，iOS编程的基础框架,它包括字符串，集合，日期，时间等基础。无论是开发Cocoa应用程序，还是开发iOS应用程序，Foundation框架都是基础框架
        
        //字符串NSString  与  NSMutableString
        unichar data[6] = {97,98,99,100,101,102};
        //使用Unicode数值初始化字符串
        NSString* str = [[NSString alloc]initWithCharacters:data length:6];
        NSLog(@"%@",str);
        char* cstr = "Hello iOS";
        //将C语言字符串转换为NSString对象
        NSString* str2 = [NSString stringWithUTF8String:cstr];
        //将字符串写入指定文件
        [str2 writeToFile:@"/Users/spicolorpendra/Documents/Objective-C-Foundation/Objective-C-Foundation/myFile.txt" atomically:YES encoding:NSUTF8StringEncoding error:nil];
        //读取这些内容
        NSString* str3 = [NSString stringWithContentsOfFile:@"myFile.txt" encoding:NSUTF8StringEncoding error:nil];
        NSLog(@"%@",str3);
    }
    return 0;
}
