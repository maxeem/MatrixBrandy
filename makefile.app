# Makefile for brandy under NetBSD and Linux

# Use the following to generate your app.o:
# ld -r -b binary app -o app.o
# where 'app' is the name of the BASIC program. The code assumes the name
# "app" - so copy it first!

CC = gcc
LD = gcc

CFLAGSDBG += -g -DDEBUG -I/usr/include/SDL -DUSE_SDL -DDEFAULT_IGNORE
CFLAGS = -O2 -I/usr/include/SDL -DUSE_SDL -DDEFAULT_IGNORE -DBRANDYAPP

LDFLAGS +=

LIBS = -lX11 -lm -lSDL

SRCDIR = src

OBJ = $(SRCDIR)/variables.o $(SRCDIR)/tokens.o $(SRCDIR)/graphsdl.o \
	$(SRCDIR)/strings.o $(SRCDIR)/statement.o $(SRCDIR)/stack.o \
	$(SRCDIR)/miscprocs.o $(SRCDIR)/mainstate.o $(SRCDIR)/lvalue.o \
	$(SRCDIR)/keyboard.o $(SRCDIR)/iostate.o $(SRCDIR)/heap.o \
	$(SRCDIR)/functions.o $(SRCDIR)/fileio.o $(SRCDIR)/evaluate.o \
	$(SRCDIR)/errors.o $(SRCDIR)/mos.o $(SRCDIR)/editor.o \
	$(SRCDIR)/convert.o $(SRCDIR)/commands.o $(SRCDIR)/brandy.o \
	$(SRCDIR)/assign.o $(SRCDIR)/net.o $(SRCDIR)/app.o

SRC = $(SRCDIR)/variables.c $(SRCDIR)/tokens.c $(SRCDIR)/graphsdl.c \
	$(SRCDIR)/strings.c $(SRCDIR)/statement.c $(SRCDIR)/stack.c \
	$(SRCDIR)/miscprocs.c $(SRCDIR)/mainstate.c $(SRCDIR)/lvalue.c \
	$(SRCDIR)/keyboard.c $(SRCDIR)/iostate.c $(SRCDIR)/heap.c \
	$(SRCDIR)/functions.c $(SRCDIR)/fileio.c $(SRCDIR)/evaluate.c \
	$(SRCDIR)/errors.c $(SRCDIR)/mos.c $(SRCDIR)/editor.c \
	$(SRCDIR)/convert.c $(SRCDIR)/commands.c $(SRCDIR)/brandy.c \
	$(SRCDIR)/assign.c $(SRCDIR)/net.c

brandyapp:	$(OBJ)
	$(LD) $(LDFLAGS) -o brandyapp $(OBJ) $(LIBS)

# Build VARIABLES.C
VARIABLES_C = $(SRCDIR)/common.h $(SRCDIR)/target.h $(SRCDIR)/basicdefs.h \
	$(SRCDIR)/variables.h $(SRCDIR)/evaluate.h $(SRCDIR)/tokens.h \
	$(SRCDIR)/stack.h $(SRCDIR)/heap.h $(SRCDIR)/errors.h \
	$(SRCDIR)/miscprocs.h $(SRCDIR)/screen.h $(SRCDIR)/lvalue.h

$(SRCDIR)/variables.o: $(VARIABLES_C) $(SRCDIR)/variables.c
	$(CC) $(CFLAGS) $(SRCDIR)/variables.c -c -o $(SRCDIR)/variables.o

# Build TOKENS.C
TOKENS_C = $(SRCDIR)/common.h $(SRCDIR)/target.h $(SRCDIR)/basicdefs.h \
	$(SRCDIR)/tokens.h $(SRCDIR)/miscprocs.h $(SRCDIR)/convert.h \
	$(SRCDIR)/errors.h

