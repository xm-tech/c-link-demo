lib_path ?= lib
lib_src = add.c div.c mul.c sub.c
include_path = include
object_file=$(lib_path)/libmath.so

build: $(object_file)
	# -I : 指定头文件的位置
	# -L : 指定链接库的位置
	# -l : 指定链接库的名称, will find: libmath.so
	gcc src/main.c -I $(include_path) -L $(lib_path) -l math -o main

# addprefix : 添加前缀函数
$(object_file): $(addprefix lib-src/,$(lib_src))
	# -g : 以操作系统本地格式生成调试信息, GNU 调试器可利用该信息。
	# -O2 : 指定编译优化等级为 O2
	# -Wall : 生成调试信息
	# -fPIC : Generate position-independent code if possible
	# -shared : 指定生成动态链接库
	# $^ : 依赖文件
	# $@ : 目标文件
	gcc -g -O2 -Wall -fPIC -shared $^ -o $@

run:
	./main

.PHONY : clean
clean :
	-rm -f main && rm -f $(object_file) && rm -rf $(lib_path)/*.dSYM
