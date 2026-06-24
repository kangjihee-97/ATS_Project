<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>VERNALIS | 마이 페이지</title>
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

.sb-logo-img {
	width: 38px;
	height: 38px;
	object-fit: contain;
	border-radius: 8px;
	flex-shrink: 0
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
	gap: 10px;
	cursor: pointer
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
	width: calc(100% - 230px);
	min-width: 0;
	padding: 40px;
	display: flex;
	flex-direction: column;
	align-items: center
}

.page-header {
	width: 100%;
	max-width: 640px;
	margin-bottom: 24px
}

.page-title {
	font-size: 20px;
	font-weight: 700;
	color: #3d1c02;
	display: flex;
	align-items: center;
	gap: 8px
}

.page-sub {
	font-size: 13px;
	color: #a07050;
	margin-top: 5px
}

.alert {
	border-radius: 12px;
	padding: 12px 18px;
	margin-bottom: 16px;
	font-size: 13px;
	width: 100%;
	max-width: 640px
}

.alert-s {
	background: #dcfce7;
	border: 1px solid #86efac;
	color: #166534
}

.alert-e {
	background: #fee2e2;
	border: 1px solid #fca5a5;
	color: #991b1b
}

.alert-w {
	background: #fef3c7;
	border: 1px solid #fde68a;
	color: #92400e
}

.profile-card {
	background: #fff;
	border-radius: 20px;
	padding: 32px 36px;
	width: 100%;
	max-width: 640px;
	border: 1px solid #f0e0cc;
	box-shadow: 0 4px 20px rgba(139, 69, 19, .06)
}

.profile-top {
	display: flex;
	align-items: center;
	gap: 18px;
	margin-bottom: 28px;
	padding-bottom: 22px;
	border-bottom: 1.5px solid #f5ede3
}

