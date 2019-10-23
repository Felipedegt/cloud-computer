# Export cloud computer shell environment
eval "$(yarn --cwd ../cloud-computer environment)"

yarn --cwd ../docker docker run \
  --rm \
  --volume CLOUD_COMPUTER_YARN:$CLOUD_COMPUTER_YARN \
  $CLOUD_COMPUTER_IMAGE \
  tail -f $CLOUD_COMPUTER_YARN/trace.log
