.PHONY: all clean build prog setup

BOARD ?= nucleo_f411re
PYTHON ?= $(abspath .venv/bin/python)
HEX ?= $(abspath build/zephyr/zephyr.hex)

all: prog

clean:
	rm -rf build

build:
	cmake -S . -B build -G Ninja -DBOARD=$(BOARD) -DPython3_EXECUTABLE="$(PYTHON)" -DCMAKE_EXPORT_COMPILE_COMMANDS=ON && cmake --build build

prog: 
	@test -f "$(HEX)" || { echo "Build not found: $(HEX)" >&2; exit 1; }
	STM32_Programmer_CLI -c port=SWD mode=UR -w "$(HEX)" -v -rst

setup:
	bash setup.sh
