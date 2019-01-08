# 자바 퍼시스턴스 API (JPA : Java Persistence API)

ORM 의 표준 기술로 [`Hibernate`](/book/03.-back-end/05.-framework/hibernate.html), `OpenJPA`, `EclipseLink`, `TopLink` `Essentials`  과 같은 구현체가 있고, 이들의 대한 _**표준 인터페이스**_ 이다.

* 장점
  * _**객체지향적으로 개발 및 데이터를 관리**_ 할 수 있기 때문에 비지니스 로직에 집중할 수 있다.
  * 테이블의 생성, 변경, 관리가 쉽다.
  * 빠른 개발이 가능하다.
  * DB 에 의존적이지 않다.
    * MySQL, Oracle, Sysbase, Derby, PostgreSQL 등등의 데이터 베이스 지원
    * POJO 기반의 모델의 지원
* 단점
  * 객체지향을 이해하고 개발 해야 하는 만큼 러닝커브가 높다.
  * 성능상의 문제가 있을수 있다.

> ### 참고자료
> <http://blog.woniper.net/255>