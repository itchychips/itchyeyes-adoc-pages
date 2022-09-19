= Autotools C++ Setup
COMMON_HEADER

NAVHOME_LINK

== Introduction

I want a good page to setup a baseline C++ project with autotools, as well as document various scenarios one what I need to run and when.

== Initial setup

[source,bash]
----
cat <<EOF>main.cpp
#include <iostream>

int main()
{
    std::cout << "Hello world!" << std::endl;
    return 0;
}
EOF

cat <<EOF>configure.ac
#                                               -*- Autoconf -*-
# Process this file with autoconf to produce a configure script.

AC_PREREQ([2.71])
AC_INIT([FULL-PACKAGE-NAME], [VERSION], [BUG-REPORT-ADDRESS])
AM_INIT_AUTOMAKE
AC_CONFIG_SRCDIR([main.cpp])
AC_CONFIG_HEADERS([config.h])

# Checks for programs.
AC_PROG_CXX

# Checks for libraries.

# Checks for header files.

# Checks for typedefs, structures, and compiler characteristics.

# Checks for library functions.

AC_CONFIG_FILES([Makefile])
AC_OUTPUT
EOF

cat <<EOF>Makefile.am
bin_PROGRAMS = main
main_SOURCES = main.cpp
main_CXXFLAGS = -std=c++20
EOF

cat <<EOF>.gitignore
*.exe
*.log
*.o
*.swp
.deps
Makefile
Makefile.in
aclocal.m4
autom4te.cache
build
config.h
config.h.in
config.status
configure
depcomp
install-sh
main
missing
stamp-h1
EOF

touch AUTHORS ChangeLog NEWS README
autoreconf --install
----

This produces a baseline skeleton that will compile, and will set git to ignore derived files.

== Other C++ setup

This is more setup on MinGW64.

[source,bash]
----
pip install cppman
#pip install termios # Hidden dependency
pacman -S mingw64/mingw-w64-x86_64-universal-ctags-git
----

Add to vimrc:

[source,vimrc]
----
call plug#begin('~/.vim/bundle')
	" ...
	Plug 'https://github.com/derekwyatt/vim-fswitch'
	" ...
call plug#end()

" ...

" C++ stuff

au BufEnter *.h  let b:fswitchdst = "c,cpp,cc,m"
au BufEnter *.cc let b:fswitchdst = "h,hpp"

" For files in different directories
au BufEnter *.h let b:fswitchdst = 'c,cpp,m,cc' | let b:fswitchlocs = 'reg:|include.*|src/**|'

set tags=./tags
let g:gutentags_ctags_exclude_wildignore = 1
let g:gutentags_ctags_exclude = [
  \'node_modules', '_build', 'build', 'CMakeFiles', '.mypy_cache', 'venv',
  \'*.md', '*.tex', '*.css', '*.html', '*.json', '*.xml', '*.xmls', '*.ui']
----
