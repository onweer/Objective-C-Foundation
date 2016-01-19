//
//  main.m
//  可变字符串
//
//  Created by SpiColorPendra on 16/1/19.
//  Copyright © 2016年 SpiColorPendra. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // NSString是不可变的，一旦创建是不可改变的 ，只能等到这个对象被销毁
        // NSMutableString 对象则代表一个字符序列可变的字符串，而且NSMutableStringNSString的子类
        NSString* book = @"<iOS高级技术>";
        //创建NSMutableString
        NSMutableString* str = [NSMutableString stringWithFormat:@"%@",book];
        //追加字符串
        NSLog(@"address = %p",str);
        [str appendString:@"iOS开发!"];
        NSLog(@"%@",str);
        NSLog(@"address = %p",str);
        //可以看到地址没发生变化
        [str appendFormat:@"%@是一本不错的书",book ];
        NSLog(@"%@",str);
        NSLog(@"address = %p",str);
        
        //插入字符
        [str insertString:@"****" atIndex:5];
        NSLog(@"%@",str);
        //删除字符  从第五个位置开始删除4个
        [str deleteCharactersInRange:NSMakeRange(5, 4)];
        NSLog(@"%@",str);
        
        // 替换字符  从4开始长度为5的字符全部替换为----
        [str replaceCharactersInRange:NSMakeRange(4, 5) withString:@"---->"];
        NSLog(@"%@",str);
        
        
    }
    return 0;
}
