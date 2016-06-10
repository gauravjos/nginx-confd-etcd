To run

docker run -d -p host_port:80 -e ETCDKEY=etcd-key -e ETCDURL=etcd_http_url -e CONFDINT=interval_in_secs gauravsj9/nginx-confd-etcd

for example

docker run -d -p 5555:80 -e ETCDKEY=apache -e ETCDURL=http://127.0.0.1:4001 -e CONFDINT=10 gauravsj9/nginx-confd-etcd
