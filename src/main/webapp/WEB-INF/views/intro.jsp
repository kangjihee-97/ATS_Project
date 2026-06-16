<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1.0">
<title>ATS | 채용 지원자 관리 시스템</title>
<style>
@import
	url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500;700;900&display=swap')
	;

*, *::before, *::after {
	box-sizing: border-box;
	margin: 0;
	padding: 0
}

:root {
	--brown-dark: #3d1c02;
	--brown-mid: #5c2a0e;
	--brown: #8b4513;
	--brown-light: #a0522d;
	--gold: #d4a017;
	--gold-light: #e8c547;
	--cream: #f5ede3;
	--cream-light: #fdfaf6;
}

html {
	scroll-behavior: smooth
}

body {
	font-family: 'Noto Sans KR', sans-serif;
	background: #0a0602;
	color: #fff;
	overflow-x: hidden
}

/* ── 스크롤바 커스텀 ── */
::-webkit-scrollbar {
	width: 6px
}

::-webkit-scrollbar-track {
	background: #0a0602
}

::-webkit-scrollbar-thumb {
	background: #5c2a0e;
	border-radius: 3px
}

/* ══════════════════════════════
   HERO SECTION
══════════════════════════════ */
.hero {
	min-height: 100vh;
	position: relative;
	display: flex;
	align-items: center;
	justify-content: center;
	overflow: hidden;
}

