# 04. Framework

## 쿼리스트링 \(리소스 파일 캐쉬 방지\)

브라우저에서 캐의 동작은 기존에 동일한 URL 에 요청한 적이 있었는지 판단한다.  
따라서 수정 배포된 리소스파일 \(js, css, image 등등 ...\) 이 수정되면 _**URL 경로의 변경**_ 혹은 _**쿼리스트링으로 파일 캐시를 방지**_한다. 

```markup
<script src="/js/bundle.js?ver=20180628"></script>
<link rel="stylesheet" href="/css/bundle.css?ver=20180628">
<img src="/img/image.png?ver=20180628">
```

* 코드적 장점
  * 매번 캐시를 삭제해야 하는 불편함을 피할 수 있다.
* 관리적 장점
  * 파일의 릴리즈 \(release\) 버전의 정보를 알기 쉽게 구분한다.



