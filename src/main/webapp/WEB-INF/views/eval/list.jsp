<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>ATS | 면접 평가서</title>
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

.sb-logout:hover {
	color: rgba(255, 255, 255, .7)
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

.table-wrap {
	background: #fff;
	border-radius: 16px;
	overflow: hidden;
	border: 1px solid #f0e0cc
}

.eval-table {
	width: 100%;
	border-collapse: collapse
}

.eval-table th {
	font-size: 12px;
	color: #b08060;
	font-weight: 500;
	padding: 14px 16px;
	border-bottom: 1.5px solid #f0e0cc;
	text-align: left;
	background: #fdf8f3
}

.eval-table td {
	font-size: 13px;
	color: #3d1c02;
	padding: 12px 16px;
	border-bottom: 1px solid #f5ede3;
	vertical-align: middle
}

.eval-table tr:last-child td {
	border-bottom: none
}

.eval-table tr:hover td {
	background: #fdf8f3;
	cursor: pointer
}

.score-bar {
	display: flex;
	align-items: center;
	gap: 6px
}

.score-track {
	width: 60px;
	height: 6px;
	background: #f0e0cc;
	border-radius: 3px;
	overflow: hidden
}

.score-fill {
	height: 100%;
	border-radius: 3px;
	background: linear-gradient(90deg, #8b4513, #d4a017)
}

.score-num {
	font-size: 12px;
	font-weight: 600;
	color: #8b4513
}

.recommend-badge {
	display: inline-block;
	padding: 3px 10px;
	border-radius: 20px;
	font-size: 11px;
	font-weight: 600
}

.r-PASS {
	background: #dcfce7;
	color: #166534
}

.r-FAIL {
	background: #fee2e2;
	color: #991b1b
}

.empty-state {
	text-align: center;
	padding: 60px;
	color: #b08060;
	font-size: 14px
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
			<li><a href="/posting/list"><span class="ico">📢</span>채용 공고</a></li>
			<li><a href="/application/list"><span class="ico">👥</span>지원자
					목록</a></li>
			<li><a href="/pipeline/list"><span class="ico">📋</span>파이프라인</a></li>
			<li><a href="/pipeline/history"><span class="ico">📜</span>파이프라인 히스토리</a></li>
			<li><a href="/schedule/list"><span class="ico">📅</span>면접
					일정</a></li>
			<li><a href="/eval/list" class="active"><span class="ico">📝</span>면접
					평가서</a></li>
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
				<div class="page-title">📝 면접 평가서</div>
				<div class="page-sub">총 ${list.size()}건의 평가서가 있습니다</div>
			</div>
			<%
			if (isInterviewer) {
			%>
			<a href="/eval/write" class="btn-primary">＋ 평가서 작성</a>
			<%
			}
			%>
		</div>

		<div class="table-wrap">
			<c:choose>
				<c:when test="${empty list}">
					<div class="empty-state">📭 작성된 평가서가 없습니다</div>
				</c:when>
				<c:otherwise>
					<table class="eval-table">
						<thead>
							<tr>
								<th>지원자</th>
								<th>공고</th>
								<th>면접관</th>
								<th>기술역량</th>
								<th>소통능력</th>
								<th>문제해결</th>
								<th>평균</th>
								<th>권고</th>
								<th>평가일</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="e" items="${list}">
								<tr onclick="location.href='/eval/detail/${e.evalId}'">
									<td><strong>${e.applicantName}</strong></td>
									<td style="font-size: 12px; color: #8b6040">${e.postingTitle}</td>
									<td>${e.interviewerName}</td>
									<td>
										<div class="score-bar">
											<div class="score-track">
												<div class="score-fill" style="width:${e.techScore*20}%"></div>
											</div>
											<span class="score-num">${e.techScore}</span>
										</div>
									</td>
									<td>
										<div class="score-bar">
											<div class="score-track">
												<div class="score-fill" style="width:${e.commScore*20}%"></div>
											</div>
											<span class="score-num">${e.commScore}</span>
										</div>
									</td>
									<td>
										<div class="score-bar">
											<div class="score-track">
												<div class="score-fill" style="width:${e.solveScore*20}%"></div>
											</div>
											<span class="score-num">${e.solveScore}</span>
										</div>
									</td>
									<td><strong style="color: #8b4513">${e.avgScore}</strong></td>
									<td><span class="recommend-badge r-${e.recommend}">
											<c:choose>
												<c:when test="${e.recommend=='PASS'}">합격 권고</c:when>
												<c:otherwise>불합격 권고</c:otherwise>
											</c:choose>
									</span></td>
									<td style="font-size: 12px; color: #b08060">${e.evalDate}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</c:otherwise>
			</c:choose>
		</div>
	</main>
</body>
</html>