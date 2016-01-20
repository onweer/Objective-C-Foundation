//
//  main.m
//  NSCountedSet
//
//  Created by SpiColorPendra on 16/1/20.
//  Copyright © 2016年 SpiColorPendra. All rights reserved.
//

#import <Foundation/Foundation.h>
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
        // NSCountedSet 是 NSMutableSet的子类 与NSMutableSet不同的是，当程序向NSCountedSet添加元素的时候
        // NSCountedSet为每个元素额外维护一个添加次数状态  添加次数标记为1  如果再次添加该元素 虽然不会接纳这个元素
        // 但是 次数标记会 +1
        // 并且只有当添加次数变为0时，这个元素才真正从NSCountedSet中移除
        
        // method: countForObject 指定元素的添加次数
        NSCountedSet* cSet = [NSCountedSet setWithObjects:
                            @"Android",
                            @"iOS",
                            @"Ajax",
                            @"Android",
                            @"XML",
                            @"Android",
                            @"iOS",
                            nil];
        [cSet addObject:@"iOS"];
        //输出元素集合
        NSLog(@"%@",NSCollectionToString(cSet));
        //[Android,XML,iOS,Ajax]
        //获取指定元素的添加次数
        NSLog(@"iOS的添加次数为 %ld",[cSet countForObject:@"iOS"]);
        //iOS的添加次数为 3
        // 删除元素
        [cSet removeObject:@"iOS"];
        NSLog(@"删除iOS一次后 : %@  iOS的count为 : %ld",NSCollectionToString(cSet)
              ,[cSet countForObject:@"iOS"]);
        // 删除iOS一次后 : [Android,XML,iOS,Ajax]  iOS的count为 : 2
        // 继续删除iOS两次
        [cSet removeObject:@"iOS"];
        [cSet removeObject:@"iOS"];
        NSLog(@"%@",NSCollectionToString(cSet));
        //[Android,XML,Ajax]
        NSLog(@"iOS的添加次数为 %ld",[cSet countForObject:@"iOS"]);
        //iOS的添加次数为 0


    }
    return 0;
}
