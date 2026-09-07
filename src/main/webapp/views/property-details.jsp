<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ taglib uri="jakarta.tags.functions" prefix="fn" %>
<!DOCTYPE html>

<html lang="en"><head><meta charset="utf-8"/><meta content="width=device-width, initial-scale=1.0" name="viewport"/><title>EstateHub</title><link href="https://fonts.googleapis.com" rel="preconnect"/><link crossorigin="" href="https://fonts.gstatic.com" rel="preconnect"/><link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&amp;family=Plus+Jakarta+Sans:wght@600;700;800&amp;display=swap" rel="stylesheet"/><link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" rel="stylesheet"/>
<link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&amp;display=swap" rel="stylesheet"/>
<link rel="stylesheet" href="https://unpkg.com/leaflet@1.9.4/dist/leaflet.css" />
<script src="https://unpkg.com/leaflet@1.9.4/dist/leaflet.js"></script>
<style>@layer base { html, body { margin: 0; padding: 0; } body { overscroll-behavior: none; } main > :first-child { margin-top: 0 !important; } main > :last-child { margin-bottom: 0 !important; } } ::-webkit-scrollbar { display: none; }</style><script src="https://cdn.tailwindcss.com"></script><script id="tailwind-config">tailwind.config = { darkMode: "class", theme: { extend: { "colors": { "on-tertiary-fixed-variant": "#00513b", "on-primary": "#ffffff", "outline": "#7d7483", "surface-bright": "#f9f9ff", "surface-dim": "#d7dae3", "surface-container-high": "#e5e8f2", "tertiary-fixed": "#71fac8", "surface-container-lowest": "#ffffff", "outline-variant": "#cec3d4", "on-primary-fixed": "#2a0053", "background": "#f9f9ff", "secondary-container": "#ff5a5f", "on-background": "#181c23", "secondary-fixed": "#ffdad8", "error": "#ba1a1a", "on-tertiary": "#ffffff", "primary": "#450081", "surface-container-low": "#f1f3fd", "on-primary-fixed-variant": "#5f259e", "surface-container-highest": "#dfe2ec", "tertiary-fixed-dim": "#50ddad", "secondary": "#b52330", "secondary-fixed-dim": "#ffb3b0", "primary-fixed": "#eedbff", "on-secondary-container": "#60000e", "on-secondary-fixed-variant": "#92001b", "on-secondary-fixed": "#410007", "inverse-surface": "#2d3138", "on-surface": "#181c23", "on-error-container": "#93000a", "surface-container": "#ebeef7", "surface-tint": "#7841b8", "primary-container": "#5e239d", "on-tertiary-fixed": "#002116", "on-secondary": "#ffffff", "on-tertiary-container": "#36ca9b", "on-primary-container": "#cca0ff", "inverse-on-surface": "#eef0fa", "tertiary-container": "#00503a", "error-container": "#ffdad6", "surface-variant": "#dfe2ec", "tertiary": "#003727", "on-surface-variant": "#4b4452", "on-error": "#ffffff", "surface": "#f9f9ff", "inverse-primary": "#dab9ff", "primary-fixed-dim": "#dab9ff" }, "borderRadius": { "DEFAULT": "0.25rem", "lg": "0.5rem", "xl": "0.75rem", "full": "9999px" }, "spacing": { "container-max": "1280px", "gutter-sm": "0.5rem", "search-bar-height": "4rem", "gutter-xs": "0.25rem", "gutter-2xl": "3rem", "gutter-lg": "1.5rem", "gutter-md": "1rem", "gutter-xl": "2rem" }, "fontFamily": { "caption": [ "Inter" ], "body-sm": [ "Inter" ], "label-md": [ "Plus Jakarta Sans" ], "headline-xl-mobile": [ "Plus Jakarta Sans" ], "headline-lg": [ "Plus Jakarta Sans" ], "body-lg": [ "Inter" ], "body-md": [ "Inter" ], "headline-xl": [ "Plus Jakarta Sans" ], "headline-sm": [ "Plus Jakarta Sans" ], "display-hero-mobile": [ "Plus Jakarta Sans" ], "headline-md": [ "Plus Jakarta Sans" ], "display-hero": [ "Plus Jakarta Sans" ], "label-sm": [ "Plus Jakarta Sans" ] }, "fontSize": { "caption": [ "11px", { "lineHeight": "14px", "letterSpacing": "0.02em", "fontWeight": "500" } ], "body-sm": [ "12px", { "lineHeight": "18px", "letterSpacing": "0.005em", "fontWeight": "400" } ], "label-md": [ "14px", { "lineHeight": "20px", "letterSpacing": "0.01em", "fontWeight": "600" } ], "headline-xl-mobile": [ "24px", { "lineHeight": "32px", "letterSpacing": "-0.015em", "fontWeight": "700" } ], "headline-lg": [ "24px", { "lineHeight": "32px", "letterSpacing": "-0.015em", "fontWeight": "700" } ], "body-lg": [ "16px", { "lineHeight": "26px", "letterSpacing": "-0.005em", "fontWeight": "400" } ], "body-md": [ "14px", { "lineHeight": "22px", "letterSpacing": "0", "fontWeight": "400" } ], "headline-xl": [ "32px", { "lineHeight": "40px", "letterSpacing": "-0.02em", "fontWeight": "700" } ], "headline-sm": [ "16px", { "lineHeight": "24px", "letterSpacing": "0", "fontWeight": "600" } ], "display-hero-mobile": [ "30px", { "lineHeight": "38px", "letterSpacing": "-0.02em", "fontWeight": "800" } ], "headline-md": [ "20px", { "lineHeight": "28px", "letterSpacing": "-0.01em", "fontWeight": "600" } ], "display-hero": [ "44px", { "lineHeight": "54px", "letterSpacing": "-0.025em", "fontWeight": "800" } ], "label-sm": [ "12px", { "lineHeight": "16px", "letterSpacing": "0.02em", "fontWeight": "600" } ] } } } };</script></head><body class="bg-background font-body-md text-on-surface antialiased min-h-screen flex flex-col"><header class="sticky top-0 z-50 w-full bg-surface-container-lowest shadow-[0_2px_12px_rgba(0,0,0,0.06)]"><div class="h-16 max-w-container-max mx-auto px-gutter-lg flex items-center justify-between gap-gutter-md"><div class="flex items-center gap-gutter-lg"><a class="flex items-center gap-gutter-xs" data-path="explore-homes" href="javascript:void(0)"><img alt="EstateHub Logo" class="h-8 w-auto object-contain" src="https://lh3.googleusercontent.com/aida/AEtjO1Xg4rP1x__tmUvhhUEeM-xIYBlSjyhgL-aDvDihhuMxD0bc_kL9kHorsRYR5EvM9wdONnfScP46YL0QssDo1Yzd9XXTo1GpuWC9c1SGhoiGFmbBZZ-L95_tHf_7u7-NnrWpEVNDa3KKfH1MN1eMtrk2ZiwZGYM9sKA4zxHHA9vupb767aMCr2J7zivaAtyK3ypPdo3ZJ1n88WJ1YI5TA-loMe151e9ACRfxjid8X1QrA8mUitrWMg5qDMA"/><span class="font-headline-md text-headline-md text-primary-container tracking-tight">EstateHub</span></a><div class="hidden sm:flex items-center gap-gutter-xs px-3 py-1.5 rounded-lg bg-surface-container-low hover:bg-surface-container transition-colors cursor-pointer"><span class="material-symbols-outlined text-primary text-[18px]">location_on</span><span class="font-label-sm text-label-sm text-on-surface font-semibold">Mumbai</span><span class="material-symbols-outlined text-on-surface-variant text-[16px]">expand_more</span></div></div><nav class="hidden lg:flex items-center gap-gutter-lg" data-active-classes="text-primary-container font-semibold"><a aria-current="page" class="transition-colors text-primary-container font-semibold" data-path="buy-properties" href="javascript:void(0)">Buy</a><a class="font-label-md text-label-md text-on-surface-variant hover:text-on-surface transition-colors" data-path="rent-properties" href="javascript:void(0)">Rent</a><a class="font-label-md text-label-md text-on-surface-variant hover:text-on-surface transition-colors" data-path="commercial-spaces" href="javascript:void(0)">Commercial</a><a class="font-label-md text-label-md text-on-surface-variant hover:text-on-surface transition-colors" data-path="pg-co-living" href="javascript:void(0)">PG / Co-Living</a><a class="font-label-md text-label-md text-on-surface-variant hover:text-on-surface transition-colors" data-path="new-projects" href="javascript:void(0)">New Projects</a></nav><div class="flex items-center gap-gutter-md"><a class="hidden xl:flex items-center gap-1.5 text-on-surface-variant hover:text-on-surface font-label-sm text-label-sm transition-colors" data-path="mobile-app" href="javascript:void(0)"><span class="material-symbols-outlined text-[18px]">smartphone</span><span>Download App</span></a><a class="relative flex items-center justify-center p-2 rounded-full hover:bg-surface-container-low text-on-surface-variant hover:text-secondary-container transition-colors" href="${pageContext.request.contextPath}/views/favorites.jsp"><span class="material-symbols-outlined text-[22px]">favorite</span><span class="absolute top-1 right-1 flex h-4 w-4 items-center justify-center rounded-full bg-secondary-container text-on-secondary font-caption text-[10px] font-bold">3</span></a><a class="flex items-center gap-2 bg-primary-container hover:bg-primary text-on-primary px-3.5 py-1.5 rounded-lg shadow-sm transition-all" href="${pageContext.request.contextPath}/views/add-property.jsp"><span class="font-label-sm text-label-sm font-semibold">Post Property</span><span class="bg-tertiary-container text-tertiary-fixed font-caption text-[10px] font-bold px-1.5 py-0.5 rounded">FREE</span></a>
    <c:choose>
        <c:when test="${not empty sessionScope.currentUser}">
            <c:set var="dashboardUrl" value="${pageContext.request.contextPath}/customer/dashboard" />
            <c:if test="${sessionScope.currentUser.role == 'ADMIN'}">
                <c:set var="dashboardUrl" value="${pageContext.request.contextPath}/admin/dashboard" />
            </c:if>
            <c:if test="${sessionScope.currentUser.role == 'BROKER'}">
                <c:set var="dashboardUrl" value="${pageContext.request.contextPath}/broker/dashboard" />
            </c:if>
            <c:if test="${sessionScope.currentUser.role == 'SELLER'}">
                <c:set var="dashboardUrl" value="${pageContext.request.contextPath}/seller/dashboard" />
            </c:if>
            
            <div class="flex items-center gap-2 pl-gutter-xs group relative">
                <a href="${dashboardUrl}" class="flex items-center gap-2 cursor-pointer">
                    <div class="w-8 h-8 rounded-full bg-primary flex items-center justify-center hover:opacity-80 transition-opacity">
                        <span class="material-symbols-outlined text-on-primary text-[18px]">person</span>
                    </div>
                    <span class="hidden md:inline font-label-sm text-label-sm text-on-surface font-medium hover:text-primary transition-colors">${sessionScope.currentUser.name}</span>
                </a>
                
                <div class="absolute right-0 top-full mt-2 w-48 bg-white rounded-md shadow-lg hidden group-hover:block z-50 border border-surface-container-high overflow-hidden">
                    <a href="${dashboardUrl}" class="block px-4 py-2 text-sm text-on-surface hover:bg-surface-container-low">Dashboard</a>
                    <div class="border-t border-surface-container-high"></div>
                    <a href="${pageContext.request.contextPath}/logout" class="block px-4 py-2 text-sm text-error hover:bg-error-container hover:text-on-error-container transition-colors">Logout</a>
                </div>
            </div>
        </c:when>
        <c:otherwise>
            <div class="flex items-center gap-2 pl-gutter-xs">
                <a href="${pageContext.request.contextPath}/views/login.jsp" class="font-label-sm text-label-sm text-on-surface font-medium hover:text-primary">Login</a>
                <span class="text-gray-300">|</span>
                <a href="${pageContext.request.contextPath}/views/register.jsp" class="font-label-sm text-label-sm text-on-surface font-medium hover:text-primary">Register</a>
            </div>
        </c:otherwise>
    </c:choose>
    </div></div></header><main class="flex-1 w-full bg-surface"><div class="flex flex-col w-full">
    <c:if test="${not empty sessionScope.successMessage}">
        <div class="bg-green-100 border border-green-400 text-green-700 px-4 py-3 rounded relative mx-auto max-w-container-max mt-4" role="alert">
            <span class="block sm:inline">${sessionScope.successMessage}</span>
        </div>
        <c:remove var="successMessage" scope="session"/>
    </c:if>
    <c:if test="${not empty sessionScope.errorMessage}">
        <div class="bg-red-100 border border-red-400 text-red-700 px-4 py-3 rounded relative mx-auto max-w-container-max mt-4" role="alert">
            <span class="block sm:inline">${sessionScope.errorMessage}</span>
        </div>
        <c:remove var="errorMessage" scope="session"/>
    </c:if>
    
