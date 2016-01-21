//
//  main.m
//  对NSDictionary排序
//
//  Created by SpiColorPendra on 16/1/20.
//  Copyright © 2016年 SpiColorPendra. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSDictionary.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // NSDictionary
        NSDictionary* dict = [NSDictionary dictionaryWithObjectsAndKeys:
                              @"Objective-C",@"one",
                              @"Ruby",@"two",
                              @"Python",@"three",
                              @"Perl",@"four",
                              nil];
        //打印dict集合的所有元素
        [dict print];
        //获取所有直接调用value的compare:方法对所有的key进行排序
        //返回排好序的所有key组成NSArray
        NSArray* keyArr1 = [dict keysSortedByValueUsingSelector:
                            @selector(compare:)];
        NSLog(@"%@",keyArr1);
        
        NSArray* keyArr2 = [dict keysSortedByValueUsingComparator:
                            ^(id value1 , id value2){
                            //下面定义比较大小的标准: 字符串越长，即可认为value越大
                                if ([value1 length] > [value2 length]) {
                                    return NSOrderedDescending;
                                }else if([value1 length] < [value2 length]){
                                    return NSOrderedAscending;
                                }else{
                                    return NSOrderedSame;
                                }
                            }];
        NSLog(@"%@",keyArr2);
        //将NSDictionary的内容输出到指定文件中
        [dict writeToFile:@"/Users/spicolorpendra/Documents/Objective-C-Foundation/对NSDictionary排序/myFile.txt" atomically:YES];
        /*
         <?xml version="1.0" encoding="UTF-8"?>
         <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
         <plist version="1.0">
         <dict>
         <key>four</key>
         <string>Perl</string>
         <key>one</key>
         <string>Objective-C</string>
         <key>three</key>
         <string>Python</string>
         <key>two</key>
         <string>Ruby</string>
         </dict>
         </plist>

         */
        
        // 对NSDictionary的key进行过滤
        NSDictionary* dict2 = [NSDictionary dictionaryWithObjectsAndKeys:
                               [NSNumber numberWithInt:89],@"Objective-C",
                               [NSNumber numberWithInt:69],@"Ruby",
                               [NSNumber numberWithInt:75],@"Python",
                               [NSNumber numberWithInt:109],@"Perl",
                               nil];
        [dict2 print];
        //对NSDictionary的所有key进行过滤
        NSSet* keyset = [dict2 keysOfEntriesPassingTest:
                         ^(id key , id value , BOOL *stop){
                         //当value的值大于80的时候，才返回YES
                             return (BOOL)([value intValue] > 80);
                         }];
        NSLog(@"%@",keyset);
        
    }
    return 0;
}
