# Angular JS

## Browser Support

![Angular Browser Support](/img/A003.png)

## 2 Way Binding

Angular 1에서 많은 인기를 얻었던 특징중에 `ng-model` 지시자 \(directive\) 를 이용한 양방향 데이터 바인딩 \(two-way binding\) 이다.  
UI 에 연결된 데이터가 변경되면 앱의 상태가 자동으로 업데이트 되는 기능으로 예를 들면 `<input>` 박스에 사용자가 텍스트를 입력하여 값을 변경하면 자동으로 UI 에 `onChange` 같은 콜백 함수를 이용하지 않아도 자동으로 변수가 입력된 값을 업데이트 한다.

```markup
<!doctype html>
<html ng-app>
<head></head>
<body ng-init=”name=’AngularJS'”>
    <input type=”text” ng-model=”name”/>
    <div><h2>Hello, {{name}}</h2></div>
    <script src=”lib/angular/angular.js></script>
</body>
</html>
```

##### 장점

* DOM 조작이 줄어든다.

##### 단점

* 불필요한 성능 저하를 가져온다.
  * 계속해서 데이터 변화를 감지하고 바인딩 해야 하기 때문

