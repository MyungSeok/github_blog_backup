# Template Method Design Pattern (템플릿 메소드 디자인 패턴)

상위 추상 클래스가 대략적인 로직을 잡아두고 실제로 상세한 구현은 상속을 받아 구현을 강제하도록 하는것

```java
public abstract class Car {
 public void playWithOwner() {
   System.out.println("Start");

   play();

   runSomeThing();
 } 

 abstract void play();

 void runSomething() {
   System.out.println("Something");
 }
}
```

```java
public class Auto extends Car {
  @Override
  void play() {
    System.out.println("move Car");
  }

  void runSomething() {
    System.out.println("Something others");
  }  
}
```

```java
public class Main {
  public static void main(String[] args) {
    Car auto = new Auto();

    auto.playWithOwner();
  }
}
```

```log
Start 
move Car
Something others
```

> ### 참고자료
> <http://limkydev.tistory.com/81?category=957882>