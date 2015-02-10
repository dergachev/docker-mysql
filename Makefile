IMAGE = dergachev/mysql
all: build

build:
	@docker build --tag=$(IMAGE) .
