//
//  main.m
//  NSArray的KVC和KVO
//
//  Created by SpiColorPendra on 16/1/20.
//  Copyright © 2016年 SpiColorPendra. All rights reserved.
//

#import <Foundation/Foundation.h>
//定义一个函数，该函数用于把NSArray集合转换为字符串
#import "User.h"
NSString* NSCollectionToString(NSArray* array)
{
    NSMutableString* result = [NSMutableString stringWithFormat:@"["];
    for (id obj in array) {
        [result appendFormat:[obj description]];
        [result appendFormat:@","];
    }
    NSUInteger len = [result length];//获取字符串长度
    //去掉字符串最后两个字符
    [result deleteCharactersInRange:NSMakeRange(len - 2, 2)];
    [result appendString:@"]"];
    return result;
}


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSArray* array = [NSArray arrayWithObjects:
                          [[User alloc] initWithName:@"sun" pass:@"123"],
                          [[User alloc] initWithName:@"bai" pass:@"345"],
                          [[User alloc] initWithName:@"zhu" pass:@"654"],
                          [[User alloc] initWithName:@"tang" pass:@"178"],
                          [[User alloc] initWithName:@"niu" pass:@"155"],
                          nil];
        //将所有元素的name组成新的集合
        id newArr = [array valueForKey:@"name"];
        NSLog(@"%@",NSCollectionToString(newArr));
        //对集合中所有的元素进行排序
        //将多有集合的元素的name属性改为新名字
        for (id object in array) {
            [object setValue:[NSString stringWithFormat:@"NEWNAME + %d",[array indexOfObject:object] ] forKey:@"name"];
        }
        NSLog(@"%@",NSCollectionToString(array));
        
        
        
    }
    return 0;
}
