# Project Root
ARGO_PROJECT_DIR=..

# VHDL source dir
SRCDIR=$(ARGO_PROJECT_DIR)/src

# Synthesis directory
SYNTH_DIR=.

# Synthesis targets
TARGET_DIR=$(SYNTH_DIR)/targets
TARGETS=$(shell find $(TARGET_DIR)/*/config.mk)

# default rule
all: help

# include all synthesis targets defined
include $(TARGETS)

help: help_prefix $(SYNTHESIS_DESCRIPTIONS)

help_prefix:
	@echo "####################################################################"
	@echo " ARGO noc synthesis "
	@echo "####################################################################"
	@echo 
	@echo "The following synthesis targets are available:"

clean: 
	rm -rf WORK/*
	rm -rf synopsys_cache*
	rm -rf *.ddc
	rm -rf ../netlists/*
	rm -rf reports
	mkdir reports




