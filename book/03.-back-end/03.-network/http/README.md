# HTTP

## HTTP Header

### Request Header

클라이언트 브라우저에서 HTTP 프로토콜을 이용하여 _**요청 정보를 웹 서버로 전송할 때**_ HTTP 요청 헤더에 부가적인 정보를 담아 전송한다.

* Accept
  * 클라이언트가 처리하는 미디어 타입
* Accept-encoding
  * 클라이언트가 해석할 수 있는 인코딩 방식
* Accept-language
  * 클라이언트가 지원하는 언어  
* Connection
  * 클라이언트와 서버의 연결 방식
    * keep-alive : 클라이언트와 접속 유지
    * close : 클라이언트와 접속 중단
* Host
  * 호스트 이름 URI 와 PORT 번호 정보
* User-agent
  * 클라이언트 브라우저 정보

### Response Header

서버가 HTTP 프로토콜을 이용하여 클라이언트의 요청에 대해 응답할 때 부가적인 정보를 응답 헤더에 담아 전송한다.

* Connection
  * 클라이언트와 서버의 연결 방식 설정
    * keep-alive : 클라이언트와 접속 유지
    * close : 클라이언트와 접속 중단
* Content-Length
  * 요청한 파일의 데이터 길이
* Content-Type
  * 헤더 응답 문서의 mime 타입
* Date
  * 현재 일시를 GMT 형식으로 지정
* Server
  * 웹 서버 정보

> CORS 관련으로 _**Access-Control-Allow-Origin: ***_ 으로 설정되면 도메인 구분없이 XHR 호출이 가능해진다.

## Keep-alive 관련

* _**디바이스 간의 커넥션을 유지하는 기법**_ 으로 TCP 와 HTTP 가 전혀 다르다.
  * _**TCP 는 OS가 제어**_ 하고, _**HTTP 는 웹 서버가 제어**_ 한다.
* HTTP 1.1 이상에서 지원되는 스팩으로 _**헤더에 설정**_ 하면 된다.
* _**max 요청수**_ 와 _**유효시간(timeout)**_ 으로 구성된다.

## Timeout 종류

### Connection Timeout

Connection 을 구성하는데 소요되는 시간

#### Read Timeout

Server 에서 데이터를 완전히 받을때 까지 걸리는 시간

## MIME

서버가 클라이언트에게 전송되는 문서에 대한 유형을 지칭하는 타입

### Syntax

```markup
[파일의종류]/[파일타입]
```

#### Type List

* text
  * 텍스트 파일
  * text/plain, text/html, text/css, text/javascript
* multipart
  * 이미지 파일 \(비디오 제외\)
  * audio/midi, audio/mpeg, audio/webm, audio/ogg, audio/wav
* audio
  * 오디오 파일
  * audio/midi, audio/mpeg, audio/webm, audio/ogg, audio/wav
* video
  * 비디오 파일
  * video/webm, video/ogg
* application
  * 모든 바이너리 타입
  * application/octet-stream, application/pkcs12, application/vnd.mspowerpoint, application/xhtml+xml, application/xml,  application/pdf

## Cookie & Session & Cache

HTTP 프로토콜의 상태 유지를 하기 위해 Server 가 Client 를 식별할 수 있도록 사용하는 방식

### 공통점

사용자에게 빠르게 서비스를 전달하기 위해 데이터를 저장해서 사용한다.

### 차이점

#### Cookie

클라이언트에 저장되는 키와 값이 들어있는 작은 데이터 파일 \(하나당 4KB 이하\)

이름, 값, 만료날짜 \(쿠키의 저장시간\), 경로정보 등이 포함되어 있으며 반드시 자료형은 String 으로 구성된다.

사용자가 임의로 쿠키 데이터를 저장, 수정, 삭제할 수 있다.

사용자가 브라우저 설정으로 쿠키의 사용유무를 설정할 수 있다.

> HTTP 전송시에 요청 헤더에 쿠키 값이 들어 있어 쿠키의 자료량 \(데이터 사이즈\) 이 큰 경우  
> _**오버헤드로 인한 웹서버 에러가 발생**_ 할 수 있다.

#### Session

서버에서 사용하는 클라이언트 인증 정보이다.

서버는 접속 클라이언트 별로 세션을 생성해서 세션의 해당하는 쿠키 \(Session ID\) 를 클라이언트에게 생성하게 하고 이 클라이언트는 서버에 접속할 때마다 해당 쿠키의 값 \(Session ID\) 을 서버에 전송하여 세션을 유지하게 한다.

브라우저의 설정에 관계없이 동작하며, 세선 졍보로 Java 객체를 저장할 수 있다.

#### Cache

정적 자원들을 안정적으로 서비스하기 위해 데이터를 미리 저장해두고 제공하는 방식

프록시 \(Proxy\) 서버에서 제공

> ### 참고자료
> [http://blog.kurien.co.kr/544](http://blog.kurien.co.kr/544)  
> [http://brownbears.tistory.com/34](http://brownbears.tistory.com/34)  
> [http://asfirstalways.tistory.com/68](http://asfirstalways.tistory.com/68)

## sendRedirect & forward 의 차이점

### sendRedirect

새로운 요청을 작성하여 넘긴다.  
`forward` 에 비해 느리다.

### forward

요청 대상을 새로운 대상으로 전달한다.  
`sendRedirect` 에 비해 빠르다.

## Servlet Life Cycle

1. Client 의 Request 에 따라 Servlet Engine 이 Servlet 을 로드한다.
2. 로드된 Servlet 을 초기화 하기 위해 Servlet 의 `init method` 를 호출한다.
3. Servlet 객체는 각 Request 에 따른 처리를 한다.
4. 최종적으로는 `distroy method` 를 호출하여 Servlet 을 제거한다.

## HTTP METHOD

### GET

* URL로 파일 및 자원등을 가져올 수 있도록 요청

### POST

* Request 로 전달된 데이터를 기반으로 서버에 요청  
* 수행의 목적이 강함

### DELETE

* 데이터 삭제의 요청

### PUT

* Request 로 전달되는 데이터를 기반으로 서버에 요청
* 기준 데이터가 없을때는 생성, 있을때는 수정

### PATCH

* 변경된 데이터만 전달하여 업데이트를 요청함