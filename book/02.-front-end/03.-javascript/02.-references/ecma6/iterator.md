# Iterable & Iterator

자바스크립트의 반복문의 `for loop` 는 다음 몇가지로 나뉜다.

* for
  * 가장 기본적인 `for loop`
* forEach
  * 배열을 순회하며 `value` 와 `index` 를 매개변수로 전달한다.
  * `break`, `return` 으로 루프를 중단할 수 없다.
* for in
  * 배열의 인덱스만 순환 하는것이 아닌 프로토타입 체인을 포함한 모든 속성을 순회한다.
  * _**배열보다는 객체를 순회**_ 하기 위해 만들어진 루프이다.
* for of
  * `for in` 으로 배열을 순회할 때 생기는 문제점들을 해소하였다.

> `for of` 는 _**순회가능한 (iterable) 객체를 상대로 사용 가능**_ 하다.

순회가능한 (Iterable) 한 객체는 _**`Symbol.iterator` 심볼을 속성으로 가지고 있으며 이터레이터 객체를 반환하는 객체**_ 를 뜻한다.  
해당 스팩을 _**이터러블 프로토콜**_ 이라고 하며 _**해당 스팩을 구현한 객체를 이터러블 객체**_ 라고 한다.

## Iterator Interface

_**TC39**_ 에서 정의한 _**Iterator Interface**_ 정의를 따른 `Object` 로써 내응은 다음과 같다.

### Iterator Interface

* `next` 라는 키를 갖고 있으며 값으로 인자를 받지 않고 _**Iterator Result Object**_ 를 반환하는 함수가 온다.
* _**Iterator Result Object**_ 는 `value` 와 `done` 이라는 키를 갖고 있다.
  * `value` 는 실제 값을 의미
  * `done` 는 계속 반복 할 수 있는지 따른 `boolean` 값

영원히 `0` 을 반환하는 Iterator

```javascript
{
  next: function () {
    return {
      value: 0,
      done: false
    };
  }
}
```

각 배열을 순회하며 배열의 끝 값을 반환하는 Iterator

```javascript
{
  data: [1, 2, 3, 4]
  next: function () {
    return {
      done: this.data.length === 0,
      value: this.data.pop()
    };
  }
}
```

> ECMA6 에서는 _**객체 리터럴 작성 순서에 따라 파싱**_ 한다.  
>
> 예를 들면 위 코드의 `done` 과 `value` 중에서 `done` 이 먼저 작성되어 있기 때문에 `done` 을 먼저 파싱한다.  
> ECMA5 에서는 `done` 이든 `value` 든 어느것을 먼저 파싱할지 보장이 안됨

## Iterable Object

`Symbol.iterator` 의 키를 가지고 있는 객체로써 다음 스펙을 구현한 객체이다.

### Iterable Spec

* `Symbol.iterator` 의 키를 갖고 있다.
* 값으로 인자를 받지 않고 _**Iterator Object**_ 를 반환하는 함수가 온다.

```javascript
{
  [Symbol.iterator]: function () {
    return {
      next: function {
        return { value: 1, done: false };
      }
    };
  }
}
```

> ### 참고자료
> [ECMA-262 - Iterable Interface](http://www.ecma-international.org/ecma-262/6.0/#sec-iterable-interface)  
> [GDG 2016 발표자료](http://www.bsidesoft.com/?p=2913)  
> [GDG DevFest Seoul 2016 - Iterable & Iterator](https://youtu.be/CY_2mFxQwzc)

## Generator

> ### 참고자료
> <https://gist.github.com/qodot/ecf8d90ce291196817f8cf6117036997>