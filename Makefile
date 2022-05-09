all: build

bin: mkdir -p bin

build:
	go build -o bin/temporalite ./cmd/...

start: build tmp
	bin/temporalite start --namespace default --filename "${PWD}/tmp/temporalite/temporalite.db" --log-format=pretty --log-level=warn

tmp:
	mkdir -p "$PWD/tmp/temporalite"

build-headless:
	go build -tags headless -o bin/temporalite ./cmd/...

start-headless: build-headless tmp
	bin/temporalite start --headless --namespace default --filename "${PWD}/tmp/temporalite/temporalite.db" --log-format=pretty --log-level=warn
