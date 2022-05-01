# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.16

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/eryk/CSCI534/s22-final-project-atlas/aminoo

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/eryk/CSCI534/s22-final-project-atlas/aminoo

# Include any dependencies generated for this target.
include CMakeFiles/baxter-model.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/baxter-model.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/baxter-model.dir/flags.make

baxter-model.c:
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/eryk/CSCI534/s22-final-project-atlas/aminoo/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Generating baxter-model.c, baxter-model.c.h"
	aarxc package://baxter_description/urdf/baxter.urdf /home/eryk/CSCI534/s22-final-project-atlas/baxter-blocks/allowed-collision.robray /home/eryk/CSCI534/s22-final-project-atlas/jar-initial.robray -o baxter-model.c -n baxter

baxter-model.c.h: baxter-model.c
	@$(CMAKE_COMMAND) -E touch_nocreate baxter-model.c.h

CMakeFiles/baxter-model.dir/baxter-model.c.o: CMakeFiles/baxter-model.dir/flags.make
CMakeFiles/baxter-model.dir/baxter-model.c.o: baxter-model.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/eryk/CSCI534/s22-final-project-atlas/aminoo/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building C object CMakeFiles/baxter-model.dir/baxter-model.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/baxter-model.dir/baxter-model.c.o   -c /home/eryk/CSCI534/s22-final-project-atlas/aminoo/baxter-model.c

CMakeFiles/baxter-model.dir/baxter-model.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/baxter-model.dir/baxter-model.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/eryk/CSCI534/s22-final-project-atlas/aminoo/baxter-model.c > CMakeFiles/baxter-model.dir/baxter-model.c.i

CMakeFiles/baxter-model.dir/baxter-model.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/baxter-model.dir/baxter-model.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/eryk/CSCI534/s22-final-project-atlas/aminoo/baxter-model.c -o CMakeFiles/baxter-model.dir/baxter-model.c.s

# Object files for target baxter-model
baxter__model_OBJECTS = \
"CMakeFiles/baxter-model.dir/baxter-model.c.o"

# External object files for target baxter-model
baxter__model_EXTERNAL_OBJECTS =

libbaxter-model.so: CMakeFiles/baxter-model.dir/baxter-model.c.o
libbaxter-model.so: CMakeFiles/baxter-model.dir/build.make
libbaxter-model.so: CMakeFiles/baxter-model.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/eryk/CSCI534/s22-final-project-atlas/aminoo/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Linking C shared module libbaxter-model.so"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/baxter-model.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/baxter-model.dir/build: libbaxter-model.so

.PHONY : CMakeFiles/baxter-model.dir/build

CMakeFiles/baxter-model.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/baxter-model.dir/cmake_clean.cmake
.PHONY : CMakeFiles/baxter-model.dir/clean

CMakeFiles/baxter-model.dir/depend: baxter-model.c
CMakeFiles/baxter-model.dir/depend: baxter-model.c.h
	cd /home/eryk/CSCI534/s22-final-project-atlas/aminoo && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/eryk/CSCI534/s22-final-project-atlas/aminoo /home/eryk/CSCI534/s22-final-project-atlas/aminoo /home/eryk/CSCI534/s22-final-project-atlas/aminoo /home/eryk/CSCI534/s22-final-project-atlas/aminoo /home/eryk/CSCI534/s22-final-project-atlas/aminoo/CMakeFiles/baxter-model.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/baxter-model.dir/depend
