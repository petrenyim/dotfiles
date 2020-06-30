#!/bin/bash

readonly DOCKER_PS="$(docker ps | grep petrenyim_env | wc -l)"

if [[ "${DOCKER_PS}" != "0" ]]; then
  docker exec -it petrenyim_env tmux -S /tmux_sessions/session attach
else
  docker run --rm \
	-it \
	-v "/:/host" \
	-v "$(pwd)/dotfiles:/dotfiles" \
	-v "/home/${USER}/.tmux_sessions:/tmux_sessions" \
	--name petrenyim_env \
	-w "/host/home/${USER}" env tmux -S /tmux_sessions/session new-session
fi
