# Array

## concat

### Description

`concat` 메서드는 인자로 주어진 배열이나 값들을 기존 배열에 합쳐서 _**새로운 배열을 반환**_ 합니다. 

### Syntax

```javascript
arrayObj1.concat(arrayObj2)
```

#### Parameter

* arrayObj1, arrayObj2
  * **Array** 객체 

### Example

```javascript
['H', 'e', 'l', 'l', 'o'].concat(['W', 'o', 'r', 'l', 'd']);
// ['H', 'e', 'l', 'l', 'o', 'W', 'o', 'r', 'l', 'd']
```

> 이 메소드는 새로운 배열 객체를 반환 합니다.

## slice

### Description

특정 배열의 `start` 와 `end` 인덱스의 _**새로운 배열 객체를 반환**_ 합니다.

### Syntax

```javascript
arrayObj.slice(start, [end])
```

#### Parameter

* arrayObj
  * **Array** 객체 
* start
  * arrayObject 에 대한 지정된 부분의 시작
* end
  * arrayObject 에 대한 지정된 부분의 끝

### Example

```javascript
['H', 'e', 'l', 'l', 'o'].slice(1)
// ['e', 'l', 'l', 'o']
```

```javascript
['H', 'e', 'l', 'l', 'o'].slice(1, 4)
// ['e', 'l', 'l']
```

```javascript
['H', 'e', 'l', 'l', 'o'].slice(0, -1)
// ['H', 'e', 'l', 'l']
```

```javascript
['H', 'e', 'l', 'l', 'o'].slice(-1, 0)
// []
```

> 이 메소드는 새로운 배열 객체를 반환 합니다.

## shift

### Description

배열의 첫번째 요소를 제거하고, 제거된 요소를 반환합니다.

### Syntax

```javascript
arrayObj.shift()
```

### Example

```javascript
var arrayObj = ['H', 'e', 'l', 'l', 'o'];

var shifted = arrayObj.shift();

console.log(shifted);
// 'H'

console.log(arrayObj);
// ['e', 'l', 'l', 'o']
```

`while` 구문 수행시 첫번째 요소를 제거하면서 빈 배열이 나올때까지 반복문을 수행한다.

```javascript
var names = ["Andrew", "Edward", "Paul", "Chris" ,"John"];

while( (i = names.shift()) !== undefined ) {
    console.log(i);
}
// Andrew, Edward, Paul, Chris, John
```

> 이 메소드는 배열의 길이를 변하게 합니다.

> 배열의 마지막 요소를 제거하는건 **`pop`** 메소드 이다.

## unshift

### Description

새로운 요소를 배열의 앞쪽에 추가한다.  
return 값은 새로운 요소가 추가된 배열이다.

### Syntax

```javascript
arrayObj.unshift([element1[, ...[, elementN]]])
```

### Example

```javascript
var arrayObj = ['1', '2'];

arrayObj.unshift(0);
// arr is [0, 1, 2]

arrayObj.unshift(-2, -1); 
// arr is [-2, -1, 0, 1, 2]

arrayObj.unshift([-3]); 
// arr is [[-3], -2, -1, 0, 1, 2]
```

> 이 메소드는 배열의 길이를 변하게 합니다.

## map

### Description

`map()` 메소드는 배열내의 모든 요소에 대하여 제공된 함수\(callback\)를 호출하고, 그 결과를 모아서 _**새로운 배열을 반환**_ 합니다.

### Syntax

```javascript
var newAry = arrayObj.map(function callback(currentValue[, index[, array]]) {
    // newAry 의 새 요소를 반환
}[, thisArg]);
```

#### Parameter

* callback
  * 새로운 배열 요소를 생성하는 함수
* currentValue
  * 배열 요소 중 현재 처리되고 있는 요소
* index
  * 현재 처리되는 요소의 배열 내 인덱스
* array
  * `map` 메소드가 적용되는 본래의 배열
* thisArg
  * `callback`을 실행할 때 `this`로 사용되는 값 \(기본값은 window 객체\)

### Example

```javascript
var numbers = [1, 4, 9];
var roots = numbers.map(Math.sqrt);

console.log(numbers);
// [1, 4, 9]

console.log(roots);
// [1, 2, 3]
```

```javascript
var numbers = [1, 4, 9];
var doubles = numbers.map(function (num) {
    return num * 2;
});

console.log(doubles);
// [2, 8, 18]
```

```javascript
var mapAry = [{key: 1, value, 10}, {key: 2, value: 20}, {key: 3, value: 30}];
var new_mapAry = mapAry.map(function (obj) {
    var new_obj = {}
    new_obj[obj.key] = obj.value;
    return new_obj;
});

console.log(new_mapAry);
// [{1:10}, {2:20}, {3:30}]
```

#### 지정된 사이즈로 임의의 배열 생성 

```javascript
var SIZE = 10;
var getRandomNumber = function (min, max, floor) { /* 랜덤 값 제조 */ };

var newArray = Array
    .apply(null, {length: SIZE})
    .map(Function.call, function () {
        return getRandomNumber(MIN, MAX)
    });
```

> 이 메소드는 새로운 배열 객체를 반환 합니다.

## filter

### Description

`filter()` 메소드는 배열내의 모든 요소에 대하여 제공된 테스트 함수\(callback\)를 호출하고, 그 결과를 모아서 _**새로운 배열을 반환**_ 합니다.

### Syntax

```javascript
var newAry = arrayObj.filter(function callback(currentValue[, index[, array]]) {
    // 반환형이 boolean 값 true 이면 값이 유지, false 이면 값 삭제
}[, thisArg]);
```

#### Parameter

