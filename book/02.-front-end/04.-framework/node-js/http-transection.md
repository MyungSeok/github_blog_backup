# HTTP Transection

## 요청 처리

### 서버의 생성

모든 `node` 웹 서버 어플리케이션은 웹 서버 객체를 만들어야 합니다.  
이때 `createServer` 를 이용합니다.

```javascript
const http = require('http');
const server = http.createServer((request, response) => {
  // Work Process
});
```

서버로 오는 모든 HTTP 요청 마다 `createServer` 에 전달된 함수가 한번씩 호출된다.  
`createServer` 가 반환한 `Server` 객체는 `EventEmitter` 이고 `server` 객체를 생성하고 리스너를 추가하는 축약 문법이다.

> [`EventEmitter`](https://nodejs.org/api/events.html#events_class_eventemitter) 이란 ?  
> 이벤트 모듈의 의해 정의 되며 새로운 이벤트가 추가되거나 삭제될 때 이벤트를 내보냅니다.

```javascript
const http = require('http');
const server = http.createServer();
server.on('request', (req, res) => {
  // Work Process
});
```

HTTP 요청이 서버에 오면 `node` 가 트랜잭션을 다루려고 `request` 와 `response` 객체를 전달하며 요청 핸들러 함수를 호출 합니다.

### Method, URL, Header 의 처리

요청을 처리할 때, 우선은 Method 와 URL 을 확인한 후 이와 관련된 작업을 실행합니다.  
`node` 는 `request` 객체에 대부분의 프로퍼티를 넣어두므로 꺼내서 사용하면 된다.

```javascript
const {method, url} = request;
```

`request` 객체는 IncomingMessage 의 인스턴스이다.  

> `IncomingMessage Class` 의 특징
> * HTTP 에 의해 생성된다.
> * 특정 객체의 첫번째 변수로 전달되는 인수 (`SERVER` `http.ClientRequest` `request event` `response event`)
> * 응답상태 및 헤더, 데이터 등을 액세스 하는데 사용 한다.

헤더 또한 `request` 객체에서 얻어온다.

```javascript
const {headers} = request;
const userAgent  = header['user-agent'];
```

> Tips
>
> 클라이언트가 설정한 헤더 프로퍼티는 대소문자 구분없이 _**소문자로만 표현**_ 된다.  
> 일부 헤더 정보를 반복해서 설정하면 overwrite 하거나 csv 형태로 구성될 수 있다. 이런 경우에는 `rawHeaders` 를 사용할 수 있다.

### Request Body 의 처리

`post` 혹은 `put` 요청시 핸들러에 전달된 `request` 객체는 [`ReadableStream`](https://nodejs.org/api/stream.html#stream_class_stream_readable) 인터페이스를 구현하고 있다.  
이 스트림에 `EventListener` 를 등록하거나 다른 스트림의 파이프로 연결 할 수 있다.

각 `data` 이벤트에서 발생시킨 청크는 `Buffer` 이며 이는 문자열 데이터이다.  
이는 `end` 이벤트에서 이어 붙인 다음에 문자열로 만드는게 가장 좋다.

```javascript
let body = [];

request.on('data', (chunk) => {
  body.push(chunk);
}).on('end', () => {
  // `body` 에 전체 요청 바디가 문자열로 담겨 있다.
  body = Buffer.concat(body).toString();
});
```

### 오류의 관한 처리

`request` 스트림에서 오류가 발생하면 `error` 이벤트가 발행하면서 오류를 전달한다.  
별도의 이벤트 리스너가 등록되어 있지 않다면 오류를 뱉으면서 Node.js 를 종료시킨다.

```javascript
request.on('error', (error) => {
  console.error(error.stack);
});
```

### HTTP 요청 코드 정리
```javascript
const http = require('http');

http.createServer((request, response) => {
  const {headers, method, url} = request;
  
  let body = [];

  request.on('error', (error) => {
    console.error(error.stack);
  }).on('data', (chunk) => {
    body.push(chunk);
  }).on('end', () => {
    body = Buffer.concat(body).toString();

    /**
     *  헤더, 메서드, 요청경로, 바디 등을 가지게 되었으며 
     *  이 요청에 응답하는 작업을 수행할 수 있습니다.
     */
  })
}).listen(8080);
```

> 이 코드는 요청 받을 수 있지만 요청한 디바이스(클라이언트) 에 응답 하는 로직이 없기 때문에 타임아웃이 걸릴것 입니다.

## 응답 처리

### 응답 상태 코드

별도의 설정이 없으면 HTTP 응답 코드는 200 으로 고정 됩니다.  
상태 코드를 변경 하려면 `statusCode` 프로퍼티를 설정해야 합니다.

```javascript
// 리소스를 찾을수 없음 
response.statusCode = 404;
```

### 응답 헤더 설정

setHeader 메서드로 헤더를 설정 한다.

```javascript
response.setHeader('Content-Type', 'application/json');
response.setHeader('X-Powered-By', 'bacon');
```

> 헤더 설정 프로퍼티의 대/소문자는 구분이 없다.

### 명시적 응답 헤더 데이터 전송

`writeHead` 메소드를 이용하여 명시적으로 헤더 작성이 가능하다.

```javascript
response.writeHead(200, {
  'Content-Type': 'application/json',
  'X-Powered-By': 'bacon'
});
```

### 응답 바디 전송

`response` 객체는 [`WriteableStream`](https://nodejs.org/api/stream.html#stream_class_stream_writable) 이므로 클라이언트로 보내는 응답 바디는 일반적인 스트림 메서드를 이용하여 작성 합니다.

```javascript
response.write('<html>');
response.write('<body>');
response.write('<h1>Hello, World!</h1>');
response.write('</body>');
response.write('</html>');
response.end();
```

위 코드는 아래와 같이 작성해도 동일하다.

```javascript
response.end('<html><body><h1>Hello, World!</h1></body></html>');
```

### 오류에 관한 처리

`response` 스트림도 `error` 이벤트를 발생시킬수 있고 때로는 이 오류도 처리해야 합니다.  
`request` 스트림에 대한 오류와 동일하게 적용이 가능합니다.

### 현재까지 적용코드

```javascript
const http = require('http');

http.createServer((request, response) => {
  const { headers, method, url } = request;
  let body = [];

  request.on('error', (error) => {
    console.error(error);
  }).on('data', (chunk) => {
    body.push(chunk);
  }).on('end', () => {
    body = Buffer.concat(body).toString();

    response.on('error', (error) => {
      console.error(error);
    });

    response.statusCode = 200;
    response.setHeader('Content-Type', 'application/json');

    // 위 두줄의 코드를 한줄로 가능 
    // response.writeHead(200, {'Content-Type': 'application/json'});

    const responseBody = { headers, method, url, body };

    response.write(JSON.stringify(responseBody));
    response.end();

    // 위 두줄의 코드를 한줄로 가능
    // response.end(JSON.stringify(responseBody));

  });
}).listen(8080);
```

## 에코 서버 만들기

에코서버란 요청 받은 데이터를 그대로 응답으로 돌려보내는 서버이다.  
앞에서 했던것 처럼 요청 스트림에서의 데이터를 가져와 응답 스트림에 쓴다.

```javascript
const http = require('http');

http.createServer((request, response) => {
  let body = [];
  
  request.on('data', (chunk) => {
    body.push(chunk);
  }).on('end', () => {
    body = Buffer.concat(body).toString();
    response.end(body);
  });
}).listen(8080);
```

위 코드를 다음 조건에 따라 에코 응답을 보내는것으로 수정한다.

* 요청 메서드가 `POST` 인 경우
* URL 이 `/echo` 인 경우

```javascript
const http = require('http');

http.createServer((request, response) => {
  if (request.method === 'POST' && request.url === '/echo') {
    let body = [];
    request.on('data', (chunk) => {
      body.push(chunk);
    }).on('end', () => {
      body = Buffer.concat(body).toString();
      response.end(body);
    });
  } else {
    response.statusCode = 404;
    response.end();
  }
}).listen(8080);
```

> 위의 방법으로 라우팅을 하고 있지만 [`express`](/book/02.-front-end/04.-framework/node-js/express.html) 프레임워크나 [`router`](/book/02.-front-end/04.-framework/node-js/express.html) 라이브러리릉 통해서 처리도 가능하다.  

`request` 객체는 [`ReadableStream`](https://nodejs.org/api/stream.html#stream_class_stream_readable) 이고 `response` 객체는 [`WriteableStream`](https://nodejs.org/api/stream.html#stream_class_stream_writable) 이므로 [`pipe`](https://nodejs.org/api/stream.html#stream_readable_pipe_destination_options) 를 사용할 수 있다.

```javascript
const http = require('http');

http.createServer((request, response) => {
  if (request.method === 'POST' && request.url === '/echo') {
    request.pipe('response');
  } else {
    response.statusCode = 404;
    response.end()
  }
}).listen(8080);
```

### 오류에 관한 처리

```javascript
const http = require('http');

http.createServer(request, response) => {
  request.on('error', (error) => {
    console.error(error);
    response.statusCode = 400;
    response.end();
  });

  response.on('error', (error) =>{
    console.error(error);
  });

  if (request.method === 'POST' && request.url === '/echo') {
    request.pipe(response);
  } else {
    response.statusCode = 404;
    response.end();
  }
}).listen(8080);
```

> HTTP 요청을 다음 동작이 가능하다.  
> * 요청 핸들러로 HTTP 서버의 인스턴스를 생성 가능하고 특정 포트를 열 수 있다.
> * request 객체에서 Header, Method, URL, Body` 데이터를 가져올 수 있다. 
> * URL 이나 `request` 객체의 기반 데이터로 라우팅이 가능하다.
> * `request` 객체에서 `response` 객체로 데이터를 파이프로 연결 가능하다.
> * `request` 와 `response` 스트림 모두에서 스트림 오류 처리가 가능하다.

## 

> ### 참고자료
> <https://nodejs.org/ko/docs/guides/anatomy-of-an-http-transaction/>