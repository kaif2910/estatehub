<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ taglib uri="jakarta.tags.functions" prefix="fn" %>
<!DOCTYPE html>

<html lang="en"><head><meta charset="utf-8"/><meta content="width=device-width, initial-scale=1.0" name="viewport"/><title>EstateHub</title><link href="https://fonts.googleapis.com" rel="preconnect"/><link crossorigin="" href="https://fonts.gstatic.com" rel="preconnect"/><link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&amp;family=Plus+Jakarta+Sans:wght@600;700;800&amp;display=swap" rel="stylesheet"/><link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" rel="stylesheet"/>
<link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&amp;display=swap" rel="stylesheet"/><style>@layer base { html, body { margin: 0; padding: 0; } body { overscroll-behavior: none; } main > :first-child { margin-top: 0 !important; } main > :last-child { margin-bottom: 0 !important; } } ::-webkit-scrollbar { display: none; }</style><script src="https://cdn.tailwindcss.com"></script><script id="tailwind-config">tailwind.config = { darkMode: "class", theme: { extend: { "colors": { "on-tertiary-fixed-variant": "#00513b", "on-primary": "#ffffff", "outline": "#7d7483", "surface-bright": "#f9f9ff", "surface-dim": "#d7dae3", "surface-container-high": "#e5e8f2", "tertiary-fixed": "#71fac8", "surface-container-lowest": "#ffffff", "outline-variant": "#cec3d4", "on-primary-fixed": "#2a0053", "background": "#f9f9ff", "secondary-container": "#ff5a5f", "on-background": "#181c23", "secondary-fixed": "#ffdad8", "error": "#ba1a1a", "on-tertiary": "#ffffff", "primary": "#450081", "surface-container-low": "#f1f3fd", "on-primary-fixed-variant": "#5f259e", "surface-container-highest": "#dfe2ec", "tertiary-fixed-dim": "#50ddad", "secondary": "#b52330", "secondary-fixed-dim": "#ffb3b0", "primary-fixed": "#eedbff", "on-secondary-container": "#60000e", "on-secondary-fixed-variant": "#92001b", "on-secondary-fixed": "#410007", "inverse-surface": "#2d3138", "on-surface": "#181c23", "on-error-container": "#93000a", "surface-container": "#ebeef7", "surface-tint": "#7841b8", "primary-container": "#5e239d", "on-tertiary-fixed": "#002116", "on-secondary": "#ffffff", "on-tertiary-container": "#36ca9b", "on-primary-container": "#cca0ff", "inverse-on-surface": "#eef0fa", "tertiary-container": "#00503a", "error-container": "#ffdad6", "surface-variant": "#dfe2ec", "tertiary": "#003727", "on-surface-variant": "#4b4452", "on-error": "#ffffff", "surface": "#f9f9ff", "inverse-primary": "#dab9ff", "primary-fixed-dim": "#dab9ff" }, "borderRadius": { "DEFAULT": "0.25rem", "lg": "0.5rem", "xl": "0.75rem", "full": "9999px" }, "spacing": { "container-max": "1280px", "gutter-sm": "0.5rem", "search-bar-height": "4rem", "gutter-xs": "0.25rem", "gutter-2xl": "3rem", "gutter-lg": "1.5rem", "gutter-md": "1rem", "gutter-xl": "2rem" }, "fontFamily": { "caption": [ "Inter" ], "body-sm": [ "Inter" ], "label-md": [ "Plus Jakarta Sans" ], "headline-xl-mobile": [ "Plus Jakarta Sans" ], "headline-lg": [ "Plus Jakarta Sans" ], "body-lg": [ "Inter" ], "body-md": [ "Inter" ], "headline-xl": [ "Plus Jakarta Sans" ], "headline-sm": [ "Plus Jakarta Sans" ], "display-hero-mobile": [ "Plus Jakarta Sans" ], "headline-md": [ "Plus Jakarta Sans" ], "display-hero": [ "Plus Jakarta Sans" ], "label-sm": [ "Plus Jakarta Sans" ] }, "fontSize": { "caption": [ "11px", { "lineHeight": "14px", "letterSpacing": "0.02em", "fontWeight": "500" } ], "body-sm": [ "12px", { "lineHeight": "18px", "letterSpacing": "0.005em", "fontWeight": "400" } ], "label-md": [ "14px", { "lineHeight": "20px", "letterSpacing": "0.01em", "fontWeight": "600" } ], "headline-xl-mobile": [ "24px", { "lineHeight": "32px", "letterSpacing": "-0.015em", "fontWeight": "700" } ], "headline-lg": [ "24px", { "lineHeight": "32px", "letterSpacing": "-0.015em", "fontWeight": "700" } ], "body-lg": [ "16px", { "lineHeight": "26px", "letterSpacing": "-0.005em", "fontWeight": "400" } ], "body-md": [ "14px", { "lineHeight": "22px", "letterSpacing": "0", "fontWeight": "400" } ], "headline-xl": [ "32px", { "lineHeight": "40px", "letterSpacing": "-0.02em", "fontWeight": "700" } ], "headline-sm": [ "16px", { "lineHeight": "24px", "letterSpacing": "0", "fontWeight": "600" } ], "display-hero-mobile": [ "30px", { "lineHeight": "38px", "letterSpacing": "-0.02em", "fontWeight": "800" } ], "headline-md": [ "20px", { "lineHeight": "28px", "letterSpacing": "-0.01em", "fontWeight": "600" } ], "display-hero": [ "44px", { "lineHeight": "54px", "letterSpacing": "-0.025em", "fontWeight": "800" } ], "label-sm": [ "12px", { "lineHeight": "16px", "letterSpacing": "0.02em", "fontWeight": "600" } ] } } } };</script></head><body class="bg-background font-body-md text-on-surface antialiased min-h-screen flex flex-col"><header class="sticky top-0 z-50 w-full bg-surface-container-lowest shadow-[0_2px_12px_rgba(0,0,0,0.06)]">
<div class="h-16 max-w-container-max mx-auto px-gutter-lg flex items-center justify-between gap-gutter-md">
<div class="flex items-center gap-gutter-lg">
<a class="flex items-center gap-gutter-xs" data-path="explore-homes" href="${pageContext.request.contextPath}/">
<img alt="EstateHub Logo" class="h-8 w-auto object-contain" src="https://lh3.googleusercontent.com/aida/AEtjO1Xg4rP1x__tmUvhhUEeM-xIYBlSjyhgL-aDvDihhuMxD0bc_kL9kHorsRYR5EvM9wdONnfScP46YL0QssDo1Yzd9XXTo1GpuWC9c1SGhoiGFmbBZZ-L95_tHf_7u7-NnrWpEVNDa3KKfH1MN1eMtrk2ZiwZGYM9sKA4zxHHA9vupb767aMCr2J7zivaAtyK3ypPdo3ZJ1n88WJ1YI5TA-loMe151e9ACRfxjid8X1QrA8mUitrWMg5qDMA"/>
<span class="font-headline-md text-headline-md text-primary-container tracking-tight">EstateHub</span>
</a>
<div class="hidden sm:flex items-center gap-gutter-xs px-3 py-1.5 rounded-lg bg-surface-container-low hover:bg-surface-container transition-colors cursor-pointer">
<span class="material-symbols-outlined text-primary text-[18px]">location_on</span>
<span class="font-label-sm text-label-sm text-on-surface font-semibold">Mumbai</span>
<span class="material-symbols-outlined text-on-surface-variant text-[16px]">expand_more</span>
</div>
</div>
<nav class="hidden lg:flex items-center gap-gutter-lg" data-active-classes="text-primary-container font-semibold">
<a aria-current="page" class="transition-colors text-primary-container font-semibold" data-path="buy-properties" href="${pageContext.request.contextPath}/search?purpose=Buy">Buy</a>
<a class="font-label-md text-label-md text-on-surface-variant hover:text-on-surface transition-colors" data-path="rent-properties" href="${pageContext.request.contextPath}/search?purpose=Rent">Rent</a>
<c:if test="${sessionScope.currentUser != null && sessionScope.currentUser.role == 'ADMIN'}">
<a class="font-label-md text-label-md text-on-surface-variant hover:text-on-surface transition-colors" href="${pageContext.request.contextPath}/admin/properties">Admin Properties</a>
<a class="font-label-md text-label-md text-on-surface-variant hover:text-on-surface transition-colors" href="${pageContext.request.contextPath}/admin/users">Admin Users</a>
</c:if>
</nav>
<div class="flex items-center gap-gutter-md">
<c:choose>
<c:when test="${sessionScope.currentUser == null}">
<a class="font-label-sm text-label-sm text-primary-container font-medium" href="${pageContext.request.contextPath}/login">Login</a>
<a class="bg-primary-container hover:bg-primary text-on-primary px-3.5 py-1.5 rounded-lg font-label-sm text-label-sm font-semibold transition-all" href="${pageContext.request.contextPath}/register">Register</a>
</c:when>
<c:otherwise>
<a class="relative flex items-center justify-center p-2 rounded-full hover:bg-surface-container-low text-on-surface-variant hover:text-secondary-container transition-colors" data-path="saved-properties" href="${pageContext.request.contextPath}/favorites">
<span class="material-symbols-outlined text-[22px]">favorite</span>
<span class="absolute top-1 right-1 flex h-4 w-4 items-center justify-center rounded-full bg-secondary-container text-on-secondary font-caption text-[10px] font-bold"><c:out value="${fn:length(favorites)}"/></span>
</a>
<a class="flex items-center gap-2 bg-primary-container hover:bg-primary text-on-primary px-3.5 py-1.5 rounded-lg shadow-sm transition-all" data-path="post-property" href="${pageContext.request.contextPath}/property/crud">
<span class="font-label-sm text-label-sm font-semibold">Post Property</span>
</a>
<div class="flex items-center gap-2 pl-gutter-xs cursor-pointer">
<div class="w-8 h-8 rounded-full bg-primary flex items-center justify-center">
<span class="material-symbols-outlined text-on-primary text-[18px]">person</span>
</div>
<div class="hidden md:flex flex-col">
<span class="font-label-sm text-label-sm text-on-surface font-medium">${sessionScope.currentUser.name}</span>
<a href="${pageContext.request.contextPath}/logout" class="font-caption text-caption text-secondary hover:underline">Logout</a>
</div>
</div>
</c:otherwise>
</c:choose>
</div>
</div>
</header><main class="flex-1 w-full bg-surface"><div class="flex flex-col w-full">
<!-- Profile Sub-Navigation Header -->
<section class="w-full bg-surface-container-lowest shadow-sm">
<div class="max-w-container-max mx-auto px-gutter-lg py-gutter-md">
<div class="flex flex-col md:flex-row md:items-center justify-between gap-gutter-md">
<!-- User Profile Tag -->
<div class="flex items-center gap-gutter-md">
<div class="relative">
<div class="w-14 h-14 rounded-full bg-primary-container text-on-primary flex items-center justify-center font-headline-md text-headline-md shadow-sm">
              VM
            </div>
