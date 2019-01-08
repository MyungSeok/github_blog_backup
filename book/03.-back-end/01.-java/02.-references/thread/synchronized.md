# 동기화 (Synchronizred)

Java 에서 동기화 영역은 `synchronizred` 키워드로 표시된다.  

동기화는 객체에 대한 동기화로 이루어지는데 여러 Thread 가 한 개의 자원을 사용하고자 할 때 해당 Thread 만 제외하고 나머지 Thread 의 접근을 막는 방법이다.  
블록에 접근을 시도하는 _**다른 Thread 들은 블록 안의 Thread 가 실행을 마치고 블록을 벗어날때까지 차단 (blocked) 상태**_ 가 된다.

대표적으로 _**Log Files**_ 과 같이 서로 다른 프로세스에 접근 가능한 리소스를 대상으로 사용할때 효과적이다.

> 이러한 방식을 _**배타적 접근**_ 이라고 한다.

## 장점

* `thread-safe` 하게 사용이 가능하여 사용자의 의도대로 프로그램의 흐름 제어가 가능하다.  

## 단점

* 프로그램의 성능저하를 일으킬 수 있다.
  * Java 내부적으로 메서드나 변수에 동기화를 하기 위해 `block` & `unblock` 처리를 하게되는데 이런 처리들을 통하여 소비되는 리소스가 프로그램 전반적인 성능에 영향을 준다.

`synchronized` 키워드는 다음 네가지 유형의 블록이 쓰인다.

## Syntax

### 인스턴스 메소드에 동기화 적용 (Instance Method)

_**특정 부분에 대해서만 동기화를 동기화를 할 필요가 있을 경우**_ 아래 메소드와 같이  
선언문에 있는 `synchronized` 키워드를 통하여 동기화를 한다.

```java
public synchronized void add(int value) {
  this.count += value;
}
```

Instance Method 의 동기화는 _**이 Method 를 가진 Instance (객체) 를 기준**_ 으로 한다.  
하나의 Class 가 동기화된 Instance Method 를 가지면, 동기화는 이 Class 의 하나의 Instance 를 기준으로 이루어지며 한 시점에 오직 하나의 Thread 만이 동기화된 Instance Method 를 실행할 수 있다.

> 하나의 Instance 하나의 Thread 이다.

### 정적 메소드에 동기화 적용 (Static Method)

인스턴스 메소드의 사용법과 같이 선언문에 있는 `synchronized` 키워드를 통하여 동기화를 한다.

```java
public static synchronized void add(int value) {
  count += value;
}
```

Static Method 의 동기화는 _**이 Method 를 가진 Class (객체) 를 기준**_ 으로 한다.  
JVM 안에 Class 객체는 Class 당 하나만 존재할 수 있으므로, 같은 Class 에 대해서는 오직 한 Thread 에만 동기화된 Static Method 를 실행할 수 있다.

> 하나의 Class 당 하나의 Thread 이다.

### 인스턴스 메소드 안에 동기화 적용 (Instance Method Codeblock)

동기화를 메소드 전체에 적용하는것이 아닌 메소드의 특정 부분에 적용하는것이 효율적일 때가 있다.

```java
public void add(int value) {
  synchronized(this) {
    this.count += value;
  }
}
```

### 정적 메소드에 안에 동기화 적용 (Static Method Codeblock)

_**Instance Method Codeblock**_ 과 사용법은 동일하다.

```java
public static void add(int value) {
  synchronized(this) {
    this.count += value;
  }
}
```

> ### 참고자료
> <http://parkcheolu.tistory.com/15>