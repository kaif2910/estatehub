<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<c:if test="${param.fromDraft == 'true'}">
    <c:set var="redirectAfterLogin" value="${pageContext.request.contextPath}/property/crud" scope="session"/>
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
<div class="flex flex-col w-full items-center justify-center py-gutter-md">
<!-- Subtle Ambient Glow Orbs behind main module -->
<div class="relative w-full max-w-[580px] flex flex-col items-center">
<div class="absolute -top-10 -left-12 w-64 h-64 bg-primary-fixed/40 rounded-full blur-3xl pointer-events-none -z-10"></div>
<div class="absolute -bottom-10 -right-10 w-72 h-72 bg-tertiary-fixed/30 rounded-full blur-3xl pointer-events-none -z-10"></div>
<!-- Centered Floating Registration Card -->
<div class="w-full bg-surface-container-lowest rounded-xl shadow-[0_12px_40px_rgba(30,34,41,0.08)] p-gutter-lg md:p-gutter-xl flex flex-col gap-gutter-md">
<!-- Top Badging & Header -->
<div class="flex flex-col items-center text-center gap-gutter-xs">
<div class="inline-flex items-center gap-1.5 px-3 py-1 rounded-full bg-tertiary-container/10 text-on-tertiary-container font-label-sm text-label-sm">
<span class="material-symbols-outlined text-[16px]" style="font-variation-settings: 'FILL' 1;">verified</span>
<span>RERA Certified Platform</span>
</div>
<h1 class="font-headline-lg text-headline-lg text-on-surface tracking-tight mt-1">Create Your EstateHub Account</h1>
<p class="font-body-sm text-body-sm text-on-surface-variant max-w-[420px]">
          Join India's trusted network of verified home buyers, verified sellers, and certified brokers.
        </p>
</div>
<c:if test="${not empty sessionScope.errorMessage}">
    <div class="p-3 mb-2 rounded-lg bg-error-container text-on-error-container font-label-md text-label-md flex items-center gap-2">
        <span class="material-symbols-outlined text-[18px]">error</span>
        ${sessionScope.errorMessage}
    </div>
</c:if>
<!-- Segmented Role Selector -->
<div class="flex flex-col gap-1.5 mt-2">
<span class="font-label-sm text-label-sm text-on-surface-variant font-medium">I am registering as</span>
<div class="grid grid-cols-3 gap-2 p-1.5 bg-surface-container rounded-lg" id="roleSelectorGroup">
<!-- Role 1: Buyer/Tenant -->
<button class="role-tab flex flex-col items-center text-center p-2.5 rounded-md bg-surface-container-lowest text-primary shadow-sm transition-all duration-200 cursor-pointer" data-role="BUYER" type="button">
<span class="material-symbols-outlined text-[22px] mb-0.5" style="font-variation-settings: 'FILL' 1;">home</span>
<span class="font-label-sm text-label-sm font-bold">Buyer / Tenant</span>
<span class="font-caption text-caption text-on-surface-variant">Search &amp; save</span>
</button>
<!-- Role 2: Seller -->
<button class="role-tab flex flex-col items-center text-center p-2.5 rounded-md text-on-surface-variant hover:text-on-surface transition-all duration-200 cursor-pointer" data-role="SELLER" type="button">
<span class="material-symbols-outlined text-[22px] mb-0.5">real_estate_agent</span>
<span class="font-label-sm text-label-sm font-bold">Direct Owner</span>
<span class="font-caption text-caption text-on-surface-variant">Zero brokerage</span>
</button>
<!-- Role 3: Broker -->
<button class="role-tab flex flex-col items-center text-center p-2.5 rounded-md text-on-surface-variant hover:text-on-surface transition-all duration-200 cursor-pointer" data-role="BROKER" type="button">
<span class="material-symbols-outlined text-[22px] mb-0.5">badge</span>
<span class="font-label-sm text-label-sm font-bold">RERA Broker</span>
<span class="font-caption text-caption text-on-surface-variant">Partner desk</span>
</button>
</div>
</div>
<!-- Dynamic Role Note Banner -->
<div class="p-2.5 px-3 rounded-lg bg-surface-container-low flex items-center gap-2" id="roleContextNote">
<span class="material-symbols-outlined text-primary text-[18px]">verified_user</span>
<span class="font-body-sm text-body-sm text-on-surface" id="roleContextText">
          Get zero-spam property viewings and free high-accuracy EMI estimates.
        </span>
