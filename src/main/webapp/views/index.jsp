<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>

<html lang="en"><head><meta charset="utf-8"/><meta content="width=device-width, initial-scale=1.0" name="viewport"/><title>EstateHub</title><link href="https://fonts.googleapis.com" rel="preconnect"/><link crossorigin="" href="https://fonts.gstatic.com" rel="preconnect"/><link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&amp;family=Plus+Jakarta+Sans:wght@600;700;800&amp;display=swap" rel="stylesheet"/><link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" rel="stylesheet"/>
<link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&amp;display=swap" rel="stylesheet"/><style>@layer base { html, body { margin: 0; padding: 0; } body { overscroll-behavior: none; } main > :first-child { margin-top: 0 !important; } main > :last-child { margin-bottom: 0 !important; } } ::-webkit-scrollbar { display: none; }</style><script src="https://cdn.tailwindcss.com"></script><script id="tailwind-config">tailwind.config = { darkMode: "class", theme: { extend: { "colors": { "on-tertiary-fixed-variant": "#00513b", "on-primary": "#ffffff", "outline": "#7d7483", "surface-bright": "#f9f9ff", "surface-dim": "#d7dae3", "surface-container-high": "#e5e8f2", "tertiary-fixed": "#71fac8", "surface-container-lowest": "#ffffff", "outline-variant": "#cec3d4", "on-primary-fixed": "#2a0053", "background": "#f9f9ff", "secondary-container": "#ff5a5f", "on-background": "#181c23", "secondary-fixed": "#ffdad8", "error": "#ba1a1a", "on-tertiary": "#ffffff", "primary": "#450081", "surface-container-low": "#f1f3fd", "on-primary-fixed-variant": "#5f259e", "surface-container-highest": "#dfe2ec", "tertiary-fixed-dim": "#50ddad", "secondary": "#b52330", "secondary-fixed-dim": "#ffb3b0", "primary-fixed": "#eedbff", "on-secondary-container": "#60000e", "on-secondary-fixed-variant": "#92001b", "on-secondary-fixed": "#410007", "inverse-surface": "#2d3138", "on-surface": "#181c23", "on-error-container": "#93000a", "surface-container": "#ebeef7", "surface-tint": "#7841b8", "primary-container": "#5e239d", "on-tertiary-fixed": "#002116", "on-secondary": "#ffffff", "on-tertiary-container": "#36ca9b", "on-primary-container": "#cca0ff", "inverse-on-surface": "#eef0fa", "tertiary-container": "#00503a", "error-container": "#ffdad6", "surface-variant": "#dfe2ec", "tertiary": "#003727", "on-surface-variant": "#4b4452", "on-error": "#ffffff", "surface": "#f9f9ff", "inverse-primary": "#dab9ff", "primary-fixed-dim": "#dab9ff" }, "borderRadius": { "DEFAULT": "0.25rem", "lg": "0.5rem", "xl": "0.75rem", "full": "9999px" }, "spacing": { "container-max": "1280px", "gutter-sm": "0.5rem", "search-bar-height": "4rem", "gutter-xs": "0.25rem", "gutter-2xl": "3rem", "gutter-lg": "1.5rem", "gutter-md": "1rem", "gutter-xl": "2rem" }, "fontFamily": { "caption": [ "Inter" ], "body-sm": [ "Inter" ], "label-md": [ "Plus Jakarta Sans" ], "headline-xl-mobile": [ "Plus Jakarta Sans" ], "headline-lg": [ "Plus Jakarta Sans" ], "body-lg": [ "Inter" ], "body-md": [ "Inter" ], "headline-xl": [ "Plus Jakarta Sans" ], "headline-sm": [ "Plus Jakarta Sans" ], "display-hero-mobile": [ "Plus Jakarta Sans" ], "headline-md": [ "Plus Jakarta Sans" ], "display-hero": [ "Plus Jakarta Sans" ], "label-sm": [ "Plus Jakarta Sans" ] }, "fontSize": { "caption": [ "11px", { "lineHeight": "14px", "letterSpacing": "0.02em", "fontWeight": "500" } ], "body-sm": [ "12px", { "lineHeight": "18px", "letterSpacing": "0.005em", "fontWeight": "400" } ], "label-md": [ "14px", { "lineHeight": "20px", "letterSpacing": "0.01em", "fontWeight": "600" } ], "headline-xl-mobile": [ "24px", { "lineHeight": "32px", "letterSpacing": "-0.015em", "fontWeight": "700" } ], "headline-lg": [ "24px", { "lineHeight": "32px", "letterSpacing": "-0.015em", "fontWeight": "700" } ], "body-lg": [ "16px", { "lineHeight": "26px", "letterSpacing": "-0.005em", "fontWeight": "400" } ], "body-md": [ "14px", { "lineHeight": "22px", "letterSpacing": "0", "fontWeight": "400" } ], "headline-xl": [ "32px", { "lineHeight": "40px", "letterSpacing": "-0.02em", "fontWeight": "700" } ], "headline-sm": [ "16px", { "lineHeight": "24px", "letterSpacing": "0", "fontWeight": "600" } ], "display-hero-mobile": [ "30px", { "lineHeight": "38px", "letterSpacing": "-0.02em", "fontWeight": "800" } ], "headline-md": [ "20px", { "lineHeight": "28px", "letterSpacing": "-0.01em", "fontWeight": "600" } ], "display-hero": [ "44px", { "lineHeight": "54px", "letterSpacing": "-0.025em", "fontWeight": "800" } ], "label-sm": [ "12px", { "lineHeight": "16px", "letterSpacing": "0.02em", "fontWeight": "600" } ] } } } };</script></head><body class="bg-background font-body-md text-on-surface antialiased min-h-screen flex flex-col"><header class="sticky top-0 z-50 w-full bg-surface-container-lowest shadow-[0_2px_12px_rgba(0,0,0,0.06)]"><div class="h-16 max-w-container-max mx-auto px-gutter-lg flex items-center justify-between gap-gutter-md"><div class="flex items-center gap-gutter-lg"><a class="flex items-center gap-gutter-xs" data-path="explore-homes" href="javascript:void(0)"><img alt="EstateHub Logo" class="h-8 w-auto object-contain" src="https://lh3.googleusercontent.com/aida/AEtjO1Xg4rP1x__tmUvhhUEeM-xIYBlSjyhgL-aDvDihhuMxD0bc_kL9kHorsRYR5EvM9wdONnfScP46YL0QssDo1Yzd9XXTo1GpuWC9c1SGhoiGFmbBZZ-L95_tHf_7u7-NnrWpEVNDa3KKfH1MN1eMtrk2ZiwZGYM9sKA4zxHHA9vupb767aMCr2J7zivaAtyK3ypPdo3ZJ1n88WJ1YI5TA-loMe151e9ACRfxjid8X1QrA8mUitrWMg5qDMA"/><span class="font-headline-md text-headline-md text-primary-container tracking-tight">EstateHub</span></a><div class="hidden sm:flex items-center gap-gutter-xs px-3 py-1.5 rounded-lg bg-surface-container-low hover:bg-surface-container transition-colors cursor-pointer"><span class="material-symbols-outlined text-primary text-[18px]">location_on</span><span class="font-label-sm text-label-sm text-on-surface font-semibold">Mumbai</span><span class="material-symbols-outlined text-on-surface-variant text-[16px]">expand_more</span></div></div><nav class="hidden lg:flex items-center gap-gutter-lg" data-active-classes="text-primary-container font-semibold"><a class="font-label-md text-label-md text-on-surface-variant hover:text-on-surface transition-colors" href="${pageContext.request.contextPath}/search?purpose=SALE">Buy</a><a class="font-label-md text-label-md text-on-surface-variant hover:text-on-surface transition-colors" href="${pageContext.request.contextPath}/search?purpose=RENT">Rent</a><a class="font-label-md text-label-md text-on-surface-variant hover:text-on-surface transition-colors" href="${pageContext.request.contextPath}/search?categoryId=4">Commercial</a><a class="font-label-md text-label-md text-on-surface-variant hover:text-on-surface transition-colors" href="${pageContext.request.contextPath}/search?categoryId=1">Flats / Apartments</a><a class="font-label-md text-label-md text-on-surface-variant hover:text-on-surface transition-colors" href="${pageContext.request.contextPath}/search?categoryId=6">Plots</a></nav><div class="flex items-center gap-gutter-md"><a class="relative flex items-center justify-center p-2 rounded-full hover:bg-surface-container-low text-on-surface-variant hover:text-secondary-container transition-colors" href="${pageContext.request.contextPath}/views/favorites.jsp"><span class="material-symbols-outlined text-[22px]">favorite</span><span class="absolute top-1 right-1 flex h-4 w-4 items-center justify-center rounded-full bg-secondary-container text-on-secondary font-caption text-[10px] font-bold">3</span></a><a class="flex items-center gap-2 bg-primary-container hover:bg-primary text-on-primary px-3.5 py-1.5 rounded-lg shadow-sm transition-all" href="${pageContext.request.contextPath}/views/add-property.jsp"><span class="font-label-sm text-label-sm font-semibold">Post Property</span><span class="bg-tertiary-container text-tertiary-fixed font-caption text-[10px] font-bold px-1.5 py-0.5 rounded">FREE</span></a>
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
    
