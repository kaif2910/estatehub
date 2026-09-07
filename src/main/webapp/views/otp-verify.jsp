<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8"/>
<meta content="width=device-width, initial-scale=1.0" name="viewport"/>
<link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" rel="stylesheet"/>
<link href="https://fonts.googleapis.com" rel="preconnect"/>
<link crossorigin="" href="https://fonts.gstatic.com" rel="preconnect"/>
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600&family=Plus+Jakarta+Sans:wght@600;700;800&display=swap" rel="stylesheet"/>
<link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&display=swap" rel="stylesheet"/>
<style>@layer base{html,body{margin:0;padding:0;}body{overscroll-behavior:none;}main>:first-child{margin-top:0!important;}main>:last-child{margin-bottom:0!important;}}::-webkit-scrollbar{display:none;}</style>
<script src="https://cdn.tailwindcss.com"></script>
<script id="tailwind-config">tailwind.config = { darkMode: "class", theme: { extend: { "colors": { "surface-variant": "#dfe2ec", "surface-dim": "#d7dae3", "error-container": "#ffdad6", "secondary": "#b52330", "on-error-container": "#93000a", "on-primary": "#ffffff", "on-tertiary": "#ffffff", "error": "#ba1a1a", "on-primary-container": "#cca0ff", "secondary-container": "#ff5a5f", "surface": "#f9f9ff", "outline": "#7d7483", "on-secondary": "#ffffff", "inverse-on-surface": "#eef0fa", "on-surface-variant": "#4b4452", "surface-bright": "#f9f9ff", "secondary-fixed-dim": "#ffb3b0", "on-tertiary-container": "#36ca9b", "surface-container-lowest": "#ffffff", "on-background": "#181c23", "surface-container-high": "#e5e8f2", "background": "#f9f9ff", "on-secondary-fixed-variant": "#92001b", "primary": "#450081", "on-secondary-fixed": "#410007", "tertiary-fixed": "#71fac8", "surface-container-low": "#f1f3fd", "on-primary-fixed-variant": "#5f259e", "inverse-surface": "#2d3138", "on-secondary-container": "#60000e", "on-tertiary-fixed-variant": "#00513b", "tertiary-fixed-dim": "#50ddad", "on-primary-fixed": "#2a0053", "primary-fixed-dim": "#dab9ff", "outline-variant": "#cec3d4", "primary-container": "#5e239d", "surface-tint": "#7841b8", "primary-fixed": "#eedbff", "tertiary": "#003727", "secondary-fixed": "#ffdad8", "on-surface": "#181c23", "tertiary-container": "#00503a", "inverse-primary": "#dab9ff", "surface-container": "#ebeef7", "on-tertiary-fixed": "#002116", "on-error": "#ffffff", "surface-container-highest": "#dfe2ec" }, "borderRadius": { "DEFAULT": "0.25rem", "lg": "0.5rem", "xl": "0.75rem", "full": "9999px" }, "spacing": { "gutter-lg": "1.5rem", "gutter-md": "1rem", "gutter-xl": "2rem", "search-bar-height": "4rem", "gutter-2xl": "3rem", "gutter-xs": "0.25rem", "gutter-sm": "0.5rem", "container-max": "1280px" }, "fontFamily": { "body-sm": [ "Inter" ], "headline-xl": [ "Plus Jakarta Sans" ], "label-sm": [ "Plus Jakarta Sans" ], "display-hero-mobile": [ "Plus Jakarta Sans" ], "headline-sm": [ "Plus Jakarta Sans" ], "caption": [ "Inter" ], "label-md": [ "Plus Jakarta Sans" ], "headline-lg": [ "Plus Jakarta Sans" ], "headline-xl-mobile": [ "Plus Jakarta Sans" ], "body-lg": [ "Inter" ], "headline-md": [ "Plus Jakarta Sans" ], "body-md": [ "Inter" ], "display-hero": [ "Plus Jakarta Sans" ] }, "fontSize": { "body-sm": [ "12px", { "lineHeight": "18px", "letterSpacing": "0.005em", "fontWeight": "400" } ], "headline-xl": [ "32px", { "lineHeight": "40px", "letterSpacing": "-0.02em", "fontWeight": "700" } ], "label-sm": [ "12px", { "lineHeight": "16px", "letterSpacing": "0.02em", "fontWeight": "600" } ], "display-hero-mobile": [ "30px", { "lineHeight": "38px", "letterSpacing": "-0.02em", "fontWeight": "800" } ], "headline-sm": [ "16px", { "lineHeight": "24px", "letterSpacing": "0", "fontWeight": "600" } ], "caption": [ "11px", { "lineHeight": "14px", "letterSpacing": "0.02em", "fontWeight": "500" } ], "label-md": [ "14px", { "lineHeight": "20px", "letterSpacing": "0.01em", "fontWeight": "600" } ], "headline-lg": [ "24px", { "lineHeight": "32px", "letterSpacing": "-0.015em", "fontWeight": "700" } ], "headline-xl-mobile": [ "24px", { "lineHeight": "32px", "letterSpacing": "-0.015em", "fontWeight": "700" } ], "body-lg": [ "16px", { "lineHeight": "26px", "letterSpacing": "-0.005em", "fontWeight": "400" } ], "headline-md": [ "20px", { "lineHeight": "28px", "letterSpacing": "-0.01em", "fontWeight": "600" } ], "body-md": [ "14px", { "lineHeight": "22px", "letterSpacing": "0", "fontWeight": "400" } ], "display-hero": [ "44px", { "lineHeight": "54px", "letterSpacing": "-0.025em", "fontWeight": "800" } ] } } } };</script>
</head>
<body class="bg-surface font-body-md text-body-md text-on-surface min-h-screen flex flex-col justify-between antialiased selection:bg-primary-fixed selection:text-on-primary-fixed">
<header class="fixed top-0 w-full z-50 bg-surface/80 backdrop-blur-xl shadow-[0_1px_8px_rgba(0,0,0,0.04)]">
<div class="h-16 max-w-[1280px] mx-auto px-gutter-lg flex items-center justify-between">
<div class="flex items-center gap-gutter-sm">
<img alt="Brand logo" class="h-8 w-auto object-contain" src="https://lh3.googleusercontent.com/aida/AEtjO1Xg4rP1x__tmUvhhUEeM-xIYBlSjyhgL-aDvDihhuMxD0bc_kL9kHorsRYR5EvM9wdONnfScP46YL0QssDo1Yzd9XXTo1GpuWC9c1SGhoiGFmbBZZ-L95_tHf_7u7-NnrWpEVNDa3KKfH1MN1eMtrk2ZiwZGYM9sKA4zxHHA9vupb767aMCr2J7zivaAtyK3ypPdo3ZJ1n88WJ1YI5TA-loMe151e9ACRfxjid8X1QrA8mUitrWMg5qDMA"/>
<span class="font-headline-sm text-headline-sm text-primary tracking-tight">EstateHub</span>
</div>
<nav class="flex items-center gap-gutter-lg" data-active-classes="text-primary font-bold">
<a class="font-label-md text-label-md text-on-surface-variant hover:text-on-surface transition-colors" data-path="explore" href="${pageContext.request.contextPath}/search">Explore Properties</a>
<a class="font-label-md text-label-md text-on-surface-variant hover:text-on-surface transition-colors" data-path="help" href="#">Need Help?</a>
</nav>
<div class="flex items-center gap-gutter-md">
<c:choose>
    <c:when test="${not empty sessionScope.currentUser}">
        <div class="flex items-center gap-2">
            <span class="font-label-md text-on-surface-variant">${sessionScope.currentUser.name}</span>
            <a href="${pageContext.request.contextPath}/logout" class="font-label-md text-primary hover:underline">Logout</a>
        </div>
    </c:when>
    <c:otherwise>
        <div class="flex items-center gap-2">
            <a href="${pageContext.request.contextPath}/views/login.jsp" class="font-label-md text-primary">Login</a>
            <a href="${pageContext.request.contextPath}/views/register.jsp" class="font-label-md text-primary">Register</a>
        </div>
    </c:otherwise>
