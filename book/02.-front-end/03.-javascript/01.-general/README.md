# 01. General

## Strict Mode \(엄격 모드\)

스크립트 상단 혹은 함수의 시작 부분의 `'use strict'` 을 선언하면 `Strict Mode` 로 코드를 작성 할 수 있다.

```javascript
'use strict';

/* statement */
```

```javascript
function foo () {
  'use strict';

  /* statement */
}
```

`Strict Mode` 는 문법검사와 런타임 동작을 검사해주는 기능을 하는데 그 역활은 다음과 같다.

* 경고를 에러로 변환
* `read only` 객체는 수정불가
* `get` 으로 선언된 객체는 수정불가
* `extensible` 특성이 false 로 설정된 객체의 속성 확장 불가
* `delete` 연산 사용 불가
* `Literal Object` 의 동일한 이름의 Property 생성 불가
* 8 진수 및 Literal 및 escape 문 사용 불가
  
> ### 참고자료
> <http://beomy.tistory.com/13>

## 일급객체 \(First-Class Object\)

자바스크립트는 일급객체 \(First-Class Object\) 입니다.  
일급 객체 \(First-Class Object\) 는 다음과 같은 특징을 갖습니다.

* 일급 객체는 _**변수에 저장 가능**_ 해야 한다.
* 일급 객체는 _**함수의 파라미터로 전달**_할 수 있어야 한다.
* 일급 객체는 _**함수의 반환값으로 사용**_할 수 있어야 한다.
* 일급 객체는 _**자료구조에 저장**_할 수 있어야 한다.

## JSONP

웹 브라우저는 _**SOP \(same origin policy: 동일출처정책\)**_ 에 따라 서로 다른 도메인간의 데이터 통신을 제한하고 있다  
script 코드가 _**DOM 트리에 추가되어 실행되면 외부 스크립트를 로드할 수 있다는 것**_ 에서 착안   
`<script>` 태그는 SOP 정책에 속하지 않기 때문에 jsonp \(json width padding\) 이 사용됨

![Ajax n JSONP](/img/A001.png)

> JSONP 의 callback 은 _**서버에서 지원**_ 해줘야 정상적으로 사용이 가능

### 스크립트 태그 삽입으로 callback 함수 jsonp 구현하기

```javascript
var callback = '_callback_jsonp_' + Math.round(10000 * Math.random());

var script = document.createElement('script');
script.src = 'http://localhost:8080/getJSON.json?callback=' + callback;
document.body.appendChild(script);

window[callback] = function (data) {
    delete window[callback];

    /* 콜백 실행 로직 */
}
```

### 요청 URL 뒤에 callback 파라메터 추가하여 jsonp 요청 구현하기

#### Client

```javascript
$.getJSON('/jsonp.json?callback=?', function (data) {
    console.log('success: ', data);
});
```

#### Server

```java
private void doGet(HttpServletRequest request, HttpServleteResponse response) throws ServletException, IOException {
    request.setCharacterEncoding("UTF-8");
    response.setCharacterEncoding("UTF-8");

    String id = request.getParameter("id");
    String callBack = request.getParameter("callback");
  
    JSONObject obj = new JSONObject();
    obj.put("result", id);
    obj.put("go", "테스트");

    PrintWriter out = response.getWriter();
    out.write(callBack + "(" + obj.toString() + ")");
    System.out.println(callBack + "(" + obj.toString() + ")");
    out.flush();
    out.close();
}
```

### 요청 json 에 callback 함수로 한번 감싸서 jsonp 구현하기

#### Client

```javascript
$.ajax({
  url: "/jsonp.json",
  dataType: 'jsonp',
  jsonpCallback: "myCallback",
  success: function(data) {
    console.log('성공 - ', data);
  },
  error: function(xhr) {
    console.log('실패 - ', xhr);
  }
});
```

#### Server

```java
myCallback({"message":"You got an AJAX response via JSONP from another site!"});
```

