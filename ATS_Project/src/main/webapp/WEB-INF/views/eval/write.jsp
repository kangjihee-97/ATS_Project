<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>ATS | 평가서 작성</title>
<style>
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500;700&display=swap');
*,*::before,*::after{box-sizing:border-box;margin:0;padding:0}
body{font-family:'Noto Sans KR',sans-serif;background:#f5ede3;min-height:100vh;display:flex;align-items:center;justify-content:center;padding:30px}
.form-wrap{background:#fff;border-radius:20px;padding:36px 40px;width:100%;max-width:580px;border:1px solid #f0e0cc}
.form-title{font-size:20px;font-weight:700;color:#3d1c02;margin-bottom:6px}
.form-sub{font-size:13px;color:#a07050;margin-bottom:28px}
.alert{background:#fee2e2;border:1px solid #fca5a5;border-radius:10px;padding:11px 14px;font-size:13px;color:#991b1b;margin-bottom:18px}
.field{margin-bottom:20px}
.field label{display:block;font-size:12.5px;font-weight:500;color:#7a5030;margin-bottom:8px}
.field select,.field textarea{width:100%;padding:11px 14px;border:1.5px solid #e8d5c0;border-radius:10px;font-size:13.5px;font-family:'Noto Sans KR',sans-serif;color:#3d1c02;background:#fff;outline:none;transition:border-color .2s}
.field select:focus,.field textarea:focus{border-color:#8b4513;box-shadow:0 0 0 3px rgba(139,69,19,.08)}
.field textarea{resize:vertical;min-height:90px;line-height:1.7}

/* 점수 선택 */
.score-group{display:flex;gap:8px}
.score-btn{width:44px;height:44px;border:1.5px solid #e8d5c0;border-radius:10px;background:#fff;font-size:16px;font-weight:700;color:#b08060;cursor:pointer;transition:all .2s;font-family:'Noto Sans KR',sans-serif}
.score-btn:hover{border-color:#8b4513;color:#8b4513}
.score-btn.selected{background:#8b4513;border-color:#8b4513;color:#fff}
.score-label{display:flex;justify-content:space-between;font-size:11px;color:#b08060;margin-top:5px;padding:0 2px}

/* 권고 선택 */
.recommend-group{display:flex;gap:12px}
.rec-btn{flex:1;height:46px;border:1.5px solid #e8d5c0;border-radius:10px;font-size:14px;font-weight:600;cursor:pointer;font-family:'Noto Sans KR',sans-serif;background:#fff;transition:all .2s}
.rec-btn:hover{opacity:.85}
.rec-btn.pass{color:#166534;border-color:#a7f3d0}
.rec-btn.pass.selected{background:#16a34a;border-color:#16a34a;color:#fff}
.rec-btn.fail{color:#991b1b;border-color:#fca5a5}
.rec-btn.fail.selected{background:#dc2626;border-color:#dc2626;color:#fff}

.btn-row{display:flex;gap:10px;margin-top:26px}
.btn-submit{flex:1;height:48px;background:linear-gradient(135deg,#6b3015,#8b4513);color:#fff;border:none;border-radius:11px;font-size:14px;font-weight:600;cursor:pointer;font-family:'Noto Sans KR',sans-serif}
.btn-cancel{height:48px;padding:0 24px;background:#f5ede3;color:#8b4513;border:1.5px solid #e8d5c0;border-radius:11px;font-size:14px;font-weight:500;text-decoration:none;display:flex;align-items:center;cursor:pointer}
input[type=hidden]{}
</style>
</head>
<body>
<%
  com.ats.project.model.EvalVO ev =
      (com.ats.project.model.EvalVO)request.getAttribute("eval");
  boolean isEdit = (ev != null);
%>
<div class="form-wrap">
  <div class="form-title"><%= isEdit?"✏️ 평가서 수정":"📝 면접 평가서 작성" %></div>
  <div class="form-sub">항목별 점수를 선택하고 종합 의견을 작성하세요 (점수: 1~5점)</div>

  <c:if test="${not empty msg}">
    <div class="alert">⚠️ ${msg}</div>
  </c:if>

  <form action="<%= isEdit?"/eval/edit/"+ev.getEvalId():"/eval/write" %>"
        method="post" id="evalForm">

    <input type="hidden" name="recommend" id="recommendInput"
           value="<%= isEdit?ev.getRecommend():"" %>"/>

    <!-- 지원자 선택 -->
    <div class="field">
      <label>지원자 선택 *</label>
      <select name="applicationId" required>
        <option value="">지원자를 선택하세요</option>
        <c:forEach var="app" items="${applicationList}">
          <option value="${app.applicationId}"
            <%= isEdit && ev.getApplicationId()==Integer.parseInt("${app.applicationId}")
                ? "selected" : "" %>>
            ${app.applicantName} — ${app.postingTitle}
          </option>
        </c:forEach>
      </select>
    </div>

    <!-- 기술 역량 -->
    <div class="field">
      <label>기술 역량 *</label>
      <div class="score-group" id="techGroup">
        <c:forEach begin="1" end="5" var="i">
          <button type="button" class="score-btn"
                  onclick="selectScore('tech',${i})"
                  id="tech-${i}">${i}</button>
        </c:forEach>
      </div>
      <div class="score-label"><span>매우 부족</span><span>매우 우수</span></div>
      <input type="hidden" name="techScore" id="techScore"
             value="<%= isEdit?ev.getTechScore():0 %>"/>
    </div>

    <!-- 커뮤니케이션 -->
    <div class="field">
      <label>커뮤니케이션 *</label>
      <div class="score-group" id="commGroup">
        <c:forEach begin="1" end="5" var="i">
          <button type="button" class="score-btn"
                  onclick="selectScore('comm',${i})"
                  id="comm-${i}">${i}</button>
        </c:forEach>
      </div>
      <div class="score-label"><span>매우 부족</span><span>매우 우수</span></div>
      <input type="hidden" name="commScore" id="commScore"
             value="<%= isEdit?ev.getCommScore():0 %>"/>
    </div>

    <!-- 문제 해결력 -->
    <div class="field">
      <label>문제 해결력 *</label>
      <div class="score-group" id="solveGroup">
        <c:forEach begin="1" end="5" var="i">
          <button type="button" class="score-btn"
                  onclick="selectScore('solve',${i})"
                  id="solve-${i}">${i}</button>
        </c:forEach>
      </div>
      <div class="score-label"><span>매우 부족</span><span>매우 우수</span></div>
      <input type="hidden" name="solveScore" id="solveScore"
             value="<%= isEdit?ev.getSolveScore():0 %>"/>
    </div>

    <!-- 종합 의견 -->
    <div class="field">
      <label>종합 의견</label>
      <textarea name="comment"
                placeholder="지원자에 대한 종합적인 의견 또는 불합격 사유를 작성하세요"><%= isEdit?ev.getComment():"" %></textarea>
    </div>

    <!-- 합격 권고 -->
    <div class="field">
      <label>합격 권고 *</label>
      <div class="recommend-group">
        <button type="button" class="rec-btn pass"
                id="btn-PASS" onclick="selectRecommend('PASS')">
          ✅ 합격 권고
        </button>
        <button type="button" class="rec-btn fail"
                id="btn-FAIL" onclick="selectRecommend('FAIL')">
          ❌ 불합격 권고
        </button>
      </div>
    </div>

    <div class="btn-row">
      <a href="/eval/list" class="btn-cancel">취소</a>
      <button type="button" class="btn-submit"
              onclick="return submitForm()">
        <%= isEdit?"수정 완료":"평가서 제출" %>
      </button>
    </div>
  </form>
</div>

<script>
// 수정 모드 초기값 설정
<% if(isEdit){ %>
  selectScore('tech',  <%= ev.getTechScore() %>);
  selectScore('comm',  <%= ev.getCommScore() %>);
  selectScore('solve', <%= ev.getSolveScore() %>);
  selectRecommend('<%= ev.getRecommend() %>');
<% } %>

function selectScore(type, val) {
  for(var i=1; i<=5; i++){
    var btn = document.getElementById(type+'-'+i);
    btn.classList.toggle('selected', i===val);
  }
  document.getElementById(type+'Score').value = val;
}

function selectRecommend(val) {
  document.getElementById('btn-PASS').classList.toggle('selected', val==='PASS');
  document.getElementById('btn-FAIL').classList.toggle('selected', val==='FAIL');
  document.getElementById('recommendInput').value = val;
}

function submitForm() {
  if(!document.querySelector('[name=applicationId]').value){
    alert('지원자를 선택해주세요.'); return;
  }
  if(!document.getElementById('techScore').value  ||
     document.getElementById('techScore').value=='0'){
    alert('기술 역량 점수를 선택해주세요.'); return;
  }
  if(!document.getElementById('commScore').value  ||
     document.getElementById('commScore').value=='0'){
    alert('커뮤니케이션 점수를 선택해주세요.'); return;
  }
  if(!document.getElementById('solveScore').value ||
     document.getElementById('solveScore').value=='0'){
    alert('문제 해결력 점수를 선택해주세요.'); return;
  }
  if(!document.getElementById('recommendInput').value){
    alert('합격 권고 여부를 선택해주세요.'); return;
  }
  document.getElementById('evalForm').submit();
}
</script>
</body>
</html>