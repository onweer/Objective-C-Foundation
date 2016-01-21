//
//  main.m
//  谓词表达式的语法
//
//  Created by SpiColorPendra on 16/1/21.
//  Copyright © 2016年 SpiColorPendra. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // 谓词表达式由表达式、运算符和值组成   表达式的值必须返回一个BOOL
        /*
         1.基本的比较运算符
         = 、 == 判断两个表达式是否相等
         >= 、 => ...
         <= 、 =< ...
         > ...
         < ...
         != 、 <>...判断两个表达式是否不相等
         BETWEEN:BETWEEN 必须满足 表达式 BETWEEN{下限，上限}的格式  要求值必须大于或等于下限 小于或等于上限
         
         2.基本逻辑运算符
         AND、&&   逻辑与
         OR 、 ||
         NOT 、 !
         
         3.字符串比较运算符
         BEGINSWITH : //检查字符串是否以指定的子串开头
         ENDSWITH: ...是否以指定的子串结尾
         CONTAINS: ...是否包含指定子串
         LIKE: 检查字符串是否匹配自定模板 允许使用 *和?两个通配符   *代表任意多个字符  ?代表一个字符  eg: name LIKE *金* 
         、  pass LIKE ??3456  这要求3456前面必须有两个字符
         MATCHES: 检查某个字符串是否匹配指定的正则表达式 正则表达式执行效率较低 能用前面的代替尽量用前面的  
         说明: 默认区分大小写和重音符号   如果想不区分大小写使用[c]  不区分重音符号[d]  eg: name BEGINSWITH[cd] 'java'
         
         4.操作集合运算符
         ANY、SOME 指定只要集合中任意一个元素满足条件 即可返回YES  eg: ANY childen.age < 18
         ALL ...全部满足
         NONE 没有任何元素满足 才返回YES
         IN: 只有当左边表达式或值出现在右边的集合中才会返回YES
         array[index]: 返回array数组中index处的索引
         array[FIRST]: ...
         array[LAST]: ...
         array[SIZE] 
         
         5.直接量
         在谓词表达式中 双引号和单引号是相同的作用  ，但单引号只能以单引号结束 同理双引号
         FALSE、NO : 代表逻辑假
         TRUE、YES: 真
         NULL、NIL: 代表空
         SELF : 代表正在判断对象本身
         "text" 或 'text' :代表字符串
         数组:数组元素以引英文逗号隔开 : eg:{'commma','separted',literal',array'}
         直接量包含整数、小数、科学计数法表达形式: 1、27、2.123、-51.2、9.2e-5
         十六进制数: 0x开头
         八进制数: 0o开头
         二进制数: 0b开头
         
         6.保留字  
          AND、OR、IN .. 还有很多
         
    }
    return 0;
}