<!-- HERO SECTION WITH HOUSING.COM MULTI-SEGMENTED SEARCH DOCK -->
<section class="relative w-full overflow-hidden bg-surface-container-lowest">
<!-- Cinematic architectural background banner with rich gradient scrim -->
<div class="relative w-full h-[540px] md:h-[580px] bg-cover bg-center flex items-center justify-center" data-alt="Luxurious open-concept Indian luxury apartment living room with expansive glass walls overlooking Mumbai skyline at twilight, warm ambient accent lighting, rich hardwood floor textures, sophisticated furniture, deep purple and emerald cushions, warm architectural elegance." style="background-image: url('https://lh3.googleusercontent.com/aida-public/AB6AXuDt3pd89ZIzDAwvKgcCS6tqW0-9FhNG8qDZZv3teseDxQTXeAuLHS5sjyHulUC51qHFvSuRSLo8aWJjkGGv3Y1pReN-oiz-A9i0jRfa3Px1zIy8_5Jzj51lopLfY2-IftxXoV_JAwYStYMFX3A-TIjBjn3N0cSb7B2p-12P3mWrQZme3vYXW7ILl1ALvVkXVJ6WZyLri3S9-M_BVcVpvhS1hBRJXFNmWMfmUf9IEikmTGuZ3W8h7WgJyg')">
<div class="absolute inset-0 bg-gradient-to-b from-inverse-surface/85 via-inverse-surface/65 to-inverse-surface/90"></div>
<div class="absolute inset-0 bg-gradient-to-r from-primary-container/30 via-transparent to-tertiary-container/30 mix-blend-overlay"></div>
<!-- Hero Typography and Content Envelope -->
<div class="relative z-10 max-w-container-max mx-auto px-gutter-lg w-full text-center flex flex-col items-center">
<div class="inline-flex items-center gap-2 px-3 py-1.5 rounded-full bg-surface-container-lowest/15 backdrop-blur-md text-surface-bright mb-4">
<span class="material-symbols-outlined text-tertiary-fixed text-[18px]">verified_user</span>
<span class="font-label-sm text-label-sm font-semibold tracking-wide uppercase">India's Most Trusted Property Platform</span>
</div>
<h1 class="font-display-hero text-display-hero md:text-[52px] md:leading-[60px] text-surface-bright font-extrabold max-w-3xl tracking-tight drop-shadow-sm">
          Find Your Dream Home
        </h1>
