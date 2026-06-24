<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>ATS | 공지 등록</title>
<style>
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500;700&display=swap');
*,*::before,*::after{box-sizing:border-box;margin:0;padding:0}
body{font-family:'Noto Sans KR',sans-serif;background:#f5ede3;display:flex;min-height:100vh;color:#3d1c02;align-items:center;justify-content:center;padding:40px}
.form-card{background:#fff;border-radius:20px;padding:40px;width:100%;max-width:640px;border:1px solid #f0e0cc;box-shadow:0 4px 20px rgba(139,69,19,.08)}
.form-title{font-size:20px;font-weight:700;margin-bottom:28px;display:flex;align-items:center;gap:10px}
.field{margin-bottom:20px}
.field label{display:block;font-size:13px;font-weight:500;color:#5c2a0e;margin-bottom:8px}
.field input,.field textarea{width:100%;padding:13px 16px;border:1.5px solid #e8d5c0;border-radius:12px;font-size:14px;font-family:'Noto Sans KR',sans-serif;color:#3d1c02;background:#fdfaf6;outline:none;transition:all .2s}
.field input:focus,.field textarea:focus{border-color:#8b4513;box-shadow:0 0 0 3px rgba(139,69,19,.08)}
.field textarea{min-height:200px;resize:vertical;line-height:1.7}
.pin-row{display:flex;align-items:center;gap:10px;padding:12px 16px;background:#fdf8f3;border-radius:10px;border:1.5px solid #e8d5c0;cursor:pointer}
.pin-row input[type=checkbox]{width:18px;height:18px;cursor:pointer;accent-color:#8b4513}
.pin-label{font-size:13.5px;color:#5c2a0e}
.btn-row{display:flex;gap:10px;margin-top:8px}
.btn-submit{flex:1;height:50px;background:linear-gradient(135deg,#3d1c02,#5c2a0e);color:#fff;border:none;border-radius:12px;font-size:15px;font-weight:600;cursor:pointer;font-family:'Noto Sans KR',sans-serif}
.btn-back{height:50px;padding:0 22px;background:#f5ede3;color:#8b4513;border:1.5px solid #e8d5c0;border-radius:12px;font-size:14px;text-decoration:none;display:flex;align-items:center}
</style>
</head>
<body>
<div class="form-card">
  <div class="form-title">📣 공지 등록</div>
  <form action="/notice/write" method="post">
    <div class="field">
      <label>제목 *</label>
      <input type="text" name="title" placeholder="공지 제목을 입력하세요" required/>
    </div>
    <div class="field">
      <label>내용</label>
      <textarea name="content" placeholder="공지 내용을 입력하세요"></textarea>
    </div>
    <div class="field">
      <label class="pin-row">
        <input type="checkbox" name="isPinned" value="1"/>
        <span class="pin-label">📌 상단 고정 (중요 공지)</span>
      </label>
    </div>
    <div class="btn-row">
      <a href="/notice/list" class="btn-back">취소</a>
      <button type="submit" class="btn-submit">공지 등록하기</button>
    </div>
  </form>
</div>
</body>
</html>