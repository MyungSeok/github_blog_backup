# Reference

## Java Collection Framework (JCF)

Java 에서 데이터를 저장하는 기본적인 자료구조들을 한곳에 모아 관리하고 편하게 사용하기 위해서 제공하는 것  
JCF 의 상속 구조이며 사용용도에 따랄 `List` `Set` `Map` 으로 나뉜다.

모든 콜렉션의 상위 인터페이스로써 콜렉션들이 갖고 있는 핵심 메소드를 선언 (add, contain, isEmpty, remove, size, iterator ...)

| 인터페이스 | 구현체(클래스) | 특징 |
|:--|:--|:--|
|List|LinkedList<br>Stack<br>Vector<br>ArrayList|순서가 있는 데이터의 집합|
|Set|HashSet<br>TreeSet|순서를 유지하지 않는 집합<br>데이터의 중복이 허용되지 않는다.|
|Map|HashMap<br>TreeMap<br>HashTable<br>Properites|키 와 값의 쌍으로 이루어진 데이터 집합이며 순서를 유지하지 않는 집합이다.<br>데이터의 중복이 허용되지 않지만 값의 중복은 허용한다.|

> ### 참고자료  
> <http://hackersstudy.tistory.com/26>