.avatar {
	width: 64px;
	height: 64px;
	border-radius: 50%;
	background: linear-gradient(135deg, #d4a017, #f0c040);
	display: flex;
	align-items: center;
	justify-content: center;
	font-size: 24px;
	font-weight: 700;
	color: #3d1c02;
	flex-shrink: 0
}

.profile-name {
	font-size: 20px;
	font-weight: 700;
	color: #3d1c02;
	margin-bottom: 5px
}

.status-row {
	display: flex;
	align-items: center;
	gap: 5px;
	font-size: 12px;
	color: #b08060
}

.status-dot {
	width: 7px;
	height: 7px;
	border-radius: 50%;
	background: #16a34a
}

.form-grid {
	display: grid;
	grid-template-columns: 1fr 1fr;
	gap: 16px;
	margin-bottom: 24px
}

.field {
	display: flex;
	flex-direction: column;
	gap: 6px
}

.field label {
	font-size: 12.5px;
	font-weight: 500;
	color: #7a5030
}

.field input {
	width: 100%;
	padding: 11px 14px;
	border: 1.5px solid #e8d5c0;
	border-radius: 10px;
	font-size: 14px;
	font-family: 'Noto Sans KR', sans-serif;
	color: #3d1c02;
	background: #fdfaf6;
	outline: none;
	transition: border-color .2s
}

.field input:focus {
	border-color: #8b4513;
	box-shadow: 0 0 0 3px rgba(139, 69, 19, .08);
	background: #fff
}

.field input[readonly] {
	background: #f5ede3;
	color: #a07050;
	cursor: not-allowed
}

.field-hint {
	font-size: 11px;
	margin-top: 3px
}

.hint-err {
	color: #dc2626
}

.hint-ok {
	color: #16a34a
}

.hint-role-ok {
	color: #16a34a
}

.hint-role-err {
	color: #dc2626
}

.btn-row {
	display: flex;
	gap: 10px;
	justify-content: flex-end;
	padding-top: 4px;
	flex-wrap: wrap
}

.btn-cancel {
	padding: 11px 22px;
	background: #f5ede3;
	color: #8b4513;
	border: 1.5px solid #e8d5c0;
	border-radius: 10px;
	font-size: 14px;
	font-weight: 500;
	text-decoration: none;
	cursor: pointer;
	font-family: 'Noto Sans KR', sans-serif
}

.btn-pw {
	padding: 11px 22px;
	background: #fff;
	color: #5c2a0e;
	border: 1.5px solid #c8a070;
	border-radius: 10px;
	font-size: 14px;
	font-weight: 600;
	cursor: pointer;
	font-family: 'Noto Sans KR', sans-serif
}

.btn-pw:hover {
	background: #fdf5ec
}

.btn-save {
	padding: 11px 28px;
	background: linear-gradient(135deg, #3d1c02, #5c2a0e);
	color: #fff;
	border: none;
	border-radius: 10px;
	font-size: 14px;
	font-weight: 600;
	cursor: pointer;
	font-family: 'Noto Sans KR', sans-serif
}

.btn-save:hover {
	opacity: .9
}

.modal-overlay {
	display: none;
	position: fixed;
	inset: 0;
	background: rgba(0, 0, 0, .45);
	z-index: 999;
	align-items: center;
	justify-content: center
}

.modal-overlay.show {
	display: flex
}

.modal-box {
	background: #fff;
	border-radius: 20px;
	padding: 36px 40px;
	width: 100%;
	max-width: 400px;
	position: relative;
	box-shadow: 0 20px 60px rgba(0, 0, 0, .25)
}

.modal-close {
	position: absolute;
	top: 16px;
	right: 20px;
	background: none;
	border: none;
	font-size: 22px;
	cursor: pointer;
	color: #b08060;
	line-height: 1
}

.modal-title {
	font-size: 18px;
	font-weight: 700;
	color: #3d1c02;
	margin-bottom: 6px
}

.modal-sub {
	font-size: 13px;
	color: #a07050;
	margin-bottom: 24px
}

.modal-field {
	margin-bottom: 14px
}

.modal-field label {
	display: block;
	font-size: 12.5px;
	font-weight: 500;
	color: #7a5030;
	margin-bottom: 6px
}

.modal-field input {
	width: 100%;
	height: 48px;
	padding: 0 14px;
	border: 1.5px solid #e8d5c0;
	border-radius: 10px;
	font-size: 14px;
	font-family: 'Noto Sans KR', sans-serif;
	color: #3d1c02;
	background: #fdfaf6;
	outline: none;
	transition: border-color .2s
}

.modal-field input:focus {
	border-color: #8b4513;
	background: #fff
}

.modal-msg {
	font-size: 12px;
	margin-bottom: 12px;
	min-height: 16px
}

.modal-btn {
	width: 100%;
	height: 48px;
	background: linear-gradient(135deg, #3d1c02, #8b4513);
	color: #fff;
	border: none;
	border-radius: 12px;
	font-size: 14px;
	font-weight: 600;
	cursor: pointer;
	font-family: 'Noto Sans KR', sans-serif;
	margin-top: 8px
}

.modal-done {
	text-align: center;
	padding: 10px 0
}

.modal-done-icon {
	font-size: 42px;
	margin-bottom: 12px
}

.modal-done-title {
	font-size: 17px;
	font-weight: 700;
	color: #3d1c02;
	margin-bottom: 6px
}

.modal-done-sub {
	font-size: 13px;
	color: #a07050;
	margin-bottom: 22px
}
</style>
</head>
<body>
	<%
	String userName = (String) session.getAttribute("userName");
	Boolean isMaster = Boolean.TRUE.equals(session.getAttribute("isMaster"));
	Boolean isHrRep = Boolean.TRUE.equals(session.getAttribute("isHrRep"));
	Boolean isInterviewer = Boolean.TRUE.equals(session.getAttribute("isInterviewer"));
	Boolean isTester = Boolean.TRUE.equals(session.getAttribute("isTester"));
	Boolean isAdmin = Boolean.TRUE.equals(session.getAttribute("isAdmin"));
	String initial = (userName != null && userName.length() > 0) ? String.valueOf(userName.charAt(0)) : "U";
	String roleLabel = isMaster
			? "최고관리자"
			: isHrRep ? "HR Representative" : isInterviewer ? "면접관" : isTester ? "Tester" : "Tester";

	com.ats.project.model.UserVO u = (com.ats.project.model.UserVO) request.getAttribute("user");
	if (u == null)
		u = (com.ats.project.model.UserVO) session.getAttribute("loginUser");

	String roleName = "TESTER";
	try {
		if (u != null && u.getRole() != null && !u.getRole().trim().isEmpty()) {
			roleName = u.getRole().trim();
		} else if (isMaster) {
			roleName = "MASTER";
		} else if (isHrRep) {
			roleName = "HR_REP";
		} else if (isInterviewer) {
			roleName = "INTERVIEWER";
		}
	} catch (Exception e) {
		roleName = "TESTER";
	}

	String createdAt = "-";
	try {
		if (u != null && u.getCreatedAt() != null)
			createdAt = String.valueOf(u.getCreatedAt());
	} catch (Exception e) {
		createdAt = "-";
	}
	%>

	<nav class="sidebar">
		<div class="sb-logo">
			<div class="sb-logo-row">
				<img src="/img/vernalis-logo.png" class="sb-logo-img" alt="VERNALIS" />
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
			<li><a href="/user/mypage" class="active"><span class="ico">👤</span>마이
					페이지</a></li>
		</ul>
		<div class="sb-bottom">
			<div class="sb-user" onclick="location.href='/user/mypage'">
				<div class="sb-avatar"><%=initial%></div>
				<div>
					<div class="sb-user-name"><%=userName%></div>
					<div class="sb-user-role"><%=roleLabel%></div>
				</div>
			</div>
			<a href="/user/logout" class="sb-logout">← 로그아웃</a>
		</div>
	</nav>

	<main class="main">
		<div class="page-header">
			<div class="page-title">👤 마이페이지</div>
			<div class="page-sub">계정의 상세 프로필 정보를 확인하고 관리합니다</div>
		</div>

		<c:if test="${param.noAuth == 'true'}">
			<div class="alert alert-w">🚫 해당 페이지에 접근할 권한이 없습니다. 권한 변경 후
				저장하세요.</div>
		</c:if>
		<c:if test="${not empty successMsg}">
			<div class="alert alert-s">✅ ${successMsg}</div>
		</c:if>
		<c:if test="${not empty errorMsg}">
			<div class="alert alert-e">⚠️ ${errorMsg}</div>
		</c:if>

		<div class="profile-card">
			<div class="profile-top">
				<div class="avatar"><%=initial%></div>
				<div>
					<div class="profile-name"><%=userName%></div>
					<div class="status-row">
						<span class="status-dot"></span>계정 활성화 상태
					</div>
				</div>
			</div>

			<form action="/user/mypage" method="post" id="profileForm">
				<div class="form-grid">
					<div class="field">
						<label>아이디</label> <input type="text" value="${user.userId}"
							readonly />
					</div>
					<div class="field">
						<label>이름</label> <input type="text" name="name" id="nameInput"
							value="${user.name}" required />
					</div>
					<div class="field">
						<label>이메일 주소</label> <input type="email" name="email"
							id="emailInput" value="${user.email}"
							oninput="clearHint('emailHint')" /> <span
							class="field-hint hint-err" id="emailHint" style="display: none">✕
							이미 등록된 이메일입니다.</span>
					</div>
					<div class="field">
						<label>연락처</label> <input type="tel" name="phone" id="phoneInput"
							value="${user.phone}" oninput="clearHint('phoneHint')" /> <span
							class="field-hint hint-err" id="phoneHint" style="display: none">✕
							이미 등록된 연락처입니다.</span>
					</div>

					<!-- 시스템 권한 -->
					<div class="field">
						<label>시스템 권한</label> <select name="role" id="roleSelect"
							onchange="onRoleChange(this)"
							style="width: 100%; padding: 11px 14px; border: 1.5px solid #e8d5c0; border-radius: 10px; font-size: 14px; font-family: 'Noto Sans KR', sans-serif; color: #3d1c02; background: #fdfaf6; outline: none; cursor: pointer; transition: border-color .2s"
							onfocus="this.style.borderColor='#8b4513'"
							onblur="this.style.borderColor='#e8d5c0'">
							<option value="MASTER"
								<%="MASTER".equals(roleName) ? "selected" : ""%>>👑
								MASTER (최고관리자)</option>
							<option value="HR_REP"
								<%="HR_REP".equals(roleName) ? "selected" : ""%>>👔 HR
								Representative</option>
							<option value="INTERVIEWER"
								<%="INTERVIEWER".equals(roleName) ? "selected" : ""%>>🎙
								INTERVIEWER (면접관)</option>
							<option value="TESTER"
								<%="TESTER".equals(roleName) ? "selected" : ""%>>🔒
								TESTER (권한 없음)</option>
						</select>
						<div class="field-hint" id="roleHint" style="display: none"></div>
					</div>

					<div class="field">
						<label>계정 생성일</label> <input type="text" value="<%=createdAt%>"
							readonly />
					</div>
				</div>

				<div class="btn-row">
					<a href="/dashboard" class="btn-cancel">취소</a>
					<button type="button" class="btn-pw" onclick="openPwModal()">🔑
						비밀번호 변경</button>
					<button type="submit" class="btn-save">저장하기</button>
				</div>
			</form>
		</div>
	</main>

	<!-- 비밀번호 변경 모달 -->
	<div class="modal-overlay" id="pwModal">
		<div class="modal-box">
			<button class="modal-close" onclick="closePwModal()">×</button>
			<div id="pwStep1">
				<div class="modal-title">🔑 비밀번호 변경</div>
				<div class="modal-sub">현재 비밀번호를 입력하여 본인 확인 후 변경하세요</div>
				<div class="modal-field">
					<label>현재 비밀번호</label> <input type="password" id="currentPw"
						placeholder="현재 비밀번호 입력" />
				</div>
				<div class="modal-field">
					<label>새 비밀번호</label> <input type="password" id="newPw"
						placeholder="새 비밀번호 입력 (8자 이상)" />
				</div>
				<div class="modal-field">
					<label>새 비밀번호 확인</label> <input type="password" id="newPw2"
						placeholder="새 비밀번호 재입력" />
				</div>
				<div class="modal-msg hint-err" id="pwMsg"></div>
				<button class="modal-btn" onclick="changePw()">비밀번호 변경</button>
			</div>
			<div id="pwStep2" style="display: none" class="modal-done">
				<div class="modal-done-icon">✅</div>
				<div class="modal-done-title">비밀번호가 변경되었습니다</div>
				<div class="modal-done-sub">다음 로그인부터 새 비밀번호를 사용하세요</div>
				<button class="modal-btn" onclick="closePwModal()">확인</button>
			</div>
		</div>
	</div>

	<!-- 권한 인증 모달 -->
	<div class="modal-overlay" id="roleModal">
		<div class="modal-box">
			<button class="modal-close" onclick="closeRoleModal()">×</button>
			<div class="modal-title">🔐 권한 인증</div>
			<div class="modal-sub" id="roleModalSub">해당 권한 인증 코드를 입력하세요</div>
			<div class="modal-field">
				<label>인증 코드</label> <input type="password" id="roleCodeInput"
					placeholder="인증 코드 입력"
					onkeydown="if(event.key==='Enter') verifyRoleCode()" />
			</div>
			<div class="modal-msg hint-err" id="roleCodeMsg"></div>
			<button class="modal-btn" onclick="verifyRoleCode()">확인</button>
		</div>
	</div>

	<script>
function clearHint(id){ document.getElementById(id).style.display='none'; }

/* ══ 비밀번호 변경 모달 ══ */
function openPwModal(){
  document.getElementById('pwModal').classList.add('show');
  document.getElementById('pwStep1').style.display='block';
  document.getElementById('pwStep2').style.display='none';
  document.getElementById('currentPw').value='';
  document.getElementById('newPw').value='';
  document.getElementById('newPw2').value='';
  document.getElementById('pwMsg').textContent='';
}
function closePwModal(){
  document.getElementById('pwModal').classList.remove('show');
}
document.getElementById('pwModal').addEventListener('click',function(e){
  if(e.target===this) closePwModal();
});

function changePw(){
  var cur = document.getElementById('currentPw').value.trim();
  var np1 = document.getElementById('newPw').value.trim();
  var np2 = document.getElementById('newPw2').value.trim();
  var msg = document.getElementById('pwMsg');
  if(!cur){ msg.textContent='현재 비밀번호를 입력하세요.'; return; }
  if(!np1){ msg.textContent='새 비밀번호를 입력하세요.'; return; }
  if(np1.length < 8){ msg.textContent='비밀번호는 8자 이상 입력하세요.'; return; }
  if(np1 !== np2){ msg.textContent='새 비밀번호가 일치하지 않습니다.'; return; }
  if(cur === np1){ msg.textContent='현재 비밀번호와 같은 비밀번호입니다.'; return; }
  fetch('/user/verifyPassword',{method:'POST',headers:{'Content-Type':'application/x-www-form-urlencoded'},body:'password='+encodeURIComponent(cur)})
  .then(function(r){return r.json();})
  .then(function(ok){
    if(!ok){msg.textContent='현재 비밀번호가 올바르지 않습니다.';return;}
    return fetch('/user/changePassword',{method:'POST',headers:{'Content-Type':'application/x-www-form-urlencoded'},body:'newPassword='+encodeURIComponent(np1)})
    .then(function(r){return r.json();})
    .then(function(res){
      if(res){document.getElementById('pwStep1').style.display='none';document.getElementById('pwStep2').style.display='block';}
      else{msg.textContent='변경에 실패했습니다.';}
    });
  })
  .catch(function(){msg.textContent='서버 오류가 발생했습니다.';});
}

/* ══ 권한 변경 인증 ══ */
var targetRole = '';
var prevRole   = '<%=roleName%>';

var ROLE_CODES = {
  'MASTER':      'vernalis-master',
  'HR_REP':      'vernalis-hr',
  'INTERVIEWER': 'vernalis-interviewer',
  'TESTER':      null
};

var ROLE_LABELS = {
  'MASTER':      'MASTER (최고관리자)',
  'HR_REP':      'HR Representative (인사담당자)',
  'INTERVIEWER': 'INTERVIEWER (면접관)',
  'TESTER':      'TESTER (권한 없음)'
};

function onRoleChange(sel) {
  targetRole = sel.value;

  // TESTER는 코드 불필요
  if (targetRole === 'TESTER') {
    showRoleHint('ok', '✅ Tester 상태로 변경됩니다. 마이페이지 외 접근이 제한됩니다.');
    prevRole = targetRole;
    return;
  }

  // 나머지는 인증 코드 필요
  document.getElementById('roleModalSub').textContent =
    '[' + ROLE_LABELS[targetRole] + '] 권한 인증 코드를 입력하세요.';
  document.getElementById('roleCodeInput').value = '';
  document.getElementById('roleCodeMsg').textContent = '';
  document.getElementById('roleModal').classList.add('show');
  setTimeout(function(){ document.getElementById('roleCodeInput').focus(); }, 100);
}

function verifyRoleCode() {
	  var input = document.getElementById('roleCodeInput').value.trim();
	  var msg   = document.getElementById('roleCodeMsg');
	  if (!input) { msg.textContent = '인증 코드를 입력하세요.'; return; }

	  if (input === ROLE_CODES[targetRole]) {
	    // 인증 성공 — select 값을 targetRole로 확정
	    document.getElementById('roleSelect').value = targetRole;
	    prevRole = targetRole;
	    closeRoleModal();
	    showRoleHint('ok', '✅ ' + ROLE_LABELS[targetRole] + ' 권한으로 변경됩니다. 저장하기를 눌러 적용하세요.');
	  } else {
	    msg.textContent = '❌ 인증 코드가 올바르지 않습니다.';
	    document.getElementById('roleCodeInput').value = '';
	    document.getElementById('roleCodeInput').focus();
	  }
	}
function closeRoleModal() {
	  document.getElementById('roleModal').classList.remove('show');
	  // 인증 성공한 경우(prevRole이 이미 targetRole로 바뀐 경우)는 되돌리지 않음
	  var currentSelect = document.getElementById('roleSelect').value;
	  if (currentSelect !== prevRole && currentSelect !== targetRole) {
	    document.getElementById('roleSelect').value = prevRole;
	    showRoleHint('err', '⚠ 인증이 취소되어 이전 권한으로 복원되었습니다.');
	  }
	}

function showRoleHint(type, text) {
  var hint = document.getElementById('roleHint');
  hint.textContent   = text;
  hint.className     = 'field-hint ' + (type === 'ok' ? 'hint-role-ok' : 'hint-role-err');
  hint.style.display = 'block';
}

document.getElementById('roleModal').addEventListener('click', function(e){
  if (e.target === this) closeRoleModal();
});
</script>
</body>
</html>