<p class="font-body-lg text-body-lg text-surface-container-high/90 mt-3 max-w-2xl text-center">
          Explore 50,000+ verified properties with direct owner listings, zero brokerage options &amp; certified RERA approvals.
        </p>
<!-- Housing.com Signature Floating Multi-Segmented Search Bar Module -->
<div class="w-full max-w-5xl mt-8 rounded-2xl bg-surface-container-lowest shadow-2xl p-2 md:p-3 text-left">
<!-- Category Rails / Tabs -->
<div class="flex items-center gap-1 border-b border-surface-container-high px-2 pb-2 overflow-x-auto no-scrollbar">
<button class="search-tab-btn px-4 py-2 rounded-lg font-label-md text-label-md font-bold text-on-primary bg-primary-container flex items-center gap-1.5 shadow-sm transition-all" data-tab="buy">
<span class="material-symbols-outlined text-[18px]">home</span>
<span>Buy</span>
</button>
<button class="search-tab-btn px-4 py-2 rounded-lg font-label-md text-label-md font-medium text-on-surface-variant hover:text-on-surface hover:bg-surface-container-low transition-colors flex items-center gap-1.5" data-tab="rent">
<span class="material-symbols-outlined text-[18px]">key</span>
<span>Rent</span>
</button>
<button class="search-tab-btn px-4 py-2 rounded-lg font-label-md text-label-md font-medium text-on-surface-variant hover:text-on-surface hover:bg-surface-container-low transition-colors flex items-center gap-1.5" data-tab="commercial">
<span class="material-symbols-outlined text-[18px]">domain</span>
<span>Commercial</span>
</button>
<button class="search-tab-btn px-4 py-2 rounded-lg font-label-md text-label-md font-medium text-on-surface-variant hover:text-on-surface hover:bg-surface-container-low transition-colors flex items-center gap-1.5" data-tab="pg">
<span class="material-symbols-outlined text-[18px]">apartment</span>
<span>PG / Co-Living</span>
</button>
<button class="search-tab-btn px-4 py-2 rounded-lg font-label-md text-label-md font-medium text-on-surface-variant hover:text-on-surface hover:bg-surface-container-low transition-colors flex items-center gap-1.5" data-tab="plots">
<span class="material-symbols-outlined text-[18px]">landscape</span>
<span>Plots</span>
</button>
</div>
<!-- Segments Form Body -->
<form action="${pageContext.request.contextPath}/search" method="GET" class="grid grid-cols-1 lg:grid-cols-12 gap-2 mt-2.5 items-center">
<!-- Segment 1: City & Locality with Icon -->
<div class="lg:col-span-5 flex items-center gap-2 px-3 py-2 bg-surface-container-low rounded-xl">
<div class="flex items-center gap-1 text-primary pr-2 border-r border-outline-variant">
<span class="material-symbols-outlined text-[20px]">location_on</span>
</div>
<input name="keyword" id="heroSearchInput" class="w-full bg-transparent font-body-sm text-body-sm text-on-surface placeholder:text-on-surface-variant/70 focus:outline-none py-1.5" placeholder="Search City, Locality, or Project..." type="text"/>
<button type="button" onclick="promptGPSLocation()" title="Detect My Current GPS Location" class="px-2.5 py-1 rounded-lg bg-primary/10 hover:bg-primary/20 text-primary font-caption text-caption font-bold flex items-center gap-1 shrink-0 transition-colors cursor-pointer">
<span class="material-symbols-outlined text-[16px] text-primary">my_location</span>
<span class="hidden sm:inline">Near Me</span>
</button>
</div>
<!-- Segment 2: Property Type dropdown -->
<div class="lg:col-span-4 px-3 py-2 bg-surface-container-low rounded-xl flex items-center gap-2">
<span class="material-symbols-outlined text-primary text-[20px]">apartment</span>
<div class="w-full">
<label class="block font-caption text-[10px] text-on-surface-variant font-medium uppercase">Listing Type</label>
<select name="purpose" class="w-full bg-transparent font-label-sm text-label-sm text-on-surface font-semibold focus:outline-none cursor-pointer">
<option value="">All Listings (Buy / Rent)</option>
<option value="SALE">For Sale</option>
<option value="RENT">For Rent</option>
</select>
</div>
</div>
<!-- Segment 4: Search Action -->
<div class="lg:col-span-3 flex items-center gap-2">
<button type="submit" class="w-full bg-secondary-container hover:bg-secondary text-on-secondary py-3 px-5 rounded-xl font-label-md text-label-md font-bold flex items-center justify-center gap-2 shadow-md transition-transform active:scale-95"><span class="material-symbols-outlined text-[20px]">search</span><span class="whitespace-nowrap">Search Properties</span></button>
</div>
</form>
</div>
<!-- Quick Trending Search Tags -->
<div class="flex flex-wrap items-center justify-center gap-2 mt-4 text-surface-bright">
<span class="font-caption text-caption text-surface-variant/90 uppercase tracking-wider font-semibold">Trending Cities:</span>
<a class="px-3 py-1 rounded-full bg-surface-container-lowest/15 hover:bg-surface-container-lowest/30 backdrop-blur-sm font-caption text-caption text-surface-bright transition-colors flex items-center gap-1" href="${pageContext.request.contextPath}/search?keyword=Mumbai">
<span class="material-symbols-outlined text-[13px] text-tertiary-fixed">location_city</span> Mumbai
</a>
<a class="px-3 py-1 rounded-full bg-surface-container-lowest/15 hover:bg-surface-container-lowest/30 backdrop-blur-sm font-caption text-caption text-surface-bright transition-colors flex items-center gap-1" href="${pageContext.request.contextPath}/search?keyword=Bangalore">
<span class="material-symbols-outlined text-[13px] text-tertiary-fixed">location_city</span> Bangalore
</a>
<a class="px-3 py-1 rounded-full bg-surface-container-lowest/15 hover:bg-surface-container-lowest/30 backdrop-blur-sm font-caption text-caption text-surface-bright transition-colors flex items-center gap-1" href="${pageContext.request.contextPath}/search?keyword=Pune">
<span class="material-symbols-outlined text-[13px] text-tertiary-fixed">location_city</span> Pune
</a>
<a class="px-3 py-1 rounded-full bg-surface-container-lowest/15 hover:bg-surface-container-lowest/30 backdrop-blur-sm font-caption text-caption text-surface-bright transition-colors flex items-center gap-1" href="${pageContext.request.contextPath}/search?keyword=Hyderabad">
<span class="material-symbols-outlined text-[13px] text-tertiary-fixed">location_city</span> Hyderabad
</a>
<a class="px-3 py-1 rounded-full bg-surface-container-lowest/15 hover:bg-surface-container-lowest/30 backdrop-blur-sm font-caption text-caption text-surface-bright transition-colors flex items-center gap-1" href="${pageContext.request.contextPath}/search?keyword=Gurgaon">
<span class="material-symbols-outlined text-[13px] text-tertiary-fixed">location_city</span> Gurgaon
</a>
</div>
</div>
</div>
</section>
<!-- TOP LOCALITIES & CITY CHIPS (Horizontal Scroll Stream) -->
<section class="w-full bg-surface-container-lowest py-5 shadow-xs">
<div class="max-w-container-max mx-auto px-gutter-lg flex flex-col md:flex-row items-start md:items-center justify-between gap-3">
<div class="flex items-center gap-2 shrink-0">
<span class="flex h-7 w-7 items-center justify-center rounded-lg bg-primary-fixed text-on-primary-fixed">
<span class="material-symbols-outlined text-[18px]">explore</span>
</span>
<span class="font-label-md text-label-md text-on-surface font-bold">Popular Localities</span>
</div>
<!-- Scroller List -->
<div class="flex items-center gap-2 overflow-x-auto w-full no-scrollbar pb-1 md:pb-0">
<a class="inline-flex items-center gap-2 px-3.5 py-1.5 rounded-full bg-primary-fixed/40 text-on-primary-fixed-variant hover:bg-primary-fixed transition-colors shrink-0 font-label-sm text-label-sm font-semibold" href="${pageContext.request.contextPath}/search?keyword=Bandra">
Bandra West
</a>
<a class="inline-flex items-center gap-2 px-3.5 py-1.5 rounded-full bg-surface-container-low text-on-surface hover:bg-surface-container transition-colors shrink-0 font-label-sm text-label-sm font-medium" href="${pageContext.request.contextPath}/search?keyword=Andheri">
Andheri East
</a>
<a class="inline-flex items-center gap-2 px-3.5 py-1.5 rounded-full bg-surface-container-low text-on-surface hover:bg-surface-container transition-colors shrink-0 font-label-sm text-label-sm font-medium" href="${pageContext.request.contextPath}/search?keyword=Powai">
Powai Lake
</a>
<a class="inline-flex items-center gap-2 px-3.5 py-1.5 rounded-full bg-surface-container-low text-on-surface hover:bg-surface-container transition-colors shrink-0 font-label-sm text-label-sm font-medium" href="${pageContext.request.contextPath}/search?keyword=Whitefield">
Whitefield
</a>
<a class="inline-flex items-center gap-2 px-3.5 py-1.5 rounded-full bg-surface-container-low text-on-surface hover:bg-surface-container transition-colors shrink-0 font-label-sm text-label-sm font-medium" href="${pageContext.request.contextPath}/search?keyword=Gachibowli">
Gachibowli
</a>
<a class="inline-flex items-center gap-2 px-3.5 py-1.5 rounded-full bg-surface-container-low text-on-surface hover:bg-surface-container transition-colors shrink-0 font-label-sm text-label-sm font-medium" href="${pageContext.request.contextPath}/search?keyword=Koramangala">
Koramangala
</a>
<a class="inline-flex items-center gap-2 px-3.5 py-1.5 rounded-full bg-surface-container-low text-on-surface hover:bg-surface-container transition-colors shrink-0 font-label-sm text-label-sm font-medium" href="${pageContext.request.contextPath}/search?keyword=Hinjewadi">
Hinjewadi
</a>
</div>
</div>
</section>
<!-- FEATURED & VERIFIED PROPERTIES -->
<section class="max-w-container-max mx-auto px-gutter-lg py-10 w-full">
<!-- Header Block with Verification Badge -->
<div class="flex flex-col sm:flex-row sm:items-end justify-between gap-4 mb-8">
<div>
<div class="flex items-center gap-2 mb-1.5">
<span class="flex items-center gap-1.5 bg-tertiary-fixed text-on-tertiary-fixed-variant px-3 py-1 rounded-full font-label-sm text-label-sm font-bold shadow-xs">
<span class="material-symbols-outlined text-[18px]">verified</span>
<span>EstateHub Verified</span>
</span>
<span class="font-caption text-caption text-tertiary font-bold tracking-wider uppercase">100% On-Ground Audited</span>
</div>
<h2 class="font-headline-xl text-headline-xl font-bold text-on-surface tracking-tight">
          Handpicked Verified Residences
        </h2>
