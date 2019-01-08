# Spring Boot

## Spring Boot 기동

### Linux Deploy Shell Script

리눅스 환경에서 쉽게 관리를 위해 _**Shell Script**_ 형태로 만들어 두어 관리한다.

#### start.sh

앱을 시작하고 해당 _**PID**_ 를 파일에 저장한다.

```bash
#!/bin/bash
java -jar myapp.jar & echo $! > ./pid.file &
```

#### stop.sh

저장된 _**PID**_ 를 사용하여 앱을 중지 한다.

```bash
#!/bin/bash
kill $(cat ./pid.file)
```

> ### 참고자료
> <https://code.i-harness.com/ko/q/195154c>

#### Gradle 로 Spring Boot 기동

```bash
# gradle bootRun
```

#### 빌드 파일 기동

기본 기동

```bash
$ java -jar ./sq_wf-0.0.1-SNAPSHOT.jar
```

포트 `8888` 변경하여 기동

```bash
$ java -jar -Dserver.port=8888 ./sq_wf-0.0.1-SNAPSHOT.jar
```

`spring.profiles.active` 값 지정하여 기동

```bash
$ java -jar -Dserver.port=8888 -Dspring.profiles.active=release ./sq_wf-0.0.1-SNAPSHOT.jar
```

## 히카리 (Hikari CP)

Spring Boot 2.0 부터 지원 하는 JDBC Connection Pool 이다.

> ### 참고자료
> <http://jeong-pro.tistory.com/162>  
> <http://netframework.tistory.com/entry/HikariCP-소개>