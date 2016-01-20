//
//  Person.m
//  Objective-C-Foundation
//
//  Created by SpiColorPendra on 16/1/20.
//  Copyright © 2016年 SpiColorPendra. All rights reserved.
//

#import "Person.h"

@implementation Person
@synthesize name;
@synthesize pass;
- (id) initWithName:(NSString *)aname pass:(NSString *)aPass
{
    if (self = [super init]) {
        self.name = aname;
        self.pass = aPass;
        
    }
    return self;
    
}
- (void)say:(NSString *)content
{
    NSLog(@"%@说: %@",self.name,content);
}

- (NSString*) description
{
    return [NSString stringWithFormat:
            @"<User[name = %@, pass = %@]>"
            ,self.name,self.pass];
}
//重写HashCode方法
//如果两个的name pass相等 两个Person的Hash返回值相等
- (NSUInteger) hash
{
    NSLog(@"---Hash---   %@",[self class]);
    NSUInteger nameHash = name == nil ? 0 : [name hash];
    NSUInteger passHash = pass == nil ? 0 : [pass hash];
    return nameHash * 31 + passHash;
}
@end