<!-- Top Navigation Context / Sticky Quick Navigation Bar -->
<div class="bg-surface-container-lowest shadow-sm py-3 px-gutter-md">
<div class="max-w-container-max mx-auto flex flex-wrap items-center justify-between gap-y-2">
<!-- Breadcrumb trail -->
<nav class="flex items-center gap-1.5 font-caption text-caption text-on-surface-variant flex-wrap">
<a class="hover:text-primary transition-colors flex items-center gap-1" href="${pageContext.request.contextPath}/">
<span class="material-symbols-outlined text-[14px]">home</span>Home
        </a>
<span class="text-outline-variant">/</span>
<a class="hover:text-primary transition-colors" href="${pageContext.request.contextPath}/search?city=${property.city}">${property.city}</a>
<span class="text-outline-variant">/</span>
<a class="hover:text-primary transition-colors" href="${pageContext.request.contextPath}/search?keyword=${property.location}">${property.location}</a>
<span class="text-outline-variant">/</span>
<span class="text-on-surface font-semibold truncate max-w-[200px] md:max-w-xs">${property.title}</span>
</nav>
<!-- Quick Action Utilities -->
<div class="flex items-center gap-2">
<button class="flex items-center gap-1.5 px-3 py-1.5 rounded-lg bg-surface-container-low hover:bg-surface-container text-on-surface font-label-sm text-label-sm transition-all" id="shareBtn" title="Share property">
<span class="material-symbols-outlined text-[16px] text-primary">share</span>
<span class="hidden sm:inline">Share</span>
</button>
<button class="flex items-center gap-1.5 px-3 py-1.5 rounded-lg bg-surface-container-low hover:bg-surface-container text-on-surface font-label-sm text-label-sm transition-all" id="favBtn" title="Save to Favorites">
<span class="material-symbols-outlined text-[16px] text-secondary-container" id="heartIcon">favorite_border</span>
<span class="hidden sm:inline" id="favText">Save</span>
</button>
<button class="hidden md:flex items-center gap-1.5 px-3 py-1.5 rounded-lg bg-surface-container-low hover:bg-surface-container text-on-surface font-label-sm text-label-sm transition-all" onclick="window.print()" title="Print listing">
<span class="material-symbols-outlined text-[16px] text-on-surface-variant">print</span>
<span>Print</span>
</button>
<button class="flex items-center gap-1.5 px-2.5 py-1.5 rounded-lg bg-surface-container-low hover:bg-surface-container text-on-surface-variant hover:text-error font-label-sm text-label-sm transition-all" title="Report inaccuracy">
<span class="material-symbols-outlined text-[16px]">flag</span>
</button>
</div>
</div>
</div>
<!-- Main Container Envelope -->
<div class="max-w-container-max mx-auto px-gutter-md md:px-gutter-lg py-gutter-md w-full space-y-gutter-lg">
<!-- Property Header Block -->
<div class="flex flex-col lg:flex-row lg:items-end justify-between gap-4">
<div class="space-y-1.5">
<div class="flex flex-wrap items-center gap-2">
<span class="inline-flex items-center gap-1 px-2.5 py-0.5 rounded-full bg-tertiary-container text-tertiary-fixed font-label-sm text-label-sm font-semibold">
<span class="material-symbols-outlined text-[14px]">verified</span> ${property.verificationStatus}
          </span>
