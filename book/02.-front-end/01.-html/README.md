# 01. HTML

## DTD \(Document Type Definition\)

_**HTML**_ 에서 문서 형식을 지정하는 것을 _**DTD**_ 라고 하며 _**DTD**_ 는 _**HTML**_ 문서에 첫번째 줄에 위치해야 한다.

문서형식은 HTML 버전과 종류를 명시함으로써, _**브라우저가 문서를 해석하고 출력하는데 직접적으로 영향**_ 을 준다.

올바르게 문서형식이 지정된 경우에는 표준 \(Strict\) 방식, 그렇지 않는 경우에는 호환 \(Quirks\) 방식으로 출력한다.

### 호환 출력 방식 \(Quirks Rendering Mode\) 특징

* 브라우저가 HTML 을 랜더링 \(읽기, 해석, 출력\) 하는 시간이 더 걸린다.
* 브라우저마다 HTML 출력을 각각 다르게 출력한다.

### Example #1 : HTML

```markup
<!DOCTYPE html>
<html>
    <head></head>
    <body></body>
</html>
```

## onload

object 가 로드 되었을 때 발생 합니다.  
웹 페이지가 모든 컨텐츠 \(이미지, 스크립트 파일, 스타일시트\) 등을 완전히 로드한 후 실행 합니다.

### Syntax

```markup
<tag onload="myScript"></tag>
```

```markup
<tag onload="script"></tag>
```

```javascript
object.onload = function () {/* script */};
```

```javascript
object.addEventListener('load', script);
```

## `$(document).ready` vs `$(window).load` 차이점

두 이벤트 리스너 모두 jQuery 라이브러리를 필요로 하며 차이점은 아래와 같다.

* `ready` 이벤트는 DOM 이 로드되고 Element 의 접근이 안정될 때 발생한다.
* `load` 이벤트는 DOM 과 모든 Asset (이미지, 문서 등등...) 들이 로드된 이후에 발생한다.

### Syntax

```javascript
$(document).ready(function () {
    /* statement */
});
```

```javascript
$(window).load(function () {
    /* statement */
});
```

### Vanilla JS

#### IE 9 이상

```javascript
document.addEventListener('DOMContentLoaded', function () {
    /* statement */
});
```

#### IE8 이하

`IE8` 이하에서는 아래와 같이 사용해야 한다.

```javascript
document.onreadystatechange = function () {
    if (document.readyState === 'complete') {
        /* statement */
    }
};
```

`readyState` 에 필드 값 유형

|readyState|Description|
|:--|:--
|uninitialized|아직 로딩이 시작되지 않음|
|loading|로딩중|
|interactive|어느정도 로드가 되었으며 사용자가 상호작용 할 수 있음|
|complete|로딩 완료|

```javascript
window.onload = function () {
    /* statement */
}
```

> ### 참고자료
> <https://developer.mozilla.org/en-US/docs/Web/API/GlobalEventHandlers/onload>

### Detail

| Feature | Description |
| :--- | :--- |
| 이벤트 버블링 | NO |
| 중단 가능 여부 | NO |
| 이벤트 유형 | UI 생성시 |
| 지원 태그 | `<body>`, `<frame>`, `<iframe>`, `<img>`, `<input type="image">`, `<link>`, `<script>`, `<style>`  |
| DOM 버전 | Level 2 이벤트 |

## 시맨틱 \(Semantic\) 마크업

브라우저가 웹 문서 \(HTML\) 를 정확히 읽어내기 위하여 _**정보의 의미에 맞는 HTML Tag**_ 를 이용하여 작성하는 것  
출력 형태는 `<div>` 와 별 차이는 없다.

### 장점

* 웹 접근성이 좋아짐
* SEO \(Search Engine Optimization\) 개선 효과
* 코드 가독성, 재사용성이 높아짐

대표적으로 `<header>` `<nav>` `<section>` `<article>` `<footer>` 가 있다.

| 태그 | 설명 |
| :--- | :--- |
| section | 문서의 구획 \(예: 장, 절\) |
| article | 독립된 콘텐츠 영역 \(예: 개별 신문기사\) |
| nav | 네비게이션 메뉴 영역 |
| aside | 부가 콘텐츠\(예: 사이드바, 광고 등\) 본문 내용과 비교적 관련성이 적은 것 |
| header | 헤더글. 본문 위에 첨가하는 짧은 글 영역 |
| footer | 바닥글. 본문 아래에 첨가하는 짧은 글 영역 |
| hgroup | 제목\(h1 ~ h6\) 을 그룹화하는 요소 |