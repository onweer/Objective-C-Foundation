//
//  Dog.h
//  Objective-C-Foundation
//
//  Created by SpiColorPendra on 16/1/19.
//  Copyright © 2016年 SpiColorPendra. All rights reserved.
//

#import <Foundation/Foundation.h>

// 要实现copy mutableCopy 必须实现NSCopying协议
@interface Dog : NSObject <NSCopying>
@property NSString* name;
@property int age;
@end