<p class="font-body-md text-body-md text-on-surface-variant">
          100% physically inspected properties with RERA compliance and verified ownership records.
        </p>
</div>
<a class="group inline-flex items-center gap-2 font-label-md text-label-md font-bold text-primary-container hover:text-primary transition-colors" href="${pageContext.request.contextPath}/search">
<span>View All Verified Properties</span>
<span class="material-symbols-outlined text-[20px] transition-transform group-hover:translate-x-1">arrow_forward</span>
</a>
</div>
<!-- 4-Column Responsive Grid -->
<div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-gutter-lg">
<c:forEach items="${properties}" var="p">
        <div class="group bg-surface-container-lowest rounded-2xl overflow-hidden shadow-sm hover:shadow-xl transition-all duration-300 flex flex-col">
          <div class="relative w-full aspect-video overflow-hidden bg-surface-container">
            <img class="w-full h-full object-cover group-hover:scale-105 transition-transform duration-500" src="${p.primaryImageUrl}" alt="${p.title}" />
            <div class="absolute top-2.5 left-2.5 flex flex-col gap-1">
              <span class="inline-flex items-center gap-1 bg-surface-container-lowest/90 backdrop-blur-md text-tertiary font-caption text-caption font-bold px-2 py-0.5 rounded-md shadow-xs">
                <span class="material-symbols-outlined text-[14px] text-tertiary-fixed-dim">verified</span> Verified
              </span>
            </div>
            <button class="absolute top-2.5 right-2.5 w-8 h-8 rounded-full bg-surface-container-lowest/85 backdrop-blur-md flex items-center justify-center text-on-surface-variant hover:text-secondary-container transition-colors shadow-sm">
              <span class="material-symbols-outlined text-[18px]">favorite</span>
            </button>
          </div>
          <div class="p-4 flex-1 flex flex-col justify-between">
            <div>
              <div class="flex items-baseline justify-between mb-1">
                <span class="font-headline-md text-headline-md font-extrabold text-on-surface">₹ ${p.price}</span>
              </div>
              <h3 class="font-headline-sm text-headline-sm font-bold text-on-surface truncate group-hover:text-primary transition-colors">
                <a href="${pageContext.request.contextPath}/property/details?id=${p.propertyId}">${p.title}</a>
              </h3>
              <p class="font-body-sm text-body-sm text-on-surface-variant flex items-center gap-1 mt-0.5 truncate">
                <span class="material-symbols-outlined text-[16px] text-outline">location_on</span>
                ${p.location}, ${p.city}
              </p>
              <div class="grid grid-cols-2 gap-2 mt-3.5 py-2.5 px-3 bg-surface-container-low rounded-xl text-on-surface-variant font-caption text-caption">
                <div class="flex items-center gap-1.5 font-medium">
                  <span class="material-symbols-outlined text-[16px] text-primary">bed</span> ${p.bedrooms} Beds
                </div>
                <div class="flex items-center gap-1.5 font-medium">
                  <span class="material-symbols-outlined text-[16px] text-primary">bathtub</span> ${p.bathrooms} Baths
                </div>
                <div class="flex items-center gap-1.5 font-medium">
                  <span class="material-symbols-outlined text-[16px] text-primary">square_foot</span> ${p.areaSqft} sq.ft
                </div>
                <div class="flex items-center gap-1.5 font-medium">
                  <span class="material-symbols-outlined text-[16px] text-primary">category</span> ${p.categoryName}
                </div>
              </div>
            </div>
          </div>
        </div>
        </c:forEach>
