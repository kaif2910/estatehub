<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<c:if test="${param.fromDraft == 'true'}">
    <c:set var="redirectAfterLogin" value="${pageContext.request.contextPath}/property/crud" scope="session"/>
</c:if>
<c:if test="${not empty sessionScope.currentUser}">
    <c:choose>
        <c:when test="${sessionScope.currentUser.role == 'ADMIN'}">
            <c:redirect url="/admin/dashboard"/>
        </c:when>
        <c:when test="${sessionScope.currentUser.role == 'SELLER'}">
            <c:redirect url="/seller/dashboard"/>
        </c:when>
        <c:when test="${sessionScope.currentUser.role == 'BROKER'}">
            <c:redirect url="/broker/dashboard"/>
        </c:when>
        <c:otherwise>
            <c:redirect url="/customer/dashboard"/>
        </c:otherwise>
    </c:choose>
</c:if>
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
<div class="flex flex-col w-full items-center justify-center py-gutter-xl relative">
<div class="absolute -top-12 -left-16 w-80 h-80 rounded-full bg-primary-fixed-dim/30 blur-3xl pointer-events-none"></div>
<div class="absolute -bottom-16 -right-16 w-96 h-96 rounded-full bg-secondary-fixed/40 blur-3xl pointer-events-none"></div>
<div class="relative w-full max-w-[480px] bg-surface-container-lowest rounded-xl shadow-xl p-gutter-xl flex flex-col gap-gutter-lg">
<div class="flex flex-col items-center text-center gap-gutter-xs">
<div class="w-12 h-12 rounded-xl bg-primary-container/10 flex items-center justify-center text-primary-container mb-gutter-xs">
<span class="material-symbols-outlined text-[28px]" style="font-variation-settings: 'FILL' 1;">apartment</span>
</div>
<h1 class="font-headline-lg text-headline-lg text-on-surface">Welcome Back to EstateHub</h1>
<p class="font-body-sm text-body-sm text-on-surface-variant max-w-[380px]">
        Enter your credentials to access your buyer dashboard, shortlist, and saved searches.
      </p>
</div>
<c:if test="${not empty errorMessage}">
    <div class="p-3 mb-2 rounded-lg bg-error-container text-on-error-container font-label-md text-label-md flex items-center gap-2">
        <span class="material-symbols-outlined text-[18px]">error</span>
        ${errorMessage}
    </div>
</c:if>
<c:if test="${not empty sessionScope.errorMessage}">
    <div class="p-3 mb-2 rounded-lg bg-error-container text-on-error-container font-label-md text-label-md flex items-center gap-2">
        <span class="material-symbols-outlined text-[18px]">error</span>
        ${sessionScope.errorMessage}
        <c:remove var="errorMessage" scope="session"/>
    </div>
</c:if>
<c:if test="${not empty sessionScope.successMessage}">
    <div class="p-3 mb-2 rounded-lg bg-green-100 text-green-800 font-label-md text-label-md flex items-center gap-2">
        <span class="material-symbols-outlined text-[18px]">check_circle</span>
        ${sessionScope.successMessage}
        <c:remove var="successMessage" scope="session"/>
    </div>
</c:if>
<form class="flex flex-col gap-gutter-md mt-4" id="login-form" action="${pageContext.request.contextPath}/login" method="POST">
<div class="flex flex-col gap-1.5">
<label class="font-label-md text-label-md text-on-surface" for="identifier-input">Email Address</label>
<div class="relative flex items-center rounded-lg bg-surface-container-low transition-colors duration-150 focus-within:bg-surface-container-lowest focus-within:shadow-md">
<div class="pl-3.5 pr-2 py-3 flex items-center gap-1 text-on-surface-variant font-label-md text-label-md border-none select-none">
<span class="material-symbols-outlined text-[20px]">mail</span>
<span class="text-outline-variant">|</span>
</div>
<input class="w-full py-3 pr-3.5 bg-transparent font-body-md text-body-md text-on-surface placeholder:text-on-surface-variant/60 focus:outline-none" id="identifier-input" name="email" placeholder="name@domain.com" required="" type="email"/>
</div>
</div>
<div class="flex flex-col gap-1.5" id="password-group">
<div class="flex items-center justify-between">
<label class="font-label-md text-label-md text-on-surface" for="password-input">Password</label>
<a class="font-label-sm text-label-sm text-primary-container hover:underline font-semibold" data-path="forgot-password" href="${pageContext.request.contextPath}/views/forgot-password.jsp">
            Forgot Password?
          </a>
