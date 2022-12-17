// 此处预处理指令的使用，可以防止调用代码失误多次包含该头文件时，函数被声明多次
// 自定义条件编译的宏名推荐为 文件名中'.'号替换为'_', 并多加1下划线后缀, 因为标准库中的该类字符
// 一般定义为 _STDIO_H_ 这样, 因此可以避免和标准库中的定义冲突
#ifndef MATH_H_
#define MATH_H_

int add(int a, int b);

int div(int a, int b);

int mul(int a, int b);

int sub(int a, int b);

#endif
