# Vue

## Methods

* 내부적으로 사용가능한 함수들을 모아놓는다.

```javascript
export default {
  data() {
    value = null
  },
  methods: {
    /* 내부 함수목적으로 주로 사용 */
  }
}
```

## Computed

* 내부 캐시를 사용하기 때문에 계산된 속성만 사용하는것을 추천한다.
* `Getter` 속성 목적으로만 사용하며 필요에 의해서는 `Setter` 사용이 가능하다.

```javascript
export default {
  data() {
    return {
      value: ''
    };
  },
  computed: {
    getValue: {
      get: () => this.value,
      set: value => this.value = value
    }
  }
}
```

## Watch

* 변수가 변경되는것을 감지하여 이전값과 새로운 값을 제공한다.
* __*일반적인 변수를 포함하여 `computed` 함수 선언과 동시에 사용가능하다.*__

```javascript
export default {
  data() {
    return {
      value: ''
    };
  },
  computed: {
    getValue: {
      get: () => this.value,
      set: value => this.value = value
    }
  },
  /* 변수가 변경되는 것을 감지 */
  watch: {
    getValue(newValue, oldValue) {
      console.log('새로운 값 : ' + newValue);
      console.log('오래된 값 : ' + oldValue);
    }
  }
}
```