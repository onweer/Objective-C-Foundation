//
//  User.m
//  Objective-C-Foundation
//
//  Created by SpiColorPendra on 16/1/19.
//  Copyright © 2016年 SpiColorPendra. All rights reserved.
//

#import "User.h"

@implementation User

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
@end
