#
# Dockerfile for cpuminer-multi
# build: docker build --tags cpuminer-multi https://github.com/OhGodAPet/cpuminer-multi.git
# usage: docker run cpuminer-multi --url xxxx --user xxxx --pass xxxx
# ex: docker run cpuminer-multi --url stratum+tcp://ltc.pool.com:80 --user creack.worker1 --pass abcdef
#
#
FROM alpine

RUN apk add --no-cache alpine-sdk automake autoconf curl-dev

RUN		git clone https://github.com/OhGodAPet/cpuminer-multi.git

RUN		cd cpuminer-multi && ./autogen.sh
RUN		cd cpuminer-multi && ./configure CFLAGS="-march=native"
RUN		cd cpuminer-multi && make

WORKDIR		/cpuminer-multi
ENTRYPOINT	["./minerd"]
