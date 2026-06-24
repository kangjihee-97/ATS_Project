<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1.0">
<title>ATS | 면접 일정</title>
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

.btn-primary:hover {
	opacity: .9
}

.table-wrap {
	background: #fff;
	border-radius: 16px;
	overflow: hidden;
	border: 1px solid #f0e0cc
}

.sch-table {
	width: 100%;
	border-collapse: collapse
}

.sch-table th {
	font-size: 12px;
	color: #b08060;
	font-weight: 500;
	padding: 14px 16px;
	border-bottom: 1.5px solid #f0e0cc;
	text-align: left;
	background: #fdf8f3
}

.sch-table td {
	font-size: 13px;
	color: #3d1c02;
	padding: 13px 16px;
	border-bottom: 1px solid #f5ede3;
	vertical-align: middle
}

.sch-table tr:last-child td {
	border-bottom: none
}

.sch-table tr:hover td {
	background: #fdf8f3
}

.round-badge {
	display: inline-block;
	padding: 3px 10px;
	border-radius: 20px;
	font-size: 11px;
	font-weight: 600;
	background: #fef3c7;
	color: #92400e
}

.status-badge {
	display: inline-block;
	padding: 3px 10px;
	border-radius: 20px;
	font-size: 11px;
	font-weight: 600
}

.s-SCHEDULED {
	background: #dbeafe;
	color: #1e40af
}

.s-DONE {
	background: #dcfce7;
	color: #166534
}

.s-CANCELLED {
	background: #fee2e2;
	color: #991b1b
}

.action-btn {
	padding: 5px 12px;
	border-radius: 8px;
	font-size: 11px;
	font-weight: 500;
	cursor: pointer;
	border: none;
	font-family: 'Noto Sans KR', sans-serif;
	margin-left: 4px
}

.btn-done {
	background: #dcfce7;
	color: #166534
}

.btn-cancel-act {
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
			<li><a href="/pipeline/history"><span class="ico">📜</span>파이프라인
					히스토리</a></li>
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
			<div class="sb-user" onclick="location.href='/user/mypage'"
				style="cursor: pointer">
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
				<div class="page-title">📅 면접 일정 관리</div>
				<div class="page-sub">총 ${list.size()}건의 일정이 있습니다</div>
			</div>
			<%
			if (isAdmin) {
			%>
			<a href="/schedule/write" class="btn-primary">＋ 일정 등록</a>
			<%
			}
			%>
		</div>

		<div class="table-wrap">
			<c:choose>
				<c:when test="${empty list}">
					<div class="empty-state">📭 등록된 면접 일정이 없습니다</div>
				</c:when>
				<c:otherwise>
					<table class="sch-table">
						<thead>
							<tr>
								<th>지원자</th>
								<th>공고</th>
								<th>면접관</th>
								<th>면접 일시</th>
								<th>장소</th>
								<th>차수</th>
								<th>상태</th>
								<th>처리</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="s" items="${list}">
								<tr>
									<td><strong>${s.applicantName}</strong></td>
									<td style="color: #8b6040; font-size: 12px">${s.postingTitle}</td>
									<td>${s.interviewerName}</td>
									<td>${s.scheduledAt}</td>
									<td style="color: #8b6040">${s.location}</td>
									<td><span class="round-badge">${s.round}차</span></td>
									<td><span class="status-badge s-${s.status}"> <c:choose>
												<c:when test="${s.status=='SCHEDULED'}">예정</c:when>
												<c:when test="${s.status=='DONE'}">완료</c:when>
												<c:otherwise>취소</c:otherwise>
											</c:choose>
									</span></td>
									<td>
										<%
										if (isAdmin) {
										%> <c:if test="${s.status=='SCHEDULED'}">
											<button class="action-btn"
												style="background: #ede9fe; color: #5b21b6"
												onclick="openEditModal(${s.scheduleId}, '${s.scheduledAt}')">수정</button>
											<form action="/schedule/done/${s.scheduleId}" method="post"
												style="display: inline">
												<button class="action-btn btn-done">완료</button>
											</form>
											<form action="/schedule/cancel/${s.scheduleId}" method="post"
												style="display: inline">
												<button class="action-btn btn-cancel-act"
													onclick="return confirm('취소하시겠습니까?')">취소</button>
											</form>
										</c:if> <%
 }
 %>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</c:otherwise>
			</c:choose>
		</div>

		<!-- 면접 일시 수정 모달 -->
		<div id="editModalOverlay"
			style="display: none; position: fixed; inset: 0; background: rgba(0, 0, 0, .45); z-index: 999; align-items: center; justify-content: center">
			<div
				style="background: #fff; border-radius: 20px; padding: 32px 36px; width: 100%; max-width: 380px; box-shadow: 0 20px 60px rgba(0, 0, 0, .25)">
				<div
					style="font-size: 17px; font-weight: 700; color: #3d1c02; margin-bottom: 6px">📅
					면접 일시 수정</div>
				<div style="font-size: 13px; color: #a07050; margin-bottom: 20px">새로운
					면접 일시를 선택하세요</div>
				<form action="/schedule/update" method="post">
					<input type="hidden" name="scheduleId" id="editScheduleId">
					<input type="datetime-local" name="scheduledAt"
						id="editScheduledAt"
						style="width: 100%; height: 46px; padding: 0 12px; border: 1.5px solid #e8d5c0; border-radius: 10px; font-size: 14px; font-family: 'Noto Sans KR', sans-serif; color: #3d1c02; background: #fdfaf6; outline: none; margin-bottom: 18px">
					<div style="display: flex; gap: 8px">
						<button type="button" onclick="closeEditModal()"
							style="flex: 1; height: 46px; background: #f5ede3; color: #8b4513; border: 1.5px solid #e8d5c0; border-radius: 10px; font-size: 14px; font-weight: 500; cursor: pointer; font-family: 'Noto Sans KR', sans-serif">취소</button>
						<button type="submit"
							style="flex: 1; height: 46px; background: linear-gradient(135deg, #3d1c02, #8b4513); color: #fff; border: none; border-radius: 10px; font-size: 14px; font-weight: 600; cursor: pointer; font-family: 'Noto Sans KR', sans-serif">저장</button>
					</div>
				</form>
			</div>
		</div>
	</main>

	<script>
function openEditModal(scheduleId, scheduledAt) {
    document.getElementById('editScheduleId').value = scheduleId;
    var formatted = scheduledAt.replace(' ', 'T').substring(0, 16);
    document.getElementById('editScheduledAt').value = formatted;
    document.getElementById('editModalOverlay').style.display = 'flex';
}
function closeEditModal() {
    document.getElementById('editModalOverlay').style.display = 'none';
}
document.getElementById('editModalOverlay').addEventListener('click', function(e){
    if (e.target === this) closeEditModal();
});

<c:if test="${param.conflict == 'true'}">
alert('해당 면접관은 같은 시간대에 이미 다른 일정이 있습니다.');
</c:if>
</script>
</body>
</html>