# Spring

## AOP \(Aspect Oriented Programming : 관점 지향 프로그래밍\)

_**어플리케이션 전체에 사용되는 기능을 재사용 하도록 지원**_ 하도록 도와주는 것 

_**관심의 분리 \(Seperation of Concerns\) 를 통하여 핵심 관심 사항 \(입금, 출금, 이체\) 에 집중**_ 하는것이다.

![](../../../.gitbook/assets/image%20%283%29.png)

#### 장점

* 중복되는 코드 제거
* 효율적인 유지보수
* 높은 생산성
* 재활용성 극대화
* 유연한 변화 수용

## DI \(Dependency Injection : 의존성 주입\)

```java
public class Parent {
    private Child child;
    
    public void setChild(Child child) {
        this.child = child;
    }
}
```

스프링에서는 객체의 생성과 소멸에 관련된 작업을 자동으로 수행해 주는데   
객체가 생성되는곳을 _**Bean Container**_ 라고 한다.

스프링에서는 객체를 _**Bean**_ 이라고 부르며, 프로젝트가 실행될 때 사용자가 _**Bean**_ 으로 관리하는 객체들을 자동으로 생성해 준다.

스프링에서 실행할 때 생성했던 _**Bean**_ 을 주입시켜주는 과정을 _**DI**_ 라고 한다.

## IoC \(Inversion of Control : 역전 제어\)

일반적인 객체의 흐름은 다음과 같다.

1. 객체 생성
2. 의존성 객체 생성 \(클래스 내부\)
3. 의존성 객체 메소드 호출

하지만 스프링 내부에서는 다음과 같은 순서로 생성 및 실행된다.

1. 객체 생성
2. 의존성 객체 주입 \(스프링에게 위임하여 만들어놓은 객체\)
3. 의존성 객체 메소드 호출 

스프링이 모든 의존성 객체를 스프링이 실행될때 다 만들어 주고 필요한 곳에 주입시켜줌으로써   
_**Bean**_ 들은 _**싱글턴 패턴의 특징**_ 을 가진다.

제어의 흐름을 사용자가 컨트롤 하는것이 아닌 _**스프링에게 맏겨 작업을 처리**_하게 된다.

## Spring Bean Life Cycle

> Reference  
> http://javaslave.tistory.com/48

## Spring Boot 기동

#### Linux Deploy Shell Script

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

> 참고 경로   
> [https://code.i-harness.com/ko/q/195154c](https://code.i-harness.com/ko/q/195154c)

#### Gradle 로 Spring Boot 기동 

```bash
# gradle bootRun
```