</div>
<!-- Onboarding Form -->
<form class="flex flex-col gap-3.5" id="registrationForm" action="${pageContext.request.contextPath}/register" method="POST">
<input type="hidden" name="role" id="selectedRole" value="BUYER" />
<!-- Full Legal Name -->
<div class="flex flex-col gap-1">
<label class="font-label-sm text-label-sm text-on-surface" for="fullName">Full Legal Name</label>
<div class="relative flex items-center">
<span class="material-symbols-outlined absolute left-3 text-on-surface-variant text-[20px] pointer-events-none">person</span>
<input class="w-full h-11 pl-10 pr-3 rounded-lg bg-surface-container-low text-on-surface font-body-md text-body-md placeholder:text-on-surface-variant/60 focus:bg-surface-container-lowest focus:outline-none focus:ring-2 focus:ring-primary/20 transition-all" id="fullName" name="name" placeholder="e.g. Vikram Malhotra" required="" type="text"/>
</div>
</div>
<!-- Mobile Number with Flag Prefix -->
<div class="flex flex-col gap-1">
<div class="flex justify-between items-center">
<label class="font-label-sm text-label-sm text-on-surface" for="mobileNumber">Mobile Number</label>
<span class="font-caption text-caption text-outline flex items-center gap-1 font-medium">
<span class="material-symbols-outlined text-[14px]">chat</span>
              WhatsApp Contact Number
            </span>
</div>
<div class="flex items-center gap-2">
<div class="h-11 px-3 bg-surface-container-low rounded-lg flex items-center gap-1.5 text-on-surface font-label-md text-label-md shrink-0 select-none">
<span class="text-base leading-none">🇮🇳</span>
<span>+91</span>
</div>
<div class="relative flex-1 flex items-center">
<input class="w-full h-11 px-3 rounded-lg bg-surface-container-low text-on-surface font-body-md text-body-md placeholder:text-on-surface-variant/60 focus:bg-surface-container-lowest focus:outline-none focus:ring-2 focus:ring-primary/20 transition-all" id="mobileNumber" name="phone" maxlength="10" placeholder="98765 43210 (For WhatsApp contact)" required="" type="tel"/>
<span class="material-symbols-outlined absolute right-3 text-on-tertiary-container text-[18px] opacity-0 transition-opacity" id="validPhoneIcon">check_circle</span>
</div>
</div>
</div>
<!-- Email Address -->
<div class="flex flex-col gap-1">
<div class="flex justify-between items-center">
<label class="font-label-sm text-label-sm text-on-surface" for="emailAddress">Email Address</label>
<span class="font-caption text-caption text-on-tertiary-container flex items-center gap-1 font-semibold">
<span class="w-1.5 h-1.5 rounded-full bg-on-tertiary-container inline-block"></span>
              Verification OTP sent to Email
            </span>
