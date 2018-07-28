FROM alpine as build
RUN apk --no-cache add boost
RUN apk --no-cache add g++ make boost-dev
COPY Makefile.apline /src/Makefile
COPY tcpproxy_server.cpp /src/
WORKDIR /src
RUN make
FROM alpine
RUN apk --no-cache add boost
WORKDIR /opt
COPY --from=build /src/tcpproxy_server ./
COPY tcpproxy_server.sh ./
CMD ./tcpproxy_server.sh 0.0.0.0 $LOCAL_PORT $REMOTE_HOST $REMOTE_PORT