# Spring

스프링 프레임워크의 전반적인 이야기를 다루도록 한다.

> ### 참고자료
> <https://spring.io/projects>

## 아티팩트 (Artifact)

아티팩트는 소프트웨어 개발 프로젝트를 진행하면서 생성하는 다양한 _**산출물**_ 을 의미한다.

통상적으로는 _**라이브러리와 동일한 의미로 해석**_ 되며 `.jar`, `.war`, `.ear` 등의 확장자를 갖게된다.

### 아티팩트 저장소 (Artifact Repository)

아티팩트 저장소는 아티팩트와 메타데이터를 저장하고 관리하는 저장소를 의미한다.

저장소는 계층구조로 접근 가능하며 이 계층적 구조를 GAV (Group, Artifact, Version) 구조라고 하며 메이븐 (Maven) 에서 의존성을 찾을 때 참고하는 구조이기도 한다.

넥서스 (Nexus) 가 이 저장소에 사용되는 대표적인 제품이다.

> ### 참고자료
> <https://www.lesstif.com/pages/viewpage.action?pageId=18219542>