</div>
<div class="relative flex items-center">
<span class="material-symbols-outlined absolute left-3 text-on-surface-variant text-[20px] pointer-events-none">mail</span>
<input class="w-full h-11 pl-10 pr-3 rounded-lg bg-surface-container-low text-on-surface font-body-md text-body-md placeholder:text-on-surface-variant/60 focus:bg-surface-container-lowest focus:outline-none focus:ring-2 focus:ring-primary/20 transition-all" id="emailAddress" name="email" placeholder="vikram.malhotra@gmail.com (OTP sent here)" required="" type="email"/>
</div>
</div>
<!-- WhatsApp Number (optional, or just duplicate phone for now) -->
<input type="hidden" name="whatsapp" id="whatsappNumber" value="" />
<!-- Create Password + Real-time Strength Meter -->
<div class="flex flex-col gap-1.5">
<div class="flex justify-between items-center">
<label class="font-label-sm text-label-sm text-on-surface" for="passwordInput">Create Secure Password</label>
<span class="font-caption text-caption text-on-surface-variant" id="strengthLabel">Enter password</span>
</div>
<div class="relative flex items-center">
<span class="material-symbols-outlined absolute left-3 text-on-surface-variant text-[20px] pointer-events-none">lock</span>
<input class="w-full h-11 pl-10 pr-10 rounded-lg bg-surface-container-low text-on-surface font-body-md text-body-md placeholder:text-on-surface-variant/60 focus:bg-surface-container-lowest focus:outline-none focus:ring-2 focus:ring-primary/20 transition-all" id="passwordInput" name="password" placeholder="Min. 8 characters with numbers &amp; symbols" required="" type="password"/>
<button class="absolute right-3 text-on-surface-variant hover:text-on-surface flex items-center" id="togglePasswordBtn" type="button">
<span class="material-symbols-outlined text-[20px]" id="eyeIcon">visibility</span>
</button>
</div>
<!-- Multi-segment password strength visualizer -->
<div class="grid grid-cols-3 gap-1.5 pt-0.5">
<div class="h-1 rounded-full bg-surface-container-high transition-colors duration-300" id="bar1"></div>
<div class="h-1 rounded-full bg-surface-container-high transition-colors duration-300" id="bar2"></div>
<div class="h-1 rounded-full bg-surface-container-high transition-colors duration-300" id="bar3"></div>
</div>
<!-- Password Requirement Pills -->
<div class="flex flex-wrap items-center gap-x-3 gap-y-1 mt-0.5 font-caption text-caption text-on-surface-variant">
<span class="flex items-center gap-1 transition-colors" id="reqLength">
<span class="material-symbols-outlined text-[14px]">radio_button_unchecked</span> 8+ chars
            </span>
<span class="flex items-center gap-1 transition-colors" id="reqNum">
<span class="material-symbols-outlined text-[14px]">radio_button_unchecked</span> 1 number
            </span>
<span class="flex items-center gap-1 transition-colors" id="reqSpecial">
<span class="material-symbols-outlined text-[14px]">radio_button_unchecked</span> 1 special symbol
            </span>
</div>
</div>
<!-- Terms & WhatsApp Updates Consent Checkbox -->
<div class="flex items-start gap-2.5 pt-1">
<input class="mt-0.5 w-4 h-4 rounded text-primary focus:ring-primary accent-primary cursor-pointer" id="termsConsent" required="" type="checkbox"/>
<label class="font-body-sm text-body-sm text-on-surface-variant leading-tight select-none cursor-pointer" for="termsConsent">
            I agree to EstateHub <a class="text-primary font-semibold hover:underline" href="#">Terms of Use</a>, <a class="text-primary font-semibold hover:underline" href="#">Privacy Policy</a>, and consent to receive RERA compliance &amp; verified property updates via WhatsApp.
          </label>