### jsonpCallback 옵션 없이 사용하기

#### Client

```javascript
$.ajax({
  url: "/jsonp.json",
  dataType: 'jsonp',
  success: function(data) {
    console.log('성공 - ', data);
  },
  error: function(xhr) {
    console.log('실패 - ', xhr);
  }
});
```

#### Server

```java
jQuery18305806868467951786_1366340807385({"key":"value"});
```

`jsonp` 로 전달 받는 응답데이터는 다음과 같다.

```javascript
_callback_jsonp_({
  "code": 1,
  "message": "success",
  "result_set": {}
});
```

> ### Info
> * 전달 받는 데이터를 _**콜백 함수의 매개변수로 전달하여 실행**_ 시키는 구조  
> * CORS 설정을 한다면 별도의 jsonp 작업은 필요 없다.  
> * 요청 데이터의 응답 헤더가 `Access-Control-Allow-Orign: *` 으로 변경

## 암묵적 전역

자바스크립트 내에 변수 선언시에 선언자 \(`var`\) 가 없으면 _**암묵적 전역**_ 으로 인해 전역 프로퍼티로 등록 된다.

```javascript
var a = 0;
b = 2;
(function () {
    c = 3;
}());

delete a;
delete b;
delete c;

console.log(typeof a);        // number
console.log(typeof b);        // undefined
console.log(typeof c);        // undefined
```

> 프로퍼티는 `delete` 연산자로 삭제 가능

## 상속 \(Inheritance\)

### 프로토 타입을 이용한 확장

자바스크립트에는 자바와 달리 `class` 가 존재하지 않아 `prototype` 을 사용하여 class 를 구현합니다.

### 상속 Class 생성

### Example #1 : JS - ES5

```javascript
function Shape() {
    this.x = 0;
    this.y = 0;
}

Shape.prototype.move = function (x, y) {
    this.x += x;
    this.y += y;
}

function Rectangle() {
    Shape.call(this);
}

Rectangle.prototype = Object.create(Shape.prototype);
Rectangle.prototype.constructor = Rectangle; 
```

### 상속 객체 생성

### Example #1 : JS - ES5

```javascript
var rect = new Rectangle();

console.log(rect instanceof Rectangle);
console.log(rect instanceof Shape);

rect.move(1, 1);
```

> _**프로토타입의 확장을 이용한 방법**_ 은 _**Monkey Patching**_ 이라고도 하며 _**권장하지 않는 방법**_ 이다.

### `Object.create()` 를 이용한 메소드 상속 

### Example #1 : JS - ES5

```javascript
var parent = {
    num: 2,
    increase: function () {
        return (this.num + 1);
    }
}

console.log(parent.increase());     // 3

var child = Object.create(parent);

child.num = 12;

console.log(child.increase());    // 13
```

## 자료형 \(변수형\) 에 대한 차이점

ES 5 & 6 에 지원하는 자료형 \(변수형\) `var` `let` `const` 은 다음과 같은 차이점을 가진다.

|  | var | let | const |
| :--- | :--- | :--- | :--- |
| 유효범위 | function scope | block scope | block scope |
| 재할당 | O | O | X |

## 호이스팅 \(Hoisting\)

자바스크립트 엔진이 실행 컨텍스트를 생성하면서 scope 를 정의할 때 기술된 순서에 상관없이 _**선언부에 대한 처리 해석의 우선순위를 최우선으로 끌어올려 먼저 해석**_ 하는 것  
이는 다음과 같은 특징을 갖는다.

* 변수의 정의가 그 범위에 따라 _**선언과 할당으로 분리**_ 한다.
* 선언과 할당이 분리되며 에러를 야기시킬 수 있다.
* ES6 에서는 호이스팅의 지원이 없어졌다. \(ES5 식의 호이스팅 / TDZ 관점\)
* 기존 ES5 에서는 호이스팅이 있어 해당 값을 선언 후 호출하면 undefined 로 나온다.