<span class="inline-flex items-center gap-1 px-2.5 py-0.5 rounded-full bg-surface-container-high text-on-surface-variant font-caption text-caption">
<span class="material-symbols-outlined text-[13px]">home_work</span> ${property.categoryName}
          </span>
<span class="inline-flex items-center gap-1 px-2 py-0.5 rounded-full bg-primary-fixed text-on-primary-fixed font-caption text-caption font-semibold">
            For ${property.purpose}
          </span>
</div>
<h1 class="font-headline-xl text-headline-xl text-on-surface tracking-tight leading-tight">
          ${property.title}
        </h1>
<div class="flex items-center gap-2 text-on-surface-variant font-body-md text-body-md flex-wrap">
<span class="material-symbols-outlined text-[18px] text-primary">location_on</span>
<span>${property.location}, ${property.city}, ${property.state}</span>
<a class="text-primary font-semibold hover:underline flex items-center gap-0.5 ml-1" href="#localitySection">
<span>View on Map</span>
<span class="material-symbols-outlined text-[14px]">arrow_forward</span>
</a>
<a class="px-3 py-1 rounded-lg bg-tertiary-container text-tertiary-fixed text-xs font-bold flex items-center gap-1.5 hover:bg-tertiary transition-colors ml-2 shadow-xs" 
   target="_blank" 
   href="https://www.google.com/maps/dir/?api=1&destination=${fn:escapeXml(property.location)}+${fn:escapeXml(property.city)}">
  <span class="material-symbols-outlined text-base">directions</span>
  <span>Google Maps Directions</span>
</a>
</div>
</div>
<!-- Quick Snapshot Badge -->
<div class="flex items-center gap-4 bg-surface-container-lowest p-3 rounded-xl shadow-sm self-start lg:self-auto">
<div>
<p class="font-caption text-caption text-on-surface-variant uppercase tracking-wider">Availability</p>
<p class="font-headline-sm text-headline-sm text-tertiary-fixed-variant flex items-center gap-1 font-bold">
<span class="w-2 h-2 rounded-full bg-tertiary-fixed-variant inline-block"></span> ${property.availability}
          </p>
</div>
<div class="w-px h-8 bg-surface-container-high"></div>
<div>
<p class="font-caption text-caption text-on-surface-variant uppercase tracking-wider">Furnishing</p>
<p class="font-headline-sm text-headline-sm text-on-surface font-semibold">${property.furnishing}</p>
</div>
</div>
</div>
<!-- Multi-Photo Composite Gallery (Housing.com style 60/40 Split) -->
<section class="grid grid-cols-1 lg:grid-cols-12 gap-3 h-auto lg:h-[460px] rounded-2xl overflow-hidden shadow-sm bg-surface-container-low">
<!-- Large Hero Photo (60% Desktop) -->
<div class="lg:col-span-7 relative group cursor-pointer overflow-hidden min-h-[300px] lg:min-h-full">
<img class="w-full h-full object-cover group-hover:scale-105 transition-transform duration-500" alt="${property.title}" src="${property.primaryImageUrl}"/>
<div class="absolute inset-0 bg-gradient-to-t from-inverse-surface/60 via-transparent to-transparent"></div>
<div class="absolute bottom-4 left-4 flex flex-wrap items-center gap-2">
<span class="bg-inverse-surface/85 backdrop-blur-sm text-surface-bright px-3 py-1 rounded-lg font-label-sm text-label-sm flex items-center gap-1.5">
<span class="material-symbols-outlined text-[16px]">photo_camera</span> Primary Photo
          </span>
</div>
</div>
<!-- Right 4-Photo Mosaic Grid (40% Desktop) -->
<div class="lg:col-span-5 grid grid-cols-2 grid-rows-2 gap-3 h-[300px] lg:h-full">
<c:choose>
  <c:when test="${not empty property.images && fn:length(property.images) > 1}">
    <c:forEach items="${property.images}" var="img" varStatus="st">
      <c:if test="${st.index > 0 && st.index <= 4}">
        <div class="relative group cursor-pointer overflow-hidden rounded-lg">
          <img class="w-full h-full object-cover group-hover:scale-105 transition-transform duration-500" src="${img.imageUrl}" alt="${property.title}"/>
        </div>
      </c:if>
    </c:forEach>
  </c:when>
  <c:otherwise>
    <div class="relative group cursor-pointer overflow-hidden rounded-lg col-span-2 row-span-2">
      <img class="w-full h-full object-cover" src="${property.primaryImageUrl}" alt="${property.title}"/>
    </div>
  </c:otherwise>
</c:choose>
</div>
</section>
<!-- Two-Column Primary Body Content (70% Left / 30% Right) -->
<div class="grid grid-cols-1 lg:grid-cols-12 gap-gutter-lg items-start">
<!-- LEFT COLUMN (70% - 8 cols) -->
<div class="lg:col-span-8 space-y-gutter-lg min-w-0">
<!-- 1. Key Pricing & Specs Overview Card -->
<section class="bg-surface-container-lowest rounded-2xl p-gutter-lg shadow-sm space-y-gutter-md">
<!-- Pricing Header Strip -->
<div class="flex flex-col sm:flex-row sm:items-baseline justify-between pb-4 border-b border-surface-container-high gap-3">
<div>
<div class="flex items-baseline gap-2">
<span class="font-headline-xl text-headline-xl text-on-surface font-extrabold text-primary">₹ ${property.price}</span>
<span class="font-body-md text-body-md text-on-surface-variant font-medium">(${property.purpose})</span>
</div>
<p class="font-caption text-caption text-on-surface-variant mt-0.5">Verified Direct Owner Listing</p>
</div>
<a class="px-4 py-2 rounded-xl bg-tertiary-container text-tertiary-fixed font-bold text-xs flex items-center gap-1.5 hover:bg-tertiary transition-colors" 
   target="_blank" 
   href="https://www.google.com/maps/dir/?api=1&destination=${fn:escapeXml(property.location)}+${fn:escapeXml(property.city)}">
  <span class="material-symbols-outlined text-base">near_me</span>
  <span>Directions on Google Maps</span>
