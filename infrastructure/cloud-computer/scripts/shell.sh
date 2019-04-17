# Export cloud computer shell environment
export $(yarn environment)

# Export local git config
export $(yarn --cwd ../git environment)

# Point shell context to the current environment's terraform host
export $(yarn --cwd ../terraform environment)

yarn --cwd ../docker docker run \
  --env CLOUDSDK_CONFIG=$CLOUD_COMPUTER_GCLOUD \
  --env DISPLAY=$CLOUD_COMPUTER_XEPHYR_DISPLAY \
  --env DOCKER_CONFIG=$CLOUD_COMPUTER_DOCKER \
  --env DOCKER_HOST=unix:///var/run/docker.sock \
  --env GIT_AUTHOR_EMAIL \
  --env GIT_AUTHOR_NAME \
  --env GIT_COMMITTER_EMAIL \
  --env GIT_COMMITTER_NAME \
  --env CLOUD_COMPUTER_BACKEND \
  --env CLOUD_COMPUTER_CERTIFICATES \
  --env CLOUD_COMPUTER_CREDENTIALS \
  --env CLOUD_COMPUTER_CODE \
  --env CLOUD_COMPUTER_CODE_SERVER \
  --env CLOUD_COMPUTER_DOCKER \
  --env CLOUD_COMPUTER_FRONTEND \
  --env CLOUD_COMPUTER_GCLOUD \
  --env CLOUD_COMPUTER_GITHUB \
  --env CLOUD_COMPUTER_HOME \
  --env CLOUD_COMPUTER_HOST_DNS \
  --env CLOUD_COMPUTER_HOST_ID \
  --env CLOUD_COMPUTER_HOST_NAME \
  --env CLOUD_COMPUTER_HOST_USER \
  --env CLOUD_COMPUTER_KUBECONFIGS \
  --env CLOUD_COMPUTER_NODEMON \
  --env CLOUD_COMPUTER_SLACKBOT \
  --env CLOUD_COMPUTER_TERRAFORM \
  --env CLOUD_COMPUTER_TMUX \
  --env CLOUD_COMPUTER_X11 \
  --env CLOUD_COMPUTER_XEPHYR_DISPLAY \
  --env CLOUD_COMPUTER_YARN \
  --env TERRAFORM_TARGET \
  --interactive \
  --name ${COMPOSE_PROJECT_NAME}_shell-$(date +%M%S) \
  --rm \
  --tty \
  --volume /etc/hosts:/etc/hosts \
  --volume /var/run/docker.sock:/var/run/docker.sock \
  --volume $HOME/.ssh:$CLOUD_COMPUTER_HOME/.ssh \
  --volume $CLOUD_COMPUTER_BACKEND_VOLUME:$CLOUD_COMPUTER_BACKEND \
  --volume $CLOUD_COMPUTER_FRONTEND_VOLUME:$CLOUD_COMPUTER_FRONTEND \
  --volume $CLOUD_COMPUTER_CERTIFICATES_VOLUME:$CLOUD_COMPUTER_CERTIFICATES \
  --volume $CLOUD_COMPUTER_CODE_VOLUME:$CLOUD_COMPUTER_CODE \
  --volume $CLOUD_COMPUTER_CODE_SERVER_VOLUME:$CLOUD_COMPUTER_CODE_SERVER \
  --volume $CLOUD_COMPUTER_CREDENTIALS_VOLUME:$CLOUD_COMPUTER_CREDENTIALS \
  --volume $CLOUD_COMPUTER_DOCKER_VOLUME:$CLOUD_COMPUTER_DOCKER \
  --volume $CLOUD_COMPUTER_GCLOUD_VOLUME:$CLOUD_COMPUTER_GCLOUD \
  --volume $CLOUD_COMPUTER_GITHUB_VOLUME:$CLOUD_COMPUTER_GITHUB \
  --volume $CLOUD_COMPUTER_HOME_VOLUME:$CLOUD_COMPUTER_HOME \
  --volume $CLOUD_COMPUTER_KUBECONFIGS_VOLUME:$CLOUD_COMPUTER_KUBECONFIGS \
  --volume $CLOUD_COMPUTER_TERRAFORM_VOLUME:$CLOUD_COMPUTER_TERRAFORM \
  --volume $CLOUD_COMPUTER_TMUX_VOLUME:$CLOUD_COMPUTER_TMUX \
  --volume $CLOUD_COMPUTER_X11_VOLUME:$CLOUD_COMPUTER_X11 \
  --volume $CLOUD_COMPUTER_YARN_VOLUME:$CLOUD_COMPUTER_YARN \
  --workdir $CLOUD_COMPUTER_BACKEND \
  cloud-computer/cloud-computer:latest zsh --login
