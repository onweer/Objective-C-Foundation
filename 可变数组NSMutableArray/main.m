//
//  main.m
//  可变数组NSMutableArray
//
//  Created by SpiColorPendra on 16/1/19.
//  Copyright © 2016年 SpiColorPendra. All rights reserved.
//

#import <Foundation/Foundation.h>
//定义一个函数，该函数用于把NSArray集合转换为字符串
NSString* NSCollectionToString(NSArray* array)
{
    NSMutableString* result = [NSMutableString stringWithFormat:@"["];
    for (id obj in array) {
        [result appendFormat:[obj description]];
        [result appendFormat:@","];
    }
    NSUInteger len = [result length];//获取字符串长度
    //去掉字符串最后两个字符
    [result deleteCharactersInRange:NSMakeRange(len - 2, 2)];
    [result appendString:@"]"];
    return result;
}


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // NSArray是不可变的集合，一旦NSArray创建成功 程序就不能向集合中添加元素，不能删除元素，也不能替换元素
        // 但是NSArray只是保存对象的指针，因此，NSArray只保证这些指针变量中的地址不能改变，不能保证地址指向的对象不能改变
        // NSArray有一个子类 NSMutableArray，它可变 可加 可删 可替换
        // .. NSMutableArray增加了如 add remove replace sort开头的方法
        // NSMutableArray 也有 sortUsingSelector、sortUsingComparator、sortUsingFunction:context:这三个方法
        // 这三个方法与NSArray类似，区别是：返回的是 集合本身  而NSArray返回的是新的序列
        
        NSMutableArray *array = [NSMutableArray arrayWithContentsOfFile:
                                 @"myFile.txt"];
        [array addObject:@"iOS"]; //向元素最后添加一个元素
        NSLog(@"最后追加一个元素后: %@",NSCollectionToString(array));
        //使用NSArray向集合尾部添加多个元素
        [array addObjectsFromArray:[NSArray
                                   arrayWithObjects:@"关于",@"赵子龙", nil]];
        NSLog(@"最后追加一个NSArray后 : %@",NSCollectionToString(array));
        //向指定位置添加插入一个元素
        [array insertObject:@"Ajax" atIndex:2];
        NSLog(@"在索引为2处添加一个元素后: %@",NSCollectionToString(array));
        //使用NSArray向集合指定位置插入多个元素!
        [array insertObjects:[NSArray
                              arrayWithObjects:@"赵本山",@"周杰伦", nil]
                   atIndexes:[NSIndexSet indexSetWithIndexesInRange:
                         NSMakeRange(3, 2)]];
        NSLog(@"插入多个元素后: %@",NSCollectionToString(array));
        [array removeLastObject]; //删除最后一个元素
        NSLog(@"删除最后一个元素后 %@",NSCollectionToString(array));
        [array removeObjectAtIndex:5]; //删除集合中指定索引处的元素
        NSLog(@"删除索引为5的元素后 %@",NSCollectionToString(array));
        [array removeObjectsInRange:NSMakeRange(2, 3)]; //删除索引为2~5的元素
        NSLog(@"删除索引处2~5的元素后 %@",NSCollectionToString(array));
        //替换索引处为2的元素
        [array replaceObjectAtIndex:2 withObject:@"Android"];
        NSLog(@"替换索引为2处的元素后 %@",NSCollectionToString(array));
    }
    return 0;
}
