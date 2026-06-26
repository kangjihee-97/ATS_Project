# 🌿 VERNALIS — AI 융합 채용 관리 시스템

> 채용의 모든 과정을 하나의 플랫폼에서 스마트하게 관리하세요.

<br>

## 📌 프로젝트 소개

**VERNALIS**는 채용 담당자의 반복적인 업무를 줄이고, 데이터 기반의 채용 의사결정을 돕기 위해 개발된 AI 융합 채용 관리 시스템(ATS)입니다.

지원자 관리부터 면접 일정, 합격/불합격 통보, 통계 분석까지 하나의 플랫폼에서 처리할 수 있습니다.

<br>

## 👥 팀원 소개

| 이름 | 역할 | 담당 업무 |
|------|------|-----------|
| 김도현 | 팀장 | 메인 대시보드, 캘린더, 공지사항, 로그인 페이지, AI 융합 |
| 정유한 | 팀원 | 채용 공고, 마이페이지, 파이프라인, 아이디 중복 확인 |
| 강지희 | 팀원 | 단계별 흐름 UI, 통계 리포트, 차트 시각화, 회원관리, Ajax 실시간 단계 변경 |

<br>

## 📅 개발 기간

**2025.05.26 ~ 2026.06.27 (총 5주)**

<br>

## 🛠 기술 스택

### Backend
![Java](https://img.shields.io/badge/Java-17-007396?style=flat&logo=java)
![Spring Boot](https://img.shields.io/badge/Spring_Boot-3.2.5-6DB33F?style=flat&logo=springboot)
![MyBatis](https://img.shields.io/badge/MyBatis-3.x-000000?style=flat)
![MySQL](https://img.shields.io/badge/MySQL-8.0-4479A1?style=flat&logo=mysql)

### Frontend
![JSP](https://img.shields.io/badge/JSP-JSTL-orange?style=flat)
![HTML5](https://img.shields.io/badge/HTML5-E34F26?style=flat&logo=html5&logoColor=white)
![CSS3](https://img.shields.io/badge/CSS3-1572B6?style=flat&logo=css3&logoColor=white)
![JavaScript](https://img.shields.io/badge/JavaScript-F7DF1E?style=flat&logo=javascript&logoColor=black)

### Infra
![Docker](https://img.shields.io/badge/Docker-2496ED?style=flat&logo=docker&logoColor=white)
![AWS EC2](https://img.shields.io/badge/AWS_EC2-FF9900?style=flat&logo=amazonaws&logoColor=white)

### API
![Gemini AI](https://img.shields.io/badge/Gemini_AI-4285F4?style=flat&logo=google&logoColor=white)
![Gmail SMTP](https://img.shields.io/badge/Gmail_SMTP-EA4335?style=flat&logo=gmail&logoColor=white)

<br>

## ✨ 주요 기능

### 🔐 로그인 / 회원가입
- BCrypt 단방향 암호화 비밀번호 저장
- 실시간 비밀번호 강도 게이지 및 조건 체크리스트
- 아이디 / 이메일 / 연락처 중복 확인
- 이메일 2단계 인증 보안 로그인

### 📊 메인 대시보드
- KPI 카드 (전체 지원자 / 서류 검토 / 면접 진행 / 최종 합격)
- 채용 파이프라인 현황 차트
- **Gemini AI** 실시간 채용 현황 분석 및 행동 추천

### 📋 채용 공고 관리
- 공고 등록 / 수정 / 삭제 / 강제 마감
- 마감일 자동 상태 변경
- 공고별 지원자 수 실시간 집계

### 👤 지원자 관리
- 지원서 등록 (이력서 파일 첨부)
- 6가지 기준 정렬 및 엑셀 내보내기
- **Gemini AI** 자기소개서 분석 → 강점 / 면접 추천 질문 자동 생성

### 🗂 채용 파이프라인
- 칸반 보드 드래그 앤 드롭 단계 변경
- 변경 즉시 DB 반영
- 합격 / 불합격 확정 및 불합격 사유 기록

### 📁 파이프라인 히스토리
- 최종 확정 지원자 이력 관리
- 필터 / 검색 / 정렬 / 복수 선택 삭제
- 서버사이드 페이징

### 📅 면접 일정 / 평가서
- 면접 일정 캘린더 관리
- 동일 면접관 1시간 이내 중복 방지 로직
- 항목별 점수 평가서 작성

### 📈 통계 리포트
- 이탈률 퍼널 차트
- 불합격 사유 TOP 5 자동 집계
- **Gemini AI** 원인 분석 및 개선 방향 제시
- PDF 저장 / 엑셀 다운로드

### 👥 회원 관리
- MASTER / ADMIN / INTERVIEWER 권한 기반 접근 제어
- 계정 상태 관리 (ACTIVE / INACTIVE)
- 삭제 로그 관리

### 📢 공지사항
- 공지 등록 / 조회 / 삭제

### 👤 마이페이지
- 개인정보 수정 / 비밀번호 변경

<br>

## 🏗 시스템 아키텍처

```
사용자 (Browser)
     ↓
AWS EC2 (Docker)
     ↓
Spring Boot (Tomcat 내장)
     ↓          ↓
 MySQL DB    Gemini AI API
```

<br>

## 📂 프로젝트 구조

```
ATS_Project/
├── src/main/java/com/ats/project/
│   ├── config/          # 설정
│   ├── controller/      # MVC 컨트롤러
│   ├── dao/             # MyBatis DAO
│   ├── model/           # VO 클래스
│   ├── service/         # 비즈니스 로직
│   └── AtsProjectApplication.java
├── src/main/resources/
│   ├── mapper/          # MyBatis XML Mapper
│   └── application.properties
└── src/main/webapp/
    └── WEB-INF/views/   # JSP 뷰
```

<br>

## 🔒 보안

- BCrypt 단방향 해시 암호화로 비밀번호 보호
- 권한 기반 접근 제어 (MASTER / ADMIN / INTERVIEWER)
- 이메일 2단계 인증 보안 로그인

<br>

## 🐳 배포

Docker + AWS EC2 환경에서 배포하였습니다.

```bash
git clone https://github.com/kangjihee-97/ATS_Project.git
cd ATS_Project
# .env 파일 설정 후
docker-compose up -d --build
```