<span class="absolute bottom-0 right-0 w-4 h-4 bg-tertiary-container rounded-full ring-2 ring-surface-container-lowest flex items-center justify-center">
<span class="material-symbols-outlined text-tertiary-fixed text-[11px]" style="font-variation-settings: 'FILL' 1;">verified</span>
</span>
</div>
<div>
<div class="flex items-center gap-2">
<h1 class="font-headline-md text-headline-md text-on-surface">Vikram Malhotra</h1>
<span class="px-2.5 py-0.5 rounded-full bg-primary-fixed text-on-primary-fixed font-caption text-caption">PREMIUM BUYER</span>
</div>
<p class="font-body-sm text-body-sm text-on-surface-variant flex items-center gap-1.5 mt-0.5">
<span class="material-symbols-outlined text-[15px] text-tertiary-container">location_on</span>
              Targeting: Andheri, Powai, Chembur • Pre-approved Loan: ₹2.8 Cr
            </p>
</div>
</div>
<!-- Dashboard Action Micro-metrics -->
<div class="flex items-center gap-gutter-sm self-start md:self-auto">
<div class="px-3.5 py-2 rounded-xl bg-surface-container-low text-left">
<span class="font-caption text-caption text-on-surface-variant block">Analyzed Homes</span>
<span class="font-headline-sm text-headline-sm text-primary font-bold">1,420+</span>
</div>
<div class="px-3.5 py-2 rounded-xl bg-surface-container-low text-left">
<span class="font-caption text-caption text-on-surface-variant block">Top Matches</span>
<span class="font-headline-sm text-headline-sm text-secondary-container font-bold">18 Ready</span>
</div>
</div>
</div>
<!-- Navigation Tab Rails -->
<div class="flex items-center gap-gutter-sm mt-gutter-md overflow-x-auto no-scrollbar">
<a class="px-4 py-2 rounded-lg font-label-md text-label-md text-on-surface-variant hover:bg-surface-container-low transition-colors whitespace-nowrap" data-path="dashboard" href="javascript:void(0)">
          Dashboard
        </a>
