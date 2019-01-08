# Promise

JavaScript 특성상 싱글 스레드 환경에서 대부분의 작업들은 비동기로 이루어진다.

하지만 최근에 자바스크립트 기술의 발전과 하나의 작업을 콜백으로 결과를 받은뒤 순차적으로 작업을 수행하고자 한다면 아래와 같은 콜백 중첩 (콜백 지옥) 을 경험하게 된다.

```javascript
async(1, function () {
  async(2, function () {
    async(3, function () {
      async(4, function () {
        async(5, function () {
          console.log('작업 완료???!!??!!')
        });
      });
    });
  });
});
```

이러한 상황을 극복하기 위해 오래전부터 Promies 라는 패턴이 제안되어 왔으며 다양한 라이브러리를 통해서 이를 구현하여 사용해 왔다.

`Promise` 패턴은 ES5 환경에서 일부 브라우저에서 사용 가능하며 ES6 에 정식 스팩에 포함되었다.

> ### 브라우저별 지원 여부
> IE 는 사용 불가하여 Polyfill 코드를 사용하여 구현해야 함  
> Chrome, FF 는 _**Full Support**_

## 사용

### Syntax

```javascript
new Promise(function (resolve, reject) {
  /* statement */
});
```

실행시 `Promise` 구문에서 실행한 익명함수의 반환값은 무시된다.

#### Parameters

* resolve
  * 성공시 전달되는 인수 (함수 혹은 변수)
* reject
  * 실패시 전달되는 인수 (함수 혹은 변수)

### Example

#### Case 1 : 기초

Promise 의 기본적인 선언은 아래와 같다.

```javascript
var _promise = function (param) {
  return new Promise(function (resolve, reject) {
    window.setTimeout(function () {
      if (param) {
        resolve('Success');
      } else {
        reject(Error('Failed'));
      }
    }, 3000);
  });
}
```

`Promise` 사용시 다음 상태중에 하나가 될 것이다.

* pending
  * 아직 `Promise` 를 수행중인 상태
* fulfilled
  * `Promise` 가 성공적인 상태이다.
* rejected
  * `Promise` 가 실패한 상태이다.
* settled
  * `Promise` 성공여부와 상관없이 완료된 상태이다.

`new Promise` 로 Promise 가 생성되는 직후부터 `resolve` 나 `reject` 가 호출되기 전까지의 순간을 pending 상태라고 볼 수 있다.  
이후 비동기 작업이 마친뒤 결과물을 약속대로 잘 줄 수 있다면 첫번째 파라메터로 주입되는 `resolve` 함수를 호출하고, 실패했다면 `reject` 함수를 호출하는 것이 기본적인 Promise 개념이다.

이를 실행하는 실행부는 아래와 같다.

```javascript
_promise(true)
  .then(function (message) {
    console.log(message);
  }, function (error) {
    console.error(error);
  });
```

실행부에서는 `_promise()` 를 실행하면 Promise 의 새로운 객체가 반환되고 정상적으로 비동기 작업이 수행됬을때 `then` 을 호출하는 API 가 존재한다.  
`then` 은 성공시 첫번째 파라메터를 수행하며, 실패시 두번째 파라메터를 수행하게 된다.

#### Case 2 : 예외처리

Javascript 함수의 체이닝으로 연결된 형태에서 비동기 작업이 중간에 에러날 경우 다음과 같이 처리 가능하다.

```javascript
_promise(true)
  .then(JSON.parse)
  .catch(function () {
    alert('Error');
  })
  .then(function (message) {
    console.log(message);
  })
```

#### Case 3 : 모든 Promise 를 완료하고 실행

```javascript
var promise1 = new Promise(function (resolve, reject) {
  window.setTimeout(function () {
    console.log('1st Promise');
    resolve('1');
  }, Math.random() * 20000 + 1000);
});

var promise2 = new Promise(function (resolve, reject) {
  window.setTimeout(function () {
    console.log('2nd Promise');
    resolve('2');
  }, Math.random() * 10000 + 1000);
});

Promise.all([promise1, promise2])
  .then(function (values) {
    console.log('All Complete');
    console.dir(values);
  });
```

> ### 참고자료
> <https://programmingsummaries.tistory.com/325>
> <https://developer.mozilla.org/ko/docs/Web/JavaScript/Reference/Global_Objects/Promise>