$(SRCDIR)/tokens.o: $(TOKENS_C) $(SRCDIR)/tokens.c
	$(CC) $(CFLAGS) $(SRCDIR)/tokens.c -c -o $(SRCDIR)/tokens.o

# Build GRAPHSDL.C
GSDL_C = $(SRCDIR)/common.h $(SRCDIR)/target.h $(SRCDIR)/basicdefs.h \
	$(SRCDIR)/errors.h $(SRCDIR)/scrcommon.h $(SRCDIR)/screen.h \
	$(SRCDIR)/mos.h $(SRCDIR)/graphsdl.h

$(SRCDIR)/graphsdl.o: $(GSDL_C) $(SRCDIR)/graphsdl.c
	$(CC) $(CFLAGS) $(SRCDIR)/graphsdl.c -c -o $(SRCDIR)/graphsdl.o

# Build STRINGS.C
STRINGS_C = $(SRCDIR)/common.h $(SRCDIR)/target.h $(SRCDIR)/basicdefs.h \
	$(SRCDIR)/strings.h $(SRCDIR)/heap.h $(SRCDIR)/errors.h

$(SRCDIR)/strings.o: $(STRINGS_C) $(SRCDIR)/strings.c
	$(CC) $(CFLAGS) $(SRCDIR)/strings.c -c -o $(SRCDIR)/strings.o

# Build STATEMENT.C
STATEMENT_C = $(SRCDIR)/common.h $(SRCDIR)/target.h $(SRCDIR)/basicdefs.h \
	$(SRCDIR)/tokens.h $(SRCDIR)/commands.h $(SRCDIR)/stack.h \
	$(SRCDIR)/heap.h $(SRCDIR)/errors.h $(SRCDIR)/editor.h \
	$(SRCDIR)/miscprocs.h $(SRCDIR)/variables.h $(SRCDIR)/evaluate.h \
	$(SRCDIR)/screen.h $(SRCDIR)/fileio.h $(SRCDIR)/strings.h \
	$(SRCDIR)/iostate.h $(SRCDIR)/mainstate.h $(SRCDIR)/assign.h \
	$(SRCDIR)/statement.h

$(SRCDIR)/statement.o: $(STATEMENT_C) $(SRCDIR)/statement.c
	$(CC) $(CFLAGS) $(SRCDIR)/statement.c -c -o $(SRCDIR)/statement.o

# Build STACK.C
STACK_C = $(SRCDIR)/common.h $(SRCDIR)/target.h $(SRCDIR)/basicdefs.h \
	$(SRCDIR)/stack.h $(SRCDIR)/miscprocs.h $(SRCDIR)/strings.h \
	$(SRCDIR)/tokens.h $(SRCDIR)/errors.h

$(SRCDIR)/stack.o: $(STACK_C) $(SRCDIR)/stack.c
	$(CC) $(CFLAGS) $(SRCDIR)/stack.c -c -o $(SRCDIR)/stack.o

# Build MISCPROCS.C
MISCPROCS_C = $(SRCDIR)/common.h $(SRCDIR)/target.h $(SRCDIR)/basicdefs.h \
	$(SRCDIR)/tokens.h $(SRCDIR)/errors.h $(SRCDIR)/keyboard.h \
	$(SRCDIR)/screen.h $(SRCDIR)/miscprocs.h

$(SRCDIR)/miscprocs.o: $(MISCPROCS_C) $(SRCDIR)/miscprocs.c
	$(CC) $(CFLAGS) $(SRCDIR)/miscprocs.c -c -o $(SRCDIR)/miscprocs.o

# Build MAINSTATE.C
MAINSTATE_C = $(SRCDIR)/common.h $(SRCDIR)/target.h $(SRCDIR)/basicdefs.h \
	$(SRCDIR)/tokens.h $(SRCDIR)/variables.h $(SRCDIR)/stack.h \
	$(SRCDIR)/heap.h $(SRCDIR)/strings.h $(SRCDIR)/errors.h \
	$(SRCDIR)/statement.h $(SRCDIR)/evaluate.h $(SRCDIR)/convert.h \
	$(SRCDIR)/miscprocs.h $(SRCDIR)/editor.h $(SRCDIR)/mos.h \
	$(SRCDIR)/screen.h $(SRCDIR)/lvalue.h $(SRCDIR)/fileio.h \
	$(SRCDIR)/mainstate.h