</div>
<div class="relative flex items-center rounded-lg bg-surface-container-low transition-colors duration-150 focus-within:bg-surface-container-lowest focus-within:shadow-md">
<span class="material-symbols-outlined text-on-surface-variant pl-3.5 text-[20px]">lock_open</span>
<input class="w-full py-3 pl-2.5 pr-10 bg-transparent font-body-md text-body-md text-on-surface placeholder:text-on-surface-variant/60 focus:outline-none" id="password-input" name="password" placeholder="Enter your account password" type="password"/>
<button aria-label="Toggle password visibility" class="absolute right-3 text-on-surface-variant hover:text-on-surface flex items-center justify-center p-1 rounded transition-colors" id="toggle-password-visibility" type="button">
<span class="material-symbols-outlined text-[20px]" id="eye-icon">visibility</span>
</button>
</div>
</div>
<div class="hidden flex-col gap-1.5" id="otp-hint-group">
<p class="font-body-sm text-body-sm text-on-surface-variant bg-surface-container-low p-3 rounded-lg flex items-center gap-2">
<span class="material-symbols-outlined text-tertiary-container text-[20px]">verified</span>
          We will send a 6-digit verification code to this phone number via SMS.
        </p>
</div>
<div class="flex items-center justify-between mt-1">
<label class="flex items-center gap-2 cursor-pointer select-none">
<input checked="" class="w-4 h-4 rounded text-primary-container accent-primary-container cursor-pointer" type="checkbox"/>
<span class="font-body-sm text-body-sm text-on-surface-variant">Remember this device for 30 days</span>
</label>
</div>
<button class="w-full mt-2 py-3.5 px-6 rounded-lg bg-primary-container hover:bg-primary text-on-primary font-label-md text-label-md transition-all duration-200 flex items-center justify-center gap-2 shadow-md hover:shadow-lg active:scale-[0.99]" id="submit-button" type="submit">
<span id="submit-button-text">Sign In to EstateHub</span>
<span class="material-symbols-outlined text-[18px]">arrow_forward</span>
</button>
</form>
<div class="relative flex items-center justify-center my-1">
<div class="w-full h-px bg-surface-variant"></div>
<span class="absolute px-3 bg-surface-container-lowest font-caption text-caption uppercase tracking-wider text-on-surface-variant font-semibold">
        Or Continue With
      </span>
</div>
<div class="flex flex-col gap-2.5">
<button class="w-full py-3 px-4 rounded-lg bg-surface-container-low hover:bg-surface-container text-on-surface font-label-md text-label-md transition-colors flex items-center justify-center gap-3" type="button">
<svg class="w-5 h-5" viewbox="0 0 24 24">
<path d="M23.745 12.27c0-.7-.06-1.4-.19-2.07H12v4.51h6.6c-.29 1.52-1.14 2.82-2.4 3.68v3.05h3.88c2.27-2.09 3.665-5.17 3.665-9.17Z" fill="#4285F4"></path>
<path d="M12 24c3.24 0 5.95-1.08 7.93-2.91l-3.88-3.05c-1.08.72-2.45 1.16-4.05 1.16-3.12 0-5.77-2.1-6.72-4.93H1.25v3.15C3.26 21.36 7.33 24 12 24Z" fill="#34A853"></path>
<path d="M5.28 14.27c-.25-.72-.38-1.49-.38-2.27s.14-1.55.38-2.27V6.58H1.25C.45 8.16 0 9.94 0 12s.45 3.84 1.25 5.42l4.03-3.15Z" fill="#FBBC05"></path>
<path d="M12 4.75c1.77 0 3.35.61 4.6 1.8l3.42-3.42C17.95 1.19 15.24 0 12 0 7.33 0 3.26 2.64 1.25 6.58l4.03 3.15c.95-2.83 3.6-4.98 6.72-4.98Z" fill="#EA4335"></path>
</svg>
<span>Continue with Google</span>
</button>
<button class="w-full py-3 px-4 rounded-lg bg-tertiary-container/10 hover:bg-tertiary-container/15 text-tertiary font-label-md text-label-md transition-colors flex items-center justify-between px-4" type="button">
<div class="flex items-center gap-2.5">
<svg class="w-5 h-5 fill-current text-tertiary-container" viewbox="0 0 24 24">
<path d="M12.04 2c-5.46 0-9.91 4.45-9.91 9.91 0 1.75.46 3.45 1.32 4.95L2.05 22l5.25-1.38c1.45.79 3.08 1.21 4.74 1.21 5.46 0 9.91-4.45 9.91-9.91 0-2.65-1.03-5.14-2.9-7.01A9.82 9.82 0 0 0 12.04 2m.01 1.67c2.2 0 4.26.86 5.82 2.42a8.23 8.23 0 0 1 2.41 5.83c0 4.54-3.7 8.24-8.24 8.24-1.48 0-2.93-.4-4.2-1.15l-.3-.18-3.12.82.83-3.04-.2-.31a8.19 8.19 0 0 1-1.26-4.38c0-4.54 3.7-8.24 8.24-8.24m4.52 11.66c-.25-.13-1.47-.72-1.7-.81-.23-.08-.39-.13-.56.13-.17.25-.64.81-.79.97-.14.17-.29.19-.54.06-.25-.13-1.06-.39-2.02-1.24-.74-.66-1.24-1.48-1.39-1.73-.14-.25-.02-.39.11-.51.11-.11.25-.29.37-.43.13-.15.17-.25.25-.42.08-.17.04-.31-.02-.44-.06-.13-.56-1.34-.76-1.84-.2-.49-.4-.42-.56-.43h-.48c-.16 0-.43.06-.66.31-.22.25-.86.84-.86 2.06s.88 2.39 1 2.56c.13.17 1.73 2.64 4.19 3.7.59.25 1.04.4 1.4.52.59.19 1.13.16 1.56.1.47-.07 1.47-.6 1.68-1.18.21-.58.21-1.08.15-1.18-.06-.1-.23-.16-.48-.28Z"></path>
</svg>
<span class="font-semibold text-on-surface">Login via WhatsApp</span>
</div>
<span class="px-2 py-0.5 rounded-full bg-tertiary-container text-on-tertiary font-label-sm text-[11px] font-bold tracking-wide flex items-center gap-1">
<span class="material-symbols-outlined text-[13px]">bolt</span> Instant OTP
        </span>
