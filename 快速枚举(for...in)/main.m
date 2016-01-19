//
//  main.m
//  快速枚举(for...in)
//
//  Created by SpiColorPendra on 16/1/19.
//  Copyright © 2016年 SpiColorPendra. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        //快速枚举语法格式:
        //for (type variableName in Collection){ //自动迭代每个访问元素}
        NSArray* array = [NSArray arrayWithContentsOfFile:
                          @"myFile.txt"];
        for (id a in array) {
            NSLog(@"%@",a);
        }
    }
    return 0;
}
