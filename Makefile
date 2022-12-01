lib_path ?= lib
lib_src = add.c div.c mul.c sub.c
include_path = include

build: $(lib_path)/libmath.so
	# -I : 指定头文件的位置
	# -L : 指定链接库的位置
	# -l : 指定链接库的名称
	gcc src/main.c -I $(include_path) -L lib -l math -o main


# addprefix : 添加前缀函数
$(lib_path)/libmath.so: $(addprefix lib-src/,$(lib_src))
	# -fPIC : Generate position-independent code if possible
	#  $^ : 依赖文件
	#  $@ : 目标文件
	gcc -fPIC -shared $^ -o $@

run:
	./main

.PHONY : clean
clean :
	-rm -f main && rm -f lib/libmath.so
