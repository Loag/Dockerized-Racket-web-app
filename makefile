
build:
	docker build -t racket-docker-practice .

# silence m1 warning
build-m1:
	docker build --platform linux/arm64/v8 -t racket-docker-practice .

run-cont:
	docker run -d -p 8081:8081 racket-docker-practice	