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
<img alt="Brand logo." class="h-8 w-auto object-contain" src="https://lh3.googleusercontent.com/aida/AEtjO1Xg4rP1x__tmUvhhUEeM-xIYBlSjyhgL-aDvDihhuMxD0bc_kL9kHorsRYR5EvM9wdONnfScP46YL0QssDo1Yzd9XXTo1GpuWC9c1SGhoiGFmbBZZ-L95_tHf_7u7-NnrWpEVNDa3KKfH1MN1eMtrk2ZiwZGYM9sKA4zxHHA9vupb767aMCr2J7zivaAtyK3ypPdo3ZJ1n88WJ1YI5TA-loMe151e9ACRfxjid8X1QrA8mUitrWMg5qDMA"/>
<div class="flex flex-col"><div class="flex items-center gap-gutter-xs"><span class="font-headline-sm text-headline-sm text-primary tracking-tight">EstateHub</span><span class="bg-primary-fixed text-on-primary-fixed font-label-sm text-caption px-1.5 py-0.5 rounded">PARTNER DESK</span></div><div class="flex items-center gap-1 text-on-surface-variant"><span class="material-symbols-outlined text-[12px] text-tertiary-container">location_on</span><span class="font-body-sm text-caption text-on-surface-variant">Mumbai Cluster</span></div></div></div>
<nav class="hidden xl:flex items-center gap-gutter-xs bg-surface-container-low p-1.5 rounded-xl">
<a aria-current="page" class="px-3 py-2 transition-all bg-primary-container text-on-primary font-label-md rounded-lg" href="#">Dashboard (Overview)</a>
<a class="px-3 py-2 rounded-lg font-label-md text-label-md text-on-surface-variant hover:text-on-surface hover:bg-surface-container-high transition-all" href="#">My Listings</a>
<a class="px-3 py-2 rounded-lg font-label-md text-label-md text-on-surface-variant hover:text-on-surface hover:bg-surface-container-high transition-all" href="${pageContext.request.contextPath}/views/add-property.jsp">Post New Property (+)</a>
<a class="px-3 py-2 rounded-lg font-label-md text-label-md text-on-surface-variant hover:text-on-surface hover:bg-surface-container-high transition-all" href="${pageContext.request.contextPath}/views/inquiries.jsp">Leads & Inquiries</a>
</nav>
<div class="flex items-center gap-gutter-md shrink-0">
<div class="flex items-center gap-2 pl-2"><div class="hidden md:flex flex-col text-right"><div class="flex items-center justify-end gap-1"><span class="font-label-md text-label-md text-on-surface leading-tight">${sessionScope.currentUser.name}</span><span class="material-symbols-outlined text-[16px] text-on-tertiary-container">verified</span></div><span class="font-caption text-caption text-on-surface-variant">Seller</span></div><div class="w-8 h-8 rounded-full bg-primary flex items-center justify-center"><span class="material-symbols-outlined text-on-primary text-[18px]">person</span></div></div>
<a href="${pageContext.request.contextPath}/logout" class="text-sm font-medium hover:underline text-primary">Logout</a>
</div></div></header>
<main class="w-full pt-20 bg-surface min-h-[calc(100vh-140px)]">
<div class="flex flex-col w-full">
<div class="w-full bg-gradient-to-r from-primary via-primary-container to-primary text-on-primary shadow-xl">
<div class="max-w-[1280px] mx-auto px-gutter-lg py-gutter-xl">
<div class="flex flex-col lg:flex-row lg:items-center lg:justify-between gap-gutter-lg">
<div class="flex items-start sm:items-center gap-5">
<div class="relative shrink-0"><div class="w-20 h-20 rounded-2xl bg-surface-container-lowest p-1 shadow-lg"><div class="w-full h-full rounded-xl bg-primary-fixed flex items-center justify-center text-primary font-headline-lg text-headline-lg font-bold">
 ${sessionScope.currentUser.name.substring(0,2)}