</c:choose>
<div class="w-8 h-8 rounded-full bg-primary flex items-center justify-center"><span class="material-symbols-outlined text-on-primary text-[18px]">person</span></div>
</div>
</div>
</header>
<main class="w-full flex-1 pt-16 bg-surface flex flex-col justify-center items-center px-gutter-md py-gutter-xl">
<div class="flex flex-col w-full items-center justify-center py-gutter-xl px-gutter-sm relative overflow-hidden">
<div class="absolute -top-32 -left-20 w-96 h-96 bg-primary-fixed/20 rounded-full blur-3xl pointer-events-none"></div>
<div class="absolute -bottom-24 -right-20 w-96 h-96 bg-secondary-fixed/20 rounded-full blur-3xl pointer-events-none"></div>
<div class="w-full max-w-[480px] bg-surface-container-lowest rounded-xl shadow-2xl p-gutter-xl relative z-10 flex flex-col items-center">
<div class="relative mb-gutter-md flex items-center justify-center">
<div class="w-16 h-16 rounded-full bg-surface-container-low flex items-center justify-center shadow-inner">
<span class="material-symbols-outlined text-primary-container text-[32px]">mark_email_read</span>
</div>
<div class="absolute -bottom-1 -right-1 w-7 h-7 rounded-full bg-tertiary-container flex items-center justify-center shadow-md">
<span class="material-symbols-outlined text-on-tertiary text-[16px]" style="font-variation-settings: 'FILL' 1;">verified_user</span>
</div>
</div>
<h1 class="font-headline-xl text-headline-xl text-on-surface text-center tracking-tight mb-2">
      Verify Email Address
    </h1>
