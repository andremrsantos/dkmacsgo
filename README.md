# DKmacsGO - Emacs with GO

This container provides the popular **emacs** editor running on an
interactive and isolated container with full **golang** developing
environment. It makes easy to setup and develop your **golang**
project.

    ## Basic run example
    docker run -it -v ${PWD}:/workspace dkmacsgo

## Short lived container

Since I rather use my docker on a short lived container, I mapped
the internal **GOPATH** (´/godev´) to a local volume ´/home/user/.go´.
Some go packages are required to enjoy all emacs benefits and I
recommend to install it before running. See the code example bellow:

    ## Install required packages
    ## goimports
    docker run --rm -v /home/user/.go:/godev dkmacsgo \
        go get -u golang.org/x/tools/cmd/goimports
    ## gocode
    docker run --rm -v /home/user/.go:/godev dkmacsgo \
        go get -u github.com/nsf/gocode

    ## Running
    docker run --rm -it \
        -v ${HOME}/.gitconfig:/root/.gitconfig \
        -v ${GOPATH}:/godev \
        -v ${PWD}:/workspace \
        dkmacsgo

I've also mapped **.gitconfig** to the user folder to make easy
to use the internal **git**.

## Long lived container

Alternatively you can use a long-lived container, see code bellow:

    ## init the container
    docker run -it \
        -name dkmacs \
        -v ${HOME}/.gitconfig:/root/.gitconfig \
        -v ${PWD}:/workspace \
        dkmacsgo

    ## on other windon install required packages
    docker exec dkmacs go get -u github.com/nsf/gocode
    docker exec dkmacs go get -u golang.org/x/tools/cmd/goimports
