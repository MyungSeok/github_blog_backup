# Symbol

ES6 에서 나온 원시 데이터형 ([Primitive DataType](https://developer.mozilla.org/en-US/docs/Glossary/Primitive)) 의 일종으로 객체에 `Unique` 한 속성을 만들어 다른 라이브러리와 충동을 피하기 위함이다.

* Undefined
* Null
* Boolean
* Number
* String
* Object
* _**Symbol**_

## Syntax

```javascript
Symbol([description]);
```

### Parameter

* description
  * 선택적 (Optional) 문자열로 디버깅에 사용할 수 있는 설명이다.
  * 자체적으로 심볼에 접근하는 용도로 사용할 수 없음 

## Description

기본적으로 새 원시 심볼을 생성하려면 아래와 같이 선택적 문자열과 함께 `Symbol()` 을 쓰면 된다.

```javascript
var sym1 = Symbol();
var sym2 = Symbol('foo');
var sym3 = Symbol('foo');
```

매번 새로운 심볼을 생성하기 때문에 아래 같이은 조건은 성립할 수 없다.

```javascript
console.log(Symbol('foo') === Symbol('foo'))      // false
```

`new` 연산자를 이용한 문법은 `TypeError` 를 발생한다.

```javascript
var sym = new Symbol();     // TypeError
```

반드시 심볼 래퍼 객체 생성이 필요하면 Object() 함수를 이용하여 사용가능하다.

```javascript
var sym = Symbol('foo');
typeof sym;               // "symbol"
var symObj = Object(sym);
typeof symObj;            // "object"
```

## 심볼의 생성

심볼의 생성은 다음 3가지 방법이 있다.

### 고유한 심볼 생성

```javascript
var sym = Symbol('foo');
```

### 심볼 레지스트리에서 찾아서 복사

```javascript
var sym = Symbol.for('foo');
```

### 미리 정의된 상용 심볼 사용

```javascript
Symbol.iterator
```

상용심볼은 특별한 용도를 위해서 만들어 놓은 심볼이며 대표적인 상용 심볼은 다음과 같다.

* Symbol.iterator
  * 이터러블한 객체를 정의하기 위한 심볼
* Symbol.hasInstance
  * [`instanceof`](/book/02.-front-end/03.-javascript/02.-references/operator-and-expression.html?h=instanceof) 를 확장하기 위한 심볼
* Symbol.match
  * [`String.prototype.match`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/match) 메소드의 확장