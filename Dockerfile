FROM golang:1.8-alpine
MAINTAINER André M. Ribeiro dos Santos "andremrsantos@gmail.com"

RUN apk update && \
    apk --no-cache add \
    ca-certificates \
    git \
    diffutils \
    emacs

ENV TERM xterm-256color
ENV GOPATH /godev
ENV PATH /godev/bin:$PATH

COPY emacs.d $HOME/.emacs.d/
RUN mkdir -p $HOME/.emacs.d/private/cache && \
    emacs --batch --load $HOME/.emacs.d/init.el

WORKDIR $HOME/workspace

CMD ["emacs", "./"]