$(SRCDIR)/mainstate.o: $(MAINSTATE_C) $(SRCDIR)/mainstate.c
	$(CC) $(CFLAGS) $(SRCDIR)/mainstate.c -c -o $(SRCDIR)/mainstate.o

# Build LVALUE.C
LVALUE_C = $(SRCDIR)/common.h $(SRCDIR)/target.h $(SRCDIR)/basicdefs.h \
	$(SRCDIR)/tokens.h $(SRCDIR)/evaluate.h $(SRCDIR)/stack.h \
	$(SRCDIR)/errors.h $(SRCDIR)/variables.h $(SRCDIR)/miscprocs.h \
	$(SRCDIR)/lvalue.h

$(SRCDIR)/lvalue.o: $(LVALUE_C) $(SRCDIR)/lvalue.c
	$(CC) $(CFLAGS) $(SRCDIR)/lvalue.c -c -o $(SRCDIR)/lvalue.o

# Build KEYBOARD.C
KEYBOARD_C = $(SRCDIR)/common.h $(SRCDIR)/target.h $(SRCDIR)/basicdefs.h \
	$(SRCDIR)/errors.h $(SRCDIR)/keyboard.h $(SRCDIR)/screen.h \
	$(SRCDIR)/keyboard-inkey.h

$(SRCDIR)/keyboard.o: $(KEYBOARD_C) $(SRCDIR)/keyboard.c
	$(CC) $(CFLAGS) $(SRCDIR)/keyboard.c -c -o $(SRCDIR)/keyboard.o

# Build IOSTATE.C
IOSTATE_C = $(SRCDIR)/common.h $(SRCDIR)/target.h $(SRCDIR)/basicdefs.h \
	$(SRCDIR)/tokens.h $(SRCDIR)/stack.h $(SRCDIR)/strings.h \
	$(SRCDIR)/errors.h $(SRCDIR)/miscprocs.h $(SRCDIR)/evaluate.h \
	$(SRCDIR)/convert.h $(SRCDIR)/mos.h $(SRCDIR)/fileio.h \
	$(SRCDIR)/screen.h $(SRCDIR)/lvalue.h $(SRCDIR)/statement.h \
	$(SRCDIR)/iostate.h

$(SRCDIR)/iostate.o: $(IOSTATE_C) $(SRCDIR)/iostate.c
	$(CC) $(CFLAGS) $(SRCDIR)/iostate.c -c -o $(SRCDIR)/iostate.o

# Build HEAP.C
HEAP_C = $(SRCDIR)/common.h $(SRCDIR)/target.h $(SRCDIR)/basicdefs.h \
	$(SRCDIR)/heap.h $(SRCDIR)/target.h $(SRCDIR)/errors.h \
	$(SRCDIR)/miscprocs.h

$(SRCDIR)/heap.o: $(HEAP_C) $(SRCDIR)/heap.c
	$(CC) $(CFLAGS) $(SRCDIR)/heap.c -c -o $(SRCDIR)/heap.o

# Build FUNCTIONS.C
FUNCTIONS_C = $(SRCDIR)/common.h $(SRCDIR)/target.h $(SRCDIR)/basicdefs.h \
	$(SRCDIR)/tokens.h $(SRCDIR)/variables.h $(SRCDIR)/strings.h \
	$(SRCDIR)/convert.h $(SRCDIR)/stack.h $(SRCDIR)/errors.h \
	$(SRCDIR)/evaluate.h $(SRCDIR)/keyboard.h $(SRCDIR)/screen.h \
	$(SRCDIR)/mos.h $(SRCDIR)/miscprocs.h $(SRCDIR)/fileio.h \
	$(SRCDIR)/functions.h

