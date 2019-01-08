# Performance

## String / StringBuffer / StringBuilder 의 사용

문자열을 더하는 식에는 `string` 보다는 `stringBuffer` 나 `stringBuilder` 을 사용해야 한다.

`string` 은 새로운 값을 할당할 때마다 새로 생성되기 때문 \(클래스의 메모리 참조 주소가 바뀜\)

`stringBuffer` 나 `stringBuilder` 는 값을 메모리에 append 하는 방식으로 클래스를 별도로 생성하지 않는다.

`stringBuilder` 는 변경 가능한 문자열로 synchronization 이 적용되지 않는다.

`stringBuffer` 는 _**멀티쓰레드 환경에서 안정적**_ 이다.