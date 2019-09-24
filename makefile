ifeq ($(OS), Windows_NT)
  RM = CMD /C del /Q /F
  RRM = CMD /C rmdir /Q /S
  BACKSLASH := \$(strip)
else
  RM = rm -f
  RRM = rm -f -r
	BACKSLASH := /$(strip)
endif

TARGET 				= 	$(CUR_DIR_NAME)
CC 						= 	cc
CCFLAGS 			= 	-g -Wall -Werror
LFLAGS				=		-static-libgcc -static-libstdc

DIRS					=		binaries 	\
									objects		\

SRC_DIR				=		./source
BIN_DIR 			=		./binaries
OBJ_DIR				=		./objects
INC_DIR				=		./include
MKF_PTH 			:= 	$(abspath $(lastword $(MAKEFILE_LIST)))
CUR_DIR				:=	$(strip $(subst Makefile,, $(MKF_PTH)))
RUN_DIR				:= 	$(addprefix $(CUR_DIR), $(strip $(subst .\,, $(BIN_DIR))))
CUR_DIR_NAME	:= 	$(notdir $(patsubst %/,%,$(dir $(MKF_PTH))))
SRCS 					=		$(wildcard $(SRC_DIR)/*.c)
INCLUDES			=		-I$(INC_DIR)
OBJS 					=		$(subst $(SRC_DIR),$(OBJ_DIR),$(SRCS:.c=.o))

.PHONY: clean
.PHONY: directories
.PHONY: formatting
.PHONY: run
.PHONY: depend
.PHONY: cmp
.PHONY: rel

all: directories $(BIN_DIR)/$(TARGET) run

cmp: directories $(BIN_DIR)/$(TARGET)


$(BIN_DIR)/$(TARGET): $(OBJS)
	$(CC) $(CCFLAGS) $(INCLUDES) -o $@ $(OBJS) $(LFLAGS)

$(OBJ_DIR)/%.o: $(SRC_DIR)/%.c
	$(CC) $(CCFLAGS) $(INCLUDES) -c $< -o $@

directories: $(DIRS)

$(DIRS):
	mkdir $(DIRS)

format: format.py
	python format.py $(INC_DIR) doClean
	python format.py $(SRC_DIR) doClean

clean:
	$(RRM) $(subst /,$(BACKSLASH), $(BIN_DIR))
	$(RRM) $(subst /,$(BACKSLASH), $(OBJ_DIR))

run:
	$(RUN_DIR)/$(TARGET)

depend: $(SRCS)
	makedepend $(INCLUDES) $^