</button>
</div>
<div class="text-center pt-2">
<p class="font-body-sm text-body-sm text-on-surface-variant">
        Don't have an EstateHub account? 
        <a class="font-label-md text-label-md text-primary-container font-semibold hover:underline" data-path="register" href="${pageContext.request.contextPath}/views/register.jsp">
          Register as Buyer or Seller
        </a>
</p>
</div>
<div class="pt-4 mt-1 border-none bg-surface-container-low -mx-gutter-xl -mb-gutter-xl px-gutter-xl py-3.5 rounded-b-xl flex items-center justify-around">
<div class="flex items-center gap-1.5 text-on-surface-variant">
<span class="material-symbols-outlined text-[17px] text-tertiary-container" style="font-variation-settings: 'FILL' 1;">verified</span>
<span class="font-caption text-caption font-semibold">100% RERA Verified</span>
</div>
<div class="w-1 h-1 rounded-full bg-outline-variant"></div>
<div class="flex items-center gap-1.5 text-on-surface-variant">
<span class="material-symbols-outlined text-[17px] text-secondary-container" style="font-variation-settings: 'FILL' 1;">shield</span>
<span class="font-caption text-caption font-semibold">Zero Spam</span>
</div>
<div class="w-1 h-1 rounded-full bg-outline-variant"></div>
<div class="flex items-center gap-1.5 text-on-surface-variant">
<span class="material-symbols-outlined text-[17px] text-primary-container" style="font-variation-settings: 'FILL' 1;">lock</span>
<span class="font-caption text-caption font-semibold">256-bit SSL</span>
</div>
</div>
</div>
</div>
<script>
  (function() {
    const tabPassword = document.getElementById('tab-password');
    const tabOtp = document.getElementById('tab-otp');
    const passwordGroup = document.getElementById('password-group');
    const otpHintGroup = document.getElementById('otp-hint-group');
    const submitBtnText = document.getElementById('submit-button-text');
    const togglePassBtn = document.getElementById('toggle-password-visibility');
    const passInput = document.getElementById('password-input');
    const eyeIcon = document.getElementById('eye-icon');

    function switchTab(mode) {
      if (mode === 'password') {
        tabPassword.classList.add('bg-primary-container', 'text-on-primary', 'shadow-sm');
        tabPassword.classList.remove('text-on-surface-variant');
        tabOtp.classList.remove('bg-primary-container', 'text-on-primary', 'shadow-sm');
        tabOtp.classList.add('text-on-surface-variant');
        
        passwordGroup.classList.remove('hidden');
        otpHintGroup.classList.add('hidden');
        submitBtnText.textContent = 'Sign In to EstateHub';
      } else {
        tabOtp.classList.add('bg-primary-container', 'text-on-primary', 'shadow-sm');
        tabOtp.classList.remove('text-on-surface-variant');
        tabPassword.classList.remove('bg-primary-container', 'text-on-primary', 'shadow-sm');
        tabPassword.classList.add('text-on-surface-variant');
        
        passwordGroup.classList.add('hidden');
        otpHintGroup.classList.remove('hidden');
        otpHintGroup.classList.add('flex');
        submitBtnText.textContent = 'Get OTP via SMS';
      }
    }

    if (tabPassword) tabPassword.addEventListener('click', () => switchTab('password'));
    if (tabOtp) tabOtp.addEventListener('click', () => switchTab('otp'));

    if (togglePassBtn) {
      togglePassBtn.addEventListener('click', () => {
        const isPassword = passInput.getAttribute('type') === 'password';
        passInput.setAttribute('type', isPassword ? 'text' : 'password');
        if (eyeIcon) eyeIcon.textContent = isPassword ? 'visibility_off' : 'visibility';
      });
    }
  })();
</script></main>
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
