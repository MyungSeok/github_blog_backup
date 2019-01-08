# Vue Store

## 이벤트 전달

### 동기식 이벤트 전달

```javascript
store.commit('syncFunc');
```

```javascript
new Vuex.Store({
  state: {},
  mutations: {
    // 반드시 함수형이여야 한다.
    syncFunc: (state) => {
      /* statement */
    }
  }
});
```

## 비동기 이벤트 전달

```javascript
store.dispatch('asyncFunc');
```

```javascript
new Vuex.Store({
  state: {},
  actions: {
    // 반드시 함수형이여야 하며 클로져나 스코프체인의 보장이 어렵다.
    asyncFunc: (state) => {
      /* statement */
    }
  }
});
```