LIB_PATH ?= lib
LIB_SRC = add.c div.c mul.c sub.c
INCLUDE_PATH = include
OBJECT_FILE=$(LIB_PATH)/libmath.so

CC = gcc

MYCFLAGS = -std=c99
# -g : 以操作系统本地格式生成调试信息, GNU 调试器可利用该信息。
# -O2 : 指定编译优化等级为 O2
# -Wall : 生成调试信息
# -fPIC : Generate position-independent code if possible
# -shared : 指定生成动态链接库
CFLAGS = -g -O2 -Wall $(MYCFLAGS) -fPIC -shared


build: $(OBJECT_FILE)
	# -I : 指定头文件的位置
	# -L : 指定链接库的位置
	# -l : 指定链接库的名称, will find: libmath.so
	$(CC) src/main.c -I $(INCLUDE_PATH) -L $(LIB_PATH) -l math -o main

# addprefix : 添加前缀函数
$(OBJECT_FILE): $(addprefix lib-src/,$(LIB_SRC))
	# $^ : 依赖文件
	# $@ : 目标文件
	$(CC) $(CFLAGS) $^ -o $@

run:
	./main

.PHONY : clean
clean :
	-rm -f main && rm -f $(OBJECT_FILE) && rm -rf $(LIB_PATH)/*.dSYM
