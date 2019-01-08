# Linux

## nslookup

nslookup 명령어는 _**네임 서버 관련 조회**_를 할 수 있는 명령어이다.  
_**서버의 네트워크가 살아있는지 확인하는 용도**_로 사용한다.

```bash
$ nslookup IP
```

```bash
$ nslookup DOMAIN
```

## dig

DIG \(Domain Information Groper\) 는 nslookup 과 동일한 기능이지만 더욱 상세한 출력이 가능합니다.

### 특정 도메인 확인

```bash
$ dig google.com
```

### 특정 네임서버를 통한 도메인 확인

```bash
$ dig @8.8.8.8 google.com
```

### 도메인 추적 확인

```bash
$ dig google.com +trace
```

> ### 참고자료
> <https://www.codns.com/b/B05-110>

## telnet

_**서버 네트워크가 살아있는지 확인하는 용도로 많이 사용**_ 한다.

```bash
$ telnet IP [PORT]
```

```bash
$ telnet DOMAIN [PORT]
```

## service

리눅스 상에 서비스로 등록되어 있는 목록을 가져온다.

```bash
# service --status-all
```

리눅스 상에 서비스를 기동 혹은 중지 시킨다.

```bash
# service SERVICE_NAME start
```

```bash
# service SERVICE_NAME restart
```

```bash
# service SERVICE_NAME stop
```

## netstat

포트별 서비스 목록

```bash
# netstat -atlpvn

# netstat -tnlp
```

### State

* **LISTENING**
  * 서비스 대기중
* **ESTABLISHED**
  * 다른 컴퓨터와 연결된 상태
* **CLOSED**
  * 연결이 종료되어 있는 상태
* **TIME WAIT**
  * 연결은 종료 되었지만 당분간은 소켓은 열어놓은 상태

### Options

* `-a`  `--all`
  * 모든 소켓을 보기
* `-c` `--continuous`
  * 현재의 실행 명령을 매 초마다 실행
* `-e` `--extend`
  * 확장 정보 추가
* `-g` `--groups`
  * 멀티캐스트에 대한 그룹별 정보를 보여줌 \(IPv4/IPv6\)
* `-i` `--interface`
  * 인터페이스별 통계값
* `-n` `--numberic`
  * 도메인을 주소를 읽지 않고 숫자로 출력한다.
  * 아래 3개의 명령어가 합쳐진 형태이다.
    * `--numberic-hosts` : 호스트 부분을 IP 로 출력
    * `--numberic-ports` : 포트 부분을 숫자로 출력
    * `--numberic-users` : 유저 부분을 숫자로 출력 \(UID\)
* `-o` `--timers`
  * 연결 대기 시간 표기
* `-p` `--program`
  * PID 와 사용중인 프로그램명을 표시
* `-r` `--route`
  * 라우팅 테이블 보기
* `-s` `--statistics`
  * 프로토콜 요약 정보
* `-t` `--tcp`
  * TCP 프로토콜 보기
* `-u` `--udp`
  * UDP 프로토콜 보기
* `-v`
  * 버전 보기
* `-w` `--row`
  * RAW 프로토콜 보기
* `-A`
  * 프로토콜별 보기
* `-M`
  * 마스커 레이딩 정보 표시

## Crontab

### CLI

에디터 열기

```bash
$ crontab -e
```

작업 목록

```bash
$ crontab -l
```

작업 삭제

```bash
$ crontab -r
```

### 주기 설정

```bash
*　　　　　　*　　　　　　*　　　　　　*　　　　　　*
분(0-59)　　시간(0-23)　　일(1-31)　　월(1-12)　　　요일(0-7)
```

초단위로 실행할 경우 `sleep` 명령어 를 이용하면 된다.

> ### 참고자료
> <https://jdm.kr/blog/2>