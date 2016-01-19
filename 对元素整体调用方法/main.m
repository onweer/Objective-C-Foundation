//
//  main.m
//  对元素整体调用方法
//
//  Created by SpiColorPendra on 16/1/19.
//  Copyright © 2016年 SpiColorPendra. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "User.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // NSArray查找元素的索引是 isEqual比较
        // 初始化NSArray对象
        NSArray* array = [NSArray arrayWithObjects:
                          [[User alloc]initWithName:@"sun" pass:@"123"],
                          [[User alloc]initWithName:@"bai" pass:@"345"],
                          [[User alloc]initWithName:@"zhu" pass:@"654"],
                          [[User alloc] initWithName:@"tang" pass:@"178"],
                          [[User alloc] initWithName:@"niu" pass:@"155"],
                           nil];
        //对元素整体调用方法
        [array makeObjectsPerformSelector:@selector(say:) withObject:@"下午好,NSArray厉害吗?"];
        /*
         sun说: 下午好,NSArray厉害吗?
         bai说: 下午好,NSArray厉害吗?
         zhu说: 下午好,NSArray厉害吗?
         tang说: 下午好,NSArray厉害吗?
         niu说: 下午好,NSArray厉害吗?
         */
        NSString* content = @"iOS高级技术开发";
        //迭代集合内指定范围内的元素，并使用该元素来执行代码块
        [array enumerateObjectsAtIndexes:[NSIndexSet indexSetWithIndexesInRange:NSMakeRange(2,2)]
                                 options:NSEnumerationReverse
                                // 代码块的第一个参数代表正在遍历的元素集合
                               //代码块的第二个参数代表正在遍历的元素集合的索引
         usingBlock:^(id obj,NSUInteger idx,BOOL *stop)
         {
             NSLog(@"正在处理第%ld个元素: %@",idx,obj);
             [obj say:content];
         }];
        /*
         正在处理第3个元素: <User[name = tang, pass = 178]>
         tang说: iOS高级技术开发
         正在处理第2个元素: <User[name = zhu, pass = 654]>
         zhu说: iOS高级技术开发

         */
    }
    return 0;
}
