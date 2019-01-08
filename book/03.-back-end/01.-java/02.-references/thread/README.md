# THREAD

## Process & Thread 의 차이

프로세스와 스레드는 서로 밀접한 관계에 있으나 서로 다른 개체이다.

### Process

* 실행중인 프로세스 객체
* _**CPU 시간이나 메모리 등의 시스템 자원이 할당되는 독립적인 개체**_
* 각 프로세스는 별도의 주소 공간에서 실행 되며, _**한 프로세스는 다른 프로세스의 변수나 자료구조에 접근할 수 없음**_
* 같은 메모리를 읽고 쓰는 프로세스는 생성 가능
* 프로세스간의 통신은 Pipe, Socket, File 등으로 통신한다.

### Thread

* 프로세스가 할당받은 자원을 이용하는 실행의 단위
* 프로세스와 같은 공간의 Stack 공간을 사용하며 여러 Thread 는 그 상태의 일부를 공유한다.

> _**Multi Thread**_ 환경의 작업시에는 Therad 간의 자원 공유의 _**동기화 문제**_ 에 신경을 써야 한다.

## Thread 를 만드는 방법

아래와 같이 크게 3가지 방법이 있다.

* `Thread` 클래스를 확장 한다.
* `Runnable` 인터페이스를 구현
* Thread Pool 을 생성하기 위해, 어플리케이션에서 `Executor` 프레임워크를 사용한다.

> 'Runnable' 인터페이스는 상속 객체를 필요로 하지 않기 때문에 인터페이스로 적절하다.

이러한 방법들은 대부분 멀티스레드를 만들어 작업을 수행하는 과정으로  
[여기](/book/03.-back-end/01.-java/02.-references/thread/multi_thread.html)서 자세한 방법들을 소개한다.

## Thread 상태

* `NEW` : Thread 가 실행 준비가 되었습니다.
* `RUNNABLE` : JVM (Java Virtual Machine) 이 Thread 코드를 수행중입니다.
* `BLOCKED` : Thread 가 차단되어 있는 상태 입니다.
* `WAITING` : Thread 다른 Thread 의 작업이 수행되기를 기다립니다.
* `TIMED_WAITING` : Thread 가 다른 Thread 의 지정된 대기시간의 특정 작업을 수행하기까지 기다립니다.
* `TERMIATED` : Thread 의 실행을 완료했습니다.