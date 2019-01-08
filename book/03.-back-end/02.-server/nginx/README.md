# NGINX

## 기존 Apache 랑 차이점

* apache
  * 요청마다 스레드 혹은 프로세스 생성 및 처리
* nginx
  * 요청마다 비동기 이벤트를 발생시켜 처리

## proxy\_pass

_**/etc/nginx/sites-available/default**_ 경로를 다음과 같이 수정한다.

> 이전 파일은 백업 한다.

```bash
server {
        listen 80;

        server_name localhost;

        location / {
                proxy_pass http://localhost:8080;
        }
}
```