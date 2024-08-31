PRJ_NAME := DijkstraAlgorithm

### Paths ###
PRJ_ROOT        := $(shell dirname $(realpath $(firstword $(MAKEFILE_LIST))))
PRJ_SOURCE_CODE := ${PRJ_ROOT}/SourceCode
PRJ_OUTPUT_DIR  := ${PRJ_ROOT}/Outputs
PRJ_OBJECTS_DIR := ${PRJ_OUTPUT_DIR}/Objects
INCLUDES        += -I${PRJ_SOURCE_CODE}

### Derived Variables ###
CPP_SRC_FILES   := $(shell find -L $(PRJ_SOURCE_CODE) -type f -name "*.cpp"  -print)                # All C++ files
CPP_OBJECTS     := $(patsubst $(PRJ_SOURCE_CODE)/%.cpp,$(PRJ_OBJECTS_DIR)/%.o, $(CPP_SRC_FILES))    # All C++ objects

### Targets ###
# Complete build
all: $(CPP_OBJECTS)
	@g++ -o ${PRJ_OUTPUT_DIR}/${PRJ_NAME}.elf $(CPP_OBJECTS)

run:
	${PRJ_OUTPUT_DIR}/${PRJ_NAME}.elf

clean:
	rm -rf ${PRJ_OUTPUT_DIR}

# Generic C/C++ files build target (Object generation)
${PRJ_OBJECTS_DIR}/%.o : $(PRJ_SOURCE_CODE)/%.cpp
	@echo "Building '$<' for project '${PRJ_NAME}'"

	@mkdir -p $(@D)
	@g++ $(INCLUDES) -c $< -o $@

	@echo "Built '$<' for project '${PRJ_NAME}'"