</a>
</div>
<!-- Structured Key Metrics Grid -->
<div class="grid grid-cols-2 sm:grid-cols-3 md:grid-cols-4 gap-4 pt-1">
<div class="flex items-start gap-3 p-2.5 rounded-xl bg-surface-container-low">
<div class="w-10 h-10 rounded-lg bg-surface-container-lowest flex items-center justify-center text-primary shadow-sm">
<span class="material-symbols-outlined text-[22px]">square_foot</span>
</div>
<div>
<p class="font-caption text-caption text-on-surface-variant">Carpet Area</p>
<p class="font-headline-sm text-headline-sm text-on-surface font-bold">${property.areaSqft} sq.ft</p>
</div>
</div>
<div class="flex items-start gap-3 p-2.5 rounded-xl bg-surface-container-low">
<div class="w-10 h-10 rounded-lg bg-surface-container-lowest flex items-center justify-center text-primary shadow-sm">
<span class="material-symbols-outlined text-[22px]">bed</span>
</div>
<div>
<p class="font-caption text-caption text-on-surface-variant">Bedrooms</p>
<p class="font-headline-sm text-headline-sm text-on-surface font-bold">${property.bedrooms} BHK</p>
</div>
</div>
<div class="flex items-start gap-3 p-2.5 rounded-xl bg-surface-container-low">
<div class="w-10 h-10 rounded-lg bg-surface-container-lowest flex items-center justify-center text-primary shadow-sm">
<span class="material-symbols-outlined text-[22px]">bathtub</span>
</div>
<div>
<p class="font-caption text-caption text-on-surface-variant">Bathrooms</p>
<p class="font-headline-sm text-headline-sm text-on-surface font-bold">${property.bathrooms} Baths</p>
</div>
</div>
<div class="flex items-start gap-3 p-2.5 rounded-xl bg-surface-container-low">
<div class="w-10 h-10 rounded-lg bg-surface-container-lowest flex items-center justify-center text-primary shadow-sm">
<span class="material-symbols-outlined text-[22px]">category</span>
</div>
<div>
<p class="font-caption text-caption text-on-surface-variant">Category</p>
<p class="font-headline-sm text-headline-sm text-on-surface font-bold">${property.categoryName}</p>
</div>
</div>
</div>
</section>
<!-- 2. About Property Section -->
<section class="bg-surface-container-lowest rounded-2xl p-gutter-lg shadow-sm space-y-4">
<div class="flex items-center justify-between">
<h2 class="font-headline-lg text-headline-lg text-on-surface font-bold">About this Property</h2>
<span class="font-caption text-caption text-on-surface-variant">Listing ID: #${property.propertyId}</span>
</div>
<div class="prose max-w-none text-on-surface font-body-lg text-body-lg space-y-3 leading-relaxed">
<p>${property.description}</p>
</div>
</section>
<!-- 3. Amenities Grid (4-Column Matrix) -->
<section class="bg-surface-container-lowest rounded-2xl p-gutter-lg shadow-sm space-y-gutter-md">
<div class="flex items-center justify-between">
<div>
<h2 class="font-headline-lg text-headline-lg text-on-surface font-bold">Society Amenities &amp; Features</h2>
<p class="font-body-sm text-body-sm text-on-surface-variant">Curated luxury lifestyle facilities provided inside the gated enclave</p>
</div>
<span class="px-3 py-1 bg-surface-container rounded-full font-label-sm text-label-sm font-semibold text-primary">24 Amenities</span>
</div>
<div class="grid grid-cols-2 sm:grid-cols-3 md:grid-cols-4 gap-3">
<div class="flex items-center gap-3 p-3 rounded-xl bg-surface-container-low hover:bg-surface-container transition-colors">
<div class="w-9 h-9 rounded-lg bg-surface-container-lowest flex items-center justify-center text-primary">
<span class="material-symbols-outlined text-[20px]">fitness_center</span>
</div>
<span class="font-label-sm text-label-sm font-semibold text-on-surface">Gymnasium</span>
</div>
<div class="flex items-center gap-3 p-3 rounded-xl bg-surface-container-low hover:bg-surface-container transition-colors">
<div class="w-9 h-9 rounded-lg bg-surface-container-lowest flex items-center justify-center text-primary">
<span class="material-symbols-outlined text-[20px]">pool</span>
</div>
<span class="font-label-sm text-label-sm font-semibold text-on-surface">Swimming Pool</span>
</div>
<div class="flex items-center gap-3 p-3 rounded-xl bg-surface-container-low hover:bg-surface-container transition-colors">
<div class="w-9 h-9 rounded-lg bg-surface-container-lowest flex items-center justify-center text-primary">
<span class="material-symbols-outlined text-[20px]">meeting_room</span>
</div>
<span class="font-label-sm text-label-sm font-semibold text-on-surface">Clubhouse</span>
</div>
<div class="flex items-center gap-3 p-3 rounded-xl bg-surface-container-low hover:bg-surface-container transition-colors">
<div class="w-9 h-9 rounded-lg bg-surface-container-lowest flex items-center justify-center text-primary">
<span class="material-symbols-outlined text-[20px]">security</span>
</div>
<span class="font-label-sm text-label-sm font-semibold text-on-surface">24/7 CCTV &amp; Guards</span>
</div>
<div class="flex items-center gap-3 p-3 rounded-xl bg-surface-container-low hover:bg-surface-container transition-colors">
<div class="w-9 h-9 rounded-lg bg-surface-container-lowest flex items-center justify-center text-primary">
<span class="material-symbols-outlined text-[20px]">child_care</span>
</div>
<span class="font-label-sm text-label-sm font-semibold text-on-surface">Children Play Park</span>
</div>
<div class="flex items-center gap-3 p-3 rounded-xl bg-surface-container-low hover:bg-surface-container transition-colors">
<div class="w-9 h-9 rounded-lg bg-surface-container-lowest flex items-center justify-center text-primary">
<span class="material-symbols-outlined text-[20px]">directions_run</span>
</div>
<span class="font-label-sm text-label-sm font-semibold text-on-surface">Jogging Track</span>
</div>
<div class="flex items-center gap-3 p-3 rounded-xl bg-surface-container-low hover:bg-surface-container transition-colors">
<div class="w-9 h-9 rounded-lg bg-surface-container-lowest flex items-center justify-center text-primary">
<span class="material-symbols-outlined text-[20px]">call</span>
</div>
<span class="font-label-sm text-label-sm font-semibold text-on-surface">Intercom Facility</span>
</div>
<div class="flex items-center gap-3 p-3 rounded-xl bg-surface-container-low hover:bg-surface-container transition-colors">
<div class="w-9 h-9 rounded-lg bg-surface-container-lowest flex items-center justify-center text-primary">
<span class="material-symbols-outlined text-[20px]">bolt</span>
</div>
<span class="font-label-sm text-label-sm font-semibold text-on-surface">100% Power Backup</span>
</div>
<div class="flex items-center gap-3 p-3 rounded-xl bg-surface-container-low hover:bg-surface-container transition-colors">
<div class="w-9 h-9 rounded-lg bg-surface-container-lowest flex items-center justify-center text-primary">
<span class="material-symbols-outlined text-[20px]">water_drop</span>
</div>
<span class="font-label-sm text-label-sm font-semibold text-on-surface">Rainwater Harvest</span>
</div>
<div class="flex items-center gap-3 p-3 rounded-xl bg-surface-container-low hover:bg-surface-container transition-colors">
<div class="w-9 h-9 rounded-lg bg-surface-container-lowest flex items-center justify-center text-primary">
<span class="material-symbols-outlined text-[20px]">garage_home</span>
</div>
<span class="font-label-sm text-label-sm font-semibold text-on-surface">Reserved Covered Parking</span>
</div>
<div class="flex items-center gap-3 p-3 rounded-xl bg-surface-container-low hover:bg-surface-container transition-colors">
<div class="w-9 h-9 rounded-lg bg-surface-container-lowest flex items-center justify-center text-primary">
<span class="material-symbols-outlined text-[20px]">sports_tennis</span>
</div>
<span class="font-label-sm text-label-sm font-semibold text-on-surface">Squash Court</span>
</div>
<div class="flex items-center gap-3 p-3 rounded-xl bg-surface-container-low hover:bg-surface-container transition-colors">
<div class="w-9 h-9 rounded-lg bg-surface-container-lowest flex items-center justify-center text-primary">
<span class="material-symbols-outlined text-[20px]">ev_station</span>
</div>
<span class="font-label-sm text-label-sm font-semibold text-on-surface">EV Charging Bays</span>
</div>
</div>
</section>
<!-- 4. Floor Plan & Unit Layout Section -->
<section class="bg-surface-container-lowest rounded-2xl p-gutter-lg shadow-sm space-y-4">
<div class="flex flex-col sm:flex-row sm:items-center justify-between gap-2">
<div>
<h2 class="font-headline-lg text-headline-lg text-on-surface font-bold">Floor Plan &amp; Spatial Layout</h2>
<p class="font-body-sm text-body-sm text-on-surface-variant">Carefully proportioned ${property.bedrooms} BHK layout designed for maximum natural sunlight and spatial efficiency</p>
</div>
<div class="flex items-center gap-2">
<button class="px-3 py-1.5 rounded-lg bg-primary-container text-on-primary font-label-sm text-label-sm font-semibold flex items-center gap-1 shadow-sm">
<span class="material-symbols-outlined text-[16px]">view_in_ar</span> View 3D Plan
              </button>
