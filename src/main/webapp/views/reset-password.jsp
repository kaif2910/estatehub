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
<div class="flex flex-col w-full items-center justify-center py-gutter-md">
<div class="relative w-full max-w-[500px] flex flex-col items-center">
<div class="absolute -top-12 -left-12 w-64 h-64 bg-primary-fixed opacity-40 rounded-full blur-3xl pointer-events-none"></div>
<div class="absolute -bottom-8 -right-8 w-56 h-56 bg-secondary-fixed-dim opacity-30 rounded-full blur-3xl pointer-events-none"></div>
<div class="relative w-full bg-surface-container-lowest rounded-xl shadow-[0_12px_40px_rgba(30,34,41,0.08)] p-gutter-xl flex flex-col">
<div class="flex items-center justify-between mb-gutter-lg">
<div class="inline-flex items-center justify-center w-12 h-12 rounded-xl bg-primary-fixed text-primary shadow-sm">
<span class="material-symbols-outlined text-[26px]">key</span>
</div>
<div class="inline-flex items-center gap-1.5 px-3 py-1 rounded-full bg-tertiary-container/10 text-on-tertiary-container">
<span class="material-symbols-outlined text-[14px]" style="font-variation-settings: 'FILL' 1;">verified_user</span>
<span class="font-label-sm text-caption">Secure Connection</span>
</div>
</div>
<div class="flex flex-col gap-1.5 mb-gutter-lg">
<h1 class="font-headline-lg text-headline-lg text-on-surface tracking-tight">Reset Your Password</h1>
<p class="font-body-md text-body-md text-on-surface-variant leading-relaxed">
          Enter a new strong password for your account below.
        </p>
</div>
<c:if test="${not empty sessionScope.errorMessage}">
    <div class="p-3 mb-2 rounded-lg bg-error-container text-on-error-container font-label-md text-label-md flex items-center gap-2">
        <span class="material-symbols-outlined text-[18px]">error</span>
        ${sessionScope.errorMessage}
    </div>
</c:if>
<form class="flex flex-col gap-gutter-md" id="resetForm" action="${pageContext.request.contextPath}/reset-password" method="POST">
<div class="flex flex-col gap-1.5">
<label class="font-label-md text-label-md text-on-surface flex items-center justify-between" for="otpCode">
<span>6-Digit Verification Code</span>
<span class="font-caption text-caption text-secondary-container">Required</span>
</label>
<div class="relative flex items-center">
<div class="absolute left-3.5 pointer-events-none text-on-surface-variant flex items-center justify-center">
<span class="material-symbols-outlined text-[20px]">pin</span>
</div>
<input class="w-full h-12 pl-11 pr-4 bg-surface-container-low rounded-lg font-body-md text-body-md text-on-surface placeholder:text-outline focus:bg-surface-container-lowest focus:outline-none focus:ring-2 focus:ring-primary-container transition-all" id="otpCode" name="otpCode" placeholder="Enter 6-digit OTP" required="" type="text" maxlength="6"/>
</div>
</div>
<div class="flex flex-col gap-1.5">
<label class="font-label-md text-label-md text-on-surface flex items-center justify-between" for="newPassword">
<span>New Password</span>
<span class="font-caption text-caption text-secondary-container">Required</span>
</label>
<div class="relative flex items-center">
<div class="absolute left-3.5 pointer-events-none text-on-surface-variant flex items-center justify-center">
<span class="material-symbols-outlined text-[20px]">lock</span>
</div>
<input class="w-full h-12 pl-11 pr-4 bg-surface-container-low rounded-lg font-body-md text-body-md text-on-surface placeholder:text-outline focus:bg-surface-container-lowest focus:outline-none focus:ring-2 focus:ring-primary-container transition-all" id="newPassword" name="newPassword" placeholder="Min. 8 characters" required="" type="password"/>
</div>
</div>
<div class="flex flex-col gap-1.5">
<label class="font-label-md text-label-md text-on-surface flex items-center justify-between" for="confirmPassword">
<span>Confirm Password</span>
<span class="font-caption text-caption text-secondary-container">Required</span>
</label>
<div class="relative flex items-center">
<div class="absolute left-3.5 pointer-events-none text-on-surface-variant flex items-center justify-center">
<span class="material-symbols-outlined text-[20px]">lock_reset</span>
</div>
<input class="w-full h-12 pl-11 pr-4 bg-surface-container-low rounded-lg font-body-md text-body-md text-on-surface placeholder:text-outline focus:bg-surface-container-lowest focus:outline-none focus:ring-2 focus:ring-primary-container transition-all" id="confirmPassword" name="confirmPassword" placeholder="Re-enter new password" required="" type="password"/>
</div>
</div>
<button class="group relative w-full h-12 bg-primary-container hover:bg-primary text-on-primary rounded-lg font-label-md text-label-md flex items-center justify-center gap-2 shadow-md hover:shadow-lg transition-all active:scale-[0.99] overflow-hidden mt-2" type="submit">
<span>Save New Password</span>
<span class="material-symbols-outlined text-[18px] transition-transform group-hover:translate-x-1">save</span>
</button>
</form>
<div class="mt-gutter-lg pt-gutter-md flex items-center justify-center">
<a class="inline-flex items-center gap-1.5 font-label-md text-label-md text-primary hover:text-primary-container transition-colors group" data-path="login" href="${pageContext.request.contextPath}/views/login.jsp">
<span class="material-symbols-outlined text-[18px] transition-transform group-hover:-translate-x-1">arrow_back</span>
<span>Cancel and back to Sign In</span>
</a>
</div>
</div>
</div>
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
