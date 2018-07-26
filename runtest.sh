#!/bin/bash -x

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"

cd $DIR/include/dynamic

# The -g flag includes debugging information in the compiled program.

# The -fPIC flag stands for “Position Independent Code” generation,
# a requirement for shared libraries. Because it’s impossible to know where
# the shared library code will be, this flag allows the code to be located at 
# any virtual address at runtime.
# The -shared flag creates the shared library (shared libraries have the
# prefix lib and suffix .so [for shared object].
#
# To use the lib in program,
# gcc -g -wall -o prog prog.c libDynamic.so

mkdir -p $DIR/include/dynamic/bin/
rm -rf $DIR/include/dynamic/bin/*
gcc -g -fPIC -Wall -Werror -Wextra -pedantic *.c -shared -o $DIR/include/dynamic/bin/libDynamic.so
#cp $DIR/include/dynamic/*.h $DIR/include/dynamic/bin/


#static library, the actual code is extracted from the library by the linker
# and used to build the final executable at the point you 
# compile/build your application.
cd $DIR/include/static
mkdir -p $DIR/include/static/bin/
rm -rf $DIR/include/static/bin/*
gcc -g -fPIC -Wall -Werror -Wextra -pedantic -c *.c -o $DIR/include/static/bin/libStatic.o

#Create a archive from the output files for the static lib.
ar rcs $DIR/include/static/bin/libStatic.a $DIR/include/static/bin/*.o
#cp $DIR/include/static/*.h $DIR/include/static/bin/

#Must provide the path where the dynamic libs can be found.
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$DIR/include/dynamic/bin/
cd $DIR
go build
./GoWithClib
