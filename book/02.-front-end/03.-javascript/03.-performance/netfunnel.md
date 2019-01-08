# NetFunnel (넷퍼넬)

지연 네트워킹의 한 방법으로 _**Aim To G**_ 사 에서 개발한 지연 네트워킹 서비스 솔루션이다.

대부분 대량의 접속처리시에 대기열을 만들어 놓고 순차적으로 처리하는 방식으로  
쿠폰, 예매, 대용량 트래픽 처리시에 용이하다.

JS 단에서 실제 자원 호출 전에 `NetFunnel` 모듈을 호출하여 자원을 먼저 호출하여 사용 가능 상태인지 확인 후 처리한다.

```html
<!-- Resource JS -->
<script type="text/javascript" src="/netfunnel.js"></script>
<!-- Config & Skin -->
<script type="text/javascript" src="/netfunnel_config.js"></script>
```

```javascript
// NetFunnel_Action( overriding params:Object, callback:Function ); 
NetFunnel_Action({
  service_id:'SERVICE ID',
  action_id:'ACTION ID',
  skin_id:'SKIN ID'
}, function(ev, ret){
  /* success statement */
  /* Ajax Logic */
})
```

Action Key 키 반납

```javascript
NetFunnel_Complete({
  service_id:'SERVICE ID',
  action_id:'ACTION ID',
  skin_id:'SKIN ID'
}, function(ev, ret) {
});
```