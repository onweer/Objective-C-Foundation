//
//  Person.h
//  Objective-C-Foundation
//
//  Created by SpiColorPendra on 16/1/20.
//  Copyright © 2016年 SpiColorPendra. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject
//  使用HashSet来存储Person这种对象 需要重写HashCode方法!!!!!!!!!!!!
@property (nonatomic,copy) NSString* name;
@property (nonatomic,copy) NSString* pass;

- (instancetype)initWithName:(NSString*)aname pass:(NSString*)aPass;
- (void) say:(NSString*) content;
- (NSUInteger) hash;
@end
