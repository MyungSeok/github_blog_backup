# 설치 (Installation)

## Docker Ubuntu 이미지를 받아서 설치

[Docker](/book/03.-back-end/06.-devops/docker/cli.html) 관련 내용과 중복될 수 있습니다.

* 설치 환경
  * Ubuntu 18.0.4 LTS

### 설치 준비

#### ubuntu 이미지 받기

```bash
$ docker pull ubuntu:latest
```

#### Container 생성하기

```bash
$ docker run -i -t -d -p 9000:9000/tcp --name square-dev ubuntu /bin/bash
```

#### `apt-get` 업데이트

```bash
$ apt-get update
```

#### `vim` 설치

```bash
$ apt-get install vim
```

### Package 를 이용한 nginx 설치

#### `nginx` 다운로드 및 설치

설치 여부를 묻는게 귀찮으니 `-y` 옵션을 준다.

```bash
$ apt-get install nginx -y
```

#### 설치 확인

```bash
$ nginx -v

nginx version: nginx/1.14.0 (Ubuntu)                                  # version

$ nginx -t

nginx: the configuration file /etc/nginx/nginx.conf syntax is ok      # config file 내용 (문법) 검사
nginx: configuration file /etc/nginx/nginx.conf test is successful    # config file 테스트 결과
```

#### nginx 상태

```bash
$ service nginx status
```

#### nginx 중지

```bash
$ service nginx stop
```

#### nginx 기동

```bash
$ service nginx start
```