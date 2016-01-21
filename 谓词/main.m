//
//  main.m
//  谓词
//
//  Created by SpiColorPendra on 16/1/21.
//  Copyright © 2016年 SpiColorPendra. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "User.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        //NSPredicate用于定义一个逻辑条件，通过该条件可以执行搜索或内存中的过滤操作，前面的集合都提供了使用谓词对集合进行过滤的方法
        // 定义谓词
        // 谓词由NSPredicate对象来代表，它有三个子类:NSComparisonPredicete、NSCompoundPredicate、NSExpression
        
        //创建谓词要求name的以s开头
        NSPredicate* pred = [NSPredicate predicateWithFormat:
                             @"name like 's*'"];
        User *user1 =[[User alloc]initWithName:@"sun" pass:@"123"];
        //对user1对象使用谓词进行判断
        BOOL result1= [pred evaluateWithObject:user1];
        NSLog(@"user1的name是否以s开头 : %d",result1);
        User* user2 = [[User alloc]initWithName:@"bai" pass:@"563"];
        //对user2对象使用谓词判断
        BOOL result2 = [pred evaluateWithObject:user2];
        NSLog(@"user2的name是否以s开头 : %d",result2);
        
        
        // 使用谓词过滤集合
        NSMutableArray* array = [NSMutableArray arrayWithObjects:
                                 [NSNumber numberWithInt:50],
                                 [NSNumber numberWithInt:42],
                                 [NSNumber numberWithInt:20],
                                 [NSNumber numberWithInt:64],
                                 [NSNumber numberWithInt:56],
                                 nil];
        //创建谓词 要求过滤后只剩下大于50的集合元素
        NSPredicate* pred1 = [NSPredicate predicateWithFormat:
                              @"SELF > 50"];
        [array filterUsingPredicate:pred1];
        NSLog(@"值大于50的元素: %@",array);
        //创建一个NSSet集合
        NSSet* set = [NSSet setWithObjects:
                      [[User alloc] initWithName:@"孙二狗" pass:@"4567"],
                      [[User alloc] initWithName:@"银他妈" pass:@"5678"],
                      [[User alloc] initWithName:@"猪八戒" pass:@"5142"],
                      [[User alloc] initWithName:@"金三角" pass:@"6790"],
                      [[User alloc] initWithName:@"金三胖" pass:@"69g1"],
                      nil];
        NSPredicate* pred2 = [NSPredicate predicateWithFormat:@"name CONTAINS '金'"];
        //使用谓词对set集合进行过滤
        NSSet* newSet = [set filteredSetUsingPredicate:pred2];
        NSLog(@"name包含金的 : %@",newSet);
        
        //在谓词中使用占位符
    }
    return 0;
}
