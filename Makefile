.PHONY: help
help:
	@echo "Try 'make run'"

.PHONY: build
build:
	docker build -t lwp-race:latest .

.PHONY: run
run: build
	# Extra arguments to get fuse working from https://stackoverflow.com/a/49021109
	docker run --device /dev/fuse --cap-add SYS_ADMIN lwp-race:latest
