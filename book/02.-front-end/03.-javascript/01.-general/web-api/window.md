# Window

## SetTimeout

`WindowTimers` 에서 지원하는 타이머 객체로서   
_**자바스크립트 엔진이 일정시간 대기하였다가 UI 큐에 작업을 추가**_ 한다.

### Syntax

```javascript
[window.]setTimeout(callback[, delay[, param1[, ... paramN]]]);
```

#### Parameter

* window
  * `this` 객체가 window 일때 생략 가능 
* callback
  * 지연된 시간이 끝난 후 실행되는 콜백 함수 
* delay
  * 함수 지연 시간 \(default : 0\)
* param1 ... paramN
  * 콜백 함수로 전달될 매개변수 
  * IE9 이하에서는 매개변수 전달이 안된다. \(IE 10 이상 지원\)

#### Example #1 : JS - ES5

```javascript
var timeoutId;

// 타이머 세팅 
function setTimer() {
    timeoutId = window.setTimeout(function () {
        alert('Notice');
    }, 2000);
}

// 타이머 삭제 
function cancleTimer() {
    window.clearTimeout(timeoutId);
}
```

지정된 시간 이후에 UI 작업 큐에 추가되기 때문에 실제로 언제 실행 되는지는 알 수 없다.

## SetInterval

일정한 주기를 기간으로 `callback` 함수를 호출 합니다.

### Syntax

```javascript
[window.]setInterval(callback, delay[, param1[, ... paramN]]);
```

#### Parameter

* window
  * `this` 객체가 window 일때 생략 가능 
* callback
  * 지연된 시간이 끝난 후 실행되는 콜백 함수 
* delay
  * 함수 지연 시간 \(default : 0\)
* param1 ... paramN
  * 콜백 함수로 전달될 매개변수 
  * IE9 이하에서는 매개변수 전달이 안된다. \(IE 10 이상 지원\)

#### Example

```javascript
var intervalID;

// 타이머 세팅 
function setTimer() {
    intervalId = window.setInterval(function () {
        alert('Notice');
    }, 2000);
}

// 타이머 삭제 
function cancleTimer() {
    window.clearInterval(intervalId);
}
```

## RequestAnimationFrame

브라우저에게 `callback` 함수를 \(프레임 단위로 처리되는\) 호출 하도록 합니다.   
이 `callback` 은 보통 1초에 60회 정도 호출되게 설계되어 있지만   
W3C 권장사항에 따라 디스플레이의 주사율과 일치하도록 실행 됩니다.

> `<iframe>` 에서는 requestAnimationFrame\(\) 의 호출이 멈출수 있습니다.

### Syntax

```javascript
[window.]requestAnimationFrame(callback);
```

### Polyfill

브라우저 별로 다를 수가 있으니 아래 구문으로 사용을 권한다.

```javascript
const reqAnimate = window.requestAnimationFrame 
      || window.webkitRequestAnimationFrame 
      || window.mozRequestAnimationFrame 
      || window.oRequestAnimationFrame 
      || window.msRequestAnimationFrame 
      || ((callback) => {
        window.setTimeout(callback, 1000 / 60);
      });

reqAnimate(() => {
/* statement */
});
```