</div>
</div>
<!-- Floorplan Interactive Card -->
<div class="grid grid-cols-1 md:grid-cols-12 gap-4 items-center bg-surface-container-low p-4 rounded-xl">
<div class="md:col-span-7 relative group cursor-pointer overflow-hidden rounded-lg bg-surface-container-lowest p-2 shadow-inner">
<img class="w-full h-64 object-contain mx-auto group-hover:scale-105 transition-transform duration-300" alt="${property.title} Architectural Plan" src="https://lh3.googleusercontent.com/aida-public/AB6AXuASVHK5IWzl9uwRV2MQVBHR8_PJ9qzGY9hPrN63uCeanCJ9nmsJtTcvDNyvTe_YAgS3Uk0LBvW8pOZKPxfQIix80LTUCS02-1HSfOn007eRT_91CsEpVI1Q3Vw238tPn2ebDJoWpP1nTjczgqs_ULuOuqDXvVDMNJRNZdqV7IoH5GeIamg68EvxIM2-I4jxc9vyfFI8Fje4gRiUhV8-zz141cC2gbrcCFx-UvNK5wvypVjkghoyqKZW-w"/>
<div class="absolute bottom-2 right-2 bg-inverse-surface/80 text-surface-bright font-caption text-caption px-2 py-1 rounded flex items-center gap-1">
<span class="material-symbols-outlined text-[14px]">zoom_in</span> Click to Enlarge
              </div>
</div>
<div class="md:col-span-5 space-y-3">
<h3 class="font-label-md text-label-md font-bold text-on-surface">Room Specs & Dimensions</h3>
<div class="space-y-2 font-body-sm text-body-sm">
<div class="flex items-center justify-between p-2 rounded-lg bg-surface-container-lowest">
<span class="text-on-surface-variant">Carpet Area</span>
<span class="font-bold text-on-surface">${property.areaSqft} sq.ft</span>
</div>
<div class="flex items-center justify-between p-2 rounded-lg bg-surface-container-lowest">
<span class="text-on-surface-variant">Bedrooms</span>
<span class="font-bold text-on-surface">${property.bedrooms} BHK</span>
</div>
<div class="flex items-center justify-between p-2 rounded-lg bg-surface-container-lowest">
<span class="text-on-surface-variant">Bathrooms</span>
<span class="font-bold text-on-surface">${property.bathrooms} Baths</span>
</div>
<div class="flex items-center justify-between p-2 rounded-lg bg-surface-container-lowest">
<span class="text-on-surface-variant">Furnishing</span>
<span class="font-bold text-on-surface">${property.furnishing}</span>
</div>
<div class="flex items-center justify-between p-2 rounded-lg bg-surface-container-lowest">
<span class="text-on-surface-variant">Property Type</span>
<span class="font-bold text-on-surface">${property.categoryName}</span>
</div>
</div>
</div>
</div>
</section>
<!-- 5. Locality & Commute Map Section -->
<section class="bg-surface-container-lowest rounded-2xl p-gutter-lg shadow-sm space-y-4" id="localitySection">
<div class="flex flex-col sm:flex-row sm:items-center justify-between gap-2">
<div>
<h2 class="font-headline-lg text-headline-lg text-on-surface font-bold">Locality &amp; Commute Map</h2>
<p class="font-body-sm text-body-sm text-on-surface-variant">${property.title} • ${property.location}, ${property.city}</p>
</div>
<a class="font-label-sm text-label-sm font-semibold text-tertiary-fixed bg-tertiary-container hover:bg-tertiary px-3.5 py-1.5 rounded-full flex items-center gap-1.5 transition-colors shadow-xs"
   target="_blank"
   href="https://www.google.com/maps/dir/?api=1&destination=${fn:escapeXml(property.location)}+${fn:escapeXml(property.city)}">
  <span class="material-symbols-outlined text-base">directions</span>
  <span>Open Google Maps Directions</span>
</a>
</div>
<!-- Interactive Leaflet Map Container -->
<div class="w-full h-80 rounded-xl relative shadow-sm border border-outline-variant/30 overflow-hidden z-0" id="propertyDetailMap"></div>

