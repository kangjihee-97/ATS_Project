<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>ATS | 이메일 인증</title>
<style>
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500;700&display=swap');
*, *::before, *::after { box-sizing: border-box; margin: 0; padding: 0; }
body {
  font-family: 'Noto Sans KR', sans-serif;
  background: linear-gradient(135deg, #3d1c02 0%, #5c2a0e 50%, #8b4513 100%);
  min-height: 100vh;
  display: flex;
  align-items: center;
  justify-content: center;
}
.card {
  background: #fff;
  border-radius: 20px;
  padding: 48px 44px;
  width: 420px;
  box-shadow: 0 20px 60px rgba(0,0,0,0.3);
  text-align: center;
}
.logo { font-size: 28px; font-weight: 700; color: #3d1c02; letter-spacing: 2px; margin-bottom: 6px; }
.logo-sub { font-size: 11px; color: #b08060; letter-spacing: 3px; margin-bottom: 32px; }
.icon { font-size: 48px; margin-bottom: 16px; }
.title { font-size: 20px; font-weight: 700; color: #3d1c02; margin-bottom: 8px; }
.desc { font-size: 13px; color: #a07050; margin-bottom: 8px; line-height: 1.6; }
.email-mask { font-size: 14px; font-weight: 600; color: #3d1c02; margin-bottom: 28px; }
.input-wrap { position: relative; margin-bottom: 16px; }
.code-input {
  width: 100%;
  padding: 16px;
  font-size: 24px;
  font-weight: 700;
  text-align: center;
  letter-spacing: 12px;
  border: 2px solid #e0d0c0;
  border-radius: 12px;
  outline: none;
  color: #3d1c02;
  font-family: 'Noto Sans KR', sans-serif;
  transition: border-color .2s;
}
.code-input:focus { border-color: #d4a017; }
.btn {
  width: 100%;
  padding: 14px;
  border: none;
  border-radius: 12px;
  font-size: 15px;
  font-weight: 700;
  cursor: pointer;
  font-family: 'Noto Sans KR', sans-serif;
  transition: all .2s;
  margin-bottom: 10px;
}
.btn-primary { background: linear-gradient(135deg, #3d1c02, #5c2a0e); color: #fff; }
.btn-primary:hover { opacity: .9; }
.btn-secondary { background: #f5ede3; color: #8b4513; border: 1px solid #e0c8a0; }
.btn-secondary:hover { background: #ede0d0; }
.msg-error { color: #dc2626; font-size: 13px; margin-bottom: 12px; }
.msg-success { color: #16a34a; font-size: 13px; margin-bottom: 12px; }
.timer { font-size: 13px; color: #a07050; margin-bottom: 16px; }
.timer span { font-weight: 700; color: #dc2626; }
.back-link { font-size: 12px; color: #b08060; text-decoration: none; display: block; margin-top: 8px; }
.back-link:hover { color: #8b4513; }
</style>
</head>
<body>
<div class="card">
  <div class="logo">VERNALIS</div>
  <div class="logo-sub">Applicant Tracking</div>
  <div class="icon">📧</div>
  <div class="title">이메일 인증</div>
  <div class="desc">아래 이메일로 인증번호를 발송했습니다.</div>
  <div class="email-mask">${email}</div>

  <c:if test="${not empty msg}">
    <c:choose>
      <c:when test="${msg == '인증번호를 재발송했습니다.'}">
        <div class="msg-success">${msg}</div>
      </c:when>
      <c:otherwise>
        <div class="msg-error">${msg}</div>
      </c:otherwise>
    </c:choose>
  </c:if>

  <form action="/user/verify" method="post">
    <div class="input-wrap">
      <input type="text" name="code" class="code-input" maxlength="6" placeholder="000000" autofocus autocomplete="off" />
    </div>
    <div class="timer">인증번호는 <span>3분</span> 내에 입력해 주세요.</div>
    <button type="submit" class="btn btn-primary">인증 확인</button>
  </form>

  <form action="/user/resendCode" method="post">
    <button type="submit" class="btn btn-secondary">인증번호 재발송</button>
  </form>

  <a href="/user/login" class="back-link">← 로그인으로 돌아가기</a>
</div>
</body>
</html>
