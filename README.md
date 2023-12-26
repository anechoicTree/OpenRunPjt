

# 🎫 OpenRunPjt
티켓 예매 웹 서비스 구현 팀 프로젝트 / Team_5penRun

+ [개발과정]
<br>

# 📚 STACKS
<div> 
  <img src="https://img.shields.io/badge/java-007396?style=for-the-badge&logo=java&logoColor=white">
  <img src="https://img.shields.io/badge/spring-6DB33F?style=for-the-badge&logo=spring&logoColor=white">
  <img src="https://img.shields.io/badge/eclipse-2C2255?style=for-the-badge&logo=eclipseide&logoColor=white">
  <img src="https://img.shields.io/badge/apache tomcat-F8DC75?style=for-the-badge&logo=apachetomcat&logoColor=white">
  <br>
  
  <img src="https://img.shields.io/badge/html5-E34F26?style=for-the-badge&logo=html5&logoColor=white"> 
  <img src="https://img.shields.io/badge/css-1572B6?style=for-the-badge&logo=css3&logoColor=white"> 
  <img src="https://img.shields.io/badge/javascript-F7DF1E?style=for-the-badge&logo=javascript&logoColor=black"> 
  <img src="https://img.shields.io/badge/jquery-0769AD?style=for-the-badge&logo=jquery&logoColor=white">
  <br>
  
  <img src="https://img.shields.io/badge/mysql-4479A1?style=for-the-badge&logo=mysql&logoColor=white"> 
  <img src="https://img.shields.io/badge/mariaDB-003545?style=for-the-badge&logo=mariaDB&logoColor=white">   
  <img src="https://img.shields.io/badge/github-181717?style=for-the-badge&logo=github&logoColor=white">
  <img src="https://img.shields.io/badge/git-F05032?style=for-the-badge&logo=git&logoColor=white">
</div>
<br>

# 👨🏻‍💻 팀원
+ [윤황집]
+ [김예종] 
+ [송혜진]
+ [진안성]
+ [최혜빈]

# ⚙️ 개발도구
+ Front-End
  + HTML
  + CSS
  + JavaScript
+ Back-End
  + java
  + Spring
+ DBMS
  + MariaDB
+ Database-GUI
  + HeidiSQL
  + SequelPro
+ Version control & Co-operation
  + Git
  + GitHub

# 프로젝트 소개
  ### 📌 프로그램 개요
  공연, 전시 관련 API를 이용한 통합 티켓 예매 웹페이지

  현재 운영중인 대다수의 공연-전시 예매 사이트의 경우 상품 판매자가 서비스(사이트) 관리자에게 상품의 정보를 제공, 관리자가 상품을 일괄적으로 등록하는 일반 B2C 쇼핑몰 형식의 구성을 가지고 있습니다.
  
  상품 판매자가 직접 상품 판매를 할 수 있는 C2C 오픈마켓 형식의 서비스(사이트)를 구현하여, 자유로운 공연-전시 상품 판매가 이루어지는 것을 목표로 합니다.

  ### 📌 기획 의도

  판매자 회원이 직접 상품을 등록하는 오픈마켓 형식의 티켓 예매 서비스를 구현
    ▪ Spring MVC 패턴을 활용한 프론트엔드부터 백엔드까지 전 영역의 구현 경험 및 학습
    ▪ MyBatis의 어노테이션을 활용한 SQL 쿼리 매핑 및 데이터베이스 연동 구현 경험 및 학습
    ▪ Ajax 및 jquery를 활용한 비동기 처리를 통한 데이터 갱신 기능 구현 경험 및 학습

# 기능 소개
  ### ✅ 로그인 / 회원가입

  ![회원가입, 로그인]

  - 회원가입(구매자) : 이메일을 통한 인증 및 유효성검사 후 회원가입 진행
  - 회원가입(판매자) : 이메일을 통한 인증 및 유효성검사 후 회원가입 진행. 이 때, 관리자 인증(사업자 번호) 전 판매자 회원등급(미인증) 상태로 가입 됨.
  - 로그인 : 세션을 활용한 로그인 유지 기능 구현
  - 아이디 및 비밀번호 찾기 : 이메일 인증을 통한 아이디 및 비밀번호 찾기 기능 구현

  ### ✅ 메인

  ![메인]

  - 카테고리별, 랭킹별, 지역별 조회 메뉴 연동
  - 로그인, 회원가입 메뉴 연동
  - 고객센터 메뉴 연동
  - 슬라이드 형식의 메인 배너(카테고리별 필터링)

  ### ✅ 검색

  ![검색]

  - 헤더 영역 우상단 내 검색창 내 검색어 입력을 통한 통합검색 기능 구현
  - 입력된 검색어를 바탕으로 통합검색 실행 후 통합검색 페이지 내 검색결과 표시
  - 검색결과 페이지 내 정렬 및 필터 기능 구현

  ### ✅ 정렬 및 필터링

  ![정렬]
  ![필터링]

  - 정렬 : 판매순, 조회순, 추천순 (내림차순) 으로 검색 결과 정렬 기능 구현
  - 필터링 : 카테고리별(뮤지컬~전시), 지역별(서울~제주), 일자별 속성 선택을 통한 필터 기능 구현(중복 적용 가능)

  ### ✅ 상세페이지

  ![상세페이지]

  - 판매자가 직접 등록한 상품 정보를 토대로 상세페이지 제작 및 노출

  ### ✅ 예매 및 결제

  ![예매]

  - 일자, 장소, 좌석 등 속성 선택을 통한 예매 진행 및 DB 저장
  
  ![결제]

  - 결제 API(카카오페이 API)를 이용하여 결제를 진행 및 DB 저장

  ### ✅ 마이페이지

  ![구매자_마이페이지]

  - 예매내역 관리(목록조회 및 상세조회), 문의 관리(목록조회 및 상세 조회), 회원정보 관리(수정 및 탈퇴)

  ![판매자_마이페이지]

  - 상품 관리(목록조회 및 상세조회, 상품 등록-수정-삭제), 문의 관리(목록조회 및 상세조회, 답변 등록), 회원정보 관리(수정 및 탈퇴)

  ### ✅ 관리자

  ![관리자_판매자 인증]
  ![관리자_공지사항]
  ![관리자_자주 묻는 질문]
  ![관리자_이용 가이드]
  ![관리자_1:1 문의 관리]

  - 판매자 인증 : 판매자 목록 조회 및 상세 조회, 체크박스 선택 후 버튼 클릭을 통한 판매자 인증(등급변경: 미인증 > 인증) 기능 구현
  - 공지사항 관리 : 등록, 조회, 수정, 삭제 (CRUD) 기능 구현. 페이지네이션 구현
  - 자주묻는질문 관리 : 등록, 조회, 수정, 삭제 (CRUD) 기능 구현. 페이지네이션 구현
  - 이용가이드 관리 : 등록, 조회, 수정, 삭제 (CRUD) 기능 구현. 이미지 등록 및 수정 기능 구현
  - 1:1문의 관리 : 문의 목록 조회 및 상세 내역 조회, 답변 작성 및 등록된 이메일을 통한 답변 전송 기능 구현


# API 정보

   ### ☑ Kakao Pay API

      카카오페이 API를 통해 카카오페이로 결제하는 기능을 구현
