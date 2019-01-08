# CLI

## Version

### 버전 확인 \(version\)

```bash
$ docker version
$ docker --version
$ docker version
```

### 정보 확인 \(info\)

```bash
$ docker info
```

## Image

### 이미지 찾기 \(search\)

#### Syntax

```bash
$ docker search IMAGE
```

#### Example

```bash
$ docker search ubuntu
```

### 이미지 다운 \(pull\)

#### Syntax

```bash
$ docker pull IMAGE[:TAG]
```

#### Example

```bash
$ docker pull ubuntu:latest
```

### 이미지 목록 \(ls\)

#### Syntax

```bash
$ docker image ls
```

### 이미지 삭제 \(rmi\)

#### Syntax

```bash
$ docker rmi IMAGE[:TAG]
```

#### Example

```bash
$ docker rmi ubuntu
```

## Container

### 컨테이너 생성 \(run\)

#### Syntax

```bash
$ docker run [OPTIONS] IMAGE[:TAG|@DIGEST] [COMMAND] [ARG...]
```

#### Example

```bash
$ docker run -i -t -d -p 80:80/tcp --name ubuntu_container ubuntu /bin/bash
```

ubuntu 이미지를 컨테이너로 생성

* ubuntu 이미지를 컨테이너로 생성
* `-i`\(interactive\)
  * 표준 입력\(stdin\)을 활성화
  * 컨테이너와 연결\(attach\)되어 있지 않더라도 표준 입력을 유지합니다.
  * 보통 이 옵션을 사용하여 Bash에 명령을 입력합니다.
* `-t`\(Pseudo-tty\)
  * TTY 모드
  * Bash Shell 사용하려면 필요한 옵션
  * 이 옵션을 설정하지 않으면 명령을 입력할 수는 있지만 셸이 표시되지 않습니다.
* `-d` \(detached\)
  * 데몬 모드
  * 컨테이너가 백그라운드로 동작 된다
* `-v` \(volume\)
  * 호스트의 디렉토리가 데이터 볼륨으로 생성되어 공유된다.
  * \[HOST\_PATH\] : \[CONTAINER\_PATH\]
* `-p` \(port\)
  * 컨테이너 포트 포워딩
  * \[HOST\_PORT\] : \[CONTAINER\_PORT\]
* `--name`
  * 컨테이너의 이름을 지정
* `/bin/bash` 쉘을 이용하여 입출력을 할 수 있다.

#### 컨테이너 목록 \(ls\)

```bash
$ docker container ls [option]       # running
$ docker container ls --all          # all
$ docker container ls -aq            # all and quite mode
```

#### 컨테이너 기동 \(start\)

```bash
$ docker start CONTAINER
```

#### 컨테이너 재시작 \(restart\)

```bash
$ docker restart CONTAINER
```

#### 컨테이너 접속 \(attach\)

```bash
$ docker attach CONTAINER
```

#### 컨테이너 내부 명령 실행 \(exec\)

```bash
$ docker exec CONTAINER COMMAND [ARG...]
```

> Docker 를 컨테이너로 진입 후 exit 명령어로 컨테이너를 빠져 나오면 컨테이너가 종료되기 때문에 이에 대해 사용한다.

```bash
$ docker exec -it CONTAINER /bin/bash
```

CONTAINER 이름을 가진 컨테이너에 `/bin/bash` 쉘을 사용한다.  
`exit` 명령어로 Shell \(컨테이너\) 을 빠져 나와도 컨테이너가 종료되지 않는다.

#### 컨테이너 삭제 \(rm\)

```bash
$ docker rm CONTAINER
```

#### 컨테이너 세부정보 확인 (inspect)

컨테이너의 세부정보를 json 형태로 확인 가능

```bash
$ docker inspect CONTAINER
```

#### 컨테이너에 파일 복사 \(cp\)

##### 컨테이너 -&gt; 호스트

```bash
$ docker cp CONTAINER:CONTAINER_FILE_PATH HOST_FILE_PATH
```

##### 호스트 -&gt; 컨테이너

```bash
$ docker cp HOST_FILE_PATH CONTAINER:CONTAINER_FILE_PATH
```

```bash
$ docker cp ubuntu:/etc/nginx/nginx.conf ./
```

`ubuntu` 내에 있는 `nginx.conf` 파일을 지정된 로컬 호스트 경로로 복사한다.