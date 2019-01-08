# 함수형 프로그래밍 (Functional Programming)

JDK 8 (Java Development Kit 8) 에서 제공하는 새로운 인터페이스들과 기능들을 다룬다.

## 람다 표현식 (Lamda Expression)

Java 8 에서 지원하는 람다 표현식은 고차함수를 이용하여 더 쉽게 프로그래밍 할 수 있다.

### Exmaple

```java
List<Integer> numbers = Arrays.asList(1, 2, 3, 4, 5, 6);
```

#### Case 1 : 기존 방식

모든 수를 합치기

```java
public int sumAll(List<Integer> numbers) {
  int total = 0;
  for (int number : numbers) {
    total += number;
  }

  return total;
}
```

짝수만 더하기

```java
public int sumEven(List<Integer> numbers) {
  int total = 0;
  for (int number : numbers) {
    if (number % 2 == 0) {
      total += number;
    }
  }

  return total;
}
```

#### Case 2 : 람다 표현식을 이용

```java
public int sumAll(List<Integer> numbers, Predicate<Integer> p) {
  int total = 0;
  for (int number : numbers) {
    if (p.test(number)) {
      total += number;
    }
  }

  return total;
}
```

내부에서 함수형 인터페이스인 `Predicate` 의 인자를 받아 결과를 인자로 반환하는 _**고차함수의 방식**_ 을 사용한다. (JS 의 일급객체의 속성과 유사함)

> ### 참고자료
> <https://gist.github.com/ihoneymon/3a98ea468766d6ff3678>

```java
// 모든수를 더함
sumAll(numbers, n -> true);
// 짝수만 더함
sumAll(numbers, n -> n % 2 == 0);
// 홀수만 더함
sumAll(numbers, n -> n % 2 == 1);

```

> ### 참고자료
> <http://cyberx.tistory.com/55>  
> <http://cyberx.tistory.com/79>