<p class="font-body-md text-body-md text-on-surface-variant text-center max-w-sm">
      Enter the 6-digit OTP verification code sent to
    </p>
<div class="mt-2 mb-gutter-lg flex items-center gap-2 px-3 py-1.5 rounded-full bg-surface-container-low shadow-sm">
<span class="font-headline-sm text-headline-sm text-on-surface tracking-wide">
        <c:choose>
            <c:when test="${not empty sessionScope.pendingOtpEmail}">${sessionScope.pendingOtpEmail}</c:when>
            <c:when test="${not empty sessionScope.pendingAdminEmail}">${sessionScope.pendingAdminEmail}</c:when>
            <c:otherwise>${sessionScope.otpEmail}</c:otherwise>
        </c:choose>
      </span>
<button class="flex items-center text-primary-container hover:text-primary transition-colors p-0.5 rounded-full" title="Edit email" type="button">
<span class="material-symbols-outlined text-[18px]">edit</span>
</button>
</div>
<c:if test="${not empty errorMessage}">
    <div class="p-3 mb-2 rounded-lg bg-error-container text-on-error-container font-label-md text-label-md flex items-center gap-2 w-full justify-center">
        <span class="material-symbols-outlined text-[18px]">error</span>
        ${errorMessage}
    </div>
</c:if>
<c:if test="${not empty sessionScope.errorMessage}">
    <div class="p-3 mb-2 rounded-lg bg-error-container text-on-error-container font-label-md text-label-md flex items-center gap-2 w-full justify-center">
        <span class="material-symbols-outlined text-[18px]">error</span>
        ${sessionScope.errorMessage}
        <c:remove var="errorMessage" scope="session"/>
    </div>