$(SRCDIR)/functions.o: $(FUNCTIONS_C) $(SRCDIR)/functions.c
	$(CC) $(CFLAGS) $(SRCDIR)/functions.c -c -o $(SRCDIR)/functions.o

# Build FILEIO.C
FILEIO_C = $(SRCDIR)/common.h $(SRCDIR)/target.h $(SRCDIR)/basicdefs.h \
	$(SRCDIR)/errors.h $(SRCDIR)/fileio.h $(SRCDIR)/strings.h \
	$(SRCDIR)/net.h

$(SRCDIR)/fileio.o: $(FILEIO_C) $(SRCDIR)/fileio.c
	$(CC) $(CFLAGS) $(SRCDIR)/fileio.c -c -o $(SRCDIR)/fileio.o

# Build NET.C
NET_C = $(SRCDIR)/net.h $(SRCDIR)/errors.h

$(SRCDIR)/net.o: $(NET_C) $(SRCDIR)/net.c
	$(CC) $(CFLAGS) $(SRCDIR)/net.c -c -o $(SRCDIR)/net.o

# Build EVALUATE.C
EVALUATE_C = $(SRCDIR)/common.h $(SRCDIR)/target.h $(SRCDIR)/basicdefs.h \
	$(SRCDIR)/tokens.h $(SRCDIR)/variables.h $(SRCDIR)/lvalue.h \
	$(SRCDIR)/strings.h $(SRCDIR)/stack.h $(SRCDIR)/errors.h \
	$(SRCDIR)/evaluate.h $(SRCDIR)/statement.h $(SRCDIR)/miscprocs.h \
	$(SRCDIR)/functions.h

$(SRCDIR)/evaluate.o: $(EVALUATE_C) $(SRCDIR)/evaluate.c
	$(CC) $(CFLAGS) $(SRCDIR)/evaluate.c -c -o $(SRCDIR)/evaluate.o

# Build ERRORS.C
ERRORS_C = $(SRCDIR)/common.h $(SRCDIR)/target.h $(SRCDIR)/basicdefs.h \
	$(SRCDIR)/errors.h $(SRCDIR)/stack.h $(SRCDIR)/fileio.h \
	$(SRCDIR)/tokens.h $(SRCDIR)/screen.h $(SRCDIR)/miscprocs.h \
	$(SRCDIR)/keyboard.h $(SRCDIR)/graphsdl.h

$(SRCDIR)/errors.o: $(ERRORS_C) $(SRCDIR)/errors.c
	$(CC) $(CFLAGS) $(SRCDIR)/errors.c -c -o $(SRCDIR)/errors.o

# Build MOS.C
MOS_C = $(SRCDIR)/common.h $(SRCDIR)/target.h $(SRCDIR)/errors.h \
	$(SRCDIR)/basicdefs.h $(SRCDIR)/mos.h $(SRCDIR)/graphsdl.h \
	$(SRCDIR)/screen.h $(SRCDIR)/keyboard.h $(SRCDIR)/mos_swinums.h

$(SRCDIR)/mos.o: $(MOS_C) $(SRCDIR)/mos.c
	$(CC) $(CFLAGS) $(SRCDIR)/mos.c -c -o $(SRCDIR)/mos.o

# Build EDITOR.C
EDITOR_C = $(SRCDIR)/common.h $(SRCDIR)/target.h $(SRCDIR)/basicdefs.h \
	$(SRCDIR)/errors.h $(SRCDIR)/variables.h $(SRCDIR)/heap.h \
	$(SRCDIR)/tokens.h $(SRCDIR)/strings.h $(SRCDIR)/miscprocs.h \
	$(SRCDIR)/stack.h $(SRCDIR)/fileio.h

