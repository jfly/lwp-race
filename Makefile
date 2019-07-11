.PHONY: help
help:
	echo "Try 'make run' and 'make run-slow'"

.PHONY: build
build:
	docker build -t lwp-race:latest .

.PHONY: run
run: build
	# Extra arguments to get fuse working from https://stackoverflow.com/a/49021109
	docker run --device /dev/fuse --cap-add SYS_ADMIN -e SLOW_LOAD_A_DOT_JS="" lwp-race:latest

.PHONY: run-slow
run-slow: build
	# Extra arguments to get fuse working from https://stackoverflow.com/a/49021109
	docker run --device /dev/fuse --cap-add SYS_ADMIN -e SLOW_LOAD_A_DOT_JS=1 lwp-race:latest
