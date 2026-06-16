<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>ATS | 공고 상세</title>
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
	background: linear-gradient(180deg, #3d1c02 0%, #5c2a0e 100%);
	display: flex;
	flex-direction: column;
	position: fixed;
	top: 0;
	left: 0;
	height: 100%;
	z-index: 100
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

.sb-user-info {
	flex: 1;
	min-width: 0
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
	min-width: 0
}

.breadcrumb {
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
	padding: 32px;
	border: 1px solid #f0e0cc;
	margin-bottom: 20px
}

.detail-header {
	display: flex;
	justify-content: space-between;
	align-items: flex-start;
	margin-bottom: 22px
}

.detail-title {
	font-size: 22px;
	font-weight: 700;
	color: #3d1c02
}

.detail-dept {
	font-size: 14px;
	color: #a07050;
	margin-top: 4px
}

.status-badge {
	padding: 6px 14px;
	border-radius: 20px;
	font-size: 12px;
	font-weight: 600
}

.s-OPEN {
	background: #dcfce7;
	color: #166534
}

.s-CLOSED {
	background: #fee2e2;
	color: #991b1b
}

.info-grid {
	display: grid;
	grid-template-columns: 1fr 1fr 1fr;
	gap: 14px;
	margin-bottom: 24px
}

.info-item {
	background: #fdf8f3;
	border-radius: 10px;
	padding: 14px
}

.info-label {
	font-size: 11px;
	color: #b08060;
	margin-bottom: 5px
}

.info-val {
	font-size: 15px;
	font-weight: 600;
	color: #3d1c02
}

.section-title {
	font-size: 14px;
	font-weight: 600;
	color: #3d1c02;
	margin-bottom: 10px;
	padding-bottom: 8px;
	border-bottom: 1.5px solid #f5ede3
}

.section-body {
	font-size: 13.5px;
	color: #6b4025;
	line-height: 1.8;
	white-space: pre-wrap;
	background: #fdf8f3;
	padding: 14px;
	border-radius: 10px;
	margin-bottom: 16px
}

.applicant-tag {
	display: inline-block;
	background: #fdf0e8;
	color: #8b4513;
	padding: 6px 14px;
	border-radius: 20px;
	font-size: 13px;
	font-weight: 600
}

.btn-group {
	display: flex;
	gap: 10px;
	margin-top: 22px
}

.btn-back {
	padding: 10px 20px;
	background: #fff;
	color: #8b6040;
	border: 1.5px solid #e8d5c0;
	border-radius: 10px;
	font-size: 13px;
	font-weight: 500;
	text-decoration: none
}

.btn-edit {
	padding: 10px 20px;
	background: #f5ede3;
	color: #8b4513;
	border: 1.5px solid #e8d5c0;
	border-radius: 10px;
	font-size: 13px;
	font-weight: 500;
	text-decoration: none
}

.btn-close-post {
	padding: 10px 20px;
	background: #fee2e2;
	color: #991b1b;
	border: 1.5px solid #fca5a5;
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
	String userRole = (String) session.getAttribute("userRole");
	Boolean isMaster = Boolean.TRUE.equals(session.getAttribute("isMaster"));
	Boolean isAdmin = Boolean.TRUE.equals(session.getAttribute("isAdmin"));
	Boolean isInterviewer = Boolean.TRUE.equals(session.getAttribute("isInterviewer"));
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

		<div class="sb-section">메인</div>
		<ul class="sb-menu">
			<li><a href="/dashboard"><span class="ico">🏠</span>대시보드</a></li>
			<li><a href="/calendar"><span class="ico">📆</span>캘린더</a></li>
		</ul>
		<div class="sb-section">채용 관리</div>
		<ul class="sb-menu">
			<li><a href="/posting/list" class="active"><span class="ico">📢</span>채용
					공고</a></li>
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
			if (isMaster) {
			%><li><a href="/admin/users"><span class="ico">⚙️</span>회원
					관리</a></li>
			<%
			}
			%>
		</ul>
		<div class="sb-section">공지</div>
		<ul class="sb-menu">
			<li><a href="/notice/list"><span class="ico">📣</span>공지사항</a></li>
		</ul>
		<div class="sb-section">내 정보</div>
		<ul class="sb-menu">
			<li><a href="/user/mypage"><span class="ico">👤</span>마이 페이지</a></li>
		</ul>
		<div class="sb-bottom">
			<div class="sb-user" onclick="location.href='/user/mypage'" style="cursor:pointer">
				<div class="sb-avatar"><%=initial%></div>
				<div class="sb-user-info">
					<div class="sb-user-name"><%=userName%></div>
					<div class="sb-user-role"><%=roleLabel%></div>
				</div>
			</div>
			<a href="/user/logout" class="sb-logout">← 로그아웃</a>
		</div>
	</nav>

	<main class="main">
		<div class="breadcrumb">
			<a href="/posting/list">채용 공고</a> › ${posting.title}
		</div>

		<div class="detail-card">
			<div class="detail-header">
				<div>
					<div class="detail-title">${posting.title}</div>
					<div class="detail-dept">${posting.department}</div>
				</div>
				<span class="status-badge s-${posting.status}"> <c:choose>
						<c:when test="${posting.status=='OPEN'}">모집 중</c:when>
						<c:otherwise>마감</c:otherwise>
					</c:choose>
				</span>
			</div>

			<div class="info-grid">
				<div class="info-item">
					<div class="info-label">모집 인원</div>
					<div class="info-val">${posting.headcount}명</div>
				</div>
				<div class="info-item">
					<div class="info-label">마감일</div>
					<div class="info-val">${posting.deadline}</div>
				</div>
				<div class="info-item">
					<div class="info-label">현재 지원자</div>
					<div class="info-val">
						<span class="applicant-tag">${posting.applicantCount}명</span>
					</div>
				</div>
			</div>

			<c:if test="${not empty posting.requirements}">
				<div class="section-title">자격 요건</div>
				<div class="section-body">${posting.requirements}</div>
			</c:if>

			<c:if test="${not empty posting.preferred}">
				<div class="section-title">우대 사항</div>
				<div class="section-body">${posting.preferred}</div>
			</c:if>

			<div class="btn-group">
				<a href="/posting/list" class="btn-back">← 목록</a>
				<%
				if (isAdmin) {
				%>
				<a href="/posting/edit/${posting.postingId}" class="btn-edit">✏️
					수정</a>
				<c:if test="${posting.status=='OPEN'}">
					<form action="/posting/close/${posting.postingId}" method="post"
						style="display: inline">
						<button type="submit" class="btn-close-post"
							onclick="return confirm('이 공고를 마감 처리하시겠습니까?')">🔒 마감 처리
						</button>
					</form>
				</c:if>
				<form action="/posting/delete/${posting.postingId}" method="post"
					style="display: inline">
					<button type="submit"
						style="padding: 10px 20px; background: #dc2626; color: #fff; border: none; border-radius: 10px; font-size: 13px; font-weight: 600; cursor: pointer; font-family: 'Noto Sans KR', sans-serif"
						onclick="return confirm('이 공고를 삭제하시겠습니까?\n관련된 지원서, 면접 일정, 평가서가 모두 삭제됩니다.')">
						🗑 삭제</button>
				</form>
				<%
				}
				%>
			</div>
		</div>
	</main>
</body>
</html>