//
//  Person.m
//  Objective-C-Foundation
//
//  Created by SpiColorPendra on 16/1/19.
//  Copyright © 2016年 SpiColorPendra. All rights reserved.
//

#import "Person.h"

@implementation Person
int count;
- (id)initWithName :(NSString*)name andAge:(int)age{

    if (self = [super init]) {
        self.name = name;
        self.age = age;
    }
    return self;
}

-(void)info:(NSTimer*)timer
{
    NSLog(@"正在执行%d次任务",count++);
    NSLog(@"name = %@ , age = %d",self.name,self.age);
    if(count > 10){
        NSLog(@"取消定时器");
        [timer invalidate];
    }
}
-(void)info{
    NSLog(@"正在执行%d次任务",count++);
    NSLog(@"name = %@ , age = %d",self.name,self.age);
    if(count > 10){
        NSLog(@"取消定时器");
    }

}

-(NSTimer*)returnTimer
{
    // 启动定时器
    return [NSTimer scheduledTimerWithTimeInterval:0.5 //每次间隔
                                     target:self  //指定当前对象的info:方法作为执行任务
                                   selector:@selector(info:)  //指定某个对象的特点方法作为重复执行的任务
                                   userInfo:nil   //用于传入额外附加信息
                                    repeats:YES];  //是否重复执行任务
    
}

@end
