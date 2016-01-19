//
//  main.m
//  NSArray
//
//  Created by SpiColorPendra on 16/1/19.
//  Copyright © 2016年 SpiColorPendra. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // NSArray代表有序，可重复，集合中没个元素都有其对于的顺序索引
        // NSArray允许使用重复，第一次添加的索引是0 第二次是1
        NSArray *array = [NSArray arrayWithObjects:@"iOS",@"Android",@"XML",@"Ajax",@"Struts",nil];
        NSLog(@"第一个元素:%@",[array objectAtIndex:0]);
        NSLog(@"索引为1的元素:%@",[array objectAtIndex:1]);
        NSLog(@"最后一个元素:%@",[array lastObject]);
        //获取索引从2~5的元素组成新集合
        NSArray* array1 = [array objectsAtIndexes:[NSIndexSet
                                               indexSetWithIndexesInRange:NSMakeRange(2, 3)]];
        
        NSLog(@"%@",array1);
        //获取元素在集合中的位置
        NSLog(@"Android的位置为%ld",[array indexOfObject:@"Android"]);
        //h获取元素在集合指定范围内的位置
        NSLog(@"在2~4范围内Android的位置为%ld",[array indexOfObject:@"Android" inRange:NSMakeRange(2,3)]);
        //在2~4范围内Android的位置为    9223372036854775807   尝试返回的Android并未在这个位置上，9223372036854775807是常量NSNotFound的值
        
        //向数组最后追加一个元素
        //原Array数组本身并没有改变，只是将新返回的NSArray赋给array
        array = [array arrayByAddingObject:@"旺财"];
        //向array后面追加另一个数组
        //原Array数组本身并没有改变，只是将新返回的NSArray赋给array
        array = [array arrayByAddingObjectsFromArray:[NSArray arrayWithObjects:@"林青霞", @"贾宝玉",nil]];
        for (int i = 0; i<array.count; i++) {
            NSLog(@"%@",[array objectAtIndex:i]);
        }
        
        //获取array数组中索引为5~8的所有元素
        NSArray* array2 = [array subarrayWithRange:NSMakeRange(5, 3)];
        //将NSArray集合的元素写入文件
        [array2 writeToFile:@"/Users/spicolorpendra/Documents/Objective-C-Foundation/NSArray/myFile.txt" atomically:YES];
        /*
         <?xml version="1.0" encoding="UTF-8"?>
         <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
         <plist version="1.0">
         <array>
         <string>旺财</string>
         <string>林青霞</string>
         <string>贾宝玉</string>
         </array>
         </plist>
         */
        //写入文件的格式
        
        
    }
    return 0;
}