</div>
</section>

</div>
<script>
  // Tab switcher micro-interaction for Housing.com style categories
  document.querySelectorAll('.search-tab-btn').forEach(btn => {
    btn.addEventListener('click', function() {
      document.querySelectorAll('.search-tab-btn').forEach(b => {
        b.className = 'search-tab-btn px-4 py-2 rounded-lg font-label-md text-label-md font-medium text-on-surface-variant hover:text-on-surface hover:bg-surface-container-low transition-colors flex items-center gap-1.5';
      });
      this.className = 'search-tab-btn px-4 py-2 rounded-lg font-label-md text-label-md font-bold text-on-primary bg-primary-container flex items-center gap-1.5 shadow-sm transition-all';
    });
  });

  // Favorite toggle micro-interaction
  document.querySelectorAll('button:has(.material-symbols-outlined)').forEach(btn => {
    if (btn.querySelector('.material-symbols-outlined')?.textContent.trim() === 'favorite') {
      btn.addEventListener('click', function(e) {
        e.preventDefault();
        const icon = this.querySelector('.material-symbols-outlined');
        if (icon.style.fontVariationSettings.includes("'FILL' 1")) {
          icon.style.fontVariationSettings = "'FILL' 0";
          this.classList.remove('text-secondary-container');
          this.classList.add('text-on-surface-variant');
        } else {
          icon.style.fontVariationSettings = "'FILL' 1";
          this.classList.remove('text-on-surface-variant');
          this.classList.add('text-secondary-container');
        }
      });
    }
  });
