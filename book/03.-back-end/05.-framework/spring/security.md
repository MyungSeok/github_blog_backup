# Spring Security

Java EE 기반의 Enterprise Software Application 을 위한 포괄적인 보안 서비스이다.

Spring Security 는 보안을 구성하는 다음 두가지 영역이 있다.

```mermaid
  graph LR
  A["Authentication (인증)"] --> B["Authorization (권한)"]
```

* Authentication (인증)
  * 사용자가 애플리케이션 작업을 수행할 수 있는 Authorization (권한) 을 얻는 과정
* Authorization (권한)
  * 애플리케이션의 작업을 수행할 수 있도록 허락되어 있는 결정

일반적으로 _**로그인**_ 과 같은 과정들은 HTTP 기본인증을 통하여 진행되며 이는 _**Form 기반 로그인**_ 이 된다.