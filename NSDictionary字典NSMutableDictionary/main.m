//
//  main.m
//  NSDictionary字典NSMutableDictionary
//
//  Created by SpiColorPendra on 16/1/20.
//  Copyright © 2016年 SpiColorPendra. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "User.h"
#import "NSDictionary.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // 前面说了NSDictionary是保存具有映射关系的对象   其实就是Java的Map<K,V> = =。还取个名字叫字典 我也是醉了
        // 所以NSDictionary保存着两组值 一组用于保存NSDictionary里的key  一组用于保存NSDictionary里的value
        //  key 和 value 可以是任何类型  但是key不允许重复
        // key 和 value之间存在单向一对一关系 通过指定的key 总能找到唯一的 确定的value
        // 从NSDictionary中取出数据的时候，只要给指定的key  就能取出对应的value
        // 如果把NSDictionary所有的key都放在一起 它们就组成了Set集合
        //  allKeys方法用于返回所有key组成的集合,但是这个方法的返回值是 NSArray对象，所以底层应该处理了这个对象把NSSet转换成了NSArray
        
        // 直接使用多个value ， key 来创建NSDictionary对象
        NSDictionary* dict = [NSDictionary dictionaryWithObjectsAndKeys:
                              [[User alloc] initWithName:@"sun" pass:@"123"],@"one",
                              [[User alloc] initWithName:@"bai" pass:@"345"],@"tow",
                              [[User alloc] initWithName:@"sun" pass:@"123"],@"three",
                              [[User alloc] initWithName:@"tang" pass:@"178"],@"four",
                              [[User alloc] initWithName:@"niu" pass:@"155"],@"five",
                              nil];
        [dict print];
        /*
         {one=<User[name = sun, pass = 123]>, five=<User[name = niu, pass = 155]>, tow=<User[name = bai, pass = 345]>, three=<User[name = sun, pass = 123]>, four=<User[name = tang, pass = 178]>}
         */
        NSLog(@"dict包含%ld个key-value对",[dict count]);
        NSLog(@"dict的所有key为: %@",[dict allKeys]);
        NSLog(@"<User[name=sun,pass=123]>对应的所有key为:%@"
              ,[dict allKeysForObject:
                [[User alloc] initWithName:@"sun"
                                      pass:@"123"]]);
        //遍历dict所有的value枚举器
        NSEnumerator* en = [dict objectEnumerator];
        NSObject* value;
        //使用枚举器来遍历dict中所有的value
        while (value = [en nextObject]) {
            NSLog(@"%@",value);
        }
        //使用指定代码块来迭代该集合中所有的key-value对
        [dict enumerateKeysAndObjectsUsingBlock:
         //该集合包含多个key-value对 下面的代码块就执行相应的操作
         ^(id key,id value,BOOL *stop)
         {
             NSLog(@"%@ - %@",key,[value description]);
             [value say:@"OK,这就是NSDictionary的使用"];
         }];
        
    }
    return 0;
}