</script>

<!-- GPS LOCATION PERMISSION MODAL -->
<div id="gpsModal" class="fixed inset-0 z-[100] bg-black/60 backdrop-blur-md hidden items-center justify-center p-4">
  <div class="bg-surface-container-lowest max-w-md w-full rounded-3xl p-6 sm:p-8 shadow-2xl border border-outline-variant/30 text-center flex flex-col items-center space-y-5 relative">
    
    <button type="button" onclick="closeGpsModal()" class="absolute top-4 right-4 text-on-surface-variant hover:text-on-surface p-1 rounded-full">
      <span class="material-symbols-outlined text-[20px]">close</span>
    </button>

    <div class="w-16 h-16 rounded-full bg-primary-container/10 flex items-center justify-center text-primary shadow-inner">
      <span class="material-symbols-outlined text-3xl animate-pulse">my_location</span>
    </div>

    <div class="space-y-2">
      <h3 class="font-heading text-xl font-extrabold text-on-surface">Allow GPS Location Access</h3>
      <p class="text-xs text-on-surface-variant leading-relaxed">
        EstateHub will use your device's GPS location to find and recommend verified properties available in your exact locality.
      </p>
    </div>

    <div id="gpsStatus" class="hidden text-xs font-semibold px-3 py-1.5 rounded-full bg-surface-container-low text-primary flex items-center gap-1.5">
      <span class="material-symbols-outlined text-[16px] animate-spin">sync</span>
      <span id="gpsStatusText">Detecting your GPS location...</span>
    </div>

    <div class="flex flex-col sm:flex-row items-center gap-2.5 w-full pt-1">
      <button type="button" onclick="requestGPSLocation()" class="w-full py-3 px-4 rounded-xl bg-primary hover:bg-primary-container text-on-primary font-bold text-xs shadow-md transition-all flex items-center justify-center gap-2">
        <span class="material-symbols-outlined text-base">near_me</span>
        <span>Allow GPS Location</span>
      </button>

      <button type="button" onclick="closeGpsModal()" class="w-full py-3 px-4 rounded-xl bg-surface-container-low hover:bg-surface-container-high text-on-surface border border-outline-variant/40 font-bold text-xs transition-all">
        Search Manually
      </button>
    </div>
  </div>
