LIBNAME = fun

all: lib$(LIBNAME).so test$(LIBNAME)

$(LIBNAME).o: $(LIBNAME).h $(LIBNAME).cpp
	mkoctfile -c -g -fPIC $(LIBNAME).cpp

lib$(LIBNAME).so: $(LIBNAME).o
	g++ -shared -o lib$(LIBNAME).so $(LIBNAME).o -L/usr/lib/x86_64-linux-gnu/octave/7.3.0/ -loctave -loctinterp -g

test$(LIBNAME): lib$(LIBNAME).so main.cpp fun.h
	g++ -Wall -L$(PWD) -L/usr/lib/x86_64-linux-gnu/octave/7.3.0/ -Wl,-rpath=$(PWD) -o $@ main.cpp -l$(LIBNAME) -g -loctave -loctinterp

install:
	cp fun.h ../thirdparty/linux/include/
	cp libfun.so ../thirdparty/linux/lib/x64/

.PHONY: clean
clean:
	$(RM) -f *.out *.so *.o *.oct
