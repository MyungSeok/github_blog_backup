# Sort

## 퀵 정렬 \(Quick Sort\)

정렬중에서 가장 빠른 정렬로 보통 시간 복잡도은 O(n log n) 이며 최악의경우 O(n²) 으로 시간복잡도가 소요된다.

## 머지 정렬 \(Merge Sort\)

정렬하려는 배열을 반으로 나눠 최소의 파티션으로 나누고 정렬한 후 머지하면서 정렬

> 시간 복잡도는 `O(n log n)` 으로 퀵 정렬과 달리 _**별도의 저장공간이 필요**_ 하다.

#### Example # 1 : JS - ES5

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

## 버블 \(Bubble\)

왼쪽 끝에서 부터 인접하는 두 항목의 값을 비교하여 서로 위치를 교환하는 정렬 방법

## 선택 \(Selection\)

전체 요소에서 기준 위치에 맞는 원소를 선택하여 교환하는 방식

## 삽입 \(Insertion\)

전체요소에서 가장 작은 데이터를 찾아 가장 앞의 데이터와 교환하는 방식

## 속도 비교

퀵 &gt; 합병 &gt; 힙 &gt; 쉘 &gt; 삽입 &gt; 선택 &gt; 버블

