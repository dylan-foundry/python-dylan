library:      python-dylan
target-type:  dll
license:      See License.txt in this distribution for details.
warranty:     Distributed WITHOUT WARRANTY OF ANY KIND
files:        library
              python-dylan
              bool
              dict
              int
              list
              string
              tuple
c-files:      wrappers.c
c-libraries:  -lpython
jam-includes: python.jam
