VER=0.3
build:
	docker build . -t sweethome3d -t asdlfkj31h/sweethome3d:${VER} -t asdlfkj31h/sweethome3d:latest

run:
	docker-compose up --build

push:
	docker push asdlfkj31h/sweethome3d:${VER}
	docker push asdlfkj31h/sweethome3d:latest
