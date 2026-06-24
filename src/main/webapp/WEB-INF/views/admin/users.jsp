<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>ATS | 회원 관리</title>
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

.master-badge {
	display: inline-flex;
	align-items: center;
	gap: 6px;
	padding: 6px 14px;
	background: linear-gradient(135deg, #d4a017, #e8c547);
	border-radius: 20px;
	font-size: 12px;
	font-weight: 600;
	color: #3d1c02
}

/* 통계 카드 */
.stat-row {
	display: flex;
	gap: 14px;
	margin-bottom: 22px
}

.stat-card {
	flex: 1;
	background: #fff;
	border-radius: 14px;
	padding: 16px 20px;
	border: 1px solid #f0e0cc;
	display: flex;
	align-items: center;
	gap: 14px
}

.stat-icon {
	width: 42px;
	height: 42px;
	border-radius: 12px;
	display: flex;
	align-items: center;
	justify-content: center;
	font-size: 20px
}

.stat-label {
	font-size: 12px;
	color: #b08060;
	margin-bottom: 4px
}

.stat-num {
	font-size: 22px;
	font-weight: 700;
	color: #3d1c02
}

/* 테이블 */
.table-wrap {
	background: #fff;
	border-radius: 16px;
	overflow: hidden;
	border: 1px solid #f0e0cc
}

.user-table {
	width: 100%;
	border-collapse: collapse
}

.user-table th {
	font-size: 12px;
	color: #b08060;
	font-weight: 500;
	padding: 14px 16px;
	border-bottom: 1.5px solid #f0e0cc;
	text-align: left;
	background: #fdf8f3
}

.user-table td {
	font-size: 13px;
	color: #3d1c02;
	padding: 12px 16px;
	border-bottom: 1px solid #f5ede3;
	vertical-align: middle
}

.user-table tr:last-child td {
	border-bottom: none
}

.user-avatar {
	width: 32px;
	height: 32px;
	border-radius: 50%;
	background: linear-gradient(135deg, #d4a017, #f0c040);
	display: inline-flex;
	align-items: center;
	justify-content: center;
	font-size: 13px;
	font-weight: 700;
	color: #3d1c02;
	margin-right: 8px;
	vertical-align: middle
}

/* 역할 배지 */
.role-badge {
	display: inline-block;
	padding: 3px 10px;
	border-radius: 20px;
	font-size: 11px;
	font-weight: 600
}

.r-MASTER {
	background: linear-gradient(135deg, #d4a017, #e8c547);
	color: #3d1c02
}

.r-ADMIN {
	background: #dbeafe;
	color: #1e40af
}

.r-INTERVIEWER {
	background: #ede9fe;
	color: #5b21b6
}

/* 상태 배지 */
.status-active {
	display: inline-block;
	padding: 3px 10px;
	border-radius: 20px;
	font-size: 11px;
	font-weight: 600;
	background: #dcfce7;
	color: #166534
}

.status-inactive {
	display: inline-block;
	padding: 3px 10px;
	border-radius: 20px;
	font-size: 11px;
	font-weight: 600;
	background: #fee2e2;
	color: #991b1b
}

/* 버튼 */
.action-wrap {
	display: flex;
	gap: 6px;
	align-items: center;
	flex-wrap: wrap
}

.role-select {
	padding: 5px 8px;
	border: 1.5px solid #e8d5c0;
	border-radius: 8px;
	font-size: 12px;
	font-family: 'Noto Sans KR', sans-serif;
	color: #3d1c02;
	background: #fff;
	cursor: pointer;
	outline: none
}

.role-select:focus {
	border-color: #8b4513
}

.btn-sm {
	padding: 5px 12px;
	border-radius: 8px;
	font-size: 11px;
	font-weight: 500;
	cursor: pointer;
	border: none;
	font-family: 'Noto Sans KR', sans-serif;
	transition: all .2s
}

.btn-role {
	background: #f5ede3;
	color: #8b4513;
	border: 1.5px solid #e8d5c0
}

.btn-role:hover {
	background: #e8d5c0
}

.btn-activate {
	background: #dcfce7;
	color: #166534
}

.btn-deactivate {
	background: #fef3c7;
	color: #92400e
}

.btn-del {
	background: #fee2e2;
	color: #991b1b
}

.btn-del:hover {
	background: #fca5a5
}

.me-badge {
	font-size: 10px;
	padding: 2px 7px;
	border-radius: 20px;
	background: #f0e8ff;
	color: #5b21b6;
	margin-left: 4px
}
</style>
</head>
<body>
	<%
	String userName = (String) session.getAttribute("userName");
	String userRole = (String) session.getAttribute("userRole");
	Boolean isMaster = Boolean.TRUE.equals(session.getAttribute("isMaster"));
	Boolean isAdmin = Boolean.TRUE.equals(session.getAttribute("isAdmin"));
	String initial = (userName != null && userName.length() > 0) ? String.valueOf(userName.charAt(0)) : "U";
	String myId = (String) session.getAttribute("userId");
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
			<li><a href="/eval/list"><span class="ico">📝</span>면접 평가서</a></li>
		</ul>
		<div class="sb-section">분석</div>
		<ul class="sb-menu">
			<li><a href="/stats"><span class="ico">📊</span>통계 리포트</a></li>
			<%
			if (isMaster) {
			%><li><a href="/admin/users" class="active"><span
					class="ico">⚙️</span>회원 관리</a></li>
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
					<div class="sb-user-role">최고관리자</div>
				</div>
			</div>
			<a href="/user/logout" class="sb-logout">← 로그아웃</a>
		</div>
	</nav>

	<main class="main">
		<%-- 알림 메시지 --%>
		<c:if test="${not empty errorMsg}">
			<div
				style="background: #fee2e2; border: 1px solid #fca5a5; border-radius: 12px; padding: 12px 18px; margin-bottom: 16px; font-size: 13px; color: #991b1b">
				⚠️ ${errorMsg}</div>
		</c:if>
		<c:if test="${not empty successMsg}">
			<div
				style="background: #dcfce7; border: 1px solid #86efac; border-radius: 12px; padding: 12px 18px; margin-bottom: 16px; font-size: 13px; color: #166534">
				✅ ${successMsg}</div>
		</c:if>
		<div class="top-bar">
			<div>
				<div class="page-title">
					⚙️ 회원 관리 <span class="master-badge"
						style="font-size: 11px; margin-left: 8px">👑 MASTER 전용</span>
				</div>
				<div class="page-sub">전체 ${list.size()}명의 계정을 관리합니다</div>
			</div>
			<a href="/user/login"
				style="padding: 10px 20px; background: linear-gradient(135deg, #6b3015, #8b4513); color: #fff; border: none; border-radius: 10px; font-size: 13px; font-weight: 600; cursor: pointer; text-decoration: none; font-family: 'Noto Sans KR', sans-serif"
				onclick="return confirm('회원가입 페이지로 이동합니다. 로그아웃 됩니다.')"> ＋ 새 계정
				추가 </a>
		</div>

		<!-- 통계 카드 -->
		<%
		int cntMaster = 0, cntAdmin = 0, cntInter = 0, cntInactive = 0;
		java.util.List<com.ats.project.model.UserVO> uList = (java.util.List<com.ats.project.model.UserVO>) request
				.getAttribute("list");
		if (uList != null) {
			for (com.ats.project.model.UserVO u : uList) {
				if ("MASTER".equals(u.getRole()))
			cntMaster++;
				else if ("ADMIN".equals(u.getRole()))
			cntAdmin++;
				else if ("INTERVIEWER".equals(u.getRole()))
			cntInter++;
				if ("INACTIVE".equals(u.getStatus()))
			cntInactive++;
			}
		}
		%>
		<div class="stat-row">
			<div class="stat-card">
				<div class="stat-icon" style="background: #fef3c7">👑</div>
				<div>
					<div class="stat-label">최고관리자</div>
					<div class="stat-num"><%=cntMaster%></div>
				</div>
			</div>
			<div class="stat-card">
				<div class="stat-icon" style="background: #dbeafe">👔</div>
				<div>
					<div class="stat-label">인사담당자</div>
					<div class="stat-num"><%=cntAdmin%></div>
				</div>
			</div>
			<div class="stat-card">
				<div class="stat-icon" style="background: #ede9fe">🎙</div>
				<div>
					<div class="stat-label">면접관</div>
					<div class="stat-num"><%=cntInter%></div>
				</div>
			</div>
			<div class="stat-card">
				<div class="stat-icon" style="background: #fee2e2">🔒</div>
				<div>
					<div class="stat-label">비활성 계정</div>
					<div class="stat-num"><%=cntInactive%></div>
				</div>
			</div>
		</div>

		<!-- 회원 목록 테이블 -->
		<div class="table-wrap">
			<table class="user-table">
				<thead>
					<tr>
						<th>계정</th>
						<th>이름</th>
						<th>이메일</th>
						<th>연락처</th>
						<th>역할</th>
						<th>상태</th>
						<th>가입일</th>
						<th>관리</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="u" items="${list}">
						<tr>
							<td>
								<div class="sb-user" style="gap: 8px">
									<div class="user-avatar">${u.name.substring(0,1)}</div>
									<strong>${u.userId}</strong>
									<c:if
										test="${u.userId == pageContext.session.getAttribute('userId')}">
										<span class="me-badge">나</span>
									</c:if>
								</div>
							</td>
							<td>${u.name}</td>
							<td style="font-size: 12px; color: #8b6040">${u.email}</td>
							<td style="font-size: 12px; color: #8b6040">${u.phone}</td>
							<td><span class="role-badge r-${u.role}"> <c:choose>
										<c:when test="${u.role=='MASTER'}">👑 최고관리자</c:when>
										<c:when test="${u.role=='ADMIN'}">👔 인사담당자</c:when>
										<c:otherwise>🎙 면접관</c:otherwise>
									</c:choose>
							</span></td>
							<td><c:choose>
									<c:when test="${u.status=='ACTIVE'}">
										<span class="status-active">활성</span>
									</c:when>
									<c:otherwise>
										<span class="status-inactive">비활성</span>
									</c:otherwise>
								</c:choose></td>
							<td style="font-size: 12px; color: #b08060">${u.createdAt}</td>
							<td><c:choose>
									<%-- 자기 자신은 관리 버튼 제한 --%>
									<c:when
										test="${u.userId == pageContext.session.getAttribute('userId')}">
										<span style="font-size: 12px; color: #b08060">현재 로그인 중</span>
									</c:when>
									<c:otherwise>
										<div class="action-wrap">

											<%-- 역할 변경 --%>
											<form action="/admin/users/role" method="post"
												style="display: flex; gap: 4px; align-items: center">
												<input type="hidden" name="userId" value="${u.userId}" /> <select
													name="role" class="role-select">
													<option value="ADMIN"
														<c:if test="${u.role=='ADMIN'}">selected</c:if>>인사담당자</option>
													<option value="INTERVIEWER"
														<c:if test="${u.role=='INTERVIEWER'}">selected</c:if>>면접관</option>
													<option value="MASTER"
														<c:if test="${u.role=='MASTER'}">selected</c:if>>최고관리자</option>
												</select>
												<button type="submit" class="btn-sm btn-role">변경</button>
											</form>

											<%-- 상태 변경 --%>
											<form action="/admin/users/status" method="post"
												style="display: inline">
												<input type="hidden" name="userId" value="${u.userId}" />
												<c:choose>
													<c:when test="${u.status=='ACTIVE'}">
														<input type="hidden" name="status" value="INACTIVE" />
														<button type="submit" class="btn-sm btn-deactivate"
															onclick="return confirm('${u.name} 계정을 비활성화하시겠습니까?')">
															비활성</button>
													</c:when>
													<c:otherwise>
														<input type="hidden" name="status" value="ACTIVE" />
														<button type="submit" class="btn-sm btn-activate">활성화</button>
													</c:otherwise>
												</c:choose>
											</form>

											<%-- 삭제 --%>
											<form action="/admin/users/delete" method="post"
												style="display: inline">
												<input type="hidden" name="userId" value="${u.userId}" />
												<button type="submit" class="btn-sm btn-del"
													onclick="return confirm('${u.name} 계정을 삭제하시겠습니까?\n이 작업은 되돌릴 수 없습니다.')">
													삭제</button>
											</form>

										</div>
									</c:otherwise>
								</c:choose></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</main>
</body>
</html>