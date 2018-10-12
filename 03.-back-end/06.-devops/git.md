# Git

## ssh-keygen

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

#### Parameter

* -t
  * 암호화 타입
* -b
  * 생성할 키의 비트수 \(default: 2048\)
* -C 
  * 주석입력 

## Revert

#### Syntax

```bash
$ git revert {COMMIT_NUMBER} 
```

### Merge Commit Revert

일반적인 리버트로는 불가능 하다.

`-m 1` 옵션을 넣어 줘야 한다.

```bash
$ git revert -m 1 {COMMIT_NUMBER} 
```