<a class="px-4 py-2 rounded-lg font-label-md text-label-md text-on-surface-variant hover:bg-surface-container-low transition-colors whitespace-nowrap flex items-center gap-1.5" data-path="saved-properties" href="javascript:void(0)">
<span>Favorites</span>
<span class="w-5 h-5 rounded-full bg-surface-container-high text-on-surface text-[11px] font-bold flex items-center justify-center">6</span>
</a>
<a class="px-4 py-2 rounded-lg font-label-md text-label-md bg-primary-container text-on-primary shadow-sm whitespace-nowrap flex items-center gap-1.5" data-path="ai-recommendations" href="javascript:void(0)">
<span class="material-symbols-outlined text-[17px]">auto_awesome</span>
<span>AI Recommendations (Active)</span>
</a>
<a class="px-4 py-2 rounded-lg font-label-md text-label-md text-on-surface-variant hover:bg-surface-container-low transition-colors whitespace-nowrap" data-path="property-preferences" href="javascript:void(0)">
          Property Preferences
        </a>
</div>
</div>
</section>
<!-- Main Portal Content -->
<div class="max-w-container-max mx-auto px-gutter-lg py-gutter-xl w-full">
<!-- Match Engine Hero Banner -->
<section class="relative overflow-hidden rounded-2xl bg-gradient-to-r from-primary via-primary-container to-on-primary-fixed-variant text-on-primary p-gutter-xl shadow-md mb-gutter-xl">
<div class="absolute -right-16 -top-16 w-80 h-80 rounded-full bg-surface-tint/20 blur-3xl pointer-events-none"></div>
<div class="relative z-10 flex flex-col lg:flex-row lg:items-center justify-between gap-gutter-lg">
<div class="max-w-3xl space-y-2">
<div class="inline-flex items-center gap-2 px-3 py-1 rounded-full bg-surface-container-lowest/15 backdrop-blur font-caption text-caption text-tertiary-fixed">
<span class="material-symbols-outlined text-[16px]">psychology</span>
<span>EstateHub Neural Match Engine v3.4 Active</span>
</div>
<h2 class="font-display-hero-mobile lg:font-display-hero text-display-hero-mobile lg:text-display-hero tracking-tight text-surface-container-lowest">
            Your Bespoke High-Intent Matches
          </h2>
