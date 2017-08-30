# https://stackoverflow.com/a/16346321
BINDIR := ./bin
create_bin_dir := $(shell mkdir -p $(BINDIR))

CXX_VERSION := $(shell $(CXX) -dumpversion)

CPPFLAGS := -I -Wall -Wextra -Werror -pedantic
CXXFLAGS := -std=c++1z
LIBS := 

all: hello_world

.PHONY: all clean

hello_world: hello_world.o
	@echo "LD $@ with $(CXX) version $(CXX_VERSION)"
	$(CXX) -o $(BINDIR)/$@ $^ $(CPPFLAGS) $(CXXFLAGS) $(LIBS)

clean:
	rm -rf *.o $(BINDIR)/*

%.o: %.cc
	@echo "CXX $<"
	$(CXX) -c -o $@ $< $(CPPFLAGS) $(CXXFLAGS)

# http://make.mad-scientist.net/managing-recipe-echoing/
$(V).SILENT:
