# Solid

객체지향 4대 특성인 캡슐화, 상속, 추상화, 다형성 등을 이용하여 객체지향 프로그래밍 셜계를 도와주는 원칙들이 있다.  
이를 SOLID 원칙들이라 하며 자기 자신의 클래스의 응집도를 높이고, 타 클래스의 결합도를 낮추는 _**High-Cohesion - Loose Coupling**_ 원칙을 객체 지향관점에서 도입한것이다.

_**SOLID**_ 5대 원칙 (객체 지향 설계 5원칙)

* [SRP (Single Reponsibility Principle : 단일 책임의 원칙)](/book/03.-back-end/01.-java/01.-general/solid/srp.html)
* [OCP (Open Closed Principle : 개방 폐쇄의 원칙)](/book/03.-back-end/01.-java/01.-general/solid/ocp.html)
* [LSP (Liskov Substitution Principle : 리스코프 치환의 원칙)](/book/03.-back-end/01.-java/01.-general/solid/lsp.html)
* [ISP (Interface Segregation Principle : 인터페이스 분리의 원칙)](/book/03.-back-end/01.-java/01.-general/solid/isp.html)
* [DIP (Dependency Inversion Principle : 의존 역전의 원칙)](/book/03.-back-end/01.-java/01.-general/solid/dip.html)

## SRP (Single Reponsibility Principle : 단일 책임의 원칙)

작성된 _**클래스는 하나의 기능만 가지며**_ 클래스가 제공하는 모든 서비스는 그 _**하나의 책임을 수행하는데 집중**_ 되어야 한다는것

> 리팩토링 (Refactoring) 을 통하여 해당 책임을 최상의 상태로 분배

## OCP (Open Closed Principle : 개방 폐쇄 원칙)

소프트웨어의 구성요소 (컴포넌트, 클래스, 모듈, 함수) 는 확장에는 열려 있고, 변경에는 닫혀 있어야 한다는 의미이다.  
기존의 구성요소는 수정이 일어나지 말아야 하며, 기존의 구소요소를 쉽게 확장하여 재 사용 가능해야 한다는 뜻이다.

> 확장 될것과 불변의 속성을 엄격히 구분한다. 
> 두 모듈이 만나는 지점에 인터페이스를 정의한다.
> 구현에 의존하기보다 정의한 인터페이스에 의존하도록 코드를 작성한다.

## LSP (Liskov Substitution Principle : 리스코프 치환 원칙)

* 파생 클래스는 부모타입과 호환이 되어야 한다.
* 서브타입은 언제나 기반 타입과 호환될 수 있어야 한다.  
* 하위 클래스가 상위 클래스의 역할을 대신할 때 논리적으로 맞아 떨어져야 한다.

## ISP (Interface Segregation Principle : 인터페이스 분리 원칙)

최소한의 의미에 맞는 인터페이스만 구현해야 한다.

> 클래스 인터페이스를 통한 분리  
> 객체 인터페이스를 통한 분리 

## DIP (Dependency Inversion Principle : 의존 역전 원칙)

하위 레벨모듈의 변경이 상위 레벨 모듈의 변경을 요구하는 역전현상

> ### 참고자료
> <http://www.nextree.co.kr/p6960/>  
> <http://limkydev.tistory.com/77>  
> <http://choipattern.blogspot.com/2013/08/solid.html>