<p class="font-body-md text-body-md text-primary-fixed">
            Personalized curated properties matching your profile preferences:
            <span class="font-semibold text-surface-container-lowest">Budget ₹1.8 Cr - ₹2.8 Cr</span>,
            <span class="font-semibold text-surface-container-lowest">2-3 BHK</span> in
            <span class="font-semibold text-surface-container-lowest">Andheri West, Powai, Goregaon</span>,
            with Commute <span class="font-semibold text-surface-container-lowest">&lt; 30 mins to BKC</span>.
          </p>
</div>
<div class="flex flex-col sm:flex-row items-stretch sm:items-center gap-3 shrink-0">
<button class="flex items-center justify-center gap-2 px-4 py-2.5 rounded-lg bg-surface-container-lowest text-primary font-label-md text-label-md hover:bg-surface-bright shadow-sm transition-transform active:scale-95" onclick="window.location.href='${pageContext.request.contextPath}/views/preferences.jsp'">
<span class="material-symbols-outlined text-[18px]">tune</span>
<span>Edit Buyer Preferences</span>
</button>
</div>
</div>
<!-- Live Filters Strip -->
<div class="relative z-10 mt-gutter-lg pt-gutter-md border-t border-surface-container-lowest/15 flex flex-wrap items-center justify-between gap-gutter-md font-body-sm text-body-sm">
<div class="flex items-center gap-3">
<label class="relative inline-flex items-center cursor-pointer">
<input checked="" class="sr-only peer" id="verifiedOnlyToggle" type="checkbox"/>
<div class="w-10 h-6 bg-surface-container-lowest/30 peer-focus:outline-none rounded-full peer peer-checked:after:translate-x-full peer-checked:after:border-white after:content-[''] after:absolute after:top-[2px] after:left-[2px] after:bg-white after:rounded-full after:h-5 after:w-5 after:transition-all peer-checked:bg-tertiary-fixed"></div>
<span class="ml-2.5 font-label-sm text-label-sm text-surface-container-lowest">Show Only Verified &amp; Clear Title listings</span>
</label>
<span class="hidden md:inline text-primary-fixed">•</span>
<span class="hidden md:flex items-center gap-1 text-primary-fixed">
<span class="material-symbols-outlined text-[16px] text-tertiary-fixed">schedule</span>
            Refreshed 12 mins ago
          </span>
</div>
<div class="flex items-center gap-2">
<span class="text-primary-fixed font-caption text-caption">SORTED BY:</span>
<span class="px-2.5 py-1 rounded bg-surface-container-lowest/20 text-surface-container-lowest font-label-sm text-label-sm font-semibold">
            Highest Match AI Score
          </span>
</div>
</div>
</section>
<!-- Content 2-Column Grid: Listings (Left 8-col) + Tuning Controls (Right 4-col) -->
<div class="grid grid-cols-1 lg:grid-cols-12 gap-gutter-xl items-start">
<!-- Primary Listings Column (7-8 cols) -->
<div class="lg:col-span-8 flex flex-col gap-gutter-lg">

