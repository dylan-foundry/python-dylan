all: build

.PHONY: build test

LIB_SOURCES = $(wildcard *.dylan) \
              python-dylan.lid \
              wrappers.c

TEST_SOURES = $(wildcard tests/*.dylan) \
              $(wildcard tests/*.lid)

build: $(LIB_SOURCES)
	dylan-compiler -build python-dylan

test: $(LIB_SOURCES) $(TEST_SOURCES)
	dylan-compiler -build python-dylan-test-suite-app
	_build/bin/python-dylan-test-suite-app

clean:
	rm -rf _build/bin/python-dylan*
	rm -rf _build/lib/*python-dylan*
	rm -rf _build/build/python-dylan*