</div></div></div>
<div class="flex flex-col gap-1.5"><div class="flex flex-wrap items-center gap-2"><span class="font-headline-xl text-headline-xl text-on-primary font-extrabold tracking-tight">Seller Dashboard</span><span class="text-on-primary/60 font-body-md text-body-md">•</span><span class="font-headline-md text-headline-md text-primary-fixed font-semibold">${sessionScope.currentUser.name}</span></div></div>
</div>
<div class="flex flex-wrap items-center gap-3 shrink-0 pt-2 lg:pt-0">
<a href="${pageContext.request.contextPath}/views/add-property.jsp" class="inline-flex items-center gap-2 bg-secondary-container hover:bg-secondary text-on-secondary px-5 py-3 rounded-lg font-label-md text-label-md font-bold shadow-md transition-all">
<span class="material-symbols-outlined text-[20px]">add_circle</span><span>Post New Property (+)</span></a>
</div></div></div></div>
<div class="max-w-[1280px] w-full mx-auto px-gutter-lg py-gutter-xl flex flex-col gap-gutter-xl">
<div class="grid grid-cols-1 sm:grid-cols-2 xl:grid-cols-4 gap-gutter-md">
<div class="bg-surface-container-lowest rounded-xl p-5 shadow-sm hover:shadow-md transition-shadow relative overflow-hidden flex flex-col justify-between">
<div class="flex items-start justify-between"><div><span class="font-label-sm text-label-sm font-semibold uppercase tracking-wider text-on-surface-variant">Active Inventory</span><div class="flex items-baseline gap-2 mt-1"><span class="font-headline-xl text-headline-xl font-extrabold text-on-surface">${totalProperties != null ? totalProperties : 0}</span></div></div><div class="w-12 h-12 rounded-xl bg-primary-fixed flex items-center justify-center text-primary"><span class="material-symbols-outlined text-2xl">apartment</span></div></div>
</div>
<div class="bg-surface-container-lowest rounded-xl p-5 shadow-sm hover:shadow-md transition-shadow relative overflow-hidden flex flex-col justify-between">
<div class="flex items-start justify-between"><div><span class="font-label-sm text-label-sm font-semibold uppercase tracking-wider text-on-surface-variant">Total Inquiries</span><div class="flex items-baseline gap-2 mt-1"><span class="font-headline-xl text-headline-xl font-extrabold text-on-surface">${totalInquiries != null ? totalInquiries : 0}</span></div></div><div class="w-12 h-12 rounded-xl bg-secondary-fixed flex items-center justify-center text-secondary"><span class="material-symbols-outlined text-2xl">forum</span></div></div>
</div>
</div>
<div class="grid grid-cols-1 lg:grid-cols-12 gap-gutter-xl items-start">
<div class="lg:col-span-8 flex flex-col gap-gutter-md">
<div class="bg-surface-container-lowest rounded-xl shadow-sm overflow-hidden flex flex-col">
<div class="hidden md:grid grid-cols-12 gap-4 px-6 py-3.5 bg-surface-container-low text-caption font-label-sm uppercase tracking-wider text-on-surface-variant font-bold">
<div class="col-span-5">Property & Configuration</div><div class="col-span-2">Listed Value</div><div class="col-span-2">Verification</div><div class="col-span-2 text-center">Views</div><div class="col-span-1 text-right">Action</div>
</div>
<c:forEach items="${properties}" var="p">
<div class="p-5 md:px-6 md:py-4 hover:bg-surface-container-low/60 transition-colors border-b-0 flex flex-col md:grid md:grid-cols-12 gap-4 items-center border-b border-surface-variant">
<div class="col-span-5 w-full flex items-center gap-3.5"><div class="w-20 h-16 rounded-lg overflow-hidden shrink-0 relative"><img class="w-full h-full object-cover" src="${p.primaryImageUrl != null ? p.primaryImageUrl : 'https://placehold.co/150x150?text=No+Image'}"/><span class="absolute bottom-1 right-1 bg-inverse-surface/80 text-inverse-on-surface text-[9px] px-1 rounded font-bold">${p.bedrooms} BHK</span></div><div class="flex flex-col min-w-0"><span class="font-label-md text-label-md font-bold text-on-surface truncate">${p.title}</span><span class="font-body-sm text-body-sm text-on-surface-variant truncate">${p.location}, ${p.city}</span><span class="font-caption text-caption text-primary font-medium mt-0.5">${p.purpose}</span></div></div>
<div class="col-span-2 w-full flex md:flex-col justify-between md:justify-center"><span class="font-label-md text-label-md font-extrabold text-on-surface">₹${p.price}</span></div>
<div class="col-span-2 w-full flex md:flex-col justify-between md:justify-center"><span class="inline-flex items-center gap-1 text-on-tertiary-container font-label-sm text-label-sm font-bold"><span class="material-symbols-outlined text-[16px] text-tertiary-fixed-dim">verified</span>${p.verificationStatus}</span><span class="font-caption text-caption text-on-surface-variant">${p.propertyStatus}</span></div>
<div class="col-span-2 w-full flex md:flex-col items-center justify-between md:justify-center"><span class="font-caption text-caption text-on-surface-variant">${p.viewCount} Views</span></div>
<div class="col-span-1 w-full flex items-center justify-end gap-1">
<a href="${pageContext.request.contextPath}/property/crud?action=edit&id=${p.propertyId}" class="p-1.5 rounded-lg text-primary hover:bg-primary-fixed transition-colors" title="Edit"><span class="material-symbols-outlined text-[18px]">edit</span></a>
<form action="${pageContext.request.contextPath}/property/crud" method="POST" style="display:inline;" onsubmit="return confirm('Are you sure you want to delete this property?');">
<input type="hidden" name="action" value="delete"/>
<input type="hidden" name="propertyId" value="${p.propertyId}"/>
<button type="submit" class="p-1.5 rounded-lg text-error hover:bg-error-container transition-colors" title="Delete"><span class="material-symbols-outlined text-[18px]">delete</span></button>
</form>
</div></div>
</c:forEach>
</div>
</div>
</div>
</div></div></main>
<footer class="w-full bg-surface-container-lowest shadow-[0_-1px_8px_rgba(0,0,0,0.03)] py-gutter-xl"><div class="max-w-[1280px] mx-auto px-gutter-lg flex flex-col md:flex-row items-center justify-between gap-gutter-md"><div class="flex flex-col sm:flex-row items-center gap-gutter-sm text-center sm:text-left"><div class="flex items-center gap-2"><span class="material-symbols-outlined text-primary text-xl">support_agent</span><span class="font-label-md text-label-md text-on-surface font-bold">EstateHub Broker Care Desk:</span></div><a class="font-label-md text-label-md text-primary hover:underline" href="tel:18002008899">1800-200-8899 (Mon-Sat, 9AM - 8PM)</a><span class="hidden sm:inline text-outline-variant">•</span><a class="font-body-sm text-body-sm text-on-surface-variant hover:text-on-surface" href="mailto:partners@estatehub.in">partners@estatehub.in</a></div></div></footer></body></html>
