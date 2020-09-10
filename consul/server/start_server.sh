docker run \
	-d \
	-p 8500:8500 \
	-p 8600:8600/udp \
	--name=consul-server \
	test:latest \
	--network=robot-shop_robotshop 
