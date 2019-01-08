# 리엑트 라이프 사이클 (React Life Cycle)

리엑트의 라이프 사이클에 따른 메소드를 정의한다.  
아래 두 그림을 활용하여 확인해 보는것이 좋다.

![리엑트 라이프 사이클](/img/A027.png)

![리엑트 라이프 사이클](/img/A028.png)

## constructor

* 생성자 메소드
* 컴포넌트가 처음 만들어질때 실행된다.
* 기본 `state` 를 정의할 수 있다.

```javascript
constructor(props) {
  super(props);
}
```

## componentWillMount

* 컴포넌트가 DOM 위에 만들어지기 전에 실행된다.

```javascript
componentWillMount() {
  /* statement */
}
```

## render

* 컴포넌트 렌더링을 담당한다.

```javascript
render() {
  return (
    <b>Hello World</b>
  );
}
```

## componentDidMount

* 컴포넌트가 만들어지고 첫 렌더링을 다 마친후 실행되는 메소드
* 외부 JavaScript Framework 를 연동하거나 setTimeout, setInterval 및 AJAX 처리 등을 작성한다.

```javascript
componentDidMount() {
  /* statement */
}
```

## componentWillReceiveProps

* 컴포넌트가 `prop` 를 새로 받았을 때 실행됩니다.
* `prop` 에 따라 `state` 를 업데이트 해야 할 때 사용하면 유용하다.
* 이 안에서 `this.setState()` 를 해도 추가적으로 렌더링하지 않는다.

```javascript
componentWillReceiveProps(nextProps) {
  console.log(JSON.stringify(nextProps));
}
```

## shouldComponentUpdate

* `prop` 혹은 `state` 가 변경되었을 때, 리 랜더링 여부를 결정짓는 메소드
* 리 랜더링 여부를 `Boolean` 타입으로 반환

```javascript
shouldComponentUpdate(nextProps, nextState) {
  console.log(JSON.stringify(nextProps));
  console.log(JSON.stringify(nextState));

  return nextProps.id === this.props.id;
}
```

## componentWillUpdate

* 컴포넌트가 업데이터 되기 전에 실행됩니다.
* 이 메소드 안에서 `this.setState()` 를 사용하면 무한루프에 빠진다.

```javascript
componentWillUpdate(nextProps, nextState) {
  console.log(JSON.stringify(nextProps));
  console.log(JSON.stringify(nextState));
}
```

## componentDidUpdate

* 컴포넌트가 리 랜더링을 마친 후 실행

```javascript
componentDidUpdate(prevProps, prevState) {
  console.log(JSON.stringify(prevProps));
  console.log(JSON.stringify(prevState));
}
```

## componentWillUnmount

* 컴포넌트가 DOM 에서 사라진 후 실행되는 메소드 입니다.

```javascript
componentWillUnmount() {
  /* statement */
}
```