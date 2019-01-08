# 04. Database

## SQL Injection

코드 인젝션의 한 기법으로 클라이언트의 입력값을 조작하여 서버의 데이터베이스를 공격하는 방식을 말한다.

### 방어 방법

### 권한으로 제한하는 방법

Query String 을 실행을 권한에 따라 제한할 수 있도록 한다.

### 입력값 검증

정규식 혹은 유효값의 vaildation 확인을 한다.

### Prepared Statement (저장 프로시저) 사용

현존하는 가장 좋은 방법으로 사용전에 일부 컴파일 되어 실행된다.  
Query 에 미리 형식을 지정하는 것으로 지정된 형식의 Query 형식이 아니면 실행되지 않는다.

```java
try{
  String uId = "admin";
  String query = "SELECT * FROM user_info WHERE uId= ?"

  stmt = conn.prepareStatement(query);
  stmt.setString(1, uId);

  ResultSet rs = stmt.executeQuery();
  while(rs.netxt()) {
    /* statement */
  }
} catch () {
  /* statement */
} finally {
  /* statement */
}
```