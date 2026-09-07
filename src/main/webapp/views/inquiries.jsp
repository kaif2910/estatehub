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
<span class="font-headline-sm text-headline-sm text-primary tracking-tight">EstateHub Inquiries</span>
</div>
<nav class="hidden xl:flex items-center gap-gutter-xs bg-surface-container-low p-1.5 rounded-xl">
<a class="px-3 py-2 rounded-lg font-label-md text-label-md text-on-surface-variant hover:text-on-surface hover:bg-surface-container-high transition-all" href="${pageContext.request.contextPath}/">Home</a>
</nav>
</div></header>
<main class="w-full pt-20 bg-surface min-h-[calc(100vh-140px)]">
<div class="max-w-[1280px] mx-auto px-gutter-lg py-gutter-xl">
<h1 class="font-headline-xl text-headline-xl text-on-surface tracking-tight mb-4">Leads & Inquiries</h1>
<div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
<c:forEach items="${inquiries}" var="inq">
<div class="bg-surface-container-lowest rounded-2xl p-5 shadow-sm hover:shadow-md transition-all">
<div class="flex flex-col gap-3">
<div class="flex items-start gap-3">
<div class="w-12 h-12 rounded-full bg-primary-container text-on-primary flex items-center justify-center font-headline-sm text-headline-sm">
${inq.customerName.substring(0,2).toUpperCase()}
</div>
<div class="flex flex-col">
<span class="font-headline-sm text-headline-sm text-on-surface">${inq.customerName}</span>
<span class="font-body-sm text-caption text-on-surface-variant">${inq.customerPhone} | ${inq.customerEmail}</span>
<span class="bg-secondary-fixed text-on-secondary-fixed font-label-sm text-caption px-2 py-0.5 rounded-full font-bold mt-1 w-max">${inq.status}</span>
</div>
</div>
<div class="bg-surface-container-low rounded-xl p-3">
<span class="font-label-md text-label-md text-on-surface truncate block">Property: ${inq.propertyTitle}</span>
</div>
<p class="font-body-sm text-body-sm text-on-surface-variant bg-surface rounded-lg p-2.5 italic">"${inq.message}"</p>
<div class="font-caption text-caption text-on-surface-variant text-right">Received: ${inq.createdAt}</div>
</div>
</div>
</c:forEach>
<c:if test="${empty inquiries}">
<div class="col-span-full p-8 text-center bg-surface-container-lowest rounded-xl shadow-sm text-on-surface-variant">
No inquiries found.
</div>
</c:if>
</div>
</div>
</main>
</body>
</html>
