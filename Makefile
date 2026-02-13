CC = gcc
CXX = g++
FC = gfortran
CFLAGS = -Wall -Wextra -std=c99 -O2
CXXFLAGS = -Wall -Wextra -std=c++11 -O2
FFLAGS = -Wall -O2
LDFLAGS = -lm
PYTHON = python3
GO = go
DOTNET = dotnet
RUSTC = rustc
NODE = node
JAVAC = javac
JAVA = java
PHP = php
RSCRIPT = Rscript
PERL = perl
RUBY = ruby
TSC = tsc
TS_NODE = ts-node
LUA = lua

SRC_DIR = src
BUILD_DIR = build

C_TARGET = $(BUILD_DIR)/cosine_similarity
C_SRC = $(SRC_DIR)/cosine_similarity.c
CPP_TARGET = $(BUILD_DIR)/cosine_similarity_cpp
CPP_SRC = $(SRC_DIR)/cosine_similarity.cpp
CS_SRC = $(SRC_DIR)/cosine_similarity.cs
F90_TARGET = $(BUILD_DIR)/cosine_similarity_f90
F90_SRC = $(SRC_DIR)/cosine_similarity.f90
GO_SRC = $(SRC_DIR)/cosine_similarity.go
GO_TARGET = $(BUILD_DIR)/cosine_similarity_go
JAVA_SRC = $(SRC_DIR)/cosine_similarity.java
JAVA_CLASS = $(BUILD_DIR)/cosine_similarity.class
JS_SRC = $(SRC_DIR)/cosine_similarity.js
LUA_SRC = $(SRC_DIR)/cosine_similarity.lua
PERL_SRC = $(SRC_DIR)/cosine_similarity.pl
PHP_SRC = $(SRC_DIR)/cosine_similarity.php
PY_SRC = $(SRC_DIR)/cosine_similarity.py
R_SRC = $(SRC_DIR)/cosine_similarity.R
RUBY_SRC = $(SRC_DIR)/cosine_similarity.rb
RUST_SRC = $(SRC_DIR)/cosine_similarity.rs
RUST_TARGET = $(BUILD_DIR)/cosine_similarity_rust
TS_SRC = $(SRC_DIR)/cosine_similarity.ts
TS_TARGET = $(BUILD_DIR)/cosine_similarity_ts.js

all: $(BUILD_DIR) $(C_TARGET) $(CPP_TARGET) $(F90_TARGET) $(GO_TARGET) $(RUST_TARGET) $(JAVA_CLASS) $(TS_TARGET)

$(BUILD_DIR):
	mkdir -p $(BUILD_DIR)

$(C_TARGET): $(C_SRC) | $(BUILD_DIR)
	$(CC) $(CFLAGS) -o $(C_TARGET) $(C_SRC) $(LDFLAGS)

$(CPP_TARGET): $(CPP_SRC) | $(BUILD_DIR)
	$(CXX) $(CXXFLAGS) -o $(CPP_TARGET) $(CPP_SRC)

$(F90_TARGET): $(F90_SRC) | $(BUILD_DIR)
	$(FC) $(FFLAGS) -o $(F90_TARGET) $(F90_SRC)

$(GO_TARGET): $(GO_SRC) | $(BUILD_DIR)
	$(GO) build -o $(GO_TARGET) $(GO_SRC)

$(RUST_TARGET): $(RUST_SRC) | $(BUILD_DIR)
	$(RUSTC) -o $(RUST_TARGET) $(RUST_SRC)

$(JAVA_CLASS): $(JAVA_SRC) | $(BUILD_DIR)
	$(JAVAC) -d $(BUILD_DIR) $(JAVA_SRC)

$(TS_TARGET): $(TS_SRC) | $(BUILD_DIR)
	$(TSC) $(TS_SRC) --outFile $(TS_TARGET)

clean:
	rm -rf $(BUILD_DIR)

run: all
	@echo "===================="
	@echo "C 실행 결과:"
	@echo "===================="
	@$(C_TARGET)
	@echo ""
	@echo "===================="
	@echo "C++ 실행 결과:"
	@echo "===================="
	@$(CPP_TARGET)
	@echo ""
	@echo "===================="
	@echo "C# 실행 결과:"
	@echo "===================="
	@cd $(SRC_DIR) && $(DOTNET) run cosine_similarity.cs
	@echo ""
	@echo "===================="
	@echo "Fortran 실행 결과:"
	@echo "===================="
	@$(F90_TARGET)
	@echo ""
	@echo "===================="
	@echo "Go 실행 결과:"
	@echo "===================="
	@$(GO_TARGET)
	@echo ""
	@echo "===================="
	@echo "Java 실행 결과:"
	@echo "===================="
	@$(JAVA) -cp $(BUILD_DIR) cosine_similarity
	@echo ""
	@echo "===================="
	@echo "JavaScript 실행 결과:"
	@echo "===================="
	@$(NODE) $(JS_SRC)
	@echo ""
	@echo "===================="
	@echo "Lua 실행 결과:"
	@echo "===================="
	@$(LUA) $(LUA_SRC)
	@echo ""
	@echo "===================="
	@echo "Perl 실행 결과:"
	@echo "===================="
	@$(PERL) $(PERL_SRC)
	@echo ""
	@echo "===================="
	@echo "PHP 실행 결과:"
	@echo "===================="
	@$(PHP) $(PHP_SRC)
	@echo ""
	@echo "===================="
	@echo "Python 실행 결과:"
	@echo "===================="
	@$(PYTHON) $(PY_SRC)
	@echo ""
	@echo "===================="
	@echo "R 실행 결과:"
	@echo "===================="
	@$(RSCRIPT) $(R_SRC)
	@echo ""
	@echo "===================="
	@echo "Ruby 실행 결과:"
	@echo "===================="
	@$(RUBY) $(RUBY_SRC)
	@echo ""
	@echo "===================="
	@echo "Rust 실행 결과:"
	@echo "===================="
	@$(RUST_TARGET)
	@echo ""
	@echo "===================="
	@echo "TypeScript 실행 결과:"
	@echo "===================="
	@$(TS_NODE) $(TS_SRC)

run-c: $(C_TARGET)
	$(C_TARGET)

run-cpp: $(CPP_TARGET)
	$(CPP_TARGET)

run-csharp:
	cd $(SRC_DIR) && $(DOTNET) run cosine_similarity.cs

run-fortran: $(F90_TARGET)
	$(F90_TARGET)

run-go: $(GO_TARGET)
	$(GO_TARGET)

run-java: $(JAVA_CLASS)
	$(JAVA) -cp $(BUILD_DIR) cosine_similarity

run-javascript:
	$(NODE) $(JS_SRC)

run-lua:
	$(LUA) $(LUA_SRC)

run-perl:
	$(PERL) $(PERL_SRC)

run-php:
	$(PHP) $(PHP_SRC)

run-python:
	$(PYTHON) $(PY_SRC)

run-r:
	$(RSCRIPT) $(R_SRC)

run-ruby:
	$(RUBY) $(RUBY_SRC)

run-rust: $(RUST_TARGET)
	$(RUST_TARGET)

run-typescript:
	$(TS_NODE) $(TS_SRC)

.PHONY: all clean run run-c run-cpp run-csharp run-fortran run-go run-java run-javascript run-lua run-perl run-php run-python run-r run-ruby run-rust run-typescript