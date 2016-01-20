//
//  NSDictionary.m
//  Objective-C-Foundation
//
//  Created by SpiColorPendra on 16/1/20.
//  Copyright © 2016年 SpiColorPendra. All rights reserved.
//

#import "NSDictionary.h"

@implementation NSDictionary (print)
- (void) print
{
    NSMutableString* result = [NSMutableString stringWithFormat:
                               @"{"];
    //使用快速枚举语法来遍历NSDictionary
    //循环计数器将依次等于该NSDictionary的每个key
    for (id key in self) {
        [result appendString:[key description]];
        [result appendString:@"="];
        //使用下标访问法根据key来获取对应的value
        [result appendString:[self[key] description]]; //这里也可以写成[self objectForKey:key ] description]];
        [result appendString:@", "];
        //当程序调用dictionary[key]下标访问法进行访问的时候 实际上就是通过 objectForKeyedSubscript:  方法进行的访问
    }
    //获取字符串长度
    NSUInteger len = [result length];
    //去掉字符串最后两个字符
    [result deleteCharactersInRange:NSMakeRange(len - 2, 2)];
    [result appendString:@"}"];
    NSLog(@"%@",result);
}
@end
