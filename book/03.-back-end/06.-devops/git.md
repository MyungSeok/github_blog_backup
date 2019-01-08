# Git

## SSH 키 만들기

### ssh-keygen

```bash
$ ssh-keygen -t rsa -b 4096 -C "rrest@icloud.com"

Generating public/private rsa key pair.
Enter file in which to save the key (/Users/rrest/.ssh/id_rsa):
/Users/rrest/.ssh/id_rsa already exists.
Overwrite (y/n)? y
Enter passphrase (empty for no passphrase):
Enter same passphrase again:
Your identification has been saved in /Users/rrest/.ssh/id_rsa.
Your public key has been saved in /Users/rrest/.ssh/id_rsa.pub.
The key fingerprint is:
SHA256:1iaYasPL6u/8cJY06MnhX7Z2J45cr4nz673wT8cnI20 rrest@icloud.com
The key's randomart image is:
+---[RSA 4096]----+
|                 |
|                 |
|                 |
|     . o .       |
|    o = S o      |
|   = = + o   . . |
|    @ + o o . E +|
|   + B +o=o*.+ +.|
| .o+*.o.=*B==o.  |
+----[SHA256]-----+
```

`~/.ssh` 경로에 다음 파일이 생성된다.

* id\_rsa
  * 개인키 \(지정 경로 `~/.ssh` 에 보관\)
* id\_rsa.pub
  * 공개키 \(복사해서 저장소에 넣음\)

#### Parameters

* -t
  * 암호화 타입
* -b
  * 생성할 키의 비트수 \(default: 2048\)
* -C
  * 주석입력

## 리버트 (Revert)

### Syntax

```bash
$ git revert {COMMIT_NUMBER}
```

## CLI

### 로컬 브랜치 생성 & 체크아웃

현재 브랜치 기준으로 생성된다.

```bash
$ git checkout -b feature/CNST-001
```

### 로컬 상태 보기 (변경 파일)

```bash
$ git status
```

### 로컬 작업 Staged files 로 올리기

```bash
$ git add file1 file2 file3 (...)
```

```bash
$ git add .
```

```bash
$ git add *
```

### 로컬 작업 Unstaged files 로 내리기

```bash
$ git reset file1 file2 file3 (...)
```

```bash
$ git reset *
```

```bash
$ git reset .
```

### 로컬 작업 되돌리기

Unstaged files 로 들어 있어야 함

```bash
$ git checkout file1
```

```bash
$ git checkout *
```

### 작업 커밋하기

```bash
$ git commit -m '작업내역'
```

### 작업 푸시히기

```bash
$ git push
```

### 원격 브랜치 업데이트

새로 생성된 브랜치 정보를 가져온다.

```bash
$ git remote update
```

### 원격 브랜치 정보 리스트

```bash
$ git branch -r
```

### 원격 브랜치 다운로드 & 체크아웃

원격 브랜치랑 동잃한 이름으로 체크아웃 한다.

```bash
$ git checkout -t origin/feature/CNST-001
```

```bash
$ git checkout --track origin/feature/CNST-001
```

### 머지 되돌리기 (Merge Commit Revert)

머지 커밋 (Merge Commit) 일반적인 리버트로는 불가능 하다.

`-m 1` 옵션을 넣어 줘야 한다.

```bash
$ git revert -m 1 {COMMIT_NUMBER}
```

> ### 참고자료
> <https://mylko72.gitbooks.io/git/content/remote/branch.html>

### SSH 등록 후 원격 저정소 푸시 비밀번호 물어볼때

아래와 같이 키체인에 추가한다.

```bash
$ ssh-add -K ~/.ssh/id_rsa
```