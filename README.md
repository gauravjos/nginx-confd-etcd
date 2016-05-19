docker run -d -p 5555:80 -e ETCDKEY=hello-80 -e ETCDURL=http://172.27.59.156:4001 -e CONFDINT=10 gauravsj9/nginx-confd-etcd
