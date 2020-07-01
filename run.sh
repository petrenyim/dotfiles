#!/bin/bash

readonly DOCKER_PS="$(docker ps | grep petrenyim_env | wc -l)"

if [[ "${DOCKER_PS}" != "0" ]]; then
  docker exec -it petrenyim_env tmux -S /tmux_sessions/session attach
else
  docker run --rm \
	-it \
	--network=host \
	-v "/:/host" \
	-v "$(pwd)/dotfiles:/dotfiles" \
	-v "${HOME}/.ssh:/root/.ssh" \
	-v "${HOME}/.tmux_sessions:/tmux_sessions" \
	--env "HOME=/host/${HOME}" \
	--name petrenyim_env \
	-w "/host/${HOME}" env tmux -S /tmux_sessions/session new-session
fi
