<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>ATS | 공고 등록</title>
<style>
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500;700&display=swap');
*,*::before,*::after{box-sizing:border-box;margin:0;padding:0}
body{font-family:'Noto Sans KR',sans-serif;background:#f5ede3;min-height:100vh;display:flex;align-items:center;justify-content:center;padding:30px}
.form-wrap{background:#fff;border-radius:20px;padding:36px 40px;width:100%;max-width:640px;border:1px solid #f0e0cc}
.form-title{font-size:20px;font-weight:700;color:#3d1c02;margin-bottom:6px}
.form-sub{font-size:13px;color:#a07050;margin-bottom:28px}
.field{margin-bottom:18px}
.field label{display:block;font-size:12.5px;font-weight:500;color:#7a5030;margin-bottom:7px}
.field input,.field select,.field textarea{width:100%;padding:11px 14px;border:1.5px solid #e8d5c0;border-radius:10px;font-size:13.5px;font-family:'Noto Sans KR',sans-serif;color:#3d1c02;background:#fff;outline:none;transition:border-color .2s}
.field input:focus,.field select:focus,.field textarea:focus{border-color:#8b4513;box-shadow:0 0 0 3px rgba(139,69,19,.08)}
.field textarea{resize:vertical;min-height:100px;line-height:1.7}
.field-row{display:grid;grid-template-columns:1fr 1fr;gap:14px}
.btn-row{display:flex;gap:10px;margin-top:24px}
.btn-submit{flex:1;height:48px;background:linear-gradient(135deg,#6b3015,#8b4513);color:#fff;border:none;border-radius:11px;font-size:14px;font-weight:600;cursor:pointer;font-family:'Noto Sans KR',sans-serif}
.btn-cancel{height:48px;padding:0 24px;background:#f5ede3;color:#8b4513;border:1.5px solid #e8d5c0;border-radius:11px;font-size:14px;font-weight:500;cursor:pointer;font-family:'Noto Sans KR',sans-serif;text-decoration:none;display:flex;align-items:center}
</style>
</head>
<body>
<%
  com.ats.project.model.PostingVO p =
      (com.ats.project.model.PostingVO) request.getAttribute("posting");
  boolean isEdit = (p != null);
%>
<div class="form-wrap">
  <div class="form-title"><%= isEdit ? "📝 공고 수정" : "📢 채용 공고 등록" %></div>
  <div class="form-sub"><%= isEdit ? "공고 내용을 수정하세요" : "새로운 채용 공고를 등록하세요" %></div>

  <form action="<%= isEdit ? "/posting/edit/"+p.getPostingId() : "/posting/write" %>"
        method="post">

    <div class="field">
      <label>공고 제목 *</label>
      <input type="text" name="title" required
             value="<%= isEdit ? p.getTitle() : "" %>"
             placeholder="예) 백엔드 개발자 모집"/>
    </div>

    <div class="field-row">
      <div class="field">
        <label>부서명 *</label>
        <input type="text" name="department" required
               value="<%= isEdit ? p.getDepartment() : "" %>"
               placeholder="예) 개발팀"/>
      </div>
      <div class="field">
        <label>모집 인원 *</label>
        <input type="number" name="headcount" min="1" required
               value="<%= isEdit ? p.getHeadcount() : 1 %>"/>
      </div>
    </div>

    <div class="field">
      <label>마감일 *</label>
      <input type="date" name="deadline" required
             value="<%= isEdit ? p.getDeadline() : "" %>"/>
    </div>

    <div class="field">
      <label>자격 요건</label>
      <textarea name="requirements"
                placeholder="필수 자격 요건을 입력하세요"><%= isEdit ? p.getRequirements() : "" %></textarea>
    </div>

    <div class="field">
      <label>우대 사항</label>
      <textarea name="preferred"
                placeholder="우대 사항을 입력하세요"><%= isEdit ? p.getPreferred() : "" %></textarea>
    </div>

    <div class="btn-row">
      <a href="/posting/list" class="btn-cancel">취소</a>
      <button type="submit" class="btn-submit">
        <%= isEdit ? "수정 완료" : "공고 등록" %>
      </button>
    </div>
  </form>
</div>
</body>
</html>