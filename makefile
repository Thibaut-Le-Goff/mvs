# Define the Fortran compiler
FC = gfortran

# Define compiler flags
FFLAGS = -Wall -Wextra -O2 -fimplicit-none -fcheck=all -pedantic -Werror -Wconversion -fbacktrace

# Source and build directories
SRCDIR := src
BINDIR := bin
OBJDIR := $(BINDIR)/obj

# Find all source files in the project
SRC := $(wildcard $(SRCDIR)/**/*.f95)
OBJ := $(patsubst $(SRCDIR)/%, $(OBJDIR)/%, $(SRC:.f95=.o))

# Define the executable
EXEC = $(BINDIR)/main

# Default target
all: $(EXEC)

# Rule to create the executable
$(EXEC): $(OBJ)
	@mkdir -p $(BINDIR)
	$(FC) $(FFLAGS) -o $@ $^

# Rule to compile source files into object files
$(OBJDIR)/%.o: $(SRCDIR)/%.f95
	@mkdir -p $(dir $@)
	$(FC) $(FFLAGS) -c $< -o $@

# Rule to clean the build
clean:
	rm -rf $(OBJDIR) $(BINDIR)

# Rule to run with Valgrind
valgrind: FFLAGS += -g
valgrind: $(EXEC)
	valgrind --leak-check=full --show-leak-kinds=all ./$<

# Rule to run without Valgrind
run: $(EXEC)
	./$(EXEC)

.PHONY: all clean valgrind run

