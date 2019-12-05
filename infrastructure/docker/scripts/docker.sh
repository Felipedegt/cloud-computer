# Export cloud computer shell environment
eval "$(yarn --cwd ../cloud-computer environment)"

# Export cloud computer dns environment
eval "$(yarn --cwd ../dns environment)"

if [ "$DOCKER_HOST" = "localhost" ] || [ "$DOCKER_HOST" = "unix:///var/run/docker.sock" ]; then

  # Always connect to localhost via the unix socket
  docker \
    --host unix:///var/run/docker.sock \
    "$@"

elif [ -z "$DOCKER_HOST" ]; then

  # Use tls when connecting to a remote host
  docker \
    --host docker.$CLOUD_COMPUTER_DNS_DOMAIN:443 \
    --tlsverify=false \
    "$@"
fi