$(SRCDIR)/editor.o: $(EDITOR_C) $(SRCDIR)/editor.c
	$(CC) $(CFLAGS) $(SRCDIR)/editor.c -c -o $(SRCDIR)/editor.o

# Build CONVERT.C
CONVERT_C = $(SRCDIR)/common.h $(SRCDIR)/target.h $(SRCDIR)/basicdefs.h \
	$(SRCDIR)/convert.h $(SRCDIR)/errors.h $(SRCDIR)/miscprocs.h

$(SRCDIR)/convert.o: $(CONVERT_C) $(SRCDIR)/convert.c
	$(CC) $(CFLAGS) $(SRCDIR)/convert.c -c -o $(SRCDIR)/convert.o

# Build COMMANDS.C
COMMANDS_C = $(SRCDIR)/common.h $(SRCDIR)/target.h $(SRCDIR)/basicdefs.h \
	$(SRCDIR)/miscprocs.h $(SRCDIR)/tokens.h $(SRCDIR)/statement.h \
	$(SRCDIR)/variables.h $(SRCDIR)/editor.h $(SRCDIR)/errors.h \
	$(SRCDIR)/heap.h $(SRCDIR)/stack.h $(SRCDIR)/strings.h \
	$(SRCDIR)/evaluate.h $(SRCDIR)/screen.h $(SRCDIR)/keyboard.h

$(SRCDIR)/commands.o: $(COMMANDS_C) $(SRCDIR)/commands.c
	$(CC) $(CFLAGS) $(SRCDIR)/commands.c -c -o $(SRCDIR)/commands.o

# Build BRANDY.C
BRANDY_C = $(SRCDIR)/common.h $(SRCDIR)/target.h $(SRCDIR)/basicdefs.h \
	$(SRCDIR)/tokens.h $(SRCDIR)/errors.h $(SRCDIR)/heap.h \
	$(SRCDIR)/editor.h $(SRCDIR)/commands.h $(SRCDIR)/statement.h \
	$(SRCDIR)/fileio.h $(SRCDIR)/mos.h $(SRCDIR)/keyboard.h \
	$(SRCDIR)/screen.h $(SRCDIR)/miscprocs.h $(SRCDIR)/net.h

$(SRCDIR)/brandy.o: $(BRANDY_C) $(SRCDIR)/brandy.c
	$(CC) $(CFLAGS) $(SRCDIR)/brandy.c -c -o $(SRCDIR)/brandy.o

# Build ASSIGN.C
ASSIGN_C = $(SRCDIR)/common.h $(SRCDIR)/target.h $(SRCDIR)/basicdefs.h \
	$(SRCDIR)/target.h $(SRCDIR)/tokens.h $(SRCDIR)/heap.h \
	$(SRCDIR)/stack.h $(SRCDIR)/strings.h $(SRCDIR)/variables.h \
	$(SRCDIR)/errors.h $(SRCDIR)/miscprocs.h $(SRCDIR)/editor.h \
	$(SRCDIR)/evaluate.h $(SRCDIR)/lvalue.h $(SRCDIR)/statement.h \
	$(SRCDIR)/assign.h $(SRCDIR)/fileio.h $(SRCDIR)/mos.h

$(SRCDIR)/assign.o: $(ASSIGN_C) $(SRCDIR)/assign.c
	$(CC) $(CFLAGS) $(SRCDIR)/assign.c -c -o $(SRCDIR)/assign.o

recompile:
	$(CC) $(CFLAGS) $(SRC) $(LIBS) -o brandy

debug:
	$(CC) $(CFLAGSDBG) $(SRC) $(LIBS) -o brandyapp
	strip brandyapp

check:
	$(CC) $(CFLAGS) -Wall -O2 $(SRC) $(LIBS) -o brandyapp

clean:
	rm -f $(SRCDIR)/*.o brandyapp

all:	brandyapp