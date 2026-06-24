<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>ATS | 평가서 상세</title>
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
	border-radius: 16px;
	padding: 28px;
	border: 1px solid #f0e0cc;
	margin-bottom: 20px
}

.detail-title {
	font-size: 18px;
	font-weight: 700;
	color: #3d1c02;
	margin-bottom: 4px
}

.detail-sub {
	font-size: 13px;
	color: #a07050;
	margin-bottom: 22px
}

.score-grid {
	display: grid;
	grid-template-columns: repeat(3, 1fr);
	gap: 14px;
	margin-bottom: 20px
}

.score-card {
	background: #fdf8f3;
	border-radius: 12px;
	padding: 16px;
	text-align: center;
	border: 1px solid #f0e0cc
}

.score-label {
	font-size: 12px;
	color: #b08060;
	margin-bottom: 8px
}

.score-val {
	font-size: 32px;
	font-weight: 700;
	color: #8b4513
}

.score-max {
	font-size: 13px;
	color: #b08060
}

.score-bar-h {
	height: 8px;
	background: #f0e0cc;
	border-radius: 4px;
	margin-top: 10px;
	overflow: hidden
}

.score-bar-fill {
	height: 100%;
	border-radius: 4px;
	background: linear-gradient(90deg, #8b4513, #d4a017)
}

.avg-box {
	background: linear-gradient(135deg, #5c2a0e, #8b4513);
	border-radius: 12px;
	padding: 18px 24px;
	display: flex;
	justify-content: space-between;
	align-items: center;
	margin-bottom: 20px
}

.avg-label {
	font-size: 13px;
	color: rgba(255, 255, 255, .7)
}

.avg-num {
	font-size: 36px;
	font-weight: 700;
	color: #fff
}

.recommend-badge {
	display: inline-block;
	padding: 6px 16px;
	border-radius: 20px;
	font-size: 13px;
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

.comment-box {
	background: #fdf8f3;
	border-radius: 10px;
	padding: 16px;
	font-size: 13.5px;
	color: #6b4025;
	line-height: 1.8;
	white-space: pre-wrap;
	border: 1px solid #f0e0cc
}

.section-title {
	font-size: 14px;
	font-weight: 600;
	color: #3d1c02;
	margin-bottom: 12px;
	padding-bottom: 8px;
	border-bottom: 1.5px solid #f5ede3
}

.other-eval {
	background: #fdf8f3;
	border-radius: 10px;
	padding: 14px;
	border: 1px solid #f0e0cc;
	margin-bottom: 10px
}

.other-header {
	display: flex;
	justify-content: space-between;
	align-items: center;
	margin-bottom: 10px
}

.other-name {
	font-size: 13px;
	font-weight: 600;
	color: #3d1c02
}

.other-scores {
	display: flex;
	gap: 14px;
	font-size: 12px;
	color: #8b6040
}

.other-comment {
	font-size: 12.5px;
	color: #6b4025;
	line-height: 1.7;
	margin-top: 8px
}

.btn-group {
	display: flex;
	gap: 10px;
	margin-top: 20px
}

.btn-back {
	padding: 10px 20px;
	background: #f5ede3;
	color: #8b4513;
	border: 1.5px solid #e8d5c0;
	border-radius: 10px;
	font-size: 13px;
	font-weight: 500;
	text-decoration: none
}

.btn-edit {
	padding: 10px 20px;
	background: linear-gradient(135deg, #6b3015, #8b4513);
	color: #fff;
	border: none;
	border-radius: 10px;
	font-size: 13px;
	font-weight: 600;
	text-decoration: none
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
	String userId = (String) session.getAttribute("userId");
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
		<div class="breadcrumb">
			<a href="/eval/list">면접 평가서</a> › ${eval.applicantName} 평가
		</div>

		<div class="detail-card">
			<div class="detail-title">${eval.applicantName}면접평가서</div>
			<div class="detail-sub">${eval.postingTitle}&nbsp;|&nbsp;면접관:
				${eval.interviewerName} &nbsp;|&nbsp; ${eval.evalDate}</div>

			<div class="score-grid">
				<div class="score-card">
					<div class="score-label">기술 역량</div>
					<div class="score-val">${eval.techScore}<span
							class="score-max">/5</span>
					</div>
					<div class="score-bar-h">
						<div class="score-bar-fill" style="width:${eval.techScore*20}%"></div>
					</div>
				</div>
				<div class="score-card">
					<div class="score-label">커뮤니케이션</div>
					<div class="score-val">${eval.commScore}<span
							class="score-max">/5</span>
					</div>
					<div class="score-bar-h">
						<div class="score-bar-fill" style="width:${eval.commScore*20}%"></div>
					</div>
				</div>
				<div class="score-card">
					<div class="score-label">문제 해결력</div>
					<div class="score-val">${eval.solveScore}<span
							class="score-max">/5</span>
					</div>
					<div class="score-bar-h">
						<div class="score-bar-fill" style="width:${eval.solveScore*20}%"></div>
					</div>
				</div>
			</div>

			<div class="avg-box">
				<div>
					<div class="avg-label">종합 평균 점수</div>
					<div class="avg-num">${eval.avgScore}
						<span style="font-size: 16px; opacity: .7">/ 5.0</span>
					</div>
				</div>
				<span class="recommend-badge r-${eval.recommend}"> <c:choose>
						<c:when test="${eval.recommend=='PASS'}">✅ 합격 권고</c:when>
						<c:otherwise>❌ 불합격 권고</c:otherwise>
					</c:choose>
				</span>
			</div>

			<div class="section-title">종합 의견</div>
			<div class="comment-box">
				<c:choose>
					<c:when test="${not empty eval.comment}">${eval.comment}</c:when>
					<c:otherwise>작성된 의견이 없습니다.</c:otherwise>
				</c:choose>
			</div>

			<div class="btn-group">
				<a href="/eval/list" class="btn-back">← 목록</a>
				<%
				if (isAdmin || (userId != null && userId.equals("${eval.interviewerId}"))) {
				%>
				<a href="/eval/edit/${eval.evalId}" class="btn-edit">✏️ 수정</a>
				<%
				}
				%>
			</div>
		</div>

		<c:if test="${evalList.size() > 1}">
			<div class="detail-card">
				<div class="section-title">📊 다른 면접관 평가 (${evalList.size()}명
					참여)</div>
				<c:forEach var="e" items="${evalList}">
					<div class="other-eval">
						<div class="other-header">
							<span class="other-name">${e.interviewerName}</span> <span
								class="recommend-badge r-${e.recommend}"
								style="font-size: 11px; padding: 2px 9px"> <c:choose>
									<c:when test="${e.recommend=='PASS'}">합격 권고</c:when>
									<c:otherwise>불합격 권고</c:otherwise>
								</c:choose>
							</span>
						</div>
						<div class="other-scores">
							<span>기술: <strong>${e.techScore}점</strong></span> <span>소통:
								<strong>${e.commScore}점</strong>
							</span> <span>문제해결: <strong>${e.solveScore}점</strong></span> <span>평균:
								<strong style="color: #8b4513">${e.avgScore}점</strong>
							</span>
						</div>
						<c:if test="${not empty e.comment}">
							<div class="other-comment">${e.comment}</div>
						</c:if>
					</div>
				</c:forEach>
			</div>
		</c:if>
	</main>
</body>
</html>