</c:if>
<c:if test="${not empty sessionScope.successMessage}">
    <div class="p-3 mb-2 rounded-lg bg-green-100 text-green-800 font-label-md text-label-md flex items-center gap-2 w-full justify-center">
        <span class="material-symbols-outlined text-[18px]">check_circle</span>
        ${sessionScope.successMessage}
        <c:remove var="successMessage" scope="session"/>
    </div>
</c:if>
<form class="w-full flex flex-col items-center" id="otp-form" action="${pageContext.request.contextPath}/verify-otp" method="POST">
<input type="hidden" name="email" value="${not empty sessionScope.pendingOtpEmail ? sessionScope.pendingOtpEmail : sessionScope.otpEmail}" />
<!-- Use a single input for simplicity with the backend, hide the digit boxes or adapt them -->
<!-- We'll adapt it to standard single input for robustness, styled to match the look or keep the 6 boxes and combine them on submit -->
<input type="text" name="otpCode" class="w-full h-14 text-center font-headline-xl text-headline-xl text-on-surface bg-surface-container-lowest rounded-lg shadow-md transition-all outline-none ring-2 ring-primary-container mb-gutter-md" placeholder="Enter 6-digit OTP" maxlength="6" required />

<div class="w-full flex items-center justify-between py-2 px-3 rounded-lg bg-surface-container-low mb-gutter-md">
<div class="flex items-center gap-2">
<span class="relative flex h-2.5 w-2.5">
<span class="animate-ping absolute inline-flex h-full w-full rounded-full bg-tertiary-container opacity-75"></span>
<span class="relative inline-flex rounded-full h-2.5 w-2.5 bg-tertiary-container"></span>
</span>
<span class="font-caption text-caption text-on-surface-variant font-medium">Verification Code Sent via Email</span>
</div>
<div class="flex items-center gap-1 text-tertiary-container">
<span class="material-symbols-outlined text-[15px]" style="font-variation-settings: 'FILL' 1;">lock</span>
<span class="font-caption text-caption font-semibold">Gmail 2FA Secured</span>
</div>
</div>
<div class="w-full flex flex-col gap-gutter-sm mb-gutter-lg">
<div class="flex items-center justify-between text-on-surface-variant">
<span class="font-body-sm text-body-sm flex items-center gap-1">
<span class="material-symbols-outlined text-[16px]">schedule</span>
            Resend code in
          </span>
<div class="flex items-center gap-1.5 bg-surface-container px-2.5 py-0.5 rounded-full">
<svg class="w-3.5 h-3.5 text-primary-container transform -rotate-90" viewbox="0 0 36 36">
<path class="text-surface-variant" d="M18 2.0845 a 15.9155 15.9155 0 0 1 0 31.831 a 15.9155 15.9155 0 0 1 0 -31.831" fill="none" stroke="currentColor" stroke-width="4"></path>
<path class="text-primary-container" d="M18 2.0845 a 15.9155 15.9155 0 0 1 0 31.831 a 15.9155 15.9155 0 0 1 0 -31.831" fill="none" stroke="currentColor" stroke-dasharray="70, 100" stroke-linecap="round" stroke-width="4"></path>
</svg>
<span class="font-label-sm text-label-sm font-bold text-primary-container tracking-wider" id="countdown-timer">00:42</span>
</div>
</div>
<form action="${pageContext.request.contextPath}/verify-otp" method="POST" class="w-full">
  <input type="hidden" name="resend" value="true"/>
  <button class="w-full py-2.5 px-3 rounded-lg bg-surface-container-high text-outline font-label-md text-label-md cursor-not-allowed flex items-center justify-center gap-1.5 transition-colors" disabled="" id="resend-email-btn" type="submit">
    <span class="material-symbols-outlined text-[18px]">mark_email_unread</span>
    <span>Resend Email OTP</span>
  </button>
