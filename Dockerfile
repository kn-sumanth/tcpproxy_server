FROM ubuntu:16.04 as build
RUN apt-get update
RUN apt-get install -y libboost-all-dev
COPY Makefile /src/
COPY tcpproxy_server.cpp /src/
RUN apt-get install -y build-essential
WORKDIR /src
RUN make
FROM ubuntu:16.04
RUN apt-get update
RUN apt-get install -y libboost-all-dev
WORKDIR /opt
COPY --from=build /src/tcpproxy_server ./
COPY tcpproxy_server.sh ./
CMD ./tcpproxy_server.sh 0.0.0.0 $LOCAL_PORT $REMOTE_HOST $REMOTE_PORT