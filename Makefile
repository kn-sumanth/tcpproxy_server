#
# TCP Proxy Server
# ~~~~~~~~~~~~~~~~~~~
#
# Copyright (c) 2007 Arash Partow (http://www.partow.net)
# URL: http://www.partow.net/programming/tcpproxy/index.html
#
# Distributed under the Boost Software License, Version 1.0.
#


COMPILER         = -c++
OPTIMIZATION_OPT = -O3
OPTIONS          = -pedantic -ansi -Wall -Werror $(OPTIMIZATION_OPT) -o
PTHREAD          = -lpthread
ifeq ($(OS),Windows_NT)
    LINKER_OPT       = -L/usr/lib -lstdc++ $(PTHREAD) -lboost_thread -lboost_system -lboost_chrono -lboost_date_time
else
  UNAME_S := $(shell uname -s)
  ifeq ($(UNAME_S),Darwin)
    LINKER_OPT       = -L/usr/lib -lstdc++ $(PTHREAD) -lboost_thread-mt -lboost_system-mt -lboost_chrono -lboost_date_time
  else
    LINKER_OPT       = -L/usr/lib -lstdc++ $(PTHREAD) -lboost_thread -lboost_system -lboost_chrono -lboost_date_time
  endif
endif

BUILD_LIST+=tcpproxy_server

all: $(BUILD_LIST)

tcpproxy_server: tcpproxy_server.cpp
	$(COMPILER) $(OPTIONS) tcpproxy_server tcpproxy_server.cpp $(LINKER_OPT)

strip_bin :
	strip -s tcpproxy

clean:
	rm -f core tcpproxy_server *.o *.bak *~ *stackdump *#
