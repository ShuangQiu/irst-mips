#!/bin/sh
find . -name '*.py' \
-o -name '*.java' \
-o -iname '*.[CH]' \
-o -name '*.cpp' \
-o -name '*.cc' \
-o -name '*.hpp'  \
-o -name '*.v'  \
> cscope.files

# -b: just build
# -q: create inverted index
cscope -b -q
ctags -R
