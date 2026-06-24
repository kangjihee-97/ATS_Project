<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>ATS | 채용 공고 관리</title>
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
	background: rgba(255, 255, 255, .07);
	color: rgba(255, 255, 255, .9)
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
	color: #fff;
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap
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

.top-bar {
	display: flex;
	justify-content: space-between;
	align-items: center;
	margin-bottom: 22px
}

.page-title {
	font-size: 20px;
	font-weight: 700;
	color: #3d1c02
}

.page-sub {
	font-size: 13px;
	color: #a07050;
	margin-top: 3px
}

.btn-primary {
	padding: 10px 20px;
	background: linear-gradient(135deg, #6b3015, #8b4513);
	color: #fff;
	border: none;
	border-radius: 10px;
	font-size: 13px;
	font-weight: 600;
	cursor: pointer;
	text-decoration: none;
	display: inline-flex;
	align-items: center;
	gap: 6px;
	font-family: 'Noto Sans KR', sans-serif
}

.posting-grid {
	display: grid;
	grid-template-columns: repeat(auto-fill, minmax(280px, 1fr));
	gap: 16px
}

.posting-card {
	background: #fff;
	border-radius: 16px;
	padding: 20px;
	border: 1px solid #f0e0cc;
	cursor: pointer;
	transition: transform .2s, box-shadow .2s
}

.posting-card:hover {
	transform: translateY(-2px);
	box-shadow: 0 8px 24px rgba(139, 69, 19, .12)
}

.pc-header {
	display: flex;
	justify-content: space-between;
	align-items: flex-start;
	margin-bottom: 14px
}

.pc-title-wrap {
	flex: 1;
	min-width: 0;
	margin-right: 10px
}

.pc-title {
	font-size: 15px;
	font-weight: 700;
	color: #3d1c02;
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis
}

.pc-dept {
	font-size: 12px;
	color: #a07050;
	margin-top: 3px
}

.status-badge {
	display: inline-block;
	padding: 4px 11px;
	border-radius: 20px;
	font-size: 11px;
	font-weight: 600;
	white-space: nowrap;
	flex-shrink: 0
}

.s-OPEN {
	background: #dcfce7;
	color: #166534
}

.s-CLOSED {
	background: #fee2e2;
	color: #991b1b
}

.pc-info {
	display: flex;
	flex-direction: column;
	gap: 7px;
	margin-bottom: 14px
}

.pc-row {
	display: flex;
	align-items: center;
	gap: 8px;
	font-size: 12.5px;
	color: #8b6040
}

.pc-row .lbl {
	font-size: 11px;
	color: #b08060;
	min-width: 48px
}

.pc-footer {
	display: flex;
	justify-content: space-between;
	align-items: center;
	padding-top: 12px;
	border-top: 1px solid #f5ede3
}

.pc-cnt {
	font-size: 12px;
	color: #8b4513;
	font-weight: 600;
	background: #fdf0e8;
	padding: 4px 12px;
	border-radius: 20px
}

.pc-date {
	font-size: 11px;
	color: #b08060
}

.empty-state {
	text-align: center;
	padding: 60px;
	color: #b08060;
	background: #fff;
	border-radius: 16px;
	border: 1px solid #f0e0cc
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
		<div class="top-bar">
			<div>
				<div class="page-title">📢 채용 공고 관리</div>
				<div class="page-sub">총 ${list.size()}건의 공고가 있습니다</div>
			</div>
			<%
			if (isAdmin) {
			%><a href="/posting/write" class="btn-primary">＋ 새 공고 등록</a>
			<%
			}
			%>
		</div>
		<c:choose>
			<c:when test="${empty list}">
				<div class="empty-state">
					<div style="font-size: 48px; margin-bottom: 12px">📭</div>
					<div style="font-size: 15px; font-weight: 500; margin-bottom: 6px">등록된
						채용 공고가 없습니다</div>
				</div>
			</c:when>
			<c:otherwise>
				<div class="posting-grid">
					<c:forEach var="p" items="${list}">
						<div class="posting-card"
							onclick="location.href='/posting/detail/${p.postingId}'">
							<div class="pc-header">
								<div class="pc-title-wrap">
									<div class="pc-title">${p.title}</div>
									<div class="pc-dept">${p.department}</div>
								</div>
								<span class="status-badge s-${p.status}"><c:choose>
										<c:when test="${p.status=='OPEN'}">모집 중</c:when>
										<c:otherwise>마감</c:otherwise>
									</c:choose></span>
							</div>
							<div class="pc-info">
								<div class="pc-row">
									<span class="lbl">모집 인원</span><span>${p.headcount}명</span>
								</div>
								<div class="pc-row">
									<span class="lbl">마감일</span><span>${p.deadline}</span>
								</div>
								<div class="pc-row">
									<span class="lbl">담당자</span><span>${p.createdByName}</span>
								</div>
							</div>
							<div class="pc-footer">
								<span class="pc-cnt">지원자 ${p.applicantCount}명</span> <span
									class="pc-date">${p.createdAt}</span>
							</div>
						</div>
					</c:forEach>
				</div>
			</c:otherwise>
		</c:choose>
	</main>
</body>
</html>