<c:forEach items="${recommendations}" var="rec">
<article class="rounded-2xl bg-surface-container-lowest p-gutter-lg shadow-sm hover:shadow-md transition-all duration-300">
<div class="flex flex-col md:flex-row gap-gutter-lg">
<div class="relative w-full md:w-5/12 aspect-[16/9] md:aspect-auto rounded-xl overflow-hidden shrink-0">
<img class="w-full h-full object-cover" alt="${rec.property.title}" src="${rec.property.primaryImageUrl}"/>
<div class="absolute top-3 left-3 flex items-center gap-1.5 px-3 py-1 rounded-full bg-tertiary-container text-tertiary-fixed font-label-sm text-label-sm font-bold shadow-md">
<span class="material-symbols-outlined text-[15px]" style="font-variation-settings: 'FILL' 1;">arrow_back_ios_new</span>
<span>${rec.matchScore}% MATCH</span>
</div>
</div>
<div class="flex-1 flex flex-col justify-between">
<div>
<div class="flex items-start justify-between gap-2">
<div>
<div class="flex items-center gap-2">
<h3 class="font-headline-md text-headline-md text-on-surface">${rec.property.title}</h3>
</div>
<p class="font-body-sm text-body-sm text-on-surface-variant flex items-center gap-1 mt-0.5">
<span class="material-symbols-outlined text-[15px]">pin_drop</span>
${rec.property.location}
</p>
</div>
<div class="text-right">
<span class="font-headline-lg text-headline-lg text-primary font-bold block">₹${rec.property.price}</span>
</div>
</div>
<div class="flex flex-wrap items-center gap-2 my-gutter-sm font-label-sm text-label-sm text-on-surface">
<span class="px-2.5 py-1 rounded bg-surface-container-low">${rec.property.bedrooms} BHK</span>
<span class="px-2.5 py-1 rounded bg-surface-container-low">${rec.property.areaSqft} sq.ft</span>
</div>
</div>
<div class="pt-gutter-md flex flex-wrap items-center justify-between gap-gutter-sm">
<a href="${pageContext.request.contextPath}/property/details?id=${rec.property.propertyId}" class="px-4 py-2 rounded-lg bg-secondary-container hover:bg-secondary text-on-secondary font-label-md text-label-md font-semibold transition-colors flex items-center gap-1.5 shadow-sm">
View Full Details
</a>
</div>
</div>
</div>
</article>
</c:forEach>

</div>
<!-- Right Sidebar Column (4-col) -->
<aside class="lg:col-span-4 flex flex-col gap-gutter-lg">
<!-- Module 1: AI Preference Tune-up -->
<div class="rounded-2xl bg-surface-container-lowest p-gutter-lg shadow-sm">
<div class="flex items-center justify-between mb-gutter-sm">
<div class="flex items-center gap-2">
<span class="material-symbols-outlined text-primary-container text-[20px]">tune</span>
<h3 class="font-headline-sm text-headline-sm text-on-surface">AI Preference Tune-up</h3>
</div>
<button class="font-caption text-caption text-primary hover:underline" id="resetWeightsBtn">Reset</button>
</div>
<p class="font-body-sm text-body-sm text-on-surface-variant mb-gutter-md">
            Adjust the AI score weights to instantly re-rank recommendations according to your priorities.
          </p>
