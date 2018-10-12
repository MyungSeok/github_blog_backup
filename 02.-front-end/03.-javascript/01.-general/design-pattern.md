# Design Pattern

## 네임스페이스 패턴

지역/전역 객체를 선언하여 그 안에 값을 삽입하여 사용하는 것

#### 권장 패턴

```javascript
var App = App || {};
App.Parent = function () {};
App.Child = function () {};

App.container = 1;
App.module = {
    module_1: {
        data: {a: 1, b: 2}
    },
    module_2: {}
};
```

#### 안티 패턴

```javascript
function Parent() {} 
function Child() {} 

var some_var = 1;

var module1 = {}; 

module.data = {a : 1, b : 2}; 

var module2 = {}
```

## 모듈 패턴

#### 기본 모듈 패턴 

`public` 과 `private` 의 접근 권한을 가능하게 한다.

```javascript
(function () {
    // private 변수들과 함수들을 선언
    
    return {
        // public 변수들과 함수들을 선언
    };
}());
```

```javascript
var HTMLChanger = (function() {
    var contents = 'contents';
    
    var changeHTML = function () {
        var element = document.getElementById('attribute-to-change');
        element.innerHTML = contents;
    }
    
    return {
        callChangeHTML: function () {
            changeHTML();
            console.log(contents);
        }
    };
}());

HTMLChanger.callChangeHTML();         // 'contents'
console.log(HTMLChanger.contents);    // undefined
```

#### 권장 모듈 패턴

1. Module Scope 내에서 사용할 변수 작성
2. Utility Method 작성 
3. DOM 조작 메소드 작성
4. Event Handler 작성
5. Public Method 작성

```javascript
var module = (function () {
    // 1. Module Scope 내에서 사용할 변수 작성
    var scopeVal = {},
        utilMethod,
        manipulateDOM,
        eventHandler,
        initModule;
    
    // 2. Utility Method 작성
    utilMethod = function () {
        /* 실행 코드 */
    };
    
    // 3. DOM 조작 메소드 작성
    manipulateDOM = function () {
        /* 실행 코드 */
    }
    
    // 4. Event Handler 작성
    eventHandler = function () {
        /* 실행 코드 */
    }
    
    // 5. Public Method 작성 
    return {
        init: initMethod
    };
}());
```

## 커링

여러개의 인자를 받는 함수가 있을 경우 일부의 인자만 받는 함수를 만드는 기법

#### Currying Example

```javascript
function volume(l, w, h) {
    return l * w * h;
}

function curry(fn) {
    var arity = fn.length;
    
    return (function resolver() {
        var memory = Array.prototype.slice.call(arguments);
        
        return function () {
            var local = memory.slice();
            
            Array.prototype.push.apply(local, arguments);
            
            var next = (local.length >= arity? fn : resolver);
            
            return next.apply(null, local);
        };
    }());
}
```

#### Example #1 : JS - ES5

```javascript
var curried = curry(volume),    
    length = curried(2),    
    lengthAndWidth = length(3);    

console.log(lengthAndWidth(4));
```

#### Example #2 : JS - ES5

```javascript
var _curried = curry(volume);
console.log(_curried(2)(3)(4));
```

> `Case 2` 가 10배정도 빠름

## 메모이제이션 

이전에 연산된 결과를 저장하고 사용하는 패턴   
메모리 상에 임시 저장값을 저장하여 사용할 수 있어 시간 복잡도를 많이 줄인다.

#### 일반적인 피보나치 로직

```javascript
var count = 0;

var fibonacci = function (n) {
    count++;
    return n < 2 ? n : fibonacci(n - 1) + fibonacci(n - 2);
}

for (var i = 0; i <= 10; i++) {
    console.log(i + ' = ' + fibonacci(i));
}

console.log('count = ', count);
```

#### 메모이제이션을 사용한 피보나치 로직 1

```javascript
var fibonacci = function () {
    var memo = [0, 1];
    var count = 0;
    var fib = function (n) {
        count++;

        var result = meno[n];

        if (typeof result !== 'number') {
            result = fib(n - 1) + fib(n - 2);
            memo[n] = result;
        }
        return result;
    };
    return fib;
}

for (var i = 0; i <= 10; i++) {
    console.log(i, ' = ', fibonacci(i));
}

console.log('count : ', count);
```

#### 메모이제이션을 사용한 피보나치 로직 2

```javascript
var factorial = (function () {
    var save = {};
    var fact = function (number) {
        if (number > 0) {
            var saved = save[number - 1] || fact(number - 1);
            var result = number * saved;
            save[number] = result;
            console.log(saved, result);
            return result;
        } else {
            return 1;
        }
    }
    return fact;
}());

factorial(7);
```
