# tcpproxy_server
A proxy server for TCP with option of inducing packet delays
The original source is taken from [http://www.partow.net](http://www.partow.net/programming/tcpproxy/index.html) and only slightly modified to compile for mac and also add the option for delay
## build
`make clean`

`make`
## usage
`tcpproxy_server <listening ip> <listening port> <forward host ip> <forward port> <delay_ms>`

Ex: `tcpproxy_server 127.0.0.1 8080 127.0.0.1 6379 5000`

This proxy can used for any tcp commnication like: database, redis, http, etc.

The delay makes it easy to test the timeouts for these interactions.

