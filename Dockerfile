# Minimal Docker image for FastTree v2.1.11 using Alpine base
FROM alpine:3.13.5
MAINTAINER Niema Moshiri <niemamoshiri@gmail.com>

# install FastTree
RUN apk update && \
    apk add bash gcc musl-dev && \
    wget "http://www.microbesonline.org/fasttree/FastTree.c" && \
    gcc -DUSE_DOUBLE -O3 -finline-functions -funroll-loops -Wall -o FastTree FastTree.c -lm && \
    gcc -DUSE_DOUBLE -DOPENMP -fopenmp -O3 -finline-functions -funroll-loops -Wall -o FastTreeMP FastTree.c -lm && \
    mv FastTree FastTreeMP /usr/local/bin && \
    rm FastTree.c
