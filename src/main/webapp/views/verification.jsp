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
<script id="tailwind-config">tailwind.config={darkMode:"class",theme:{extend:{"colors":{"inverse-surface":"#2d3138","surface":"#f9f9ff","outline":"#7d7483","on-secondary-fixed-variant":"#92001b","on-primary-fixed":"#2a0053","on-surface":"#181c23","outline-variant":"#cec3d4","on-error":"#ffffff","on-tertiary-fixed-variant":"#00513b","surface-container-high":"#e5e8f2","surface-bright":"#f9f9ff","primary":"#450081","on-primary-container":"#cca0ff","surface-container-lowest":"#ffffff","surface-container-highest":"#dfe2ec","tertiary-fixed-dim":"#50ddad","on-tertiary-fixed":"#002116","on-secondary-container":"#60000e","surface-dim":"#d7dae3","on-primary":"#ffffff","secondary-container":"#ff5a5f","primary-fixed-dim":"#dab9ff","primary-fixed":"#eedbff","on-tertiary-container":"#36ca9b","on-primary-fixed-variant":"#5f259e","inverse-primary":"#dab9ff","background":"#f9f9ff","surface-tint":"#7841b8","error":"#ba1a1a","tertiary-fixed":"#71fac8","on-surface-variant":"#4b4452","surface-container-low":"#f1f3fd","secondary":"#b52330","primary-container":"#5e239d","secondary-fixed":"#ffdad8","on-background":"#181c23","inverse-on-surface":"#eef0fa","on-error-container":"#93000a","on-tertiary":"#ffffff","on-secondary":"#ffffff","tertiary-container":"#00503a","error-container":"#ffdad6","tertiary":"#003727","surface-container":"#ebeef7","on-secondary-fixed":"#410007","surface-variant":"#dfe2ec","secondary-fixed-dim":"#ffb3b0"},"borderRadius":{"DEFAULT":"0.25rem","lg":"0.5rem","xl":"0.75rem","full":"9999px"},"spacing":{"gutter-xl":"2rem","gutter-xs":"0.25rem","search-bar-height":"4rem","gutter-sm":"0.5rem","container-max":"1280px","gutter-2xl":"3rem","gutter-lg":"1.5rem","gutter-md":"1rem"},"fontFamily":{"body-lg":["Inter"],"label-sm":["Plus Jakarta Sans"],"headline-sm":["Plus Jakarta Sans"],"display-hero-mobile":["Plus Jakarta Sans"],"body-sm":["Inter"],"headline-xl-mobile":["Plus Jakarta Sans"],"caption":["Inter"],"headline-md":["Plus Jakarta Sans"],"label-md":["Plus Jakarta Sans"],"display-hero":["Plus Jakarta Sans"],"headline-lg":["Plus Jakarta Sans"],"body-md":["Inter"],"headline-xl":["Plus Jakarta Sans"]},"fontSize":{"body-lg":["16px",{"lineHeight":"26px","letterSpacing":"-0.005em","fontWeight":"400"}],"label-sm":["12px",{"lineHeight":"16px","letterSpacing":"0.02em","fontWeight":"600"}],"headline-sm":["16px",{"lineHeight":"24px","letterSpacing":"0","fontWeight":"600"}],"display-hero-mobile":["30px",{"lineHeight":"38px","letterSpacing":"-0.02em","fontWeight":"800"}],"body-sm":["12px",{"lineHeight":"18px","letterSpacing":"0.005em","fontWeight":"400"}],"headline-xl-mobile":["24px",{"lineHeight":"32px","letterSpacing":"-0.015em","fontWeight":"700"}],"caption":["11px",{"lineHeight":"14px","letterSpacing":"0.02em","fontWeight":"500"}],"headline-md":["20px",{"lineHeight":"28px","letterSpacing":"-0.01em","fontWeight":"600"}],"label-md":["14px",{"lineHeight":"20px","letterSpacing":"0.01em","fontWeight":"600"}],"display-hero":["44px",{"lineHeight":"54px","letterSpacing":"-0.025em","fontWeight":"800"}],"headline-lg":["24px",{"lineHeight":"32px","letterSpacing":"-0.015em","fontWeight":"700"}],"body-md":["14px",{"lineHeight":"22px","letterSpacing":"0","fontWeight":"400"}],"headline-xl":["32px",{"lineHeight":"40px","letterSpacing":"-0.02em","fontWeight":"700"}]}}}</script>
</head>
<body class="bg-surface font-body-md text-on-surface min-h-screen">
<header class="fixed top-0 left-0 right-0 w-full z-50 bg-surface-container-lowest shadow-[0_1px_8px_rgba(0,0,0,0.06)]">
<div class="h-20 max-w-[1280px] mx-auto px-gutter-lg flex items-center justify-between gap-gutter-md">
<div class="flex items-center gap-gutter-md shrink-0">
<span class="font-headline-sm text-headline-sm text-primary tracking-tight">EstateHub KYC Verification</span>
</div>
<nav class="hidden xl:flex items-center gap-gutter-xs bg-surface-container-low p-1.5 rounded-xl">
<a class="px-3 py-2 rounded-lg font-label-md text-label-md text-on-surface-variant hover:text-on-surface hover:bg-surface-container-high transition-all" href="${pageContext.request.contextPath}/">Home</a>
<a class="px-3 py-2 rounded-lg font-label-md text-label-md text-on-surface-variant hover:text-on-surface hover:bg-surface-container-high transition-all" href="${pageContext.request.contextPath}/broker/dashboard">Dashboard</a>
</nav>
</div></header>
<main class="w-full pt-20 bg-surface min-h-[calc(100vh-140px)]">
<div class="relative w-full max-w-[1280px] mx-auto px-gutter-lg pt-6 pb-16">
<div class="bg-surface-container-lowest rounded-2xl p-6 md:p-8 shadow-sm mb-8 relative overflow-hidden">
<div class="flex flex-col lg:flex-row lg:items-center justify-between gap-6 pb-6">
<div class="flex items-start sm:items-center gap-4">
<div class="w-14 h-14 rounded-2xl bg-primary/10 flex items-center justify-center shrink-0">
<span class="material-symbols-outlined text-primary text-3xl">verified_user</span>
</div>
<div>
<h1 class="font-headline-lg text-headline-lg text-on-surface">Verification Status: ${sessionScope.currentUser.verificationStatus}</h1>
<p class="font-body-sm text-body-sm text-on-surface-variant mt-1">Upload your official Broker/Agent RERA certificate to unlock full broker privileges.</p>
</div>
</div>
</div>
</div>
<div class="lg:col-span-8 flex flex-col gap-6">
<div class="bg-surface-container-lowest rounded-2xl p-6 md:p-8 shadow-sm">
<h2 class="font-headline-md text-headline-md text-on-surface mb-4">Verification Details</h2>
<form action="${pageContext.request.contextPath}/broker/verification" method="POST" enctype="multipart/form-data" class="space-y-4">
<div>
<label class="block font-label-md text-label-md text-on-surface mb-2">Business Name <span class="text-secondary font-bold">*</span></label>
<input type="text" name="businessName" required class="w-full bg-surface-container-low p-3 rounded-lg focus:outline-none"/>
</div>
<div class="grid grid-cols-1 md:grid-cols-2 gap-4">
<div>
<label class="block font-label-md text-label-md text-on-surface mb-2">License Number / RERA ID <span class="text-secondary font-bold">*</span></label>
<input type="text" name="licenseNumber" required class="w-full bg-surface-container-low p-3 rounded-lg focus:outline-none"/>
</div>
<div>
<label class="block font-label-md text-label-md text-on-surface mb-2">Tax ID / PAN / GSTIN <span class="text-secondary font-bold">*</span></label>
<input type="text" name="taxId" required class="w-full bg-surface-container-low p-3 rounded-lg focus:outline-none"/>
</div>
</div>
<div>
<label class="block font-label-md text-label-md text-on-surface mb-2">Document Type <span class="text-secondary font-bold">*</span></label>
<select name="documentType" required class="w-full bg-surface-container-low p-3 rounded-lg focus:outline-none">
    <option value="BROKER_LICENSE">Broker License / RERA ID</option>
    <option value="COMPANY_REGISTRATION">Company Registration</option>
    <option value="TAX_ID">Tax ID (PAN/GST)</option>
</select>
</div>
<div>
<label class="block font-label-md text-label-md text-on-surface mb-2">Registration Certificate (PDF/Image max 25KB) <span class="text-secondary font-bold">*</span></label>
<input type="file" name="certificate" accept=".pdf,.jpg,.png,.jpeg" required class="w-full bg-surface-container-low p-3 rounded-lg focus:outline-none"/>
</div>
<div class="flex justify-end mt-4">
<button type="submit" class="px-6 py-2.5 rounded-lg bg-primary text-on-primary hover:bg-primary-container font-label-md text-label-md transition-all flex items-center gap-2 shadow-sm">
<span>Submit for Verification</span>
<span class="material-symbols-outlined text-lg">arrow_forward</span>
</button>
</div>
</form>
</div>
</div>
</div>
</main>
</body>
</html>