</div>

<script>
  function promptGPSLocation() {
    const modal = document.getElementById('gpsModal');
    if (modal) {
      modal.classList.remove('hidden');
      modal.classList.add('flex');
    } else {
      requestGPSLocation();
    }
  }

  function closeGpsModal() {
    const modal = document.getElementById('gpsModal');
    if (modal) {
      modal.classList.add('hidden');
      modal.classList.remove('flex');
    }
  }

  function requestGPSLocation() {
    const statusDiv = document.getElementById('gpsStatus');
    const statusText = document.getElementById('gpsStatusText');
    if (statusDiv && statusText) {
      statusDiv.classList.remove('hidden');
      statusText.textContent = 'Detecting your GPS location...';
    }

    if (!navigator.geolocation) {
      alert('Geolocation is not supported by your browser.');
      if (statusDiv) statusDiv.classList.add('hidden');
      return;
    }

    navigator.geolocation.getCurrentPosition(
      function(position) {
        const lat = position.coords.latitude;
        const lon = position.coords.longitude;

        if (statusText) statusText.textContent = 'Resolving your locality name...';

        fetch('https://nominatim.openstreetmap.org/reverse?format=json&lat=' + lat + '&lon=' + lon)
          .then(res => res.json())
          .then(data => {
            let locality = '';
            if (data && data.address) {
              locality = data.address.suburb || data.address.neighbourhood || data.address.city_district || data.address.city || data.address.town || data.address.state_district || '';
            }
            if (!locality) {
              locality = 'Bandra';
            }

            closeGpsModal();
            window.location.href = '${pageContext.request.contextPath}/search?keyword=' + encodeURIComponent(locality);
          })
          .catch(err => {
            console.error('Reverse geocoding error:', err);
            closeGpsModal();
            window.location.href = '${pageContext.request.contextPath}/search?keyword=Mumbai';
          });
      },
      function(error) {
        console.warn('GPS location error:', error.message);
        if (statusDiv) statusDiv.classList.add('hidden');
        alert('Location access denied or unavailable. You can search by entering your city name manually.');
        closeGpsModal();
      },
      { enableHighAccuracy: true, timeout: 10000, maximumAge: 0 }
    );
  }