### 예제 코드

### Example #1 : JS - ES5

```javascript
var value = 'outer scope';
(function () {
    console.log(value);        // undefined
    var value = 'inner scope';
});
```

위 코드는 아래와 같이 해석 된다.

```javascript
var value = 'outer scope';
(function () {
    var value;

    // undefined
    console.log(value);
    var value = 'inner scope';
});
```

`var` 에 비해 `const/let` 은 _**TDZ**_ 에 의해서 `ReferenceError` 가 발생한다.

```javascript
const value = 'outer scope';

(function () {
    console.log(value);
    const value = 'inner scope';
}());
```

> **TDZ \(Temporal Dead Zone\) ?**
>
> 초기화 \(선언\) 가 되지 않는 객체들을 참조 할 수 없다.  
> \(호이스팅이 되지 않는것은 아님 - ES5 처럼 undefined 로 선 할당이 안됨\)

## 함수의 선언과 표현식

### 함수 선언식 \(Function Declarations / Function Statement\)

_**실행 가능한 상태가 아니며**_  함수의 정의를 나타내는 `Statement` 으로 _**코드 해석에 따른 수행 경과가 존재 하지 않는다.**_

### Example #1 : JS - ES5

```javascript
// 함수 선언식
function foo() {
  /* statement */
}
```

### 함수 표현식 \(Function Expressions / Function Literal\)

_**실행 가능한 상태 코드**_ 로 해석되어 지거나 혹은 _**변수나 데이터 구조에 할당**_ 되어 있음을 의미한다.

### Example #1 : JS - ES5

```javascript
// 함수 표현식
var foo = function () {
  /* statement */
}
```

> _**함수의 선언식은 호이스팅에 영향**_ 을 받지만, 함수의 표현식은 호이스팅에 영향을 받지 않는다.

## 익명 함수 \(Anonymouse Function\)

함수의 선언이 아닌 _**함수 표현식을 이용하는 방법**_ 이며 즉시 실행 구문을 만들때 많이 사용된다.

익명 함수는 동적으로 할당되는 유효범위를 가지기 때문에 _**강제적인 유효범위를 설정 하는 경우에도 사용**_ 된다.

### Example #1 : JS - ES5

```javascript
(function () {
  var value = 'Hello World';
}());

console.log(value);     // ReferenceError: value is not defined
```

## 즉시 실행 구문 \(IIFE : Immediately-Invoked Function Expression\)

익명 함수 \(Anonymouse Function\) 를 이용하여 _**바로 실행 가능한 함수 표현식을 이용**_ 하여 만들어 내는 구문

### Syntax

```javascript
(function () {
  /* 실행코드 */
}());
```

### Example

기본적인 사용법

```javascript
(function () { /* statement */ })();
(function () { /* statement */ }());
(() => { /* statement */ })(); // With ES6 arrow functions (though parentheses only allowed on outside)
```

다른 방식으로 실행을 강제하는 방법

```javascript
!function () { /* statement */ }();
~function () { /* statement */ }();
-function () { /* statement */ }();
+function () { /* statement */ }();
void function () { /* statement */ }();
```

> ### 참고자료
> <https://en.wikipedia.org/wiki/Immediately_invoked_function_expression>

## Strict Mode

ECMA5 의 엄격모드는 다음과 같은 특징을 가집니다.  
이 구문은 전체 스크립트 문 혹은 부분 함수에 적용이 가능하다. (`{}` 로 묶은 블럭문에는 적용불가)

### Syntax

```javascript
'use strict';
```

### 특징

* 기존에는 무시되던 에러들을 Throwing 한다.
* 최적화 작업을 도와준다. (특정 스크립트 코드가 빨리 해석되게끔 함)
* 향후 버전에서 정의될 문법들을 금지한다.

> ### 참고자료
> <https://developer.mozilla.org/ko/docs/Web/JavaScript/Reference/Strict_mode>  