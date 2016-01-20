//
//  main.m
//  有序集合NSOrderedSet NSMutableOrderedSet
//
//  Created by SpiColorPendra on 16/1/20.
//  Copyright © 2016年 SpiColorPendra. All rights reserved.
//

#import <Foundation/Foundation.h>
// 把NSArray或NSSet转换成字符串
NSString* NSCollectionToString(id collection)
{
    NSMutableString* result = [NSMutableString stringWithFormat:
                               @"["];
    //使用快速迭代遍历NSSet集合
    for (id object in collection) {
        [result appendString:[object description]];
        [result appendString:@","];
    }
    //获取字符串长度
    NSUInteger len = [result length];
    //去掉字符串最后两个字符
    [result deleteCharactersInRange:NSMakeRange(len - 1, 1)];
    [result appendString:@"]"];
    return result;
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // NSOrderedSet 与 NSMutableOrderedSet 是一个奇怪的集合 它既有NSSet集合的特征 也有NSArray类似的功能
       // NSOrderedSet不允许元素重复  这与NSSet集合相同
        // NSOrderedSet 可以保持元素添加的顺序，而且每个元素都有索引，可以根据索引来操作元素，这与NSArray类似
        
        
    // 创建NSOrderedSet集合，使用重复元素
        NSOrderedSet* set = [NSOrderedSet orderedSetWithObjects:
                             [NSNumber numberWithInt:40],
                             [NSNumber numberWithInt:-10],
                             [NSNumber numberWithInt:9],
                             [NSNumber numberWithInt:-55],
                             [NSNumber numberWithInt:9],
                             [NSNumber numberWithInt:17],
                             nil];
        NSLog(@"%@",NSCollectionToString(set));
        //[40,-10,9,-55,17]  根据添加的顺序来存储的数字 而且去掉了9这个重复的数字
        NSLog(@"set元素的第一个元素 %@",[set firstObject]);
        NSLog(@"set元素的最后一个元素 %@",[set lastObject]);
        //获取指定索引处的元素
        NSLog(@"set元素在索引 = 2 处的元素 %@",[set objectAtIndex:2]);
        NSLog(@"-55元素在 set集合中的索引 : %ld",[set indexOfObject:[NSNumber numberWithInt:-55]]);
        //对元素进行过滤  大于8的元素保留
        NSIndexSet* indexSet = [set indexesOfObjectsPassingTest:
                                 ^(id obj, NSUInteger idx,BOOL *stop){
                                     return (BOOL)([obj intValue] > 8);
                                 }];
        NSLog(@"set集合中大于8的元素的索引是 :%@",indexSet);
        //set集合中大于20的元素的索引是 :<NSIndexSet: 0x10010ac20>[number of indexes: 3 (in 3 ranges), indexes: (0 2 4)]

    }
    return 0;
}
