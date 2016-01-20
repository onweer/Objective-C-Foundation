//
//  main.m
//  NSSet和NSMutableSet
//
//  Created by SpiColorPendra on 16/1/20.
//  Copyright © 2016年 SpiColorPendra. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"
//定义一个函数 该函数用来把NSSet集合转换成字符串
NSString* NSCollectionToString(id collection)
{
    NSMutableString* result = [NSMutableString stringWithFormat:
                                @"["];
    //使用快速迭代遍历NSSet集合
    for (id object in collection) {
        [result appendString:[object description]];
        [result appendString:@","];
    }
    //获取字符串长度
    NSUInteger len = [result length];
    //去掉字符串最后两个字符
    [result deleteCharactersInRange:NSMakeRange(len - 1, 1)];
    [result appendString:@"]"];
    return result;
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // NSSet是一个广泛的集合，NSSet按照Hash算法来存储集合中的元素,因此具有很好的存取和查找功能
        // NSSet不能保持添加的顺序 NSSet没有索引 不能根据索引来查找元素
        // NSSet和NSArray相似之处:
        // 都可以通过count方法来获取集合元素的数量
        // 都可以通过快速枚举来遍历集合
        // 通过objectEnumerator方法获取NSEnumerator枚举器对集合元素进行遍历，由于NSSet集合本身无序，因此提供反向迭代器没有意义
        // 都提供了makeObjectsPerformSelector: makeObjectsPerformSelector:withObject:方法对集合元素整体调用方法
        // 以及 enumerateObjectsUsingBlock、enumerateObjectsWithOptions:usingBlock 对集合整体或者或部分元素迭代执行代码块
        // 都提供了 valueForKey: 和 setValue:ForKey:方法对集合元素整体进行KVC编程
        // 都提供了集合的所有元素和部分元素进行KVO编程的方法
        
        // setByAddingObject:  setByAddingObjectsFromSet:    allObjects:    anyObject:
        // 注意： anyObject: 返回该集合中的某个元素 该返回的元素是不确定的，但是！该方法并不能保证随机返回元素集合
        //       也就是说NSSet只要没有发生改变，无论多少次调用该方法，返回的总是同一个元素
        // containsObjects: 判断是否包含指定元素
        // member: 判断该集合是否包含与该参数相等的元素,包含返回相等元素 否则nil
        // objectsPassingTest: 需要传入一个代码块对集合元素进行过滤 满足该代码块条件的集合元素留下来组成一个新的集合作为返回值
        // objectsWithOption:passingTest: 与前一个类似 只是可以额外地传入一个NSENumerationOptions
        
        //初始化NSSet
        //估计传入两个相等的元素 NSSet会删除一个元素
        NSSet* set1 = [NSSet setWithObjects:
                      @"iOS",
                      @"Android",
                      @"Ajax",
                      @"XML",
                      @"iOS",
                      nil];
        //程序输出set1集合
        NSLog(@"set1集合元素个数 : %ld",[set1 count]) ;
        NSLog(@"s1集合 : %@",NSCollectionToString(set1));
        //NSSet set2
        NSSet* set2 = [NSSet setWithObjects:
                       @"孙悟饭",
                       @"孙悟天",
                       @"孙悟空",
                       @"Android"
                       , nil];
        NSLog(@"set2集合 : %@",NSCollectionToString(set2));
        //向set1集合添加单个元素。将添加后的元素生成一个新集合赋给set1
        set1 = [set1 setByAddingObject:@"Python"];
        NSLog(@"set1集合添加元素后 : %@",NSCollectionToString(set1));
        //使用NSSet集合向set1集合中添加多个元素，相当于计算两个集合的并集
        NSSet* s = [set1 setByAddingObjectsFromSet:set2];
        NSLog(@"set1和set2的并集 : %@",NSCollectionToString(s));
        BOOL b = [set1 intersectsSet:set2]; //判断set1和set2是否有交集
        NSLog(@"set1和set2是否有交集 : %d",b); // 1
        BOOL bo = [set2 isSubsetOfSet:set1]; // 判断set2是否是set1的子集
        NSLog(@"set2是否是set1的子集 : %d",bo); //0
        //判断NSSer是否包含指定元素
        BOOL bb = [set1 containsObject:@"Ajax"];
        NSLog(@"set1是否包含Ajax : %d",bb); // 1
        NSLog(@"set1取出一个元素: %@",[set1 anyObject]);
        NSLog(@"set1取出一个元素: %@",[set1 anyObject]);
        //使用代码块进行集合元素的过滤
        NSSet* filteredSet = [set1 objectsPassingTest:
        ^(id obj, BOOL *stop)
        {
            return (BOOL)([obj length] > 4);
        }];
        NSLog(@"set1中元素长度大于4的集合元素有: %@",NSCollectionToString(filteredSet));
        // NSSet底层工作流程:
        //  1.对传入的对象调用Hash方法来得到该对象的HashCode值,根据HashCode值决定对象在底层Hash表中存储的位置
        //  2.如果根据HashCode计算出来该元素在底层表中存储位置已经不相同，那么系统自然将它们存在不同的位置
        //  3.如果两个元素的hashCode相同，接下来就要通过isEqual:方法判断两个元素是否相等，如果两个元素通过isEqual:方法返回NO
        //  NSSet依然认为它们不相等  NSSet会把它们都存在底层表的同一个位置,只是将在这个位置形成链 如果它们通过isEqual:比较返回的YES，那么这两个元素相等，后面的元素添加失败
        
        // 重写Hash方法
        NSLog(@"********分割线*********");
        NSSet* set = [NSSet setWithObjects:
                      [[Person alloc] initWithName:@"zhu" pass:@"123"],
                      [[Person alloc] initWithName:@"fan" pass:@"456"],
                      [[Person alloc] initWithName:@"zhao" pass:@"124"],
                      [[Person alloc] initWithName:@"zhu" pass:@"124"],
                      [[Person alloc] initWithName:@"fan" pass:@"456"],//与第三个相同
                      nil];
        NSLog(@"set中集合元素 %ld 个",[set count]);
        NSLog(@"%@",NSCollectionToString(set));
    }
    return 0;
}