<!-- Sliders -->
<div class="space-y-4">
<div>
<div class="flex justify-between font-label-sm text-label-sm text-on-surface mb-1">
<span>Commute Duration to BKC</span>
<span class="text-primary font-bold" id="commuteVal">40%</span>
</div>
<input class="w-full accent-primary-container cursor-pointer" max="70" min="10" oninput="document.getElementById('commuteVal').innerText = this.value + '%'" type="range" value="40"/>
</div>
<div>
<div class="flex justify-between font-label-sm text-label-sm text-on-surface mb-1">
<span>Price &amp; Budget Optimization</span>
<span class="text-primary font-bold" id="priceVal">30%</span>
</div>
<input class="w-full accent-primary-container cursor-pointer" max="70" min="10" oninput="document.getElementById('priceVal').innerText = this.value + '%'" type="range" value="30"/>
</div>
<div>
<div class="flex justify-between font-label-sm text-label-sm text-on-surface mb-1">
<span>Carpet Area &amp; Layout</span>
<span class="text-primary font-bold" id="areaVal">20%</span>
</div>
<input class="w-full accent-primary-container cursor-pointer" max="70" min="10" oninput="document.getElementById('areaVal').innerText = this.value + '%'" type="range" value="20"/>
</div>
<div>
<div class="flex justify-between font-label-sm text-label-sm text-on-surface mb-1">
<span>Gated Amenities &amp; Green Space</span>
<span class="text-primary font-bold" id="amenityVal">10%</span>
</div>
<input class="w-full accent-primary-container cursor-pointer" max="50" min="5" oninput="document.getElementById('amenityVal').innerText = this.value + '%'" type="range" value="10"/>
</div>
</div>
<button class="w-full mt-gutter-md py-2.5 rounded-lg bg-primary-container hover:bg-primary text-on-primary font-label-md text-label-md transition-all shadow-sm flex items-center justify-center gap-2">
<span class="material-symbols-outlined text-[18px]">refresh</span>
<span>Recalculate AI Matches</span>
</button>
</div>
<!-- Module 2: Market Price Trend Insight for You -->
<div class="rounded-2xl bg-surface-container-lowest p-gutter-lg shadow-sm">
<div class="flex items-center gap-2 mb-2">
<span class="material-symbols-outlined text-tertiary-container text-[20px]">trending_up</span>
<h3 class="font-headline-sm text-headline-sm text-on-surface">Market Price Trend Insight</h3>
</div>
<!-- Price prediction alert box -->
<div class="p-3 rounded-xl bg-tertiary-container/10 mb-gutter-md">
<div class="flex items-center gap-2 text-tertiary-container font-headline-sm text-headline-sm font-bold">
<span>+4.2%</span>
<span class="font-label-sm text-label-sm font-normal text-on-surface">Appreciation Forecast</span>
</div>
<p class="font-body-sm text-body-sm text-on-surface-variant mt-1">
              Predicted in JVLR/Powai corridor in next 12 months driven by new metro Line 6 commissioning.
            </p>
</div>
<!-- Inline SVG Visualizer Trend Sparkline Chart -->
<div class="w-full p-2 rounded-lg bg-surface-container-low">
<div class="flex justify-between font-caption text-caption text-on-surface-variant mb-1 px-1">
<span>Past 12M: ₹21.4k/sqft</span>
<span class="text-tertiary-container font-semibold">Future 12M: ₹22.3k/sqft</span>
</div>
<svg class="w-full h-24 text-tertiary-container" fill="none" preserveaspectratio="none" viewbox="0 0 300 100">
<!-- Grid lines -->
<line stroke="currentColor" stroke-dasharray="2,2" stroke-opacity="0.1" x1="0" x2="300" y1="25" y2="25"></line>
<line stroke="currentColor" stroke-dasharray="2,2" stroke-opacity="0.1" x1="0" x2="300" y1="50" y2="50"></line>
<line stroke="currentColor" stroke-dasharray="2,2" stroke-opacity="0.1" x1="0" x2="300" y1="75" y2="75"></line>
<!-- Gradient fill under curve -->
<defs>
<lineargradient id="trendGrad" x1="0%" x2="0%" y1="0%" y2="100%">
<stop offset="0%" stop-color="currentColor" stop-opacity="0.25"></stop>
<stop offset="100%" stop-color="currentColor" stop-opacity="0.0"></stop>
</lineargradient>
</defs>
<path d="M0,80 Q50,75 100,68 T200,45 T300,20 L300,100 L0,100 Z" fill="url(#trendGrad)"></path>
<!-- Main trend line -->
<path d="M0,80 Q50,75 100,68 T200,45 T300,20" stroke="currentColor" stroke-linecap="round" stroke-width="2.5"></path>
<!-- Data Points -->
<circle cx="0" cy="80" fill="currentColor" r="3.5"></circle>
<circle cx="100" cy="68" fill="currentColor" r="3.5"></circle>
<circle cx="200" cy="45" fill="currentColor" r="3.5"></circle>
<circle cx="300" cy="20" fill="currentColor" r="4.5" stroke="#ffffff" stroke-width="2"></circle>
</svg>
<div class="flex justify-between font-caption text-[10px] text-on-surface-variant px-1 mt-1">
<span>Q1 2024</span>
<span>Q3 2024</span>
<span>Now</span>
<span class="font-bold text-on-surface">Target 2026</span>
</div>
</div>
<div class="mt-gutter-md p-2.5 rounded-lg bg-surface-container-low text-on-surface-variant font-caption text-caption flex items-center gap-2">
<span class="material-symbols-outlined text-[16px] text-primary">info</span>
<span>Based on 45,000+ registered index II stamp duty records.</span>
</div>
</div>
<!-- Module 3: Instant WhatsApp Match Alerts -->
<div class="rounded-2xl bg-gradient-to-br from-surface-container-lowest to-surface-container-low p-gutter-lg shadow-sm">
<div class="flex items-center gap-2.5 mb-2">
<div class="w-8 h-8 rounded-full bg-tertiary-fixed flex items-center justify-center text-on-tertiary-fixed">
<span class="material-symbols-outlined text-[18px]">chat</span>
</div>
<div>
<h3 class="font-headline-sm text-headline-sm text-on-surface">WhatsApp Match Alerts</h3>
<p class="font-caption text-caption text-on-surface-variant">Direct instant notifications</p>
</div>
</div>
<p class="font-body-sm text-body-sm text-on-surface-variant mb-gutter-md">
            Get pinged the moment an owner posts a verified property scoring above 90% in your target zones.
          </p>
