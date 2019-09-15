TARGET 			= 	$(CUR_DIR_NAME).exe
CC 				= 	g++
CFLAGS 			= 	-g -Wall -Werror
LFLAGS			=	-LC:\MinGW\lib -lmingw32 -static-libgcc -static-libstdc++

DIRS				=		binaries 	\
							objects		\

SRC_DIR			=		.\source
BIN_DIR 			=		.\binaries
OBJ_DIR			=		.\objects
INC_DIR			=		.\include
MKF_PTH 			:= 	$(abspath $(lastword $(MAKEFILE_LIST)))
CUR_DIR			:=		$(strip $(subst Makefile,, $(MKF_PTH)))
RUN_DIR			:= 	$(addprefix $(CUR_DIR), $(strip $(subst .\,, $(BIN_DIR))))
CUR_DIR_NAME	:= 	$(notdir $(patsubst %/,%,$(dir $(MKF_PTH))))
SRCS 				=		$(wildcard $(SRC_DIR)/*.cpp)
INCLUDES			=		-I$(INC_DIR)
OBJS 				=		$(subst $(SRC_DIR),$(OBJ_DIR),$(SRCS:.cpp=.o))

.PHONY: clean
.PHONY: directories
.PHONY: formatting
.PHONY: run
.PHONY: depend
.PHONY: cmp
.PHONY: rel

all: format directories $(BIN_DIR)\$(TARGET) run

cmp: format directories $(BIN_DIR)\$(TARGET)


$(BIN_DIR)\$(TARGET): $(OBJS)
	$(CC) $(CFLAGS) $(INCLUDES) -o $@ $(OBJS) $(LFLAGS)

$(OBJ_DIR)/%.o: $(SRC_DIR)/%.cpp
	$(CC) $(CFLAGS) $(INCLUDES) -c $< -o $@

$(BIN_DIR)\$(UPTARGET): $(OBJS)
	$(CC) $(CFLAGS) $(INCLUDES) -o $@ $(OBJS) $(UPFLAGS)

directories: $(DIRS)

$(DIRS):
	mkdir $(DIRS)

format: format.py
	python format.py $(INC_DIR) doClean
	python format.py $(SRC_DIR) doClean

clean:
	-del $(OBJ_DIR)\\*.o
	-del $(BIN_DIR)\\$(TARGET)

run:
	CMD /C start $(RUN_DIR)/$(TARGET)

depend: $(SRCS)
	makedepend $(INCLUDES) $^
