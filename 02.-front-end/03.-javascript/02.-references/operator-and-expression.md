# Operator & Expression

## in

#### Description

`in` 연산자는 명시된 속성이 객체에 존재하면 `true` 를 반환합니다.

#### Syntax

```javascript
속성 in 객체명
```

##### Parameters 

* 속성
  * 속성의 이름이나 배열의 인덱스를 뜻하는 문자열 또는 수의 값입니다.
* 객체명
  * 객체의 명칭

#### Example 

```javascript
var arrayObj = ['a', 'b', 'c'];

console.log(3 in arrayObj);    // false
console.log(0 in arrayObj);    // true

console.log('a' in arrayObj);    // false
console.log('length' in arrayObj);    // true
```

```javascript
var color1 = new String('green');
console.log('length' in color1);    // true

var color2 = 'Red';
console.log('length' in color2);    // false
// color2 는 String 객체가 아니기 때문에 오류를 발생함
```

`String` 생성자로 만들어진 문자열을 명시할 수 있지만 _**문자열 리터럴은 명시할 수 없다**_

```javascript
console.log('toString' in {});     // true
```

프로토타입 체인에 의하여 접근 가능한 속성은 `true` 를 반환합니다.

## instanceof

#### Description

`instanceof` 연산자는 생성자의 `prototype` 속성과 묶인 프로토타입을 가진 오브젝트인지 확인합니다.

#### Syntax

```javascript
object instanceof constructor
```

##### Parameters

* object
  * 테스트 대상인 오브젝트
* constructor
  * 테스트할 함수 \(프로토타입 오브젝트\)

#### Example

```javascript
function C() {};

var obj = new C();

console.log(obj instanceof C);    // true
```

```javascript
function Car(make, model, year) {
  this.make = make;
  this.model = model;
  this.year = year;
}
var auto = new Car('Honda', 'Accord', 1998);

console.log(auto instanceof Car);  // true

console.log(auto instanceof Object);  // true
```

## typeof

#### Description

`typeof` 연산자는 피연산자 타입을 가르키는 문자열을 반환합니다.

| 타입 | 결과 |
| :--- | :--- |
| Undefined | "undefined" |
| Null | "object" |
| String | "string" |
| Number | "number" |
| Array | "object" |
| Boolean | "boolean" |
| Function Object | "function" |
| other Object | "object" |

#### Syntax

```javascript
typeof 피연산자
```

#### Example

```javascript
console.log(typeof 100)                  // number
console.log(typeof '100')                // string
console.log(typeof 'abc')                // string
console.log(typeof [])                   // object
console.log(typeof undefined)            // number
console.log(typeof function foo() {})    // function
```

## delete

#### Description

`delete` 연산자는 오브젝트의 속성을 삭제한다.

#### Syntax

```javascript
delete object[.property]
```

##### Parameters

* object
  * 오브젝트의 이름 또는 오브젝트의 표현식
* property
  * 삭제하고자 하는 속성

#### Example

```javascript
var Employee = {
    age: 28, 
    name: 'abc'
    designation: 'developer'
};

console.log(delete Employee.name);     // true
console.log(delete Employee.age);      // true

// 해당 프로퍼티가 존재하지 않아 true를 리턴합니다.
console.log(delete Employee.salary);   // true
```

> `delete`연산자의 사용시 유의사항.
>
> * 존재하지 않는 속성을 삭제하려고 하면 아무 작업 없이 `true`를 반환
> * 오브젝트에 프로토타입 체인과 같은 속성이 있다면 `delete`로 삭제 후에 프로토타입 체인 프로퍼티 사용가능
> * `var`로 선언된 프로퍼티는 삭제 불가

