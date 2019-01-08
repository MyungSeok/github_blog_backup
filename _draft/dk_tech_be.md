# Backend
## 언어 일반, 개념
GREY : 하
GREEN : 중
BLUE : 상

GREY
### integer가 몇 바이트인가? 

* 4byte

GREY
### short integer의 최하/최상 값은 얼마인가?

* The short data type is a 16-bit signed two's complement integer. It has a minimum value of -32,768 and a maximum value of 32,767
2^15 ~ + (2^15 - 1)

GREY
### unsigned integer는 얼마 정도까지 표현 가능한가?

* 일반적으로 unsigned int 는 부호비트를 값비트로 쓸 수 있어서 최대값이 (2^32-1) 4294967295 값을 가진다.
Java는 Unsigned가 없음.

GREY
### Compiler 와 Interpreter의 차이를 설명해 보세요.

* A compiler is a piece of code that translates the high level language into machine language. When a user writes a code in a high level language such as Java and wants it to execute, a specific compiler which is designed for Java is used before it will be executed.
Interpreters are not much different than compilers. They also convert the high level language into machine readable binary equivalents. Each time when an interpreter gets a high level language code to be executed, it converts the code into an intermediate code before converting it into the machine code.

GREY 
### Java에서 instanceof 연산자란 무엇인가요?

* 참조변수가 참조하고 있는 인스턴스의 실제 타입을 알아보기 위해 instanceof 연산자를 사용
주로 조건문에 사용되며, instanceof의 왼쪽에는 참조변수를 오른쪽에는 타입(클래스명)이 피연산자로 위치

GREEN
### Stack과 Heap Memory 장단점과 해제 방법에 대해 각각 설명해 보세요.

* Stack
  * 빠른 접근, cpu에 의해 관리됨, 지역 변수에만 할당, limit on stack size, resize 불가.

* Heap
  * 전역적으로 접근 가능, 메모리 크기에 제한 없음, 접근이 stack 보다 느림, resize 가능하나 파편화가 될 수 있음. 

* 해제 방식
  * 스택 - 자동, 힙 - 수동

BLUE
### quick sort는 무엇이며, quick sort의 time complexity는 어떻게 되나?

* 다른 원소와의 비교만으로 정렬을 수행하는 비교 정렬중 하나, 리스트 가운데 하나의 원소를 고르고 이를 pivot 이라고 하며 pivot 앞에는 pivot 보다 값이 작은 모든 원소들이 오고, pivot 뒤에는 pivot 보다 큰 값이 오도록 리스트를 만든다.
* Worst case performance O(n2)
* Best case performance O(n log n)
* Average case performance O(n log n)
* Pivot 선택이 속도에 영향을 줄 수 있음.

GREY
### java에서 public static void main (..)으로 시작합니다. public과 static을 붙이는 이유는?

* 메인 메서드는 진입점(Entry Point)을 뜻함. 그러므로 접근자는 public 이어야 함.
* 함수에 static 을 붙이면 객체 instance 가 생성되기 전에 호출할 수 있다. 
* 클래스는 메모리에 로딩된 다음에 사용이 가능
* main함수는 프로그램 최초에 호출되는 함수이기 때문에 객체 생성이전에 호출할 수 있어야 한다.
* static이 붙은 클래스나 메서드, 변수는 컴파일시 자동으로 로딩.

GREEN 
### Separation Of Concern(관심의 분리)에에 대해 설명하고 예를 들어 설명해 주세요.

* 관심의 분리는 서비스 지향 아키텍처(Service-Oriented Architecture; SOA)의 핵심 원칙
관심이 다른것은 가능한한 따로 떨어져서 서로 영향을 주지 않도록 하며, 관심이 같은 것은 하나의 객체나 관련 객체로 모이도록 설계 및 구현 하는것.

GREEN 
### AOP에 대해 설명해주세요. AOP의 부작용이 어떤게 있을까요? (천정환)

* 기능을 핵심 비지니스 로직과 공통 모듈로 구분하고, 핵심 로직에 영향을 미치지 않고 사이사이에 공통 모듈을 효과적으로 잘 끼워넣도록 하는 개발 방법입니다.
* 공통 모듈(보안 인증, 로깅 같은 요소등)을 만든 후에 코드 밖에서 이 모듈을 비지니스 로직에 삽입하는 것이 바로 AOP 적인 개발이다. 코드 밖에서 설정된다는 것이 핵심입니다.
* 프로그램 흐름을 파악하기가 힘들기 때문에 AOP 사용이 많아질 경우 유지보수가 힘들다는 단점이 존재합니다.

GREEN 
### BDD에 대해 설명해주세요. TDD와 무슨 연관이 있을까요? (천정환)

* Behavior Driven Development (행위 주도 개발) 의 약자입니다.
* BDD 는 소프트웨어 품질을 향상하기 위해 개발자간에 협력할 수 있는 Agile Software Development 기법입니다. BDD 의 목표는 TDD 를 수행하기 위한 것이며 TDD 의 접근법을 전환한 것입니다.
* TDD 의 딱딱한 어휘를 정리하고 설계나 디자인에 초점이 맞추어진 패러다임의 전환이라고 합니다. 그리하여 TDD 를 수행한다는 본질은 변하지 않지만, TDD 를 수행하기 위해 BDD 를 통해 행위 자체는 변할 수 있습니다.

## 자바 

GREEN
### String VS StringBuffer의 차이를 설명하라.

* String Class의 경우, Character를 조작하기 위한 것이며 단순한 상태를 가지고 있고, Immutable 이다.
* StringBuffer Class의 경우, 문자열을 재구성하기 위한 것이며 수정이 가능하다.

GREY
### 연결질문 - 문자열을 연산해야 할 경우 어느것이 더 효과 적인가? 

* String을 이용한 문자열 연산

```java
String str =new String("Stanford  ");
str += "Lost!!”;
```

* StringBuffer 을 이용한 문자열 연산
```java
StringBuffer str =new StringBuffer("Stanford ");
str.append("Lost!!”);
```

GREEN
### CheckedException과 UncheckedException 의 차이와 용도를 설명해 보세요.

* Checked Exception
  * 외부상황에 의해 미리 예상 가능한 오류이다
  * 예) 디스크 오류, 네트워크 오류등 로직 상의 오류와는 무관하게 발생하는 에러.
  * IOException, ClassNotFoundException, CloneNotSupportedException등등
  * RuntimeException을 제외한 Exception을 직접 상속한 모든 예외 클래스는 Checked Exception.
* Unchecked Exception
  * 프로그램 로직 상에 문제로 인해 생기는 오류이다.
  * RuntimeException 이하 모든 하위클래스는 Unchecked exception이다.
  * 발생한 예외에 대하여 반드시 코드상에서 예외 처리를 하도록 요구하지 않는다.
  * NullPointerException의 경우 null을 참조하려는 시도는 프로그램 코드 자체가 잘못된 것.
  * 이런 예방 할 수 없는 오류 조건들은 로직 상에서 처리를 요구

GREY
### 객체 재사용이란 무엇인가?

* ThreadPool, ConnectionPool 등 이외에도 코드내에서 객체를 재사용하는 방법은 아는대로 설명 하시오.
* Singelton Instance.
* new() 대신 초기화 메소드 활용.

```java
StringBuffer sb = new StringBuffer();
sb.append(“data1”);
System.out.println(sb);
sb.setLength(0);
```