</form>
</div>
<button class="w-full py-3.5 px-gutter-lg bg-primary-container hover:bg-primary text-on-primary font-label-md text-label-md rounded-lg shadow-lg hover:shadow-xl transition-all flex items-center justify-center gap-2 group" type="submit">
<span>Verify &amp; Continue</span>
<span class="material-symbols-outlined text-[20px] group-hover:translate-x-1 transition-transform">arrow_forward</span>
</button>
<div class="mt-gutter-md flex items-center justify-center gap-4 text-center">
<a class="font-label-sm text-label-sm text-primary-container hover:underline transition-all" href="${pageContext.request.contextPath}/views/login.jsp">
          Try password login instead
        </a>
<span class="text-outline-variant font-caption text-caption">•</span>
<a class="font-label-sm text-label-sm text-on-surface-variant hover:text-on-surface transition-colors" href="${pageContext.request.contextPath}/views/register.jsp">
          Change email address
        </a>
</div>
</form>
<div class="w-full mt-gutter-xl pt-gutter-md bg-surface-container-low rounded-lg p-3 flex items-start gap-2.5 shadow-sm">
<span class="material-symbols-outlined text-outline text-[20px] mt-0.5">info</span>
<div class="flex flex-col">
<span class="font-label-sm text-label-sm text-on-surface font-semibold">Didn't receive the code?</span>
<p class="font-body-sm text-body-sm text-on-surface-variant mt-0.5">
          Please check your Gmail inbox / Spam folder or click <strong>Resend Email OTP</strong> once the timer finishes.
        </p>
</div>
</div>
</div>
<div class="mt-gutter-lg flex items-center gap-6 text-on-surface-variant font-caption text-caption">
<div class="flex items-center gap-1.5">
<span class="material-symbols-outlined text-[16px] text-tertiary-container">verified</span>
<span>100% Verified Listings</span>
</div>
<div class="flex items-center gap-1.5">
<span class="material-symbols-outlined text-[16px] text-tertiary-container">shield</span>
<span>RBI &amp; RERA Regulated Flow</span>
</div>
</div>
<script>
    (function() {
      const timerElement = document.getElementById('countdown-timer');
      const resendBtn = document.getElementById('resend-email-btn');
      let timeLeft = 42;

      const interval = setInterval(() => {
        timeLeft--;
        if (timeLeft <= 0) {
          clearInterval(interval);
          if (timerElement) timerElement.textContent = '00:00';
          if (resendBtn) {
            resendBtn.removeAttribute('disabled');
            resendBtn.classList.remove('bg-surface-container-high', 'text-outline', 'cursor-not-allowed');
            resendBtn.classList.add('bg-primary-container', 'text-on-primary', 'hover:bg-primary', 'cursor-pointer');
          }
        } else {
          const formatted = timeLeft < 10 ? '0' + timeLeft : timeLeft;
          if (timerElement) timerElement.textContent = '00:' + formatted;
        }
      }, 1000);
    })();
  </script>
</div>
</main>
<footer class="w-full bg-surface-container-low shadow-[0_1px_8px_rgba(0,0,0,0.04)]">
<div class="max-w-[1280px] mx-auto px-gutter-lg py-gutter-lg flex flex-col md:flex-row items-center justify-between gap-gutter-sm">
<div class="flex flex-col items-center md:items-start gap-1">
<p class="font-caption text-caption text-on-surface-variant">© 2024 EstateHub Technologies Pvt. Ltd. All rights reserved.</p>
<p class="font-caption text-caption text-on-surface-variant">MahaRERA Registration No: A51900001234 | Available on maharera.mahaonline.gov.in</p>
</div>
<div class="flex items-center gap-gutter-lg">
<a class="font-caption text-caption text-on-surface-variant hover:text-on-surface transition-colors" data-path="terms-of-service" href="#">Terms of Service</a>
<a class="font-caption text-caption text-on-surface-variant hover:text-on-surface transition-colors" data-path="privacy-policy" href="#">Privacy Policy</a>
<a class="font-caption text-caption text-on-surface-variant hover:text-on-surface transition-colors" data-path="support" href="#">Support</a>
</div>
</div>
</footer>
</body>
</html>
