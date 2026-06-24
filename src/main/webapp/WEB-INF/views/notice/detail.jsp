<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>ATS | 공지 상세</title>
<style>
@import
	url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500;700&display=swap')
	;

*, *::before, *::after {
	box-sizing: border-box;
	margin: 0;
	padding: 0
}

body {
	font-family: 'Noto Sans KR', sans-serif;
	background: #f5ede3;
	display: flex;
	min-height: 100vh;
	color: #3d1c02
}

.sidebar {
	width: 230px;
	min-height: 100vh;
	flex-shrink: 0;
	background: linear-gradient(180deg, #3d1c02, #5c2a0e);
	display: flex;
	flex-direction: column;
	position: fixed;
	top: 0;
	left: 0;
	height: 100%;
	z-index: 100;
	overflow-y: auto
}

.sb-logo {
	padding: 28px 22px 24px;
	border-bottom: 1px solid rgba(255, 255, 255, .08)
}

.sb-logo-row {
	display: flex;
	align-items: center;
	gap: 10px
}

.sb-logo-box {
	width: 38px;
	height: 38px;
	border-radius: 10px;
	background: linear-gradient(135deg, #d4a017, #e8c547);
	display: flex;
	align-items: center;
	justify-content: center;
	font-size: 18px
}

.sb-logo-name {
	font-size: 18px;
	font-weight: 700;
	color: #fff;
	letter-spacing: 1px
}

.sb-logo-sub {
	font-size: 9px;
	color: rgba(255, 255, 255, .35);
	letter-spacing: 2px;
	margin-top: 1px
}

.sb-section {
	padding: 20px 14px 8px;
	font-size: 10px;
	color: rgba(255, 255, 255, .3);
	letter-spacing: 1.5px;
	text-transform: uppercase
}

.sb-menu {
	list-style: none;
	padding: 0 10px
}

.sb-menu li a {
	display: flex;
	align-items: center;
	gap: 10px;
	padding: 10px 14px;
	border-radius: 10px;
	text-decoration: none;
	font-size: 13.5px;
	color: rgba(255, 255, 255, .6);
	transition: all .2s;
	margin-bottom: 2px
}

.sb-menu li a:hover {
	background: rgba(255, 255, 255, .07)
}

.sb-menu li a.active {
	background: rgba(212, 160, 23, .18);
	color: #e8c547;
	font-weight: 500
}

.sb-menu li a .ico {
	font-size: 16px;
	width: 20px;
	text-align: center
}

.sb-bottom {
	margin-top: auto;
	padding: 16px 14px;
	border-top: 1px solid rgba(255, 255, 255, .08)
}

.sb-user {
	display: flex;
	align-items: center;
	gap: 10px
}

.sb-avatar {
	width: 36px;
	height: 36px;
	border-radius: 50%;
	background: linear-gradient(135deg, #d4a017, #f0c040);
	display: flex;
	align-items: center;
	justify-content: center;
	font-size: 14px;
	font-weight: 700;
	color: #3d1c02;
	flex-shrink: 0
}

.sb-user-name {
	font-size: 13px;
	font-weight: 500;
	color: #fff
}

.sb-user-role {
	font-size: 10.5px;
	color: rgba(255, 255, 255, .4)
}

.sb-logout {
	font-size: 11px;
	color: rgba(255, 255, 255, .35);
	text-decoration: none;
	margin-top: 4px;
	display: block
}

.main {
	margin-left: 230px;
	flex: 1;
	padding: 30px;
	min-width: 0;
	display: flex;
	flex-direction: column;
	align-items: center
}

.breadcrumb {
	width: 100%;
	max-width: 740px;
	font-size: 12px;
	color: #b08060;
	margin-bottom: 16px
}

.breadcrumb a {
	color: #8b4513;
	text-decoration: none
}

.detail-card {
	background: #fff;
	border-radius: 20px;
	padding: 36px 40px;
	width: 100%;
	max-width: 740px;
	border: 1px solid #f0e0cc;
	box-shadow: 0 4px 20px rgba(139, 69, 19, .06)
}

.notice-header {
	margin-bottom: 24px;
	padding-bottom: 20px;
	border-bottom: 1.5px solid #f5ede3
}

.notice-title {
	font-size: 22px;
	font-weight: 700;
	color: #3d1c02;
	line-height: 1.4;
	margin-bottom: 12px
}

.pin-badge {
	display: inline-block;
	padding: 3px 10px;
	border-radius: 10px;
	background: #fef3c7;
	color: #92400e;
	font-size: 11px;
	font-weight: 600;
	margin-right: 8px
}

.notice-meta {
	display: flex;
	gap: 16px;
	font-size: 12.5px;
	color: #b08060
}

.meta-item {
	display: flex;
	align-items: center;
	gap: 5px
}

.notice-content {
	font-size: 14.5px;
	line-height: 1.9;
	color: #4a2800;
	white-space: pre-wrap;
	min-height: 120px
}

.btn-group {
	display: flex;
	gap: 10px;
	margin-top: 28px
}

.btn-back {
	padding: 10px 22px;
	background: #f5ede3;
	color: #8b4513;
	border: 1.5px solid #e8d5c0;
	border-radius: 10px;
	font-size: 13px;
	text-decoration: none
}

.btn-del {
	padding: 10px 22px;
	background: #fee2e2;
	color: #991b1b;
	border: none;
	border-radius: 10px;
	font-size: 13px;
	font-weight: 500;
	cursor: pointer;
	font-family: 'Noto Sans KR', sans-serif
}
</style>
</head>
<body>
	<%
	String userName = (String) session.getAttribute("userName");
	Boolean isMaster = Boolean.TRUE.equals(session.getAttribute("isMaster"));
	Boolean isAdmin = Boolean.TRUE.equals(session.getAttribute("isAdmin"));
	String initial = (userName != null && userName.length() > 0) ? String.valueOf(userName.charAt(0)) : "U";
	String roleLabel = isMaster ? "최고관리자" : isAdmin ? "인사담당자" : "면접관";
	%>
	<nav class="sidebar">
		<div class="sb-logo">
			<div class="sb-logo-row">
				<img src="/img/vernalis-logo.png"
					style="width: 42px; height: 42px; object-fit: contain; border-radius: 8px; flex-shrink: 0" />
				<div>
					<div class="sb-logo-name">VERNALIS</div>
					<div class="sb-logo-sub">Applicant Tracking</div>
				</div>
			</div>
		</div>
		<ul class="sb-menu" style="padding: 10px 10px 0">
			<li><a href="/intro"
				style="background: linear-gradient(135deg, rgba(212, 160, 23, .2), rgba(139, 69, 19, .15)); color: #e8c547; font-weight: 600; border: 1px solid rgba(212, 160, 23, .3)"><span
					class="ico">✨</span>시스템 소개</a></li>
		</ul>
		<div class="sb-section">메인</div>
		<ul class="sb-menu">
			<li><a href="/dashboard"><span class="ico">🏠</span>대시보드</a></li>
			<li><a href="/calendar"><span class="ico">📆</span>캘린더</a></li>
		</ul>
		<div class="sb-section">채용 관리</div>
		<ul class="sb-menu">
			<li><a href="/posting/list"><span class="ico">📢</span>채용 공고</a></li>
			<li><a href="/application/list"><span class="ico">👥</span>지원자
					목록</a></li>
			<li><a href="/pipeline/list"><span class="ico">📋</span>파이프라인</a></li>
			<li><a href="/pipeline/history"><span class="ico">📜</span>파이프라인 히스토리</a></li>
			<li><a href="/schedule/list"><span class="ico">📅</span>면접
					일정</a></li>
			<li><a href="/eval/list"><span class="ico">📝</span>면접 평가서</a></li>
		</ul>
		<div class="sb-section">분석</div>
		<ul class="sb-menu">
			<li><a href="/stats"><span class="ico">📊</span>통계 리포트</a></li>
			<%
			if (isAdmin) {
			%><li><a href="/admin/users"><span class="ico">⚙️</span>회원
					관리</a></li>
			<%
			}
			%>
		</ul>
		<div class="sb-section">공지</div>
		<ul class="sb-menu">
			<li><a href="/notice/list" class="active"><span class="ico">📣</span>공지사항</a></li>
		</ul>
		<div class="sb-section">내 정보</div>
		<ul class="sb-menu">
			<li><a href="/mypage"><span class="ico">👤</span>마이 페이지</a></li>
		</ul>
		<div class="sb-bottom">
			<div class="sb-user" onclick="location.href='/user/mypage'" style="cursor:pointer">
				<div class="sb-avatar"><%=initial%></div>
				<div style="flex: 1; min-width: 0">
					<div class="sb-user-name"><%=userName%></div>
					<div class="sb-user-role"><%=roleLabel%></div>
				</div>
			</div>
			<a href="/user/logout" class="sb-logout">← 로그아웃</a>
		</div>
	</nav>

	<main class="main">
		<div class="breadcrumb">
			<a href="/notice/list">공지사항</a> › ${notice.title}
		</div>
		<div class="detail-card">
			<div class="notice-header">
				<div class="notice-title">
					<c:if test="${notice.isPinned == 1}">
						<span class="pin-badge">📌 공지</span>
					</c:if>
					${notice.title}
				</div>
				<div class="notice-meta">
					<span class="meta-item">✍️ ${notice.createdByName}</span> <span
						class="meta-item">📅 ${notice.createdAt.substring(0,10)}</span>
					<c:if test="${not notice.createdAt.equals(notice.updatedAt)}">
						<span class="meta-item" style="color: #d4a017">✏️ 수정됨</span>
					</c:if>
				</div>
			</div>

			<div class="notice-content">
				<c:choose>
					<c:when test="${not empty notice.content}">${notice.content}</c:when>
					<c:otherwise>
						<span style="color: #b08060">내용이 없습니다.</span>
					</c:otherwise>
				</c:choose>
			</div>

			<div class="btn-group">
				<a href="/notice/list" class="btn-back">← 목록으로</a>
				<%
				if (isAdmin) {
				%>
				<form action="/notice/delete/${notice.noticeId}" method="post"
					style="display: inline">
					<button type="submit" class="btn-del"
						onclick="return confirm('이 공지를 삭제하시겠습니까?')">🗑 삭제</button>
				</form>
				<%
				}
				%>
			</div>
		</div>
	</main>
</body>
</html>