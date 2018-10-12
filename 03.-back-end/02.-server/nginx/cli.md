# CLI

## Installation

#### Package 를 이용한 nginx 설치

* 설치 환경
  * Ubuntu 18.0.4 LTS

```bash
$ apt-get update
```

```bash
$ apt-get install nginx -y
```

#### 설치 확인

```bash
$ nginx -v
```

## Command

#### Service Start

```bash
$ sudo service nginx start
$ sudo systemctl start nginx
$ sudo /etc/init.d/nginx start
```

#### Service Restart

```bash
$ sudo service nginx restart
$ sudo systemctl restart nginx
$ sudo /etc/init.d/nginx restart
```

#### Service Stop

```bash
$ sudo service nginx stop
$ sudo systemctl stop nginx
$ sudo /etc/init.d/nginx stop
```

#### Service Status

```bash
$ sudo service nginx status
$ sudo systemctl status nginx
```

#### Service Status Reload

* 설정파일을 변경한 후 적용시 사용 

```bash
$ sudo service nginx reload
$ sudo systemctl reload nginx
$ sudo nginx -s reload
```

#### Configuration Check

```bash
$ sudo nginx -t
```



