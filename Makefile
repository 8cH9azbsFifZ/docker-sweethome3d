build:
	docker build . -t sweethome3d
	docker build . -t asdlfkj31h/sweethome3d:0.1

run:
	docker-compose up --build

push:
	docker push asdlfkj31h/sweethome3d:0.1
