# 개방 폐쇄의 원칙 (OCP : Open Closed Principle)

[SOLID](/book/03.-back-end/01.-java/01.-general/solid/) 원칙중에서 2번재 원칙으로 개방폐쇄의 원칙이라 한다.

* 확장 될것과 불변의 속성을 엄격히 구분한다.
* 두 모듈이 만나는 지점에 인터페이스를 정의한다.  
* 구현에 의존하기보다 정의한 인터페이스에 의존하도록 코드를 작성한다.

## 정의

* 소프트웨어의 구성요소 (컴포넌트, 클래스, 모듈, 함수) 는 확장에는 열려 있고, 변경에는 닫혀 있어야 한다.

이는 기존의 구성요소는 수정이 일어나지 말아야 하며, _**기존의 구성요소를 쉽게 확장하여 재사용 가능**_ 해야 한다는 뜻이며, 프로그램 설계 과정에서 많은 고민이 되어 있어야 하고 이를 위해 자주 사용되는 문법이 `interface` 를 활용한 방법이다.

아래 예시를 통하여 OCP 의 위배 사항을 살펴 보자

```java
class SoundPlayer {
  void play() {
    System.out.println("play wav");
  }
}
public class Client {
  public static void main(String[] args) {
    SoundPlayer sp = new SoundPlayer();
    sp.play();
  }
}
```

상기 코드에서 `play()` 를 다른 파일 포맷의 재생을 원한다면 OCP 원칙에 위배된다.

이러한 경우에는 `interface` 를 구성하여 OCP 를 만족한다.

```java
interface playAlgorithm {
  public void play();
}

class Wav implements playAlgorithm {
  @Override
  public void play() {
    System.out.println("Play Wav");
  }
}

class Mp3 implements playAlgorithm {
  @Override
  public void play() {
    System.out.println("Play Mp3");
  }
}
```

위와 같이 재생하고자 하는 `playAlgorithm` 인터페이스의 `play()` 를 재정의 하도록 설계한다.

이와 같은 설계 방식을 디자인 패턴에서는 [전략 패턴 (Strategy Pattern)](/book/03.-back-end/01.-java/01.-general/design_pattern/strategy.html) 이라고 한다.

OCP 를 만족한 설계는 다음과 같은 장점이 있다.

* 변경에 유연하게 대처 가능하다.
* 유지보수 비용이 감소된다.
* 코드의 가독성이 높아진다.

> ### 참고자료
> <https://code.tutsplus.com/tutorials/solid-part-2-the-openclosed-principle--net-36600>