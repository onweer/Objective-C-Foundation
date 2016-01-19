//
//  main.m
//  使用枚举遍历NSArray集合元素
//
//  Created by SpiColorPendra on 16/1/19.
//  Copyright © 2016年 SpiColorPendra. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        //对于NSArray对象，除了可以根据集合的元素的索引来遍历集合元素之外，还可以调用NSArray对象的如下两个方法
        // 来返回枚举器
        // objectEnumerator: 返回NSArray集合的顺序枚举器
        // reverseObjectEnumerator: 返回NSArray集合的逆序枚举器
        // 枚举器有两个方法:
        // allObjects : 获取枚举集合中的所有元素
        // nextObject : 获取被枚举集合中的下一个元素
        
        //使用NSEnumerator遍历集合元素
        
        //读取前面写入磁盘的文件，用文件内容来初始化NSArray集合
        NSArray* array = [NSArray arrayWithContentsOfFile:
                          @"myFIle.txt"];
        //获取NSArray的顺序枚举器
        NSEnumerator* en = [array objectEnumerator];
        id object;
        while (object = [en nextObject]) {
            NSLog(@"%@",object);
        }
        NSLog(@"-----下面逆序遍历-----");
        //获取NSArray的逆序枚举器
        en = [array reverseObjectEnumerator];
        while (object = [en nextObject]) {
            NSLog(@"%@",object);
        }
        /*
         旺财
         林青霞
         贾宝玉
         -----下面逆序遍历-----
         贾宝玉
         林青霞
         旺财
         */
        
        
    }
    return 0;
}