/* 배경 그라디언트 애니메이션 */
.hero-bg {
	position: absolute;
	inset: 0;
	background: radial-gradient(ellipse at 20% 50%, #3d1c0280 0%, transparent 60%),
		radial-gradient(ellipse at 80% 20%, #d4a01730 0%, transparent 50%),
		radial-gradient(ellipse at 60% 80%, #5c2a0e60 0%, transparent 50%),
		#0a0602;
	animation: bgPulse 8s ease-in-out infinite alternate;
}

@
keyframes bgPulse { 0% {
	background: radial-gradient(ellipse at 20% 50%, #3d1c0280 0%, transparent 60%),
		radial-gradient(ellipse at 80% 20%, #d4a01730 0%, transparent 50%),
		radial-gradient(ellipse at 60% 80%, #5c2a0e60 0%, transparent 50%),
		#0a0602
}

100
%
{
background
:
radial-gradient(
ellipse
at
70%
30%
,
#5c2a0e80
0%
,
transparent
60%
)
,
radial-gradient(
ellipse
at
20%
80%
,
#d4a01720
0%
,
transparent
50%
)
,
radial-gradient(
ellipse
at
80%
60%
,
#3d1c0260
0%
,
transparent
50%
)
,
#0a0602
}
}

/* 파티클 */
.particles {
	position: absolute;
	inset: 0;
	pointer-events: none
}

.particle {
	position: absolute;
	border-radius: 50%;
	animation: float linear infinite;
	opacity: 0;
}

@
keyframes float { 0% {
	transform: translateY(100vh) rotate(0deg);
	opacity: 0
}

10
%
{
opacity
:
.6
}
90
%
{
opacity
:
.3
}
100
%
{
transform
:
translateY(
-100px
)
rotate(
720deg
);
opacity
:
0
}
}

/* 그리드 오버레이 */
.hero-grid {
	position: absolute;
	inset: 0;
	background-image: linear-gradient(rgba(212, 160, 23, .05) 1px,
		transparent 1px), linear-gradient(90deg, rgba(212, 160, 23, .05) 1px,
		transparent 1px);
	background-size: 60px 60px;
	animation: gridMove 20s linear infinite;
}

@
keyframes gridMove {
	to {transform: translateY(60px)
}

}

/* 히어로 콘텐츠 */
.hero-content {
	position: relative;
	z-index: 2;
	text-align: center;
	padding: 0 24px;
	max-width: 900px;
}

.hero-badge {
	display: inline-flex;
	align-items: center;
	gap: 8px;
	padding: 8px 20px;
	border-radius: 30px;
	background: rgba(212, 160, 23, .12);
	border: 1px solid rgba(212, 160, 23, .3);
	font-size: 13px;
	color: var(--gold-light);
	letter-spacing: 1px;
	margin-bottom: 28px;
	animation: fadeDown .8s ease both;
}

.badge-dot {
	width: 6px;
	height: 6px;
	border-radius: 50%;
	background: var(--gold);
	animation: blink 1.5s infinite;
}

@
keyframes blink { 0%,100%{
	opacity: 1
}

50
%
{
opacity
:
.2
}
}
.hero-title {
	font-size: clamp(36px, 6vw, 72px);
	font-weight: 900;
	line-height: 1.15;
	margin-bottom: 20px;
	animation: fadeDown .9s .1s ease both;
}

.hero-title .line1 {
	display: block;
	color: #fff
}

.hero-title .hl {
	background: linear-gradient(135deg, var(--gold), var(--gold-light),
		#f0c040);
	-webkit-background-clip: text;
	-webkit-text-fill-color: transparent;
	background-clip: text;
}

.typewriter {
	display: inline-block;
	font-size: clamp(18px, 3vw, 28px);
	color: rgba(255, 255, 255, .6);
	margin-bottom: 40px;
	animation: fadeDown 1s .2s ease both;
	min-height: 40px;
}

.cursor {
	display: inline-block;
	width: 2px;
	height: 1.1em;
	background: var(--gold);
	animation: cursorBlink .8s infinite;
	vertical-align: middle;
	margin-left: 3px;
}

@
keyframes cursorBlink { 0%,100%{
	opacity: 1
}

50
%
{
opacity
:
0
}
}
.hero-btns {
	display: flex;
	gap: 14px;
	justify-content: center;
	flex-wrap: wrap;
	animation: fadeUp 1s .4s ease both;
}

.btn-hero-primary {
	padding: 15px 36px;
	border-radius: 12px;
	background: linear-gradient(135deg, var(--gold), #c8791a);
	color: var(--brown-dark);
	font-size: 15px;
	font-weight: 700;
	text-decoration: none;
	display: inline-flex;
	align-items: center;
	gap: 8px;
	transition: transform .2s, box-shadow .2s;
	box-shadow: 0 8px 30px rgba(212, 160, 23, .35);
}

.btn-hero-primary:hover {
	transform: translateY(-2px);
	box-shadow: 0 12px 40px rgba(212, 160, 23, .5)
}

.btn-hero-outline {
	padding: 15px 36px;
	border-radius: 12px;
	border: 1.5px solid rgba(255, 255, 255, .2);
	color: #fff;
	font-size: 15px;
	font-weight: 500;
	text-decoration: none;
	display: inline-flex;
	align-items: center;
	gap: 8px;
	transition: all .2s;
	background: rgba(255, 255, 255, .05);
	backdrop-filter: blur(10px);
}

.btn-hero-outline:hover {
	border-color: rgba(212, 160, 23, .5);
	background: rgba(212, 160, 23, .08)
}

/* 스크롤 유도 */
.scroll-hint {
	position: absolute;
	bottom: 40px;
	left: 50%;
	transform: translateX(-50%);
	display: flex;
	flex-direction: column;
	align-items: center;
	gap: 8px;
	font-size: 11px;
	color: rgba(255, 255, 255, .3);
	letter-spacing: 2px;
	animation: fadeIn 1.5s 1s ease both;
}

.scroll-line {
	width: 1px;
	height: 50px;
	background: linear-gradient(to bottom, rgba(212, 160, 23, .5),
		transparent);
	animation: scrollAnim 1.5s ease-in-out infinite;
}

@
keyframes scrollAnim { 0%,100%{
	transform: scaleY(1);
	opacity: 1
}

50
%
{
transform
:
scaleY(
.5
);
opacity
:
.3
}
}

/* ══════════════════════════════
   STATS SECTION
══════════════════════════════ */
.stats {
	padding: 80px 40px;
	background: linear-gradient(180deg, #0a0602, #140a04);
	position: relative;
}

.stats-inner {
	max-width: 1000px;
	margin: 0 auto;
	display: grid;
	grid-template-columns: repeat(4, 1fr);
	gap: 2px;
}

.stat-card {
	text-align: center;
	padding: 40px 20px;
	background: rgba(255, 255, 255, .02);
	border: 1px solid rgba(212, 160, 23, .1);
	transition: all .3s;
	position: relative;
	overflow: hidden;
}

.stat-card::before {
	content: '';
	position: absolute;
	top: 0;
	left: 0;
	right: 0;
	height: 2px;
	background: linear-gradient(90deg, transparent, var(--gold), transparent);
	opacity: 0;
	transition: opacity .3s;
}

.stat-card:hover::before {
	opacity: 1
}

.stat-card:hover {
	background: rgba(212, 160, 23, .05);
	transform: translateY(-4px)
}

.stat-num {
	font-size: 52px;
	font-weight: 900;
	background: linear-gradient(135deg, var(--gold), var(--gold-light));
	-webkit-background-clip: text;
	-webkit-text-fill-color: transparent;
	background-clip: text;
	line-height: 1.1;
}

.stat-unit {
	font-size: 20px
}

.stat-label {
	font-size: 14px;
	color: rgba(255, 255, 255, .4);
	margin-top: 10px
}

/* ══════════════════════════════
   FEATURES SECTION
══════════════════════════════ */
.features {
	padding: 100px 40px;
	background: #0d0704;
	position: relative;
	overflow: hidden;
}

.features::before {
	content: '';
	position: absolute;
	top: -200px;
	right: -200px;
	width: 600px;
	height: 600px;
	border-radius: 50%;
	background: radial-gradient(circle, rgba(212, 160, 23, .06), transparent
		70%);
}

.section-label {
	text-align: center;
	font-size: 12px;
	letter-spacing: 3px;
	color: var(--gold);
	text-transform: uppercase;
	margin-bottom: 12px;
}

.section-title {
	text-align: center;
	font-size: clamp(28px, 4vw, 44px);
	font-weight: 700;
	color: #fff;
	margin-bottom: 16px;
	line-height: 1.3;
}

.section-sub {
	text-align: center;
	font-size: 15px;
	color: rgba(255, 255, 255, .4);
	margin-bottom: 64px;
	max-width: 500px;
	margin-left: auto;
	margin-right: auto;
}

.features-grid {
	max-width: 1100px;
	margin: 0 auto;
	display: grid;
	grid-template-columns: repeat(3, 1fr);
	gap: 20px;
}

.feature-card {
	padding: 32px;
	border-radius: 20px;
	background: rgba(255, 255, 255, .03);
	border: 1px solid rgba(255, 255, 255, .06);
	transition: all .4s;
	position: relative;
	overflow: hidden;
	opacity: 0;
	transform: translateY(30px);
	transition: opacity .6s ease, transform .6s ease, background .3s,
		border-color .3s;
}

.feature-card.visible {
	opacity: 1;
	transform: translateY(0)
}

.feature-card::before {
	content: '';
	position: absolute;
	inset: 0;
	border-radius: 20px;
	background: linear-gradient(135deg, rgba(212, 160, 23, .06), transparent);
	opacity: 0;
	transition: opacity .3s;
}

.feature-card:hover::before {
	opacity: 1
}

.feature-card:hover {
	border-color: rgba(212, 160, 23, .25);
	transform: translateY(-6px);
}

.feat-icon {
	width: 56px;
	height: 56px;
	border-radius: 16px;
	background: linear-gradient(135deg, rgba(212, 160, 23, .2),
		rgba(139, 69, 19, .2));
	border: 1px solid rgba(212, 160, 23, .2);
	display: flex;
	align-items: center;
	justify-content: center;
	font-size: 26px;
	margin-bottom: 20px;
}

.feat-title {
	font-size: 17px;
	font-weight: 700;
	color: #fff;
	margin-bottom: 10px
}

.feat-desc {
	font-size: 13.5px;
	color: rgba(255, 255, 255, .45);
	line-height: 1.7
}

/* ══════════════════════════════
   PIPELINE SECTION
══════════════════════════════ */
.pipeline-sec {
	padding: 100px 40px;
	background: linear-gradient(180deg, #0d0704, #0a0602);
	overflow: hidden;
}

.pipeline-flow {
	max-width: 1000px;
	margin: 0 auto;
	display: flex;
	align-items: center;
	justify-content: center;
	gap: 0;
	flex-wrap: wrap;
	gap: 8px;
}

.pipe-step {
	text-align: center;
	opacity: 0;
	transform: scale(.8);
	transition: all .5s ease;
}

.pipe-step.visible {
	opacity: 1;
	transform: scale(1)
}

.pipe-icon {
	width: 72px;
	height: 72px;
	border-radius: 50%;
	margin: 0 auto 12px;
	display: flex;
	align-items: center;
	justify-content: center;
	font-size: 28px;
	border: 2px solid;
	position: relative;
}

.pipe-icon::after {
	content: '';
	position: absolute;
	inset: -6px;
	border-radius: 50%;
	border: 1px solid;
	animation: ripple 2s ease-out infinite;
}

@
keyframes ripple { 0%{
	transform: scale(1);
	opacity: .5
}

100
%
{
transform
:
scale(
1.5
);
opacity
:
0
}
}
.p1 .pipe-icon {
	background: rgba(37, 99, 235, .15);
	border-color: rgba(37, 99, 235, .5);
	color: #60a5fa
}

.p1 .pipe-icon::after {
	border-color: rgba(37, 99, 235, .3)
}

.p2 .pipe-icon {
	background: rgba(124, 58, 237, .15);
	border-color: rgba(124, 58, 237, .5);
	color: #a78bfa
}

.p2 .pipe-icon::after {
	border-color: rgba(124, 58, 237, .3)
}

.p3 .pipe-icon {
	background: rgba(217, 119, 6, .15);
	border-color: rgba(217, 119, 6, .5);
	color: #fbbf24
}

.p3 .pipe-icon::after {
	border-color: rgba(217, 119, 6, .3)
}

.p4 .pipe-icon {
	background: rgba(5, 150, 105, .15);
	border-color: rgba(5, 150, 105, .5);
	color: #34d399
}

.p4 .pipe-icon::after {
	border-color: rgba(5, 150, 105, .3)
}

.p5 .pipe-icon {
	background: rgba(212, 160, 23, .15);
	border-color: rgba(212, 160, 23, .5);
	color: var(--gold-light)
}

.p5 .pipe-icon::after {
	border-color: rgba(212, 160, 23, .3)
}

.pipe-label {
	font-size: 12px;
	color: rgba(255, 255, 255, .5);
	margin-bottom: 4px
}

.pipe-name {
	font-size: 14px;
	font-weight: 600;
	color: #fff
}

.pipe-arrow {
	font-size: 24px;
	color: rgba(255, 255, 255, .15);
	margin: 0 4px;
	padding-bottom: 28px
}

/* ══════════════════════════════
   ROLES SECTION
══════════════════════════════ */
.roles {
	padding: 100px 40px;
	background: #0a0602;
	position: relative;
	overflow: hidden;
}

.roles::after {
	content: '';
	position: absolute;
	bottom: -200px;
	left: -200px;
	width: 500px;
	height: 500px;
	border-radius: 50%;
	background: radial-gradient(circle, rgba(92, 42, 14, .3), transparent
		70%);
}

.roles-grid {
	max-width: 900px;
	margin: 0 auto;
	display: grid;
	grid-template-columns: repeat(3, 1fr);
	gap: 20px;
}

.role-card {
	padding: 36px 28px;
	border-radius: 20px;
	text-align: center;
	opacity: 0;
	transform: translateY(20px);
	transition: all .5s ease;
}

.role-card.visible {
	opacity: 1;
	transform: translateY(0)
}

.role-card:nth-child(1) {
	background: linear-gradient(135deg, rgba(212, 160, 23, .1),
		rgba(212, 160, 23, .03));
	border: 1px solid rgba(212, 160, 23, .2);
}

.role-card:nth-child(2) {
	background: linear-gradient(135deg, rgba(37, 99, 235, .1),
		rgba(37, 99, 235, .03));
	border: 1px solid rgba(37, 99, 235, .2);
}

.role-card:nth-child(3) {
	background: linear-gradient(135deg, rgba(124, 58, 237, .1),
		rgba(124, 58, 237, .03));
	border: 1px solid rgba(124, 58, 237, .2);
}

.role-emoji {
	font-size: 48px;
	margin-bottom: 16px
}

.role-name {
	font-size: 18px;
	font-weight: 700;
	color: #fff;
	margin-bottom: 8px
}

.role-desc {
	font-size: 13px;
	color: rgba(255, 255, 255, .4);
	line-height: 1.6
}

.role-perms {
	margin-top: 16px;
	display: flex;
	flex-direction: column;
	gap: 6px
}

.perm-item {
	display: flex;
	align-items: center;
	gap: 7px;
	font-size: 12px;
	color: rgba(255, 255, 255, .5);
}

.perm-dot {
	width: 5px;
	height: 5px;
	border-radius: 50%;
	background: var(--gold);
	flex-shrink: 0
}

/* ══════════════════════════════
   CTA SECTION
══════════════════════════════ */
.cta {
	padding: 100px 40px;
	background: linear-gradient(135deg, #1a0a04, #0a0602);
	text-align: center;
	position: relative;
	overflow: hidden;
}

.cta::before {
	content: 'ATS';
	position: absolute;
	font-size: 300px;
	font-weight: 900;
	color: rgba(255, 255, 255, .01);
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	pointer-events: none;
	letter-spacing: -20px;
	white-space: nowrap;
}

.cta-inner {
	position: relative;
	z-index: 1;
	max-width: 600px;
	margin: 0 auto;
}

.cta h2 {
	font-size: clamp(28px, 4vw, 48px);
	font-weight: 900;
	color: #fff;
	margin-bottom: 16px;
}

.cta p {
	font-size: 15px;
	color: rgba(255, 255, 255, .4);
	margin-bottom: 40px;
	line-height: 1.7
}

.btn-cta {
	display: inline-flex;
	align-items: center;
	gap: 10px;
	padding: 18px 44px;
	border-radius: 14px;
	background: linear-gradient(135deg, var(--gold), #c8791a);
	color: var(--brown-dark);
	font-size: 16px;
	font-weight: 700;
	text-decoration: none;
	box-shadow: 0 8px 40px rgba(212, 160, 23, .4);
	transition: all .3s;
	position: relative;
	overflow: hidden;
}

.btn-cta::after {
	content: '';
	position: absolute;
	inset: 0;
	background: linear-gradient(135deg, rgba(255, 255, 255, .15),
		transparent);
	opacity: 0;
	transition: opacity .3s;
}

.btn-cta:hover {
	transform: translateY(-3px);
	box-shadow: 0 16px 60px rgba(212, 160, 23, .6)
}

.btn-cta:hover::after {
	opacity: 1
}

/* ── 공통 애니메이션 ── */
@
keyframes fadeDown {
	from {opacity: 0;
	transform: translateY(-20px)
}

to {
	opacity: 1;
	transform: translateY(0)
}

}
@
keyframes fadeUp {
	from {opacity: 0;
	transform: translateY(20px)
}

to {
	opacity: 1;
	transform: translateY(0)
}

}
@
keyframes fadeIn {
	from {opacity: 0
}

to {
	opacity: 1
}

}

/* 네비 */
.topnav {
	position: fixed;
	top: 0;
	left: 0;
	right: 0;
	z-index: 100;
	padding: 16px 40px;
	display: flex;
	align-items: center;
	justify-content: space-between;
	transition: background .3s, backdrop-filter .3s;
}

.topnav.scrolled {
	background: rgba(10, 6, 2, .85);
	backdrop-filter: blur(12px);
	border-bottom: 1px solid rgba(212, 160, 23, .1);
}

.nav-logo {
	display: flex;
	align-items: center;
	gap: 10px;
	text-decoration: none;
}

.nav-logo-box {
	width: 36px;
	height: 36px;
	border-radius: 10px;
	background: linear-gradient(135deg, var(--gold), #c8791a);
	display: flex;
	align-items: center;
	justify-content: center;
	font-size: 18px;
}

.nav-logo-name {
	font-size: 18px;
	font-weight: 700;
	color: #fff;
	letter-spacing: 1px
}

.nav-btns {
	display: flex;
	gap: 10px;
	align-items: center
}

.nav-login {
	padding: 9px 22px;
	border-radius: 10px;
	border: 1px solid rgba(212, 160, 23, .4);
	color: var(--gold-light);
	font-size: 13px;
	font-weight: 500;
	text-decoration: none;
	transition: all .2s;
	font-family: 'Noto Sans KR', sans-serif;
}

.nav-login:hover {
	background: rgba(212, 160, 23, .1)
}

.nav-start {
	padding: 9px 22px;
	border-radius: 10px;
	background: linear-gradient(135deg, var(--gold), #c8791a);
	color: var(--brown-dark);
	font-size: 13px;
	font-weight: 700;
	text-decoration: none;
	transition: all .2s;
}

.nav-start:hover {
	transform: translateY(-1px);
	box-shadow: 0 4px 16px rgba(212, 160, 23, .35)
}

/* footer */
.footer {
	padding: 40px;
	text-align: center;
	border-top: 1px solid rgba(255, 255, 255, .05);
	font-size: 12px;
	color: rgba(255, 255, 255, .2);
}
</style>
</head>
<body>

	<!-- ── 상단 네비 ── -->
	<nav class="topnav" id="topnav">
		<a href="/intro" class="nav-logo"> <img
			src="/img/vernalis-logo.png"
			style="width: 36px; height: 36px; object-fit: contain" /> <span
			class="nav-logo-name">VERNALIS</span>
		</a>
		<div class="nav-btns">
			<a href="/user/login" class="nav-login">로그인</a> <a href="/user/login"
				class="nav-start">시작하기 →</a>
		</div>
	</nav>

	<!-- ══════════════════════
     HERO
══════════════════════ -->
	<section class="hero">
		<div class="hero-bg"></div>
		<div class="hero-grid"></div>
		<div class="particles" id="particles"></div>

		<div class="hero-content">
			<div class="hero-badge">
				<div class="badge-dot"></div>
				VERNALIS(ATS)
			</div>

			<h1 class="hero-title">
				<span class="line1">채용의 모든 것을</span> <span class="hl">하나의 플랫폼</span>으로
			</h1>

			<div class="typewriter" id="typewriter">
				<span id="typed"></span><span class="cursor"></span>
			</div>

			<div class="hero-btns">
				<a href="/user/login" class="btn-hero-primary"> 🚀 지금 시작하기 </a> <a
					href="#features" class="btn-hero-outline"> 기능 살펴보기 ↓ </a>
			</div>
		</div>

		<div class="scroll-hint">
			<span>SCROLL</span>
			<div class="scroll-line"></div>
		</div>
	</section>

	<!-- ══════════════════════
     STATS
══════════════════════ -->
	<section class="stats">
		<div class="stats-inner">
			<div class="stat-card">
				<div class="stat-num">
					<span class="count" data-target="6">0</span><span class="stat-unit">단계</span>
				</div>
				<div class="stat-label">채용 파이프라인 관리</div>
			</div>
			<div class="stat-card">
				<div class="stat-num">
					<span class="count" data-target="3">0</span><span class="stat-unit">역할</span>
				</div>
				<div class="stat-label">세분화된 권한 시스템</div>
			</div>
			<div class="stat-card">
				<div class="stat-num">
					<span class="count" data-target="100">0</span><span
						class="stat-unit">%</span>
				</div>
				<div class="stat-label">실시간 채용 현황 파악</div>
			</div>
			<div class="stat-card">
				<div class="stat-num">
					<span class="count" data-target="24">0</span><span
						class="stat-unit">시간</span>
				</div>
				<div class="stat-label">언제나 접근 가능</div>
			</div>
		</div>
	</section>

	<!-- ══════════════════════
     FEATURES
══════════════════════ -->
	<section class="features" id="features">
		<div class="section-label">FEATURES</div>
		<h2 class="section-title">왜 VERNALIS를 써야 할까요?</h2>
		<p class="section-sub">채용 담당자와 면접관 모두를 위한 완벽한 협업 도구</p>

		<div class="features-grid">
			<div class="feature-card">
				<div class="feat-icon">📢</div>
				<div class="feat-title">채용 공고 관리</div>
				<div class="feat-desc">공고 등록부터 마감일 자동 처리까지. 여러 공고를 동시에 효율적으로
					관리하세요.</div>
			</div>
			<div class="feature-card">
				<div class="feat-icon">📋</div>
				<div class="feat-title">실시간 파이프라인</div>
				<div class="feat-desc">드래그 앤 드롭으로 지원자 단계를 직관적으로 변경. 채용 현황을 한눈에
					파악하세요.</div>
			</div>
			<div class="feature-card">
				<div class="feat-icon">📅</div>
				<div class="feat-title">면접 일정 자동화</div>
				<div class="feat-desc">면접 일정 등록 시 충돌 자동 감지. 면접관별 일정 분리 관리로 혼선
					없이 진행하세요.</div>
			</div>
			<div class="feature-card">
				<div class="feat-icon">📝</div>
				<div class="feat-title">다면 평가 시스템</div>
				<div class="feat-desc">여러 면접관이 독립적으로 평가 작성. 기술·소통·문제해결 항목별 점수
					자동 집계.</div>
			</div>
			<div class="feature-card">
				<div class="feat-icon">📊</div>
				<div class="feat-title">데이터 분석 & 엑셀</div>
				<div class="feat-desc">채용 현황 대시보드와 월별 통계. 지원자 목록을 엑셀로 즉시
					다운로드하세요.</div>
			</div>
			<div class="feature-card">
				<div class="feat-icon">✉️</div>
				<div class="feat-title">자동 이메일 발송</div>
				<div class="feat-desc">합격·불합격·면접 안내 메일 자동 발송. 지원자와의 소통을 시스템이
					대신합니다.</div>
			</div>
		</div>
	</section>

	<!-- ══════════════════════
     PIPELINE FLOW
══════════════════════ -->
	<section class="pipeline-sec">
		<div class="section-label">WORKFLOW</div>
		<h2 class="section-title">채용 프로세스 한눈에</h2>
		<p class="section-sub">서류접수부터 최종합격까지 모든 단계를 체계적으로</p>

		<div class="pipeline-flow">
			<div class="pipe-step p1">
				<div class="pipe-icon">📩</div>
				<div class="pipe-label">STEP 1</div>
				<div class="pipe-name">서류 접수</div>
			</div>
			<div class="pipe-arrow">›</div>
			<div class="pipe-step p2">
				<div class="pipe-icon">📄</div>
				<div class="pipe-label">STEP 2</div>
				<div class="pipe-name">서류 합격</div>
			</div>
			<div class="pipe-arrow">›</div>
			<div class="pipe-step p3">
				<div class="pipe-icon">🎙</div>
				<div class="pipe-label">STEP 3</div>
				<div class="pipe-name">1차 면접</div>
			</div>
			<div class="pipe-arrow">›</div>
			<div class="pipe-step p3">
				<div class="pipe-icon">🤝</div>
				<div class="pipe-label">STEP 4</div>
				<div class="pipe-name">2차 면접</div>
			</div>
			<div class="pipe-arrow">›</div>
			<div class="pipe-step p5">
				<div class="pipe-icon">🏆</div>
				<div class="pipe-label">STEP 5</div>
				<div class="pipe-name">최종 합격</div>
			</div>
		</div>
	</section>

	<!-- ══════════════════════
     ROLES
══════════════════════ -->
	<section class="roles">
		<div class="section-label">ROLES</div>
		<h2 class="section-title">역할에 맞는 기능을</h2>
		<p class="section-sub">누가 접속하든 필요한 기능만 딱 보여드립니다</p>

		<div class="roles-grid">
			<div class="role-card">
				<div class="role-emoji">👑</div>
				<div class="role-name">최고관리자</div>
				<div class="role-desc">모든 기능 접근 가능. 회원 관리 및 시스템 전체 제어 권한</div>
				<div class="role-perms">
					<div class="perm-item">
						<div class="perm-dot"></div>
						전체 데이터 조회·수정
					</div>
					<div class="perm-item">
						<div class="perm-dot"></div>
						회원 계정 관리
					</div>
					<div class="perm-item">
						<div class="perm-dot"></div>
						평가서 작성·조회
					</div>
				</div>
			</div>
			<div class="role-card">
				<div class="role-emoji">👔</div>
				<div class="role-name">인사담당자</div>
				<div class="role-desc">채용 공고 관리부터 면접 일정까지. 채용 프로세스 전반 운영</div>
				<div class="role-perms">
					<div class="perm-item">
						<div class="perm-dot"></div>
						공고 등록·수정·마감
					</div>
					<div class="perm-item">
						<div class="perm-dot"></div>
						지원자 단계 변경
					</div>
					<div class="perm-item">
						<div class="perm-dot"></div>
						면접 일정 등록
					</div>
				</div>
			</div>
			<div class="role-card">
				<div class="role-emoji">🎙</div>
				<div class="role-name">면접관</div>
				<div class="role-desc">배정된 면접 일정 확인 및 평가서 작성에 집중</div>
				<div class="role-perms">
					<div class="perm-item">
						<div class="perm-dot"></div>
						본인 면접 일정 조회
					</div>
					<div class="perm-item">
						<div class="perm-dot"></div>
						평가서 작성·수정
					</div>
					<div class="perm-item">
						<div class="perm-dot"></div>
						지원자 정보 조회
					</div>
				</div>
			</div>
		</div>
	</section>

	<!-- ══════════════════════
     CTA
══════════════════════ -->
	<section class="cta">
		<div class="cta-inner">
			<h2>지금 바로 시작하세요</h2>
			<p>
				복잡한 설치 없이 바로 사용 가능합니다.<br>채용 프로세스를 체계적으로 관리해보세요.
			</p>
			<a href="/user/login" class="btn-cta"> 🚀 무료로 시작하기 </a>
		</div>
	</section>

	<footer class="footer"> © 2026 ATS · VERNALIS (Applicant Tracking System)
		· All rights reserved. </footer>

	<script>
/* ── 네비 스크롤 효과 ── */
window.addEventListener('scroll', function() {
  var nav = document.getElementById('topnav');
  nav.classList.toggle('scrolled', window.scrollY > 50);
});

/* ── 파티클 생성 ── */
(function() {
  var container = document.getElementById('particles');
  var colors = ['#d4a017','#e8c547','#8b4513','#f0c040','#c8791a'];
  for (var i = 0; i < 30; i++) {
    var el = document.createElement('div');
    el.className = 'particle';
    var size = Math.random() * 4 + 2;
    el.style.cssText = [
      'width:' + size + 'px',
      'height:' + size + 'px',
      'left:' + Math.random() * 100 + '%',
      'background:' + colors[Math.floor(Math.random() * colors.length)],
      'animation-duration:' + (Math.random() * 15 + 8) + 's',
      'animation-delay:' + Math.random() * 10 + 's',
    ].join(';');
    container.appendChild(el);
  }
})();

/* ── 타이프라이터 효과 ── */
(function() {
  var texts = [
    '공고 등록부터 최종 합격까지',
    '실시간 파이프라인 관리',
    '팀 전체가 함께 쓰는 채용 플랫폼',
    '스마트한 인재 채용의 시작',
  ];
  var idx = 0, charIdx = 0, deleting = false;
  var typed = document.getElementById('typed');

  function type() {
    var current = texts[idx];
    if (!deleting) {
      typed.textContent = current.substring(0, charIdx + 1);
      charIdx++;
      if (charIdx === current.length) {
        deleting = true;
        setTimeout(type, 1800);
        return;
      }
    } else {
      typed.textContent = current.substring(0, charIdx - 1);
      charIdx--;
      if (charIdx === 0) {
        deleting = false;
        idx = (idx + 1) % texts.length;
      }
    }
    setTimeout(type, deleting ? 50 : 80);
  }
  setTimeout(type, 1000);
})();

/* ── 스크롤 트리거 애니메이션 ── */
var observer = new IntersectionObserver(function(entries) {
  entries.forEach(function(entry) {
    if (entry.isIntersecting) {
      entry.target.classList.add('visible');
    }
  });
}, { threshold: 0.15 });

document.querySelectorAll('.feature-card, .role-card, .pipe-step').forEach(function(el, i) {
  el.style.transitionDelay = (i * 0.08) + 's';
  observer.observe(el);
});

/* ── 숫자 카운터 애니메이션 ── */
var countObserver = new IntersectionObserver(function(entries) {
  entries.forEach(function(entry) {
    if (!entry.isIntersecting) return;
    var el = entry.target;
    var target = parseInt(el.getAttribute('data-target'));
    var duration = 1500;
    var step = target / (duration / 16);
    var current = 0;
    var timer = setInterval(function() {
      current = Math.min(current + step, target);
      el.textContent = Math.floor(current);
      if (current >= target) clearInterval(timer);
    }, 16);
    countObserver.unobserve(el);
  });
}, { threshold: 0.5 });

document.querySelectorAll('.count').forEach(function(el) {
  countObserver.observe(el);
});
</script>
</body>
</html>