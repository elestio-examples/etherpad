#set env vars
set -o allexport; source .env; set +o allexport;

#wait until the server is ready
echo "Waiting for software to be ready ..."
sleep 30s;

docker-compose exec -T etherpad bash -c "npm install ep_webrtc && src/bin/installDeps.sh"