</div>
<!-- Primary Action CTA Button -->
<button class="w-full h-12 mt-2 rounded-lg bg-primary-container hover:bg-primary text-on-primary font-label-md text-label-md flex items-center justify-center gap-2 shadow-md hover:shadow-lg transition-all transform active:scale-[0.99] cursor-pointer" id="submitBtn" type="submit">
<span class="material-symbols-outlined text-[20px]">lock_open</span>
<span>Create Account &amp; Verify OTP</span>
</button>
<!-- Alternative Google Single Sign-On -->
<div class="relative flex py-1 items-center">
<div class="flex-grow h-px bg-surface-container-high"></div>
<span class="flex-shrink mx-3 text-on-surface-variant font-caption text-caption uppercase tracking-wider">or sign up using</span>
<div class="flex-grow h-px bg-surface-container-high"></div>
</div>
<button class="w-full h-11 rounded-lg bg-surface-container-low hover:bg-surface-container text-on-surface font-label-md text-label-md flex items-center justify-center gap-3 transition-colors cursor-pointer" type="button">
<!-- Google Icon SVG -->
<svg class="w-4 h-4" fill="none" viewbox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
<path d="M22.56 12.25c0-.78-.07-1.53-.2-2.25H12v4.26h5.92c-.26 1.37-1.04 2.53-2.21 3.31v2.77h3.57c2.08-1.92 3.28-4.74 3.28-8.09z" fill="#4285F4"></path>
<path d="M12 23c2.97 0 5.46-.98 7.28-2.66l-3.57-2.77c-.98.66-2.23 1.06-3.71 1.06-2.86 0-5.29-1.93-6.16-4.53H2.18v2.84C3.99 20.53 7.7 23 12 23z" fill="#34A853"></path>
<path d="M5.84 14.09c-.22-.66-.35-1.36-.35-2.09s.13-1.43.35-2.09V7.06H2.18C1.43 8.55 1 10.22 1 12s.43 3.45 1.18 4.94l2.85-2.22.81-.63z" fill="#FBBC05"></path>
<path d="M12 5.38c1.62 0 3.06.56 4.21 1.64l3.15-3.15C17.45 2.09 14.97 1 12 1 7.7 1 3.99 3.47 2.18 7.06l3.66 2.84c.87-2.6 3.3-4.52 6.16-4.52z" fill="#EA4335"></path>
</svg>
<span>Continue with Google</span>
</button>
</form>
<!-- Bottom Log-In Anchor -->
<div class="text-center pt-1">
<span class="font-body-sm text-body-sm text-on-surface-variant">Already have an EstateHub account? </span>
<a class="font-label-md text-label-md text-primary font-bold hover:underline" href="${pageContext.request.contextPath}/views/login.jsp">Log In</a>
</div>
<!-- Trust Assurance Strip -->
<div class="mt-1 p-3 rounded-lg bg-surface-container flex items-start gap-2.5">
<span class="material-symbols-outlined text-on-tertiary-container text-[20px] shrink-0 mt-0.5" style="font-variation-settings: 'FILL' 1;">security</span>
<p class="font-caption text-caption text-on-surface-variant leading-normal">
<strong class="text-on-surface font-medium">100% Privacy Guarantee:</strong> Your contact credentials are encrypted under MahaRERA compliance rules. We never sell contacts or distribute phone numbers to unverified aggregators.
        </p>
</div>
</div>
<!-- Verified Stats Micro-Bar below card -->
<div class="mt-4 flex items-center justify-center gap-6 text-on-surface-variant font-caption text-caption">
<span class="flex items-center gap-1">
<span class="material-symbols-outlined text-[16px] text-tertiary-container">verified</span>
        Over 45,000+ Verified Listings
      </span>
<span class="inline-block w-1 h-1 rounded-full bg-surface-variant"></span>
<span class="flex items-center gap-1">
<span class="material-symbols-outlined text-[16px] text-tertiary-container">support_agent</span>
        24/7 Home Concierge Support
      </span>