<form class="space-y-3" id="whatsappForm" onsubmit="event.preventDefault(); document.getElementById('waConfirm').classList.remove('hidden');">
<div>
<label class="block font-label-sm text-label-sm text-on-surface mb-1" for="waPhone">WhatsApp Number</label>
<div class="flex items-center rounded-lg bg-surface-container-lowest shadow-sm overflow-hidden">
<span class="px-3 text-on-surface-variant font-label-md text-label-md bg-surface-container-low py-2.5">+91</span>
<input class="w-full px-3 py-2.5 text-on-surface font-body-md text-body-md bg-transparent focus:outline-none" id="waPhone" placeholder="Enter 10-digit mobile" type="tel" value="98201 44521"/>
</div>
</div>
<div class="flex items-center gap-2">
<input checked="" class="accent-primary-container" id="instantDrops" type="checkbox"/>
<label class="font-body-sm text-body-sm text-on-surface" for="instantDrops">Include early-bird price cuts</label>
</div>
<button class="w-full py-2.5 rounded-lg bg-secondary-container hover:bg-secondary text-on-secondary font-label-md text-label-md font-semibold transition-colors shadow-sm flex items-center justify-center gap-1.5" type="submit">
<span class="material-symbols-outlined text-[18px]">bolt</span>
<span>Activate Daily Drops</span>
</button>
</form>
<!-- Confirmation Banner -->
<div class="hidden mt-3 p-2.5 rounded-lg bg-tertiary-fixed/30 text-on-tertiary-fixed-variant font-label-sm text-label-sm flex items-center gap-2 animate-fade-in" id="waConfirm">
<span class="material-symbols-outlined text-[17px]">check_circle</span>
<span>Alerts configured for +91 98201 44521</span>
</div>
</div>
<!-- Module 4: Pre-approval Verification Card -->
<div class="rounded-2xl bg-primary text-on-primary p-gutter-lg shadow-sm relative overflow-hidden">
<div class="relative z-10 space-y-2">
<div class="flex items-center justify-between">
<span class="px-2 py-0.5 rounded bg-surface-container-lowest/20 font-caption text-caption uppercase text-surface-bright">HDFC Verified</span>
<span class="font-headline-sm text-headline-sm font-bold text-surface-container-lowest">₹2.80 Cr</span>
</div>
<h4 class="font-label-md text-label-md text-surface-container-lowest">Loan Pre-Approval Status</h4>
<p class="font-body-sm text-body-sm text-primary-fixed">
              Letter active until Aug 2025. Unlocks 0-brokerage VIP tours and direct seller contact priority.
            </p>
<button class="text-tertiary-fixed font-label-sm text-label-sm font-semibold hover:underline flex items-center gap-1 pt-1">
<span>Download Approval Letter</span>
<span class="material-symbols-outlined text-[14px]">download</span>
</button>
</div>
</div>
</aside>
</div>
</div>
<!-- Client-side Micro-interactions -->
<script>
    // Smooth reset behavior for preference weights
    document.getElementById('resetWeightsBtn')?.addEventListener('click', () => {
      document.getElementById('commuteVal').innerText = '40%';
      document.getElementById('priceVal').innerText = '30%';
      document.getElementById('areaVal').innerText = '20%';
      document.getElementById('amenityVal').innerText = '10%';
    });

    // Toggle filter notification
    const verifiedToggle = document.getElementById('verifiedOnlyToggle');
    if (verifiedToggle) {
      verifiedToggle.addEventListener('change', (e) => {
        const checked = e.target.checked;
        const msg = checked ? "Filtering only verified & clear title properties." : "Showing all matching properties.";
        console.log(msg);
      });
    }
  </script>
