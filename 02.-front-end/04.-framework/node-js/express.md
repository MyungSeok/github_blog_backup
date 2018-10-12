# Express

## Route

라우팅은 요청 URI 및 특정한 HTTP 요청 메소드 \(GET, POST, PUT, DELETE\) 인 특정 엔드포인트 에 대한 클라이언트 요청에 대해 애플리케이션이 응답하는 방법을 결정 하는것

### Syntax

```javascript
app.METHOD(PATH, HANDLER)
```

#### Parameter

* app
  * `express` 의 인스턴스
* METHOD
  * HTTP 요청 메소드
* PATH
  * 서버 경로
* HANDLER
  * 라우트가 일치할 때 실행되는 함수

#### Example

각 요청에 따른 라우트를 정의하고 이에 응답한다.

```javascript
var express = require('express');
var app = express();

app.get('/', function(req, res) {
  res.send('hello world');
});
```

#### Method

대표적인 Express 라우팅 메소드는 다음과 같다.

```javascript
app.get('/', function (req, res) {
  res.send('Hello World!');
});
```

```javascript
app.post('/', function (req, res) {
  res.send('Got a POST request');
});
```

```javascript
app.put('/user', function (req, res) {
  res.send('Got a PUT request at /user');
});
```

```javascript
app.delete('/user', function (req, res) {
  res.send('Got a DELETE request at /user');
});
```

### Route Chain

app.route\(\) 을 이용하면 라우트 경로에 대한 체이닝 핸들러를 작성 할 수 있다.

```javascript
app.route('/book')
  .get(function(req, res) {
    res.send('Get a random book');
  })
  .post(function(req, res) {
    res.send('Add a book');
  })
  .put(function(req, res) {
    res.send('Update the book');
  });
```

`all()` 메소드를 통해 모든 응답의 대응도 가능.

```javascript
app.route('/book')
  .all(function(req, res) {
    res.send('Get a random book');
  });
```

### Route Moduler

모듈식 마운팅이 가능한 핸들러의 작성 

```javascript
var express = require('express');
var router = express.Router();

// middleware that is specific to this router
router.use(function timeLog(req, res, next) {
  console.log('Time: ', Date.now());
  next();
});
// define the home page route
router.get('/', function(req, res) {
  res.send('Birds home page');
});
// define the about route
router.get('/about', function(req, res) {
  res.send('About birds');
});

module.exports = router;
```

```javascript
var birds = require('./birds');
...
app.use('/birds', birds);
```

`/birds` 및 `/birds/about` 에 대한 요청을 처리 가능하며 해당 라우트에 대한 특정 미들웨어 함수인 timeLog 를 호출

> Express 는 HTTP 메소드에 해당하는 다음과 같은 라우팅 메소드를 지원한다.

> `get`, `post`, `put`, `head`, `delete`, `options`, `trace`, `copy`, `lock`, `mkcol`, `move`, `purge`, `propfind`, `proppatch`, `unlock`, `report`, `mkactivity`, `checkout`, `merge`, `m-search`, `notify`, `subscribe`, `unsubscribe`, `patch`, `search`및 `connect`.

### Path

URI 경로는 문자열 혹은 정규식의 패턴에도 적용된다.

#### Character Pattern

```javascript
// acd, abcd
app.get('/ab?cd', function(req, res) {
  res.send('ab?cd');
});
```

```javascript
// abcd, abbcd, abbbcd
app.get('/ab+cd', function(req, res) {
  res.send('ab+cd');
});
```

```javascript
// abcd, abxcd, abRABDOMcd, ab123cd
app.get('/ab*cd', function(req, res) {
  res.send('ab*cd');
});
```

```javascript
// /abe, /abcde
app.get('/ab(cd)?e', function(req, res) {
 res.send('ab(cd)?e');
});
```

#### Regular Expression 

```javascript
// a 가 포함된 모든 항목과 일치 
app.get(/a/, function(req, res) {
  res.send('/a/');
});
```

```javascript
// butterfly, dragonfly 과는 일치 
// butterflyman, dragonfly man 과는 불일치 
app.get(/.*fly$/, function(req, res) {
  res.send('/.*fly$/');
});
```

### Response

응답 오브젝트에 대한 메소드는 응답을 클라이언트에 전송하고 요청 및 응답의 주기를 종료할 수 있다.  
_**라우트 핸들러로부터 다음 메소드중 하나라도 호출되지 않는 경우 클라이언트 요청은 정지된 채로 방치**_ 된다. 

| 메소드 | 설명 |
| :--- | :--- |
| [res.download\(\)](http://expressjs.com/ko/4x/api.html#res.download) | 파일이 다운로드되도록 프롬프트합니다. |
| [res.end\(\)](http://expressjs.com/ko/4x/api.html#res.end) | 응답 프로세스를 종료합니다. |
| [res.json\(\)](http://expressjs.com/ko/4x/api.html#res.json) | JSON 응답을 전송합니다. |
| [res.jsonp\(\)](http://expressjs.com/ko/4x/api.html#res.jsonp) | JSONP 지원을 통해 JSON 응답을 전송합니다. |
| [res.redirect\(\)](http://expressjs.com/ko/4x/api.html#res.redirect) | 요청의 경로를 재지정합니다. |
| [res.render\(\)](http://expressjs.com/ko/4x/api.html#res.render) | 보기 템플리트를 렌더링합니다. |
| [res.send\(\)](http://expressjs.com/ko/4x/api.html#res.send) | 다양한 유형의 응답을 전송합니다. |
| [res.sendFile](http://expressjs.com/ko/4x/api.html#res.sendFile) | 파일을 옥텟 스트림의 형태로 전송합니다. |
| [res.sendStatus\(\)](http://expressjs.com/ko/4x/api.html#res.sendStatus) | 응답 상태 코드를 설정한 후 해당 코드를 문자열로 표현한 내용을 응답 본문으로서 전송합니다. |

```javascript
const router = express.Router();

// 클라이언트가 루트 경로로 진입하면 /index 경로로 리다이렉트 시킨다.
router.all('/', (req, res) => {
  res.redirect('/index');
});

// 모든 경로를 index 로 랜더링 한다.
router.all('*', (req, res) => {
  res.render('index');
});
```

