# Generator

[Iterator Interface](/02.-front-end/03.-javascript/02.-references/ecma6/iterator.html) 를 구현한 확장형 함수

## Example #1 - ES6

```javascript
function* foo() {
  yield '첫번째 호출';
  yield '두번째 호출';
  yield '세번째 호출';
  yield '네번째 호출';
}

var _foo = foo();
for (var i = 0; i < 10; ++i) {
  console.log(_foo.next());
}
```

네번째 까지만 정상 로그가 찍히며 이후로는 `{ value: undefined, done: false }` 로 나온다.

```javascript
// Object { value: '첫번째 호출', done: false }
// Object { value: '두번째 호출', done: false }
// Object { value: '세번째 호출', done: false }
// Object { value: '네번째 호출', done: false }
// Object { value: undefined, done: false }
// Object { value: undefined, done: false }
// Object { value: undefined, done: false }
// Object { value: undefined, done: false }
// Object { value: undefined, done: false }
// Object { value: undefined, done: false }
```

## yield

제너레이터 함수를 중지 시키거나 재개하는데 사용한다.

### Syntax

```javascript
[rv] = yield [expression];
```

#### Parameters

* rv
  * 제너레이터 실행을 재개 하기 위해서, optional value을 제너레이터의 `next()` 메서드로 전달하여 반환
* expression
  * 제너레이터 함수에서 제너레이터 프로토콜을 통해 반환값을 정의 한다. (Default : undefined)


> Reference
> http://hacks.mozilla.or.kr/2015/08/es6-in-depth-generators/