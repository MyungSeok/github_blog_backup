# 03. Javascript

## 공백 체크

### Example #1 : JS - ES5

```javascript
var blankPattern = /^\s+|\s+$/g;

console.log('   '.replace(blankPattern, ''));     // ""

console.log(blankPattern.test(''));              // false 
console.log(blankPattern.test('  '));             // true 
```

## 조건문

Javascript 에서 `if` 문에 들어가는 조건식이 다음과 같은 제한 사항을 갖는다.

### Example #1 : JS - ES5

```javascript
console.log(null ? 'A' : 'B')           // B
console.log(undefined ? 'A' : 'B')      // B
console.log('' ? 'A' : 'B')             // B
console.log(0 ? 'A' : 'B')              // B

console.log(' ' ? 'A' : 'B')            // A
console.log(-1 ? 'A' : 'B')             // A
```