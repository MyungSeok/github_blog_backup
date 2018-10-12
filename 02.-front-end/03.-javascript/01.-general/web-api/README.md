# Web API

## XMLHttpRequest

서버와의 비동기 데이터 통신을 하기 위해서 `XMLHttpRequest` 객체를 할 수 있다.  
기존의 자바스크립트의 `ajax` 을 사용하는 것과 동일하다.

#### 1. HTTP Request 생성 

모든 브라우저에서 사용 가능한 인스턴스를 생성한다.

```javascript
var xhr
if (window.XMLHttpRequest) {
    xhr = new XMLHttpRequest();
} else if (window.ActiveXObject) {
    xhr = new ActiveXObject('Microsoft.XMLHTTP');
}
```

#### 2. 응답 데이터를 처리할 `callback` 함수를 정의

```javascript
var successCallback = function () {
    // 서버에서 받은 응답을 프로세싱 
}

xhr.onreadystatechange = successCallback;
```

#### 3. 요청 \(Request\) 와 응답 \(Response\) 을 정의 

```javascript
xhr.open('GET', '/json', true);
xhr.send(null);
```

* `open`  Parameter
  * method
    * GET, POST, HEAD
    * _**대문자**_ 로 표기하는 것을 권한다 \(일부 브라우저에서는 비 동작할 수 있음\)
  * url
    * 요청할 서버의 경로를 입력한다.
  * async
    * 수행 방식을 결정한다 \(동기 / 비 동기\)
* `send` Parameter
  * POST 방식으로 요구 한 경우 서버로 보낼 데이터를 정의한다
  * `json` , `soap` 혹은 쿼리 스트링으로 표현 가능

> POST 로 통신할 경우 요청 \(request\) MINE type을 설정 해야 합니다.  
> 예를 들면 `send` 를 호출하기 전에 아래와 같은 형태로 `send` 로 보낼 쿼리를 이용해야 한다.

```javascript
xhr.setReqeustHeader('Content-Type', 'application/x-www-form-urlencoded');
```

#### 4. 응답 데이터 처리 

데이터 요청 \(request\) 하였을때의 응답 \(response\) 처리를 해야 한다.

응답에 사용되는 `callback` 함수에서 `XMLHttpRequest` 객체는 `readyState` 다음과 같은 응답 요구 상태값을 가진다.

`readyState` 가 가질 수 있는 응답 상태 값

* 0 \(uninitialized\)
  * 객체가 막 생성되었다.
  * `open` 메소드가 수행 되지 않았다.
* 1 \(loading\)
  * `send` 메소드가 수행 되지 않았다.
* 2 \(loaded\)
  * `send` 메소드가 수행 되었지만 요청 헤더를 사용할 수 없다.
* 3 \(interactive\)
  * 일부 데이터만 수신한 상태이며, 상태 및 응답 헤더는 사용가능
  * 요청 수행중
* 4 \(complete\)
  * 요청한 데이터를 전부 받은 상태이다.
  * 요청 및 응답이 완료됨 

동일하게  `XMLHttpRequest` 객체는 `state` 다음과 같은 상태값을 가진다.

* 200
  * 정상
* 403
  * 권한 부족 혹은 접근 금지
* 404
  * 페이지를 찾을 수 없음

```javascript
var successCallback = function () {
    if (xhr.readState === 4 && xhr.status === 200) {
        console.log('Success');    
    } else {
        console.log('Failed');
    }
}
```

#### 5. 최종 완료 코드

```javascript
var xhr = new XMLHttpRequest();
xhr.open('GET', '/json', true);
xhr.onreadystatechange = function (obj) {
    if (xhr.readyState === 4 && xhr.status === 200) {
        /* 성공 코드 */
        var responseObj = JSON.stringify(xhr.responseText);
    } else {
        /* 실패 코드 */
    }
};
xhr.send(null);
```

#### 프로그래스 모니터링 

`XMLHttpRequest` 가 지원하는 `nsIJSXMLHttpRequest` 인터페이스는 요청이 처리되는 동안 발생되는 이벤트가 수신 가능하며 주기적인 진행상태 알림 및 에러 알림 등을 확인 가능 하다

```javascript
var onProgress = function (e) {
    var percent = (e.position / e.totalSize) * 100;
    ...
}

var onError = function (e) {
    console.log('Error ', e.target.status, ' occurred while receving the document'); 
}

...

var xhr = new XMLHttpRequest();
xhr.open('GET', '/json', true);
xhr.onprogress = onProgress;
xhr.onload = onLoad;
xhr.onerror = onError;
xhr.send(null);
```

`onprogress` 의 속성인 `position` 과 `totalSize` 는 받은 데이터가 몇 바이트인지, 전체 데이터 크기가 몇 바이트인지 각각 나타냅니다.

모든 이벤트는 그에 대응하는 `XMLHttpRequest` 를 `target` 속성으로 가지고 있습니다.

