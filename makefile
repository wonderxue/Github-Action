CC = gcc
SRC_DIR = src
BUILD_DIR = build
BIN_DIR = bin
SRC = $(wildcard $(SRC_DIR)/*.c)
OBJ = $(SRC:$(SRC_DIR)/%.c=$(BUILD_DIR)/%.o)
TARGET = main

ALL: $(BIN_DIR)/$(TARGET)
	@./$<
$(BIN_DIR)/$(TARGET):$(OBJ)
	$(CC) $^ -o $@

$(BUILD_DIR)/%.o:$(SRC_DIR)/%.c
	$(CC) -c $< -o $@

.PHONY: help clean

help:
	@echo $(OBJ)
clean:
	@rm ./$(BIN_DIR)/*
	@rm ./$(BUILD_DIR)/*