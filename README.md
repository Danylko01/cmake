#构建项目,到xlog文件夹下
cmake -S . -B build

#编译(debug)
cmake --build build --config Debug

#安装
cmake --install build --config Debug --prefix=out