</div>
</div>
</div>
<script>
  (function() {
    // Role Selector Tabs Behavior
    const roleTabs = document.querySelectorAll('.role-tab');
    const roleNoteText = document.getElementById('roleContextText');
    const roleInput = document.getElementById('selectedRole');
    const phoneInput = document.getElementById('mobileNumber');
    const waInput = document.getElementById('whatsappNumber');

    const roleData = {
      BUYER: "Get zero-spam property viewings and free high-accuracy EMI estimates.",
      SELLER: "Post up to 2 properties completely free with guaranteed zero-brokerage buyers.",
      BROKER: "MahaRERA Agent License will be verified post signup for instant builder inventory access."
    };

    roleTabs.forEach(tab => {
      tab.addEventListener('click', () => {
        // Reset styles
        roleTabs.forEach(t => {
          t.classList.remove('bg-surface-container-lowest', 'text-primary', 'shadow-sm');
          t.classList.add('text-on-surface-variant');
        });
        // Activate current
        tab.classList.add('bg-surface-container-lowest', 'text-primary', 'shadow-sm');
        tab.classList.remove('text-on-surface-variant');

        // Dynamic text & hidden input update
        const role = tab.getAttribute('data-role');
        if (roleData[role] && roleNoteText) {
          roleNoteText.textContent = roleData[role];
          roleInput.value = role;
        }
      });
    });

    if(phoneInput && waInput){
        phoneInput.addEventListener('input', () => {
            waInput.value = phoneInput.value;
        });
    }

    // Toggle Password Visibility
    const pwdInput = document.getElementById('passwordInput');
    const toggleBtn = document.getElementById('togglePasswordBtn');
    const eyeIcon = document.getElementById('eyeIcon');

    if (toggleBtn && pwdInput) {
      toggleBtn.addEventListener('click', () => {
        const isPwd = pwdInput.type === 'password';
        pwdInput.type = isPwd ? 'text' : 'password';
        eyeIcon.textContent = isPwd ? 'visibility_off' : 'visibility';
      });
    }

    // Password Real-Time Strength Meter
    const bar1 = document.getElementById('bar1');
    const bar2 = document.getElementById('bar2');
    const bar3 = document.getElementById('bar3');
    const strengthLabel = document.getElementById('strengthLabel');
    const reqLength = document.getElementById('reqLength');
    const reqNum = document.getElementById('reqNum');
    const reqSpecial = document.getElementById('reqSpecial');

    if (pwdInput) {
      pwdInput.addEventListener('input', (e) => {
        const val = e.target.value;
        const hasLen = val.length >= 8;
        const hasNum = /\d/.test(val);
        const hasSpec = /[!@#$%^&*(),.?":{}|<>]/.test(val);

        // Update pills
        updatePill(reqLength, hasLen);
        updatePill(reqNum, hasNum);
        updatePill(reqSpecial, hasSpec);

        let score = 0;
        if (hasLen) score++;
        if (hasNum) score++;
        if (hasSpec) score++;

        // Reset bars
        bar1.className = 'h-1 rounded-full bg-surface-container-high transition-colors duration-300';
        bar2.className = 'h-1 rounded-full bg-surface-container-high transition-colors duration-300';
        bar3.className = 'h-1 rounded-full bg-surface-container-high transition-colors duration-300';

        if (val.length === 0) {
          strengthLabel.textContent = "Enter password";
          strengthLabel.className = "font-caption text-caption text-on-surface-variant";
          return;
        }

        if (score === 1) {
          bar1.className = 'h-1 rounded-full bg-error transition-colors duration-300';
          strengthLabel.textContent = "Weak";
          strengthLabel.className = "font-caption text-caption text-error font-semibold";
        } else if (score === 2) {
          bar1.className = 'h-1 rounded-full bg-secondary-container transition-colors duration-300';
          bar2.className = 'h-1 rounded-full bg-secondary-container transition-colors duration-300';
          strengthLabel.textContent = "Good";
          strengthLabel.className = "font-caption text-caption text-secondary font-semibold";
        } else if (score === 3) {
          bar1.className = 'h-1 rounded-full bg-on-tertiary-container transition-colors duration-300';
          bar2.className = 'h-1 rounded-full bg-on-tertiary-container transition-colors duration-300';
          bar3.className = 'h-1 rounded-full bg-on-tertiary-container transition-colors duration-300';
          strengthLabel.textContent = "Strong";
          strengthLabel.className = "font-caption text-caption text-on-tertiary-container font-semibold";
        }
      });
    }

    function updatePill(el, isValid) {
      const icon = el.querySelector('.material-symbols-outlined');
      if (isValid) {
        el.classList.add('text-on-tertiary-container', 'font-medium');
        el.classList.remove('text-on-surface-variant');
        icon.textContent = 'check_circle';
      } else {
        el.classList.remove('text-on-tertiary-container', 'font-medium');
        el.classList.add('text-on-surface-variant');
        icon.textContent = 'radio_button_unchecked';
      }
    }

    // Phone format & check mark
    const validPhoneIcon = document.getElementById('validPhoneIcon');
    if (phoneInput && validPhoneIcon) {
      phoneInput.addEventListener('input', (e) => {
        e.target.value = e.target.value.replace(/[^0-9]/g, '');
        if (e.target.value.length === 10) {
          validPhoneIcon.classList.remove('opacity-0');
          validPhoneIcon.classList.add('opacity-100');
        } else {
          validPhoneIcon.classList.add('opacity-0');
          validPhoneIcon.classList.remove('opacity-100');
        }
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
