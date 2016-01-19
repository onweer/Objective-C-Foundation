//
//  main.m
//  NSCopying与NSMutableCopy协议
//
//  Created by SpiColorPendra on 16/1/19.
//  Copyright © 2016年 SpiColorPendra. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Dog.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        //使用copy mutableCopy 虽然很方便，但是我们自己定义的对象却不能直接使用
        Dog* d = [[Dog alloc]init];
        d.name = @"旺财";
        d.age = 3;
        NSLog(@"d:name = %@ , age = %d",d.name,d.age);
        // d使用复制函数
        Dog *d2 = [d copy];
        NSLog(@"d2:name = %@ , age = %d",d2.name,d2.age);
        d2.name = @"gogo";
        d2.age = 4;
        //这里虽然是重写的copy方法，但是还是可以修改对象的成员变量
        // d使用copy来复制自身 ，底层实际是调用copyWithZone
        NSLog(@"d:name = %@ , age = %d",d.name,d.age);
        NSLog(@"d2:name = %@ , age = %d",d2.name,d2.age);
    }
    return 0;
}