* callback
  * 새로운 배열 요소를 생성하는 함수
* currentValue
  * 배열 요소 중 현재 처리되고 있는 요소
* index
  * 현재 처리되는 요소의 배열 내 인덱스
* array
  * `map` 메소드가 적용되는 본래의 배열
* thisArg
  * `callback`을 실행할 때 `this`로 사용되는 값 \(기본값은 window 객체\)

### Example

```javascript
function isBigEnough(value) {
    return value >= 10;
}

var filterd = [12, 5, 8, 130, 44].filter(isBigEnough);

console.log(filtered);
// [12, 130, 44]
```

> 이 메소드는 새로운 배열 객체를 반환 합니다.

## forEach

### Description

`forEach()` 메소드는 배열 요소마다 한 번씩 제공된 함수\(callback\) 함수를 호출해서 사용합니다.

### Syntax

```javascript
arrayObj.forEach(function callback(currentValue[, index[, array]]) {
    // 반환형 없이 각 요소마다 함수를 실행
}[, thisArg]);
```

#### Parameter

* callback
  * 새로운 배열 요소를 생성하는 함수
* currentValue
  * 배열 요소 중 현재 처리되고 있는 요소
* index
  * 현재 처리되는 요소의 배열 내 인덱스
* array
  * `map` 메소드가 적용되는 본래의 배열
* thisArg
  * `callback`을 실행할 때 `this`로 사용되는 값 \(기본값은 window 객체\)

## sort

### Description

`sort()` 메서드는 배열의 요소를 적절한 위치에 정렬하고 배열을 반환합니다.  
기본 정렬 순서는 _**유니 코드 포인트**_에 따릅니다.

### Syntax

```javascript
arrayObj.sort([compareFunction])
```

#### Parameter

* compareFunction
  * 정렬 순서를 정의하는 함수를 지정합니다. \(미 지정시 기본 정렬 순서에 따름\)

### Example

```javascript
var fruit = ['orange', 'apple', 'banana'];

console.log(fruit.sort());
// ['apple', 'banana', 'orange']
```

```javascript
var score = [4, 11, 2, 10, 3, 1];

// ASCII 문자 순서로 정렬되어 숫자의 크기대로 나오지 않음
// [1, 10, 11, 2, 3, 4]
score.sort();

// 오름차순 정렬
// [1, 2, 3, 4, 10, 11]
score.sort(function () {
    return a - b;
});

// 내림차순 정렬
// [11, 10, 4, 3, 2, 1] 
score.sort(function () {
    return b - a;
});

```

```javascript
var student = {
  { name: 'Edward', value: 21 },
  { name: 'Sharpe', value: 37 },
  { name: 'And', value: 45 },
  { name: 'The', value: -12 },
  { name: 'Magnetic' },
  { name: 'Zeros', value: 37 }
};

// value 기준으로 정렬
student.sort(function (a, b) {
  if (a.value > b.value) {
    return 1;
  }
  if (a.value < b.value) {
    return -1;
  }
  // a must be equal to b
  return 0;
});

// name 기준으로 정렬
student.sort(function(a, b) {
  var nameA = a.name.toUpperCase(); // ignore upper and lowercase
  var nameB = b.name.toUpperCase(); // ignore upper and lowercase
  if (nameA < nameB) {
    return -1;
  }
  if (nameA > nameB) {
    return 1;
  }

  // 이름이 같을 경우
  return 0;
});
```

#### 기존순서는 그대로 두고 중복 제거 

```javascript
var names = ["Mike","Matt","Nancy","Adam","Jenny","Nancy","Carl"];

var uniq = names.reduce(function (a, b){
  if (a.indexOf(b) < 0 ) a.push(b);
  return a;
},[]);

console.log(uniq, names) // [ 'Mike', 'Matt', 'Nancy', 'Adam', 'Jenny', 'Carl' ]

// 한 줄로 표현
return names.reduce(function(a,b){if(a.indexOf(b)<0)a.push(b);return a;},[]);
```

#### 기존순서는 그대로 두고 중복 제거

```javascript
var uniq = names.slice() // 정렬하기 전에 복사본을 만든다.
  .sort(function (a, b){
    return a - b;
  })
  .reduce(function (a, b){
    if (a.slice(-1)[0] !== b) a.push(b); // slice(-1)[0] 을 통해 마지막 아이템을 가져온다.
    return a;
  },[]); //a가 시작될 때를 위한 비어있는 배열

// 한 줄로 표현
return names.slice().sort(function(a,b){return a - b}).reduce(function(a,b){if (a.slice(-1)[0] !== b) a.push(b);return a;},[]);
```

## indexOf

### Description

`indexOf` 메서드는 배열에서 지정된 요소를 찾을 수있는 첫 번째 인덱스를 반환하고 존재하지 않으면 `-1`을 반환합니다.

### Syntax

```javascript
arrayObj.indexOf(element)
```

#### Parameter

* arrayObj
  * 배열 객체
* element
  * 찾을 요소

### Example

```javascript
var a = [2, 9, 9]; 
a.indexOf(2); // 0 
a.indexOf(7); // -1

if (a.indexOf(7) === -1) {
  // 요소가 배열에 존재하지 않습니다.
}
```

### Polyfill

* IE 8 이하 지원 안함 

```javascript
var indexOf = Array.prototype.indexOf || (function (prop, s) {
  for (var i = (s || 0); i < this.length; i++) {
    if (this[i] === prop) { return i; };
  }

  return -1;
});
```

```javascript
if (indexOf.call(arrayObj, value) > -1) {
    console.log('value is contain');
} else {
    console.log('value is not contain');
}
```