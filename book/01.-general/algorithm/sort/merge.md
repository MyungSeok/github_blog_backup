# 머지 정렬 \(Merge Sort\)

정렬하려는 배열을 반으로 나눠 최소의 파티션으로 나누고 정렬한 후 머지하면서 정렬

## 시간 복잡도

* `O(n log n)` 으로 [퀵 정렬](/book/01.-general/algorithm/sort/quick.html) 과 같다.

## 특이사항

* _**별도의 저장 공간이 필요**_ 하다.

## Example

### Case 1 : JS - ES5

```javascript
var arr = [6, 3, 8, 4, 1, 9, 2, 5, 7, 0];

function MergeSort(arr) {
  this.arr = null;

  if (arr instanceof Array) {
    this.arr = arr;
    return this.sort(arr);
  }
}

MergeSort.prototype = (function () {
  function sort(arr) {
    if (typeof arr === 'undefined' || !(arr instanceof Array)) {
      if (!(this.arr instanceof Array)) {
        throw new Error('Array object is not exist');
      }
      arr = this.arr;
    }

    if (arr.length === 1) {
      return arr;
    }

    var mid = Math.floor(arr.length / 2),
      left = arr.slice(0, mid),
      right = arr.slice(mid);

    return merge(sort(left), sort(right));
  }

  function merge(left, right) {
    var answer = [],
      leftLength = left.length,
      rightLength = right.length,
      leftIdx = 0,
      rightIdx = 0;

    while (leftIdx < leftLength && rightIdx < rightLength) {
      if (left[leftIdx] < right[rightIdx]) {
        answer.push(left[leftIdx]);
        leftIdx++;
      } else {
        answer.push(right[rightIdx]);
        rightIdx++;
      }
    }

    return answer.concat(left.slice(leftIdx), right.slice(rightIdx));
  }

  return {
    sort: sort
  };
}());
```

```javascript
console.log(new MergeSort(arr));
```

```javascript
var ms = new MergeSort();

console.log(ms.sort(arr));
```