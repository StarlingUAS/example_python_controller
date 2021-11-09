MAKEFILE_DIR:=$(shell dirname $(realpath $(firstword $(MAKEFILE_LIST))))

all: example_controller_python_ap example_controller_python_px4

example_controller_python_px4:
	docker build -t uobflightlabstarling/example_controller_python_px4 example_controller_python_px4

example_controller_python_ap:
	docker build -t uobflightlabstarling/example_controller_python_ap example_controller_python_ap

.PHONY: example_controller_python_px4 example_controller_python_ap all