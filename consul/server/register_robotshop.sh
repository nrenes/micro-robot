docker exec consul-agent /bin/sh -c "echo '{\"service\": {\"name\": \"web\", \"tags\": [\"go\"], \"port\": 8080}}' >> /consul/config/web.json"


