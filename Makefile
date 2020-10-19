TAG := $(or ${VERSION},${VERSION},latest)

IMAGE := hello-go:${TAG}

build:
	go build main.go

test:
	go test

run:
	go run main.go

update-dependency:
	go mod tidy

docker-build:
	docker build --tag ${IMAGE} --build-arg VERSION=${TAG} .

docker-run:
	docker run --rm -it ${IMAGE}
