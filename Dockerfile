FROM golang:1.8-alpine
MAINTAINER André M. Ribeiro dos Santos "andremrsantos@gmail.com"

RUN apk update && \
    apk --no-cache add \
    ca-certificates \
    git \
    diffutils \
    emacs

ENV HOME /home/user
ENV GOPATH /godev
ENV PATH /godev/bin:$PATH
ENV TERM xterm-256color

RUN adduser -D -u 1000 user && mkdir -p $HOME && chown -R user:user $HOME

COPY emacs.d $HOME/.emacs.d/
RUN mkdir -p $HOME/.emacs.d/private/cache && \
    emacs --batch --load $HOME/.emacs.d/init.el && \
    chown -R user:user $HOME/.emacs.d/

USER user
CMD ["emacs", "./"]
