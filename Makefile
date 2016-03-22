###############################################
# Makefile
# dev	: acidpop
# date	: 2014/01/08
###############################################

#################################################
# Redefine (.cpp) Default Compile rules
#################################################
.SUFFIXES : .c .cpp

# Compiler
CC           = g++

#PreProcessor
DEFLIST		 = -DLINUX 

#Library List
LIBLIST		= 

#Execute Name
EXENAME		 = tongtong
# Version
VERSION	 	 = 1.0.0.0
# Compiler Flag, ex) -fPIC -shared
CFLAGS		 = -c

#EXTRA_IPATHS	= ./src
INCLUDE_DIR	= ./head

# Header File Path
IPATHS       = $(EXTRA_IPATHS) -I./ -I$(INCLUDE_DIR)

# Library File Path
LPATHS       = $(EXTRA_LPATHS) -L./



################################################
# Define ANSI Color Code
################################################

#Font Color
ANSI_BLACK		= [30m
ANSI_RED		= [31m 
ANSI_GREEN		= [32m
ANSI_YELLOW		= [33m
ANSI_BLUE		= [34m
ANSI_PINK		= [35m
ANSI_BLS_GREEN	= [36m
ANSI_WHITE		= [37m

#Font Background Color
ANSI_BG_BLACK		= [30m
ANSI_BG_RED			= [31m 
ANSI_BG_GREEN		= [32m
ANSI_BG_YELLOW		= [33m
ANSI_BG_BLUE		= [34m
ANSI_BG_PINK		= [35m
ANSI_BG_BLS_GREEN	= [36m
ANSI_BG_WHITE		= [37m

#Font High Intensity Color
ANSI_H_BLACK		= [90m
ANSI_H_RED			= [91m 
ANSI_H_GREEN		= [92m
ANSI_H_YELLOW		= [93m
ANSI_H_BLUE			= [94m
ANSI_H_PINK			= [95m
ANSI_H_BLS_GREEN	= [96m
ANSI_H_WHITE		= [97m

#Font Background High Intensity Color
ANSI_BG_BLACK		= [100m
ANSI_BG_RED			= [101m 
ANSI_BG_GREEN		= [102m
ANSI_BG_YELLOW		= [103m
ANSI_BG_BLUE		= [104m
ANSI_BG_PINK		= [105m
ANSI_BG_BLS_GREEN	= [106m
ANSI_BG_WHITE		= [107m



#Font Attribute
ANSI_BOLD			= [1m
ANSI_ITALIC			= [3m
ANSI_UNDERBAR		= [4m
ANSI_BLINK			= [5m
ANSI_COL_REVERS		= [6m

# Font All Init
ANSI_NORMAL			= [0m

##################################################
# Object List
##################################################
C_SRCS			= $(wildcard *.c)
CPP_SRCS		= $(wildcard *.cpp)
SRCS			= $(C_SRCS)+$(CPP_SRCS)
OBJS			= $(C_SRCS:.c=.o)
OBJS			+= $(CPP_SRCS:.cpp=.o)

OBJS_DBG		= $(C_SRCS:.c=.dbg_o)
OBJS_DBG		+= $(CPP_SRCS:.cpp=.dbg_o)

##################################################
# Build Rules
##################################################
.c.o :
	@echo "src > $(ANSI_H_YELLOW)$< ...$(ANSI_NORMAL)"
	@$(CC) $(CFLAGS)  $< -o $@ $(IPATHS) $(DEFLIST)

.cpp.o :
	@echo "src > $(ANSI_H_YELLOW)$< ...$(ANSI_NORMAL)"
	@$(CC) $(CFLAGS) $< -o $@ $(IPATHS) $(DEFLIST)

.SUFFIXES: .c .cpp .dbg_o

.c.dbg_o :
	@echo "src > $(ANSI_H_YELLOW)$< ...$(ANSI_NORMAL)"
	@$(CC) $(CFLAGS) $< -g -o $@ $(IPATHS) $(DEFLIST)
.cpp.dbg_o:
	@echo "src > $(ANSI_H_YELLOW)$< ...$(ANSI_NORMAL)"
	@$(CC) $(CFLAGS) $< -g -o $@ $(IPATHS) $(DEFLIST)

#****************************************************************************
# build
#****************************************************************************
release	: $(OBJS) 

			@echo "$(ANSI_H_BLS_GREEN)$(ANSI_BOLD)Release build start...$(ANSI_NORMAL)"
			@$(CC) $(OBJS) $(LIBLIST) -o $(EXENAME)
			@echo "$(ANSI_H_BLS_GREEN)$(ANSI_BOLD)complete build...$(ANSI_NORMAL)"
			@echo "$(ANSI_H_BLS_GREEN)$(ANSI_BOLD)Output file -> $(ANSI_H_GREEN)$(EXENAME)$(ANSI_NORMAL)" 
			@echo ""

debug	:  $(OBJS_DBG)

			@echo "$(ANSI_H_BLS_GREEN)$(ANSI_BOLD)Debug build start...$(ANSI_NORMAL)"
			@$(CC) -g $(OBJS_DBG) $(LIBLIST) -D_DEBUG -o $(EXENAME)
			@echo "$(ANSI_H_BLS_GREEN)$(ANSI_BOLD)Complete build...$(ANSI_NORMAL)"
			@echo "$(ANSI_H_BLS_GREEN)$(ANSI_BOLD)Output file -> $(ANSI_H_GREEN)$(EXENAME)$(ANSI_NORMAL)"
			@echo ""

clean :
		@echo "$(ANSI_H_RED)Delete object files...$(ANSI_NORMAL)"
		@rm -f *.o
		@rm -f *.dbg_o
		@rm -f $(EXENAME)



