CONSUL_SERVER=$(docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' consul-server)

docker run \
	-d \
	--name=consul-agent \
	--network=robot-shop_robotshop \
	consul agent -node=client-1 -join=${CONSUL_SERVER}