<script>
  document.addEventListener("DOMContentLoaded", function() {
    var detailMapElem = document.getElementById('propertyDetailMap');
    if (!detailMapElem) return;

    var locCoords = {
      "kurla": [19.0728, 72.8826],
      "premiere": [19.0750, 72.8850],
      "al barkat": [19.0740, 72.8830],
      "andheri": [19.1197, 72.8464],
      "bandra": [19.0596, 72.8295],
      "powai": [19.1176, 72.9060],
      "mumbai": [19.0760, 72.8777],
      "bangalore": [12.9716, 77.5946],
      "pune": [18.5204, 73.8567],
      "hyderabad": [17.3850, 78.4867],
      "gurgaon": [28.4595, 77.0266]
    };

    var targetLat = 19.0760;
    var targetLng = 72.8777;
    var locText = ("${property.location}" + " " + "${property.city}" + " " + "${property.title}").toLowerCase();

    for (var k in locCoords) {
      if (locText.indexOf(k) !== -1) {
        targetLat = locCoords[k][0];
        targetLng = locCoords[k][1];
        break;
      }
    }

    var detailMap = L.map('propertyDetailMap').setView([targetLat, targetLng], 14);
    L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
      maxZoom: 19,
      attribution: '© OpenStreetMap'
    }).addTo(detailMap);

    // Detect User GPS location and place "My Location" marker
    if (navigator.geolocation) {
      navigator.geolocation.getCurrentPosition(function(pos) {
        var uLat = pos.coords.latitude;
        var uLng = pos.coords.longitude;
        var myIcon = L.divIcon({
          className: 'user-gps-marker',
          html: '<div style="background:#00503a; color:white; border:2px solid white; border-radius:12px; padding:4px 8px; font-size:10px; font-weight:800; box-shadow:0 2px 6px rgba(0,0,0,0.3);">📍 My Location</div>',
          iconSize: [90, 25]
        });
        L.marker([uLat, uLng], { icon: myIcon }).addTo(detailMap).bindPopup("<b>Your Current Location</b>");
      }, function() {});
    }

    var gMapsDirUrl = "https://www.google.com/maps/dir/?api=1&destination=" + encodeURIComponent("${property.location} ${property.city}");

    var marker = L.marker([targetLat, targetLng]).addTo(detailMap);
    marker.bindPopup(
      '<div style="font-family: Inter, sans-serif; padding: 4px;">' +
      '  <div style="font-weight: 700; font-size: 13px; color: #450081;">${property.title}</div>' +
      '  <div style="font-weight: 800; font-size: 14px; color: #181c23; margin-top: 2px;">₹ ${property.price}</div>' +
      '  <div style="font-size: 11px; color: #4b4452; margin-top: 2px; margin-bottom: 6px;">📍 ${property.location}, ${property.city}</div>' +
      '  <a href="' + gMapsDirUrl + '" target="_blank" style="display:block; text-align: center; background: #00503a; color: white; padding: 5px 8px; border-radius: 6px; text-decoration: none; font-size: 11px; font-weight: 700;">Get Directions on Google Maps</a>' +
      '</div>'
    ).openPopup();
  });
</script>
<!-- Nearby Key Landmarks Grid -->
<div class="grid grid-cols-2 md:grid-cols-4 gap-3 pt-2">
<div class="p-3 rounded-xl bg-surface-container-low flex items-start gap-2.5">
<span class="material-symbols-outlined text-[20px] text-primary mt-0.5">flight_takeoff</span>
<div>
<p class="font-label-sm text-label-sm font-semibold text-on-surface">${property.city} Airport / Transit</p>
<p class="font-caption text-caption text-on-surface-variant">Nearby Connectivity</p>
</div>
</div>
<div class="p-3 rounded-xl bg-surface-container-low flex items-start gap-2.5">
<span class="material-symbols-outlined text-[20px] text-primary mt-0.5">alt_route</span>
<div>
<p class="font-label-sm text-label-sm font-semibold text-on-surface">${property.location} Main Highway</p>
<p class="font-caption text-caption text-on-surface-variant">Fast Arterial Access</p>
</div>
</div>
<div class="p-3 rounded-xl bg-surface-container-low flex items-start gap-2.5">
<span class="material-symbols-outlined text-[20px] text-primary mt-0.5">local_hospital</span>
<div>
<p class="font-label-sm text-label-sm font-semibold text-on-surface">${property.city} Multi-Specialty Hospital</p>
<p class="font-caption text-caption text-on-surface-variant">5-10 mins distance</p>
</div>
</div>
<div class="p-3 rounded-xl bg-surface-container-low flex items-start gap-2.5">
<span class="material-symbols-outlined text-[20px] text-primary mt-0.5">shopping_bag</span>
<div>
<p class="font-label-sm text-label-sm font-semibold text-on-surface">${property.location} Shopping Hub</p>
<p class="font-caption text-caption text-on-surface-variant">Retail & Market Area</p>
</div>
</div>
</div>
</section>
<!-- 6. Price Trends & Local Insights -->
<section class="bg-surface-container-lowest rounded-2xl p-gutter-lg shadow-sm space-y-4">
<div class="flex items-center justify-between">
<div>
<h2 class="font-headline-lg text-headline-lg text-on-surface font-bold">Price Trends in ${property.location}, ${property.city}</h2>
<p class="font-body-sm text-body-sm text-on-surface-variant">Historical quarterly capital values for ${property.categoryName} listings</p>
</div>
<span class="px-3 py-1 rounded-full bg-tertiary-container text-tertiary-fixed font-label-sm text-label-sm font-bold flex items-center gap-1">
<span class="material-symbols-outlined text-[16px]">trending_up</span> Verified Locality Market
            </span>
</div>
<!-- Trend Bar Chart Data Visualisation (Inline SVG <2KB) -->
<div class="p-4 rounded-xl bg-surface-container-low">
<div class="flex items-end justify-between gap-3 h-36 pt-4 pb-2 px-2">
<div class="flex flex-col items-center gap-1 flex-1">
<span class="font-caption text-[10px] text-on-surface-variant">Q1</span>
<div class="w-full max-w-[40px] bg-outline-variant/60 rounded-t-md h-[68%] transition-all hover:bg-primary"></div>
<span class="font-caption text-[11px] text-on-surface-variant">Q1</span>
</div>
<div class="flex flex-col items-center gap-1 flex-1">
<span class="font-caption text-[10px] text-on-surface-variant">Q2</span>
<div class="w-full max-w-[40px] bg-outline-variant/60 rounded-t-md h-[74%] transition-all hover:bg-primary"></div>
<span class="font-caption text-[11px] text-on-surface-variant">Q2</span>
</div>
<div class="flex flex-col items-center gap-1 flex-1">
<span class="font-caption text-[10px] text-on-surface-variant">Q3</span>
<div class="w-full max-w-[40px] bg-outline-variant/60 rounded-t-md h-[82%] transition-all hover:bg-primary"></div>
<span class="font-caption text-[11px] text-on-surface-variant">Q3</span>
</div>
<div class="flex flex-col items-center gap-1 flex-1">
<span class="font-caption text-[10px] text-on-surface-variant">Q4</span>
<div class="w-full max-w-[40px] bg-outline-variant/60 rounded-t-md h-[88%] transition-all hover:bg-primary"></div>
<span class="font-caption text-[11px] text-on-surface-variant">Q4</span>
</div>
<div class="flex flex-col items-center gap-1 flex-1">
<span class="font-caption text-[10px] font-bold text-primary">Current</span>
<div class="w-full max-w-[40px] bg-primary rounded-t-md h-[95%] shadow-sm"></div>
<span class="font-caption text-[11px] font-bold text-primary">Current</span>
</div>
</div>
<div class="flex flex-wrap items-center justify-between text-caption font-caption text-on-surface-variant pt-3 border-t border-surface-container-high">
<span>Locality Benchmark: <strong>${property.location}, ${property.city}</strong></span>
<span>Listing Price: <strong>₹ ${property.price}</strong></span>
</div>
</div>
</section>
</div>
<!-- RIGHT COLUMN (30% - 4 cols, Sticky Sidebar) -->
<aside class="lg:col-span-4 sticky top-20 space-y-4">
<!-- Sticky Seller Contact Card -->
<div class="bg-surface-container-lowest rounded-2xl p-gutter-lg shadow-md space-y-gutter-md">
<!-- Seller Identity Strip -->
<div class="flex items-center gap-3.5 pb-3 border-b border-surface-container-high">
<div class="w-12 h-12 rounded-full bg-primary-container text-on-primary flex items-center justify-center font-bold text-lg shrink-0 shadow-sm">
  ${property.ownerName.substring(0, 1).toUpperCase()}
