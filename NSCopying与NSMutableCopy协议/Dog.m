//
//  Dog.m
//  Objective-C-Foundation
//
//  Created by SpiColorPendra on 16/1/19.
//  Copyright © 2016年 SpiColorPendra. All rights reserved.
//

#import "Dog.h"

@implementation Dog
// 重写copyWithZone方法
-(id) copyWithZone:(NSZone *)zone
{
    NSLog(@"正在执行copyWithZone方法");
    Dog *d = [[[self class]allocWithZone:zone]init];
    d.name = self.name;
    d.age = self.age;
    return d;
}
@end
