HEADERS = xopt.h
OBJECTS = xopt.o

default: libxopt.a
	$(MAKE) -C test

XFLAGS :=

ifeq ($(DEBUG),1)
	XFLAGS += -g3
endif

%.o: %.c $(HEADERS)
	$(CC) -ansi -pedantic -Wall -Wextra -Werror $(XFLAGS) $(DEFINES) -c $< -o $@

libxopt.a: $(OBJECTS)
	ar rcs $@ $(OBJECTS)

clean:
	-rm -f $(OBJECTS)
	-rm -f libxopt.a
	$(MAKE) -C test clean