</div></main><footer class="w-full bg-inverse-surface text-inverse-on-surface pt-gutter-2xl pb-gutter-xl"><div class="max-w-container-max mx-auto px-gutter-lg"><div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-gutter-xl mb-gutter-2xl"><div class="space-y-gutter-md"><div class="flex items-center gap-2"><img alt="EstateHub Logo" class="h-8 w-auto object-contain brightness-200" src="https://lh3.googleusercontent.com/aida/AEtjO1Xg4rP1x__tmUvhhUEeM-xIYBlSjyhgL-aDvDihhuMxD0bc_kL9kHorsRYR5EvM9wdONnfScP46YL0QssDo1Yzd9XXTo1GpuWC9c1SGhoiGFmbBZZ-L95_tHf_7u7-NnrWpEVNDa3KKfH1MN1eMtrk2ZiwZGYM9sKA4zxHHA9vupb767aMCr2J7zivaAtyK3ypPdo3ZJ1n88WJ1YI5TA-loMe151e9ACRfxjid8X1QrA8mUitrWMg5qDMA"/><span class="font-headline-md text-headline-md text-surface-container-lowest tracking-tight">EstateHub</span></div><p class="font-body-sm text-body-sm text-surface-variant max-w-xs">India's trusted real estate portal for verified homes, apartments, and commercial spaces.</p><div class="pt-gutter-xs flex items-center gap-gutter-sm"><span class="flex items-center gap-1 bg-tertiary-container text-tertiary-fixed font-caption text-caption px-2.5 py-1 rounded-full"><span class="material-symbols-outlined text-[14px]">verified</span> 100% RERA Verified</span></div></div><div class="space-y-gutter-sm"><h3 class="font-label-md text-label-md text-surface-container-lowest uppercase tracking-wider">Popular Searches</h3><ul class="space-y-2 font-body-sm text-body-sm text-surface-variant"><li><a class="hover:text-surface-bright transition-colors" data-path="rent-properties" href="javascript:void(0)">Flats in Mumbai</a></li><li><a class="hover:text-surface-bright transition-colors" data-path="buy-properties" href="javascript:void(0)">Flats in Bangalore</a></li><li><a class="hover:text-surface-bright transition-colors" data-path="new-projects" href="javascript:void(0)">Apartments in Gurgaon</a></li><li><a class="hover:text-surface-bright transition-colors" data-path="buy-properties" href="javascript:void(0)">Villas in Hyderabad</a></li><li><a class="hover:text-surface-bright transition-colors" data-path="commercial-spaces" href="javascript:void(0)">Offices in Pune</a></li></ul></div><div class="space-y-gutter-sm"><h3 class="font-label-md text-label-md text-surface-container-lowest uppercase tracking-wider">Quick Links</h3><ul class="space-y-2 font-body-sm text-body-sm text-surface-variant"><li><a class="hover:text-surface-bright transition-colors" data-path="about-us" href="javascript:void(0)">About Us</a></li><li><a class="hover:text-surface-bright transition-colors" data-path="careers" href="javascript:void(0)">Careers</a></li><li><a class="hover:text-surface-bright transition-colors" data-path="research-insights" href="javascript:void(0)">Research &amp; Insights</a></li><li><a class="hover:text-surface-bright transition-colors" data-path="contact-support" href="javascript:void(0)">Contact Support</a></li><li><a class="hover:text-surface-bright transition-colors" data-path="terms-privacy" href="javascript:void(0)">Terms &amp; Privacy</a></li></ul></div><div class="space-y-gutter-md"><h3 class="font-label-md text-label-md text-surface-container-lowest uppercase tracking-wider">Experience on Mobile</h3><p class="font-body-sm text-body-sm text-surface-variant">Download EstateHub App for instant notifications and direct agent chats.</p><div class="flex flex-col gap-2"><div class="flex items-center gap-3 px-3 py-2 rounded-lg bg-surface-container-high/10 hover:bg-surface-container-high/20 text-surface-bright transition-colors cursor-pointer"><span class="material-symbols-outlined text-primary-fixed">play_arrow</span><div class="text-left"><p class="font-caption text-[10px] text-surface-variant uppercase">GET IT ON</p><p class="font-label-sm text-label-sm font-semibold">Google Play</p></div></div><div class="flex items-center gap-3 px-3 py-2 rounded-lg bg-surface-container-high/10 hover:bg-surface-container-high/20 text-surface-bright transition-colors cursor-pointer"><span class="material-symbols-outlined text-primary-fixed">install_mobile</span><div class="text-left"><p class="font-caption text-[10px] text-surface-variant uppercase">DOWNLOAD ON</p><p class="font-label-sm text-label-sm font-semibold">App Store</p></div></div></div></div></div><div class="pt-gutter-lg mt-gutter-xl border-t border-outline/20 flex flex-col md:flex-row items-center justify-between gap-gutter-md font-caption text-caption text-surface-variant"><div>© 2025 EstateHub Technologies Private Limited. All rights reserved.</div><div class="flex items-center gap-gutter-xs text-surface-dim"><span class="material-symbols-outlined text-tertiary-fixed text-[16px]">shield</span><span>Made with trust for home seekers across India</span></div></div></div></footer></body></html>