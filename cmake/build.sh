#!/bin/bash

# 设置项目名称（可选，用于在输出中显示）
PROJECT_NAME="LeetCode130"

# 清理旧的构建文件
echo "Cleaning old build files..."
rm -rf CMakeCache.txt CMakeFiles/
rm -f ${PROJECT_NAME}  # 假设可执行文件与项目名称相同

# 检查CMake是否安装
if ! command -v cmake &> /dev/null; then
    echo "CMake could not be found. Please install CMake before running this script."
    exit 1
fi

# 运行CMake生成构建文件
echo "Running CMake to generate build files..."
cmake .

# 检查CMake是否成功
if [ $? -ne 0 ]; then
    echo "CMake configuration failed. Please check your CMakeLists.txt file."
    exit 1
fi

# 编译项目
echo "Compiling project..."
make

# 检查编译是否成功
if [ $? -ne 0 ]; then
    echo "Compilation failed. Please check your source code."
    exit 1
fi

# 成功消息
echo "Project ${PROJECT_NAME} compiled successfully!"

# 可选：运行可执行文件
# ./${PROJECT_NAME}