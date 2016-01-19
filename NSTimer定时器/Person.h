//
//  Person.h
//  Objective-C-Foundation
//
//  Created by SpiColorPendra on 16/1/19.
//  Copyright © 2016年 SpiColorPendra. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject
@property(nonatomic) int age;
@property(nonatomic) NSString* name;

- (id)initWithName :(NSString*)name andAge:(int)age;
-(NSTimer*)returnTimer;
-(void)info:(NSTimer*)timer;
@end
