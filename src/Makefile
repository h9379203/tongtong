#
# Makefile
#
# Target:   KATC
#
# Version:  1.0.1
#
#
KATC_HOME = ..
KATC_SRC =  $(KATC_HOME)
KATC_INC =  $(KATC_SRC)/head
#MYSQL_INC = /usr/local/mysql/include
MYSQL_INC = /usr/include/mysql
INCLUDES =  -I. -I$(KATC_INC) -I$(MYSQL_INC)
DEFINES =   -DDBGSEND -DDBGSQL #-DDEBUG 
#-DTESTMODE

CC =    g++
RM =    rm -rf
MV =    mv
RCP =   rcp
CP =    cp

LFLAGS =
CFLAGS =   -g -c $(INCLUDES) $(DEFINES)
OBJECT =        atc_main.o \
		daemon.o
		
LIBS =
#
# Build target
#
TARGET =  Fpcs

all:    $(TARGET)

$(TARGET): $(OBJECT)
	$(RM) $@
	$(CC) -o $@  $(OBJECT) -lpthread -lm -L/usr/lib64/mysql -lmysqlclient
#	$(CC) -o $@  $(OBJECT) -lpthread -lm -L/usr/local/mysql/lib/ -lmysqlclient

atc_main.o: atc_main.cpp 
	$(CC) $(CFLAGS) atc_main.cpp

daemon.o: daemon.cpp 
	$(CC) $(CFLAGS) daemon.cpp

.c.o:
	$(CC) $(CFLAGS) -o $*.o $*.cpp
#
# Clean
#
clean:
	$(RM) core *.o Fpcs
#
# End of Makefile
#
