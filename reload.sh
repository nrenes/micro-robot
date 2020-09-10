##docker-compose down
#docker-compose build
#docker-compose up -d
#docker-compose logs -f

docker-compose down --remove-orphans && docker-compose -f consul.yaml up -d --build && docker-compose up -d --build
