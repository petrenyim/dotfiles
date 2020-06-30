FROM ubuntu

LABEL maintainer="Mihaly Petrenyi <petrenyimisi@gmail.com>"

RUN apt-get update

ENV DEBIAN_FRONTEND=noninteractive
RUN ln -fs /usr/share/zoneinfo/Europe/Budapest /etc/localtime
RUN apt-get install -y tzdata
RUN dpkg-reconfigure --frontend noninteractive tzdata

RUN apt-get install -y neovim git tmux cargo ripgrep

RUN cargo install du-dust
RUN cp /root/.cargo/bin/dust /bin/dust

RUN apt-get install -y mlocate

COPY ./dotfiles /dotfiles

RUN echo "source /dotfiles/aliases" >> ~/.bashrc
RUN echo "source /dotfiles/prompt" >> ~/.bashrc
COPY ./dotfiles/tmux.conf ~/.tmux.conf

RUN updatedb

CMD ["tmux"]
