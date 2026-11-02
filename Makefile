CC := gcc
CFLAGS := -ggdb -Wall -Wextra -fsanitize=address
BUILD_DIR := build/
SRCS := $(wildcard src/*.c)
HEADERS := $(wildcard *.h)
TARGET := $(BUILD_DIR)/sosijc

# Highlight echo messages
HL_START := $(shell tput -Txterm setaf 3)
HL_END := $(shell tput -Txterm sgr0)   

.PHONY: build
build: $(SRCS) $(HEADERS) $(BUILD_DIR)
	@echo "$(HL_START)Building sosjic compiler: build/sosijc$(HL_END)"
	$(CC) $(SRCS) -o $(TARGET) $(CFLAGS)

.PHONY: run
run: build
	@echo "$(HL_START)Running build/sosjic$(HL_END)"
	./$(TARGET)

$(BUILD_DIR):
	mkdir -p $@

.PHONY: clean
clean:
	@echo "$(HL_START)Cleaning up build artifacts$(HL_END)"
	rm -rf $(BUILD_DIR)

