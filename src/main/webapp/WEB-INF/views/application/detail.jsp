<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>ATS | 지원자 상세</title>
<style>
#resumeTextBox::-webkit-scrollbar {
	width: 6px;
}

#resumeTextBox::-webkit-scrollbar-track {
	background: #f5ede3;
	border-radius: 4px;
}

#resumeTextBox::-webkit-scrollbar-thumb {
	background: #e0c8a0;
	border-radius: 4px;
}

#coverBox::-webkit-scrollbar {
	width: 6px;
}

#coverBox::-webkit-scrollbar-track {
	background: #f5ede3;
	border-radius: 4px;
}

#coverBox::-webkit-scrollbar-thumb {
	background: #e0c8a0;
	border-radius: 4px;
}

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

.detail-wrap {
	display: grid;
	grid-template-columns: 1fr 1.4fr;
	gap: 20px;
	align-items: start
}

.card {
	background: #fff;
	border-radius: 16px;
	padding: 26px;
	border: 1px solid #f0e0cc;
	margin-bottom: 20px
}

.profile-top {
	display: flex;
	align-items: center;
	gap: 16px;
	margin-bottom: 22px
}

.profile-avatar {
	width: 56px;
	height: 56px;
	border-radius: 50%;
	background: linear-gradient(135deg, #d4a017, #f0c040);
	display: flex;
	align-items: center;
	justify-content: center;
	font-size: 22px;
	font-weight: 700;
	color: #3d1c02;
	flex-shrink: 0
}

.profile-name {
	font-size: 20px;
	font-weight: 700;
	color: #3d1c02
}

.profile-posting {
	font-size: 13px;
	color: #a07050;
	margin-top: 3px
}

.stage-badge {
	display: inline-block;
	padding: 5px 14px;
	border-radius: 20px;
	font-size: 12px;
	font-weight: 600;
	margin-top: 6px
}

.s-RECEIVED {
	background: #dbeafe;
	color: #1e40af
}

.s-DOC_PASS {
	background: #ede9fe;
	color: #5b21b6
}

.s-INTERVIEW1 {
	background: #fef3c7;
	color: #92400e
}

.s-INTERVIEW2 {
	background: #fed7aa;
	color: #c2410c
}

.s-PASSED {
	background: #dcfce7;
	color: #166534
}

.s-REJECTED {
	background: #fee2e2;
	color: #991b1b
}

.s-FINAL {
	background: #dcfce7;
	color: #166534
}

.s-FAIL {
	background: #fee2e2;
	color: #991b1b
}

.info-grid {
	display: grid;
	grid-template-columns: 1fr 1fr;
	gap: 12px
}

.info-item {
	background: #fdf8f3;
	border-radius: 10px;
	padding: 12px 14px
}

.info-label {
	font-size: 11px;
	color: #b08060;
	margin-bottom: 4px
}

.info-val {
	font-size: 13.5px;
	font-weight: 500;
	color: #3d1c02
}

.section-title {
	font-size: 14px;
	font-weight: 600;
	color: #3d1c02;
	margin-bottom: 12px;
	padding-bottom: 8px;
	border-bottom: 1.5px solid #f5ede3
}

.cover-box {
	background: #fdf8f3;
	border-radius: 10px;
	padding: 16px;
	font-size: 13px;
	color: #6b4025;
	line-height: 1.8;
	border: 1px solid #f0e0cc;
	overflow-x: hidden;
	text-align: left;
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

.stage-section {
	margin-top: 18px
}

.stage-select {
	width: 100%;
	padding: 11px 14px;
	border: 1.5px solid #e8d5c0;
	border-radius: 10px;
	font-size: 13.5px;
	font-family: 'Noto Sans KR', sans-serif;
	color: #3d1c02;
	background: #fff;
	outline: none;
	margin-bottom: 10px
}

.stage-select:focus {
	border-color: #8b4513
}

.btn-stage {
	width: 100%;
	height: 44px;
	background: linear-gradient(135deg, #6b3015, #8b4513);
	color: #fff;
	border: none;
	border-radius: 10px;
	font-size: 13px;
	font-weight: 600;
	cursor: pointer;
	font-family: 'Noto Sans KR', sans-serif
}

@
keyframes spin {from { transform:rotate(0deg)
	
}

to {
	transform: rotate(360deg)
}
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
	String nameInit = (request.getAttribute("app") != null
			&& ((com.ats.project.model.ApplicationVO) request.getAttribute("app")).getApplicantName() != null)
			? String.valueOf(((com.ats.project.model.ApplicationVO) request.getAttribute("app")).getApplicantName()
					.charAt(0))
			: "?";
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
			<li><a href="/application/list" class="active"><span
					class="ico">👥</span>지원자 목록</a></li>
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
			%>
			<li><a href="/admin/users"><span class="ico">⚙️</span>회원 관리</a></li>
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
		<div class="breadcrumb">
			<a href="/application/list">지원자 목록</a> › ${app.applicantName}
		</div>

		<div class="detail-wrap">
			<!-- 왼쪽: 기본 정보 -->
			<div>
				<div class="card">
					<div class="profile-top">
						<div class="profile-avatar"><%=nameInit%></div>
						<div>
							<div class="profile-name">${app.applicantName}</div>
							<div class="profile-posting">${app.postingTitle}</div>
							<span class="stage-badge s-${app.stage}"> <c:choose>
									<c:when test="${app.stage=='RECEIVED'}">서류접수</c:when>
									<c:when test="${app.stage=='DOC_PASS'}">서류합격</c:when>
									<c:when test="${app.stage=='INTERVIEW1'}">1차면접</c:when>
									<c:when test="${app.stage=='INTERVIEW2'}">2차면접</c:when>
									<c:when test="${app.stage=='PASSED'}">최종합격</c:when>
									<c:when test="${app.stage=='REJECTED'}">불합격</c:when>
								</c:choose>
							</span>
						</div>
					</div>

					<div class="info-grid">
						<div class="info-item">
							<div class="info-label">이메일</div>
							<div class="info-val">${app.email}</div>
						</div>
						<div class="info-item">
							<div class="info-label">연락처</div>
							<div class="info-val">${empty app.phone ? '-' : app.phone}</div>
						</div>
						<div class="info-item">
							<div class="info-label">경력</div>
							<div class="info-val">
								<c:choose>
									<c:when test="${app.careerYear==0}">신입</c:when>
									<c:otherwise>${app.careerYear}년</c:otherwise>
								</c:choose>
							</div>
						</div>
						<div class="info-item">
							<div class="info-label">지원일</div>
							<div class="info-val" style="font-size: 12px">${app.appliedAt}</div>
						</div>
					</div>

					<!-- 단계 변경 (ADMIN/MASTER만) -->
					<%
					if (isAdmin) {
					%>
					<div class="stage-section">
						<div class="section-title" style="margin-top: 18px">단계 변경</div>
						<form action="/pipeline/moveAndRedirect" method="post"
							onsubmit="return confirm('단계를 변경하시겠습니까?')">
							<input type="hidden" name="applicationId"
								value="${app.applicationId}" /> <select name="stage"
								class="stage-select">
								<option value="RECEIVED"
									<c:if test="${app.stage=='RECEIVED'}">selected</c:if>>서류접수</option>
								<option value="DOC_PASS"
									<c:if test="${app.stage=='DOC_PASS'}">selected</c:if>>서류합격</option>
								<option value="INTERVIEW1"
									<c:if test="${app.stage=='INTERVIEW1'}">selected</c:if>>1차
									면접</option>
								<option value="INTERVIEW2"
									<c:if test="${app.stage=='INTERVIEW2'}">selected</c:if>>2차
									면접</option>
								<option value="PASSED"
									<c:if test="${app.stage=='PASSED'}">selected</c:if>>최종합격</option>
								<option value="REJECTED"
									<c:if test="${app.stage=='REJECTED'}">selected</c:if>>불합격</option>
							</select>
							<button type="submit" class="btn-stage">단계 변경 저장</button>
						</form>
					</div>
					<%
					}
					%>

					<div class="btn-group">
						<a href="/application/list" class="btn-back">← 목록으로</a>
					</div>
				</div>
			</div>

			<!-- 오른쪽: 자기소개서 + 이력서 + AI 분석 -->
			<div>
				<!-- 자기소개서 + 이력서 2분할 카드 -->
				<div class="card">
					<div
						style="display: grid; grid-template-columns: 1fr 1fr; gap: 16px;">
						<!-- 좌: 지원 동기 -->
						<div>
							<div class="section-title">지원 동기</div>
							<div class="cover-box" id="coverBox"
								style="max-height: 320px; overflow-y: auto; padding: 14px; text-align: left; white-space: normal;">
								<c:choose>
									<c:when test="${not empty app.coverLetter}">
										<div
											style="font-size: 12px; color: #5a3010; line-height: 1.7; text-align: left; word-break: break-word; overflow-wrap: break-word;">
											${app.coverLetter}</div>
									</c:when>
									<c:otherwise>
										<div
											style="text-align: center; padding: 10px 0; color: #b08060; font-size: 13px;">
											작성된 내용이 없습니다.</div>
									</c:otherwise>
								</c:choose>
							</div>
						</div>
						<!-- 우: 첨부 이력서 -->
						<div>
							<div class="section-title">첨부 이력서</div>
							<c:choose>
								<c:when test="${not empty app.resumeOriginalName}">
									<div style="text-align: center; margin-bottom: 10px;">
										<div
											style="font-size: 12px; font-weight: 700; color: #3d1c02; word-break: break-all; margin-bottom: 6px;">
											${app.resumeOriginalName}</div>
										<a href="/application/resume/${app.applicationId}"
											style="display: inline-block; font-size: 11px; padding: 4px 14px; border-radius: 20px; background: #f5ede3; color: #8b4513; text-decoration: none; font-weight: 500; border: 1px solid #e0c8a0;">
											📥 파일 열기 </a>
									</div>
									<div
										style="border-top: 1px solid #f0e0cc; margin-bottom: 10px;"></div>
									<div id="resumeContent"
										style="white-space: pre-wrap; font-size: 12px; color: #5a3010; line-height: 1.7;">
										<span style="color: #a07050; font-size: 12px;">불러오는
											중...</span>
									</div>
									<div id="resumeError"
										style="display: none; color: #991b1b; font-size: 12px;"></div>
								</c:when>
								<c:otherwise>
									<div
										style="text-align: center; padding: 40px 0; color: #b08060;">
										<div style="font-size: 13px;">첨부된 이력서가 없습니다.</div>
									</div>
								</c:otherwise>
							</c:choose>
						</div>
					</div>
				</div>
			</div>
		</div>
		</div>

		<!-- AI 분석 카드 -->
		<div class="card" style="margin-top: 16px" id="aiAnalysisCard">
			<div
				style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 14px; padding-bottom: 10px; border-bottom: 1.5px solid #f5ede3">
				<div style="font-size: 14px; font-weight: 600; color: #3d1c02">🤖
					AI 지원서 분석</div>
				<span
					style="font-size: 11px; padding: 3px 10px; border-radius: 20px; background: #f5ede3; color: #8b4513; font-weight: 500"
					id="aiApBadge">Gemini AI</span>
			</div>
			<!-- 초기 -->
			<div id="aiApDefault" style="text-align: center; padding: 14px 10px">
				<div
					style="font-size: 13px; color: #8b6040; margin-bottom: 14px; line-height: 1.6">
					자기소개서와 지원자 정보를<br>AI가 분석해드립니다
				</div>
				<button onclick="runApplicantAi()"
					style="width: 100%; padding: 10px; background: linear-gradient(135deg, #3d1c02, #8b4513); color: #fff; border: none; border-radius: 10px; font-size: 13px; font-weight: 600; cursor: pointer; font-family: 'Noto Sans KR', sans-serif">
					✨ AI 분석 시작</button>
			</div>
			<!-- 로딩 -->
			<div id="aiApLoading"
				style="display: none; text-align: center; padding: 20px 10px">
				<div
					style="font-size: 26px; animation: spin 1.5s linear infinite; display: inline-block">⚙️</div>
				<div style="font-size: 12px; color: #a07050; margin-top: 8px">분석
					중입니다...</div>
			</div>
			<!-- 결과 -->
			<div id="aiApResult" style="display: none">
				<div id="aiApText"
					style="font-size: 12.5px; color: #4a2800; line-height: 1.85; background: #fdf8f3; border-radius: 10px; padding: 14px; border: 1px solid #f0e0cc; white-space: pre-wrap"></div>
				<div style="display: flex; gap: 8px; margin-top: 10px">
					<button onclick="runApplicantAi()"
						style="flex: 1; padding: 8px; background: #f5ede3; color: #8b4513; border: 1.5px solid #e8d5c0; border-radius: 8px; font-size: 12px; font-weight: 500; cursor: pointer; font-family: 'Noto Sans KR', sans-serif">
						🔄 재분석</button>
					<button onclick="resetApAi()"
						style="padding: 8px 14px; background: #fff; color: #b08060; border: 1.5px solid #f0e0cc; border-radius: 8px; font-size: 12px; cursor: pointer; font-family: 'Noto Sans KR', sans-serif">
						초기화</button>
				</div>
			</div>
			<!-- 에러 -->
			<div id="aiApError"
				style="display: none; text-align: center; padding: 14px 10px">
				<div
					style="font-size: 12px; color: #991b1b; background: #fee2e2; border-radius: 8px; padding: 10px; margin-bottom: 10px"
					id="aiApErrorMsg"></div>
				<button onclick="runApplicantAi()"
					style="padding: 8px 16px; background: #f5ede3; color: #8b4513; border: 1.5px solid #e8d5c0; border-radius: 8px; font-size: 12px; cursor: pointer; font-family: 'Noto Sans KR', sans-serif">
					다시 시도</button>
			</div>
		</div>
		</div>
		</div>
	</main>

	<script>
// 이력서 텍스트 자동 로드
<c:if test="${not empty app.resumeOriginalName}">
document.addEventListener('DOMContentLoaded', function() {
    fetch('/application/resume/text/${app.applicationId}')
    .then(function(r){ return r.json(); })
    .then(function(data){
        var content = document.getElementById('resumeContent');
        if (data.error) {
            content.textContent = '';
            document.getElementById('resumeError').textContent = data.error;
            document.getElementById('resumeError').style.display = 'block';
        } else {
            content.textContent = data.text;
        }
    })
    .catch(function(){
        document.getElementById('resumeContent').textContent = '';
        document.getElementById('resumeError').textContent = '이력서를 불러오지 못했습니다.';
        document.getElementById('resumeError').style.display = 'block';
    });
});
</c:if>

function showApState(state) {
    ['aiApDefault','aiApLoading','aiApResult','aiApError'].forEach(function(id){
        document.getElementById(id).style.display = 'none';
    });
    document.getElementById(state).style.display = 'block';
}

function runApplicantAi() {
    var coverText  = document.getElementById('coverBox').innerText.trim();
    var resumeEl   = document.getElementById('resumeContent');
    var resumeText = resumeEl ? resumeEl.textContent.trim() : '';

    var combinedText = '';
    if (coverText && coverText !== '작성된 내용이 없습니다.') {
        combinedText += '[자기소개서]\n' + coverText + '\n\n';
    }
    if (resumeText) {
        combinedText += '[이력서]\n' + resumeText;
    }
    if (!combinedText.trim()) {
        alert('자기소개서 또는 이력서가 없어 AI 분석을 진행할 수 없습니다.');
        return;
    }

    showApState('aiApLoading');
    document.getElementById('aiApBadge').textContent = '분석 중...';

    var stageMap = {
        'RECEIVED':'서류접수','DOC_PASS':'서류합격',
        'INTERVIEW1':'1차면접','INTERVIEW2':'2차면접',
        'PASSED':'최종합격','REJECTED':'불합격'
    };

    var payload = {
        name       : '${app.applicantName}',
        posting    : '${app.postingTitle}',
        career     : '${app.careerYear}' === '0' ? '신입' : '${app.careerYear}년',
        stage      : stageMap['${app.stage}'] || '${app.stage}',
        coverLetter: combinedText
    };

    fetch('/ai/applicant-report', {
        method : 'POST',
        headers: {'Content-Type':'application/json'},
        body   : JSON.stringify(payload)
    })
    .then(function(r){ return r.json(); })
    .then(function(res){
        if (res.error) {
            document.getElementById('aiApErrorMsg').textContent = res.error;
            showApState('aiApError');
            document.getElementById('aiApBadge').textContent = '오류';
        } else {
            document.getElementById('aiApText').textContent = res.report;
            showApState('aiApResult');
            document.getElementById('aiApBadge').textContent = '분석 완료 ✓';
        }
    })
    .catch(function(){
        document.getElementById('aiApErrorMsg').textContent = '서버 연결 실패';
        showApState('aiApError');
    });
}

function resetApAi() {
    showApState('aiApDefault');
    document.getElementById('aiApBadge').textContent = 'Gemini AI';
}
</script>
</body>
</html>