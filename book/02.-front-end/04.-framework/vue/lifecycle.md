# 뷰 라이프 사이클 (Vue Life Cycle)

뷰의 라이프 사이클은 크게 다음 네가지로 나뉜다.

* Creation
* Mounting
* Updating
* Destruction

이는 각 단계마다 아래와 같은 특징이 있다.

![뷰 라이프 사이클](/img/A025.png)

## Creation :: 컴포넌트 초기화

컴포넌트 초기화 단계

### beforeCreate

* 모든 훅 중에서 가장 먼저 실행되는 훅
* data 와 event 가 세팅되지 않는 시점으로 접근하면 에러를 뿜는다.

```javascript
<script>
  export default {
    data() {
      return {};  
    },
    beforeCreate() {
      /* statement */
    }
  }
</script>
```

### created

* data 와 event 가 활성화 되어 접근 가능한 상태
* Template 과 VirtualDOM 은 랜더링되지 않는 상태이다.

```javascript
<script>
  export default {
    data() {
      return {};
    },
    created() {
      /* statement */
    }
  }
</script>
```

## Mounting :: DOM 삽입 단계

* 초기 랜더링 직전에 컴포넌트에 접근 가능한 상태 (SSR 지원 불가)

### beforeMount

```javascript
<script>
  export default {
    beforeMount() {
      /* statement */
    }
  }
</script>
```

### mounted

* 컴포넌트, 템플릿, 랜더링된 DOM 에 접근할 수 있다.
* 모든 하위 컴포넌트가 마운트된 상태를 보장하지 않는다.
* __*`vm.$nextTick` 를 사용하면 전체가 랜더링된 상태를 보장할 수 있다.*__ (SSR 지원 불가)

```javascript
<script>
  export default {
    mounted() {
      this.$nextTick(() => {
        /* 모든 화면이 랜더링된 후 실행함 */
      });
    }
  }
</script>
```

부모 자식 관계의 Mount 관계에 있을 경우에는 다음 순서를 보장한다.

![뷰 라이프 사이클](/img/A026.png)

## Updating :: Diff 및 재 랜더링 단계

### beforeUpdate

* 컴포넌트의 데이터가 변하여 업데이트 사이클이 시작될때 실행
* DOM이 재 랜더링되고 Fetch 되기 직전에 실행
* __*재 랜더링되기 이전의 새 상태의 데이터를 얻을수 있으며 더 많은 변경이 가능하다.*__
* 이 변경으로인한 재 랜더링은 트리거 되지 않는다.

```javascript
<script>
  export default {
    beforeUpdate() {
      /* statement */
    }
  }
</script>
```

### updated

* 컴포넌트 데이터가 변하여 재 랜더링이 일어난 후 실행된다.
* DOM이 업데이트 완료된 상태이므로 DOM의 종속적인 연산을 할 수 있다.
* __*여기서 상태를 변경하면 무한루프에 빠질수 있다.*__
* `vm.$nextTick` 를 사용하면 전체가 재 랜더링된 상태를 보장할 수 있다.

```javascript
<script>
  export default {
    updated() {
      this.$nextTick(() => {
        /* 모든 화면이 재 랜더링된 후 실행함 */
      });
    }
  }
</script>
```

## Destruction :: 해체 단계

### beforeDestroy

* 뷰 인스턴스 제거되기 직전에 호출
* 컴포넌트의 원래 모습과 기능들을 그대로 가지고 있다.
* __*이벤트 리스너를 제거 하거나 reactive subscription 을 제거 하고자 할 때 사용한다.*__ (SSR 지원 불가)

```javascript
<script>
  export default {
    beforeDestroy() {
      /* statement */
    }
  }
</script>
```

### destroyed

* 뷰 인스턴스 제거된 후 호출된다. (SSR 지원 불가)
* 모든 이벤트 리스너가 제거된다.
* 모든 하위 (자식) 리스너가 제거된다.

```javascript
<script>
  export default {
    destroyed() {
      /* statement */
    }
  }
</script>
```

> ### 참고자료
> <https://medium.com/witinweb/vue-js-라이프사이클-이해하기-7780cdd97dd4>  
> <https://alligator.io/vuejs/component-lifecycle/>