</div>
<div class="min-w-0 flex-1">
<div class="flex items-center gap-1.5 flex-wrap">
<span class="font-headline-sm text-headline-sm font-bold text-on-surface truncate">${property.ownerName}</span>
<span class="material-symbols-outlined text-primary text-[18px]" title="Verified Listing Owner">verified</span>
</div>
<p class="font-caption text-caption text-on-surface-variant">Property Listing Owner</p>
<p class="font-caption text-[11px] text-outline truncate">${property.ownerEmail}</p>
</div>
</div>
<!-- Phone Number Reveal Primary Action Button -->
<div>
<button class="w-full py-3 px-4 rounded-xl bg-secondary-container hover:bg-secondary text-on-secondary font-label-md text-label-md font-bold flex items-center justify-center gap-2 shadow-md transition-all active:scale-95" id="showPhoneBtn">
<span class="material-symbols-outlined text-[20px]">call</span>
<span id="phoneLabel">View Owner Contact Number</span>
</button>
<p class="hidden text-center mt-2 font-headline-sm text-headline-sm text-primary font-extrabold bg-primary-fixed py-2 rounded-lg" id="revealedPhone">
  ${not empty property.ownerPhone ? property.ownerPhone : '+91 9876543210'}
</p>
</div>
<!-- Contact Agent Form -->
<form class="space-y-3 pt-2" id="inquiryForm" action="${pageContext.request.contextPath}/inquiries" method="POST">
<input type="hidden" name="propertyId" value="${property.propertyId}" />
<div class="space-y-1">
<label class="font-caption text-caption text-on-surface-variant font-semibold" for="contactPhone">Contact Mobile</label>
<div class="flex gap-2">
<span class="h-11 px-3 rounded-lg bg-surface-container-low flex items-center justify-center font-label-sm text-label-sm font-semibold text-on-surface-variant">+91</span>
<input class="w-full h-11 px-3 rounded-lg bg-surface-container-low text-on-surface font-body-md text-body-md focus:outline-none focus:bg-surface-container-lowest transition-colors" id="contactPhone" name="contactPhone" pattern="[0-9]{10}" placeholder="98765 43210" required="" type="tel" value="${sessionScope.currentUser.phone}" />
</div>
</div>
<div class="space-y-1">
<label class="font-caption text-caption text-on-surface-variant font-semibold" for="message">Message</label>
<textarea class="w-full h-24 px-3 py-2 rounded-lg bg-surface-container-low text-on-surface font-body-md text-body-md focus:outline-none focus:bg-surface-container-lowest transition-colors" id="message" name="message" placeholder="I am interested in this property..." required=""></textarea>
</div>
<button class="w-full py-3 px-4 rounded-xl bg-primary-container hover:bg-primary text-on-primary font-label-md text-label-md font-bold flex items-center justify-center gap-2 shadow-md transition-all active:scale-95" type="submit">
<span class="material-symbols-outlined text-[18px]">send</span>
<span>Send Inquiry</span>
</button>
</form>
<!-- Instant WhatsApp Connect Pill Button -->
<a class="w-full py-2.5 px-4 rounded-xl bg-tertiary-container/20 hover:bg-tertiary-container/30 text-tertiary-fixed-variant font-label-md text-label-md font-bold flex items-center justify-center gap-2 transition-colors mt-2" 
   href="${whatsappUrl}" target="_blank">
<span class="material-symbols-outlined text-[20px] text-tertiary-fixed-variant">chat</span>
<span>Instant WhatsApp Chat</span>
</a>
</div>
<!-- Trust Badges Strip -->
<div class="pt-3 border-t border-surface-container-high space-y-2 font-caption text-caption text-on-surface-variant">
<div class="flex items-center gap-2">
<span class="material-symbols-outlined text-[16px] text-tertiary-fixed-variant">verified_user</span>
<span><strong>SafeVisit Verified:</strong> Clean sanitizer &amp; gated entry</span>
</div>
<div class="flex items-center gap-2">
<span class="material-symbols-outlined text-[16px] text-primary">lock_clock</span>
<span>Zero Spam Guarantee: Your data is never shared</span>
</div>
<div class="flex items-center gap-2">
<span class="material-symbols-outlined text-[16px] text-secondary">handshake</span>
<span>No Brokerage Guarantee on direct builder lots</span>
</div>
</div>
</div>
<!-- Secondary Floating Advice / Assistance Card -->
<div class="bg-surface-container-low rounded-2xl p-4 flex items-center gap-3">
<div class="w-10 h-10 rounded-full bg-primary-fixed flex items-center justify-center text-on-primary-fixed shrink-0">
<span class="material-symbols-outlined text-[20px]">support_agent</span>
</div>
<div class="min-w-0">
<p class="font-label-sm text-label-sm font-bold text-on-surface">Need Home Loan Assistance?</p>
<p class="font-caption text-caption text-on-surface-variant">Rates starting at 8.4% with HDFC &amp; ICICI</p>
</div>
<button class="ml-auto px-2.5 py-1 rounded bg-surface-container-lowest text-primary font-caption text-caption font-bold hover:bg-surface-container-high transition-colors">
            Apply
          </button>
</div>
</aside>
</div>
<!-- Related Similar Properties Recommendation Rail -->
<section class="mt-gutter-xl pt-gutter-lg border-t border-surface-container-high space-y-gutter-md">
<div class="flex items-center justify-between">
<div>
<h2 class="font-headline-xl text-headline-xl text-on-surface font-bold">Recommended Properties in ${property.location}, ${property.city}</h2>
<p class="font-body-md text-body-md text-on-surface-variant">Handpicked listings available in this exact locality and nearby area</p>
</div>
<a class="font-label-md text-label-md text-primary font-bold hover:underline flex items-center gap-1" href="${pageContext.request.contextPath}/search?keyword=${property.location}">
<span>View All in ${property.location}</span>
<span class="material-symbols-outlined text-[16px]">chevron_right</span>
</a>
</div>
<div class="grid grid-cols-1 md:grid-cols-3 lg:grid-cols-4 gap-gutter-md">
<c:forEach items="${similarProperties}" var="sp">
<div class="bg-surface-container-lowest rounded-2xl overflow-hidden shadow-sm hover:shadow-md transition-shadow group flex flex-col border border-outline-variant/30">
<div class="relative h-48 overflow-hidden bg-surface-container">
<img class="w-full h-full object-cover group-hover:scale-105 transition-transform duration-300" src="${sp.primaryImageUrl}" alt="${sp.title}" />
<span class="absolute top-3 left-3 bg-tertiary-container text-tertiary-fixed font-caption text-caption px-2.5 py-0.5 rounded-full font-semibold flex items-center gap-1">
<span class="material-symbols-outlined text-[13px]">location_on</span> Locality Match
</span>
</div>
<div class="p-4 space-y-2 flex-1 flex flex-col justify-between">
<div>
<div class="flex items-baseline justify-between mb-1">
<span class="font-headline-md text-headline-md font-bold text-on-surface">₹ ${sp.price}</span>
<span class="text-[10px] font-bold text-primary uppercase">${sp.purpose}</span>
</div>
<h3 class="font-label-md text-label-md font-bold text-on-surface truncate group-hover:text-primary transition-colors">
<a href="${pageContext.request.contextPath}/property/details?id=${sp.propertyId}">${sp.title}</a>
</h3>
<p class="font-caption text-caption text-on-surface-variant flex items-center gap-1 mt-0.5 truncate">
<span class="material-symbols-outlined text-[14px] text-primary">location_on</span> ${sp.location}, ${sp.city}
</p>
<div class="flex items-center gap-2 pt-2 text-on-surface font-caption text-caption">
<span><strong>${sp.bedrooms}</strong> Beds</span>
<span>•</span>
<span><strong>${sp.areaSqft}</strong> sq.ft</span>
<span>•</span>
<span class="truncate"><strong>${sp.categoryName}</strong></span>
</div>
</div>
<a href="${pageContext.request.contextPath}/property/details?id=${sp.propertyId}" class="w-full mt-3 py-2 rounded-lg bg-surface-container-low hover:bg-primary hover:text-on-primary font-label-sm text-label-sm font-semibold text-primary transition-colors text-center block">
View Details
</a>
</div>
</div>
</c:forEach>
</div>
</section>
</div>
<script>
    // Reveal phone number interaction
    const showPhoneBtn = document.getElementById('showPhoneBtn');
    const revealedPhone = document.getElementById('revealedPhone');
    if (showPhoneBtn && revealedPhone) {
      showPhoneBtn.addEventListener('click', () => {
        showPhoneBtn.classList.add('hidden');
        revealedPhone.classList.remove('hidden');
      });
    }

    // Favorite heart toggle micro-interaction
    const favBtn = document.getElementById('favBtn');
    const heartIcon = document.getElementById('heartIcon');
    const favText = document.getElementById('favText');
    let isSaved = false;
    if (favBtn && heartIcon && favText) {
      favBtn.addEventListener('click', () => {
        isSaved = !isSaved;
        if (isSaved) {
          heartIcon.textContent = 'favorite';
          heartIcon.style.fontVariationSettings = "'FILL' 1";
          favText.textContent = 'Saved';
          favBtn.classList.add('bg-secondary-fixed');
        } else {
          heartIcon.textContent = 'favorite_border';
          heartIcon.style.fontVariationSettings = "'FILL' 0";
          favText.textContent = 'Save';
          favBtn.classList.remove('bg-secondary-fixed');
        }
      });
    }

    // Share alert simple feedback
    const shareBtn = document.getElementById('shareBtn');
    if (shareBtn) {
      shareBtn.addEventListener('click', () => {
        if (navigator.clipboard) {
          navigator.clipboard.writeText(window.location.href);
          const orig = shareBtn.innerHTML;
          shareBtn.innerHTML = '<span class="material-symbols-outlined text-[16px] text-tertiary-fixed-variant">done</span><span class="hidden sm:inline text-tertiary-fixed-variant font-bold">Copied!</span>';
          setTimeout(() => { shareBtn.innerHTML = orig; }, 2000);
        }
      });
    }
  </script>
</div></main><footer class="w-full bg-inverse-surface text-inverse-on-surface pt-gutter-2xl pb-gutter-xl"><div class="max-w-container-max mx-auto px-gutter-lg"><div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-gutter-xl mb-gutter-2xl"><div class="space-y-gutter-md"><div class="flex items-center gap-2"><img alt="EstateHub Logo" class="h-8 w-auto object-contain brightness-200" src="https://lh3.googleusercontent.com/aida/AEtjO1Xg4rP1x__tmUvhhUEeM-xIYBlSjyhgL-aDvDihhuMxD0bc_kL9kHorsRYR5EvM9wdONnfScP46YL0QssDo1Yzd9XXTo1GpuWC9c1SGhoiGFmbBZZ-L95_tHf_7u7-NnrWpEVNDa3KKfH1MN1eMtrk2ZiwZGYM9sKA4zxHHA9vupb767aMCr2J7zivaAtyK3ypPdo3ZJ1n88WJ1YI5TA-loMe151e9ACRfxjid8X1QrA8mUitrWMg5qDMA"/><span class="font-headline-md text-headline-md text-surface-container-lowest tracking-tight">EstateHub</span></div><p class="font-body-sm text-body-sm text-surface-variant max-w-xs">India's trusted real estate portal for verified homes, apartments, and commercial spaces.</p><div class="pt-gutter-xs flex items-center gap-gutter-sm"><span class="flex items-center gap-1 bg-tertiary-container text-tertiary-fixed font-caption text-caption px-2.5 py-1 rounded-full"><span class="material-symbols-outlined text-[14px]">verified</span> 100% RERA Verified</span></div></div><div class="space-y-gutter-sm"><h3 class="font-label-md text-label-md text-surface-container-lowest uppercase tracking-wider">Popular Searches</h3><ul class="space-y-2 font-body-sm text-body-sm text-surface-variant"><li><a class="hover:text-surface-bright transition-colors" data-path="rent-properties" href="javascript:void(0)">Flats in Mumbai</a></li><li><a class="hover:text-surface-bright transition-colors" data-path="buy-properties" href="javascript:void(0)">Flats in Bangalore</a></li><li><a class="hover:text-surface-bright transition-colors" data-path="new-projects" href="javascript:void(0)">Apartments in Gurgaon</a></li><li><a class="hover:text-surface-bright transition-colors" data-path="buy-properties" href="javascript:void(0)">Villas in Hyderabad</a></li><li><a class="hover:text-surface-bright transition-colors" data-path="commercial-spaces" href="javascript:void(0)">Offices in Pune</a></li></ul></div><div class="space-y-gutter-sm"><h3 class="font-label-md text-label-md text-surface-container-lowest uppercase tracking-wider">Quick Links</h3><ul class="space-y-2 font-body-sm text-body-sm text-surface-variant"><li><a class="hover:text-surface-bright transition-colors" data-path="about-us" href="javascript:void(0)">About Us</a></li><li><a class="hover:text-surface-bright transition-colors" data-path="careers" href="javascript:void(0)">Careers</a></li><li><a class="hover:text-surface-bright transition-colors" data-path="research-insights" href="javascript:void(0)">Research &amp; Insights</a></li><li><a class="hover:text-surface-bright transition-colors" data-path="contact-support" href="javascript:void(0)">Contact Support</a></li><li><a class="hover:text-surface-bright transition-colors" data-path="terms-privacy" href="javascript:void(0)">Terms &amp; Privacy</a></li></ul></div><div class="space-y-gutter-md"><h3 class="font-label-md text-label-md text-surface-container-lowest uppercase tracking-wider">Experience on Mobile</h3><p class="font-body-sm text-body-sm text-surface-variant">Download EstateHub App for instant notifications and direct agent chats.</p><div class="flex flex-col gap-2"><div class="flex items-center gap-3 px-3 py-2 rounded-lg bg-surface-container-high/10 hover:bg-surface-container-high/20 text-surface-bright transition-colors cursor-pointer"><span class="material-symbols-outlined text-primary-fixed">play_arrow</span><div class="text-left"><p class="font-caption text-[10px] text-surface-variant uppercase">GET IT ON</p><p class="font-label-sm text-label-sm font-semibold">Google Play</p></div></div><div class="flex items-center gap-3 px-3 py-2 rounded-lg bg-surface-container-high/10 hover:bg-surface-container-high/20 text-surface-bright transition-colors cursor-pointer"><span class="material-symbols-outlined text-primary-fixed">install_mobile</span><div class="text-left"><p class="font-caption text-[10px] text-surface-variant uppercase">DOWNLOAD ON</p><p class="font-label-sm text-label-sm font-semibold">App Store</p></div></div></div></div></div><div class="pt-gutter-lg mt-gutter-xl border-t border-outline/20 flex flex-col md:flex-row items-center justify-between gap-gutter-md font-caption text-caption text-surface-variant"><div>© 2025 EstateHub Technologies Private Limited. All rights reserved.</div><div class="flex items-center gap-gutter-xs text-surface-dim"><span class="material-symbols-outlined text-tertiary-fixed text-[16px]">shield</span><span>Made with trust for home seekers across India</span></div></div></div></footer></body></html>