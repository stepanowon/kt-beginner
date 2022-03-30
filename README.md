# KT 신입사원 교육 환경 설정

---

### 개발 환경 설정

- KT_Beginner_Setup_Guide.docx 문서를 열어서 환경 설치를 시작합니다.
- 설치 도중 오류 또는 문제점 발생시 강사에게 즉시 알려주세요

## H2 데이터베이스 설치 관련

### 설치 문제 해결

- 첫번째 시도
  - c:\users\[사용자명]\ 디렉토리에서 test로 시작하는 파일을 삭제한 후 다시 실행
- 두번째 시도
  - 포트번호가 충돌나는 경우는 c:\users\[사용자명]\ 디렉토리에서 .h2.properties 파일을 찾아 webPort를 편집한다.

```.h2.properties
webSSL=false
webAllowOthers=false
webPort=8082
10=Generic DB2|com.ibm.db2.jcc.DB2Driver|jdbc\:db2\://localhost/test|
11=Generic Oracle|oracle.jdbc.driver.OracleDriver|jdbc\:oracle\:thin\:@localhost\:1521\:XE|sa
......(생략)
```

### 초기 설정

- h2.bat를 실행한 후 브라우저 화면이 나타나면 저장한 설정 중 'Generic H2 (Embedded)'로 실행한다.
- https://github.com/stepanowon/kt-beginner/tree/main/sql-fundamental 경로에서 내려받은 두개의 SQL 파일을 이용해 H2 콘솔에 넣고 실행한다(이건 강사와 함께 해보자)
