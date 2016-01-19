//
//  main.m
//  copy和mutableCopy方法
//
//  Created by SpiColorPendra on 16/1/19.
//  Copyright © 2016年 SpiColorPendra. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
       // copy复制对象，使复制的对象不可修改  mutableCopy复制对象，使复制的对象可修改
        //使用mutableCopy
        NSString* str = [NSString stringWithFormat:@"abcdefg"];
        NSMutableString* strCopy = [str mutableCopy];
        [strCopy appendString:@"---gfedcba"];
        NSLog(@"str = %@ , strCopy = %@",str,strCopy);
        //使用copy
        NSMutableString* book = [NSMutableString stringWithFormat:@"<iOS高级技术编程>"];
        NSMutableString* bookCopy = [book copy];
        //*** Terminating app due to uncaught exception 'NSInvalidArgumentException', reason: 'Attempt to mutate immutable object with replaceCharactersInRange:withString:'
        [bookCopy replaceCharactersInRange:
                                NSMakeRange(2, 3)
                                withString:@"<Android>"];
        NSLog(@"book = %@ , bookCopy = %@",book,bookCopy);
        
    }
    return 0;
}