</script>
</main><footer class="w-full bg-inverse-surface text-inverse-on-surface pt-gutter-2xl pb-gutter-xl"><div class="max-w-container-max mx-auto px-gutter-lg"><div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-gutter-xl mb-gutter-2xl"><div class="space-y-gutter-md"><div class="flex items-center gap-2"><img alt="EstateHub Logo" class="h-8 w-auto object-contain brightness-200" src="https://lh3.googleusercontent.com/aida/AEtjO1Xg4rP1x__tmUvhhUEeM-xIYBlSjyhgL-aDvDihhuMxD0bc_kL9kHorsRYR5EvM9wdONnfScP46YL0QssDo1Yzd9XXTo1GpuWC9c1SGhoiGFmbBZZ-L95_tHf_7u7-NnrWpEVNDa3KKfH1MN1eMtrk2ZiwZGYM9sKA4zxHHA9vupb767aMCr2J7zivaAtyK3ypPdo3ZJ1n88WJ1YI5TA-loMe151e9ACRfxjid8X1QrA8mUitrWMg5qDMA"/><span class="font-headline-md text-headline-md text-surface-container-lowest tracking-tight">EstateHub</span></div><p class="font-body-sm text-body-sm text-surface-variant max-w-xs">India's trusted real estate portal for verified homes, apartments, and commercial spaces.</p><div class="pt-gutter-xs flex items-center gap-gutter-sm"><span class="flex items-center gap-1 bg-tertiary-container text-tertiary-fixed font-caption text-caption px-2.5 py-1 rounded-full"><span class="material-symbols-outlined text-[14px]">verified</span> 100% RERA Verified</span></div></div><div class="space-y-gutter-sm"><h3 class="font-label-md text-label-md text-surface-container-lowest uppercase tracking-wider">Popular Searches</h3><ul class="space-y-2 font-body-sm text-body-sm text-surface-variant"><li><a class="hover:text-surface-bright transition-colors" data-path="rent-properties" href="javascript:void(0)">Flats in Mumbai</a></li><li><a class="hover:text-surface-bright transition-colors" data-path="buy-properties" href="javascript:void(0)">Flats in Bangalore</a></li><li><a class="hover:text-surface-bright transition-colors" data-path="new-projects" href="javascript:void(0)">Apartments in Gurgaon</a></li><li><a class="hover:text-surface-bright transition-colors" data-path="buy-properties" href="javascript:void(0)">Villas in Hyderabad</a></li><li><a class="hover:text-surface-bright transition-colors" data-path="commercial-spaces" href="javascript:void(0)">Offices in Pune</a></li></ul></div><div class="space-y-gutter-sm"><h3 class="font-label-md text-label-md text-surface-container-lowest uppercase tracking-wider">Quick Links</h3><ul class="space-y-2 font-body-sm text-body-sm text-surface-variant"><li><a class="hover:text-surface-bright transition-colors" data-path="about-us" href="javascript:void(0)">About Us</a></li><li><a class="hover:text-surface-bright transition-colors" data-path="careers" href="javascript:void(0)">Careers</a></li><li><a class="hover:text-surface-bright transition-colors" data-path="research-insights" href="javascript:void(0)">Research &amp; Insights</a></li><li><a class="hover:text-surface-bright transition-colors" data-path="contact-support" href="javascript:void(0)">Contact Support</a></li><li><a class="hover:text-surface-bright transition-colors" data-path="terms-privacy" href="javascript:void(0)">Terms &amp; Privacy</a></li></ul></div></div><div class="pt-gutter-lg mt-gutter-xl border-t border-outline/20 flex flex-col md:flex-row items-center justify-between gap-gutter-md font-caption text-caption text-surface-variant"><div>© 2025 EstateHub Technologies Private Limited. All rights reserved.</div><div class="flex items-center gap-gutter-xs text-surface-dim"><span class="material-symbols-outlined text-tertiary-fixed text-[16px]">shield</span><span>Made with trust for home seekers across India</span></div></div></div></footer></body></html>