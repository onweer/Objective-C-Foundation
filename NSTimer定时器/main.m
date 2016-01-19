//
//  main.m
//  NSTimer定时器
//
//  Created by SpiColorPendra on 16/1/19.
//  Copyright © 2016年 SpiColorPendra. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Person *p = [[Person alloc]initWithName:@"小明" andAge:5];
        [p info:[p returnTimer]];
  
    }
    return 0;
}
