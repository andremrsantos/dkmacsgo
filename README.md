# Dkmacs

    docker run --rm -it \
        -v ${HOME}/.gitconfig:/root/.gitconfig \
        -v ${GOPATH}:/godev \
        -v ${PWD}:/workspace \
        dkmacs
