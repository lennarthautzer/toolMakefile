TARGET 			= 		EXECUTABLENAME
CC 				= 		gcc
CFLAGS 			= 		-g -Wall -Werror
LFLAGS			=		-L../lib

DIRS				=		binaries 	\
							objects		\

SRC_DIR			=		./source
BIN_DIR 			=		./binaries
OBJ_DIR			=		./objects
INC_DIR			=		./include

SRCS 				=		$(wildcard $(SRC_DIR)/*.c)
INCLUDES			=		-I./include
OBJS 				=		$(subst $(SRC_DIR),$(OBJ_DIR),$(SRCS:.c=.o))

.PHONY: clean
.PHONY: directories
.PHONY: formatting

all: format directories $(BIN_DIR)/$(TARGET)

$(BIN_DIR)/$(TARGET): $(OBJS)
	$(CC) $(CFLAGS) $(INCLUDES) -o $@ $(OBJS) $(LFLAGS)

$(OBJ_DIR)/%.o: $(SRC_DIR)/%.c
	$(CC) $(CCFLAGS) $(INCLUDES) -c $< -o $@

directories: $(DIRS)

$(DIRS):
	mkdir -p $(DIRS)

format: format.py
	python format.py $(INC_DIR) doClean
	python format.py $(SRC_DIR) doClean

clean:
	@$(RM) $(OBJ_DIR)/*.o
	@$(RM) $(BIN_DIR)/$(TARGET)

depend: $(SRCS)
	makedepend $(INCLUDES) $^
