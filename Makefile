NAME = inem0o/redis-trib
VERSION = latest

.PHONY: all build tag release

all: build

build:
	docker build -t $(NAME):$(VERSION) --rm .

tag:
	docker tag $(NAME):$(VERSION) $(NAME):$(VERSION)

release: tag
	@if ! docker images $(NAME) | awk '{ print $$2 }' | grep -q -F $(VERSION); then echo "$(NAME) version $(VERSION) is not yet built. Please run 'make build'"; false; fi
	docker push $(NAME)
