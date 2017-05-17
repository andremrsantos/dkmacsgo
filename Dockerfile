FROM golang:1.8-alpine

MAINTAINER André M. Ribeiro dos Santos "andremrsantos@gmail.com"

RUN apk update && apk --no-cache add ca-certificates git emacs

COPY emacs.d /root/.emacs.d
RUN mkdir -p /root/.emacs.d/private/cache/ && \
    emacs --batch --load /root/.emacs.d/init.el

ENV GOPATH /godev
ENV PATH /godev/bin:$PATH
WORKDIR /workspace

CMD ["emacs", "./"]
