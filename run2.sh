#!/bin/bash

# Define the directories
SRCDIR="src"
BINDIR="bin"
OBJDIR="$BINDIR/obj"
MODDIR="$BINDIR/mod"

# Define the Fortran compiler and flags
FC="gfortran"
FFLAGS="-Wall -Wextra -O2 -fimplicit-none -fcheck=all -pedantic -Werror -Wconversion -fbacktrace -J$MODDIR"

# Find all source files
SRC=$(find $SRCDIR -name '*.f90')

# Create the object and module directories
mkdir -p $OBJDIR
mkdir -p $MODDIR

# Compile the source files into object files
for file in $SRC; do
    objfile="$OBJDIR/$(basename ${file%.f90}.o)"
    $FC $FFLAGS -c $file -o $objfile
done

# Link the object files into the final executable
EXEC="$BINDIR/main"
mkdir -p $BINDIR
$FC $FFLAGS $(find $OBJDIR -name '*.o') -o $EXEC

# Run the executable
if [[ -f $EXEC ]]; then
    ./$EXEC
else
    echo "Build failed, executable not found."
fi

