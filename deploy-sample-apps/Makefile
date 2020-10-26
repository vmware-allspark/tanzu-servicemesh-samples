TAG = `git rev-parse --short=8 HEAD`
build:
	docker build -f Dockerfile -t tsm-samples:$(TAG) .

run:
	docker run -h tsm-samples --rm -it -v ~/.kube/config:/samples/.kube/config tsm-samples:$(TAG)
