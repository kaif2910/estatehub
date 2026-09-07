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
<!-- Profile Context & Global Sub-Navigation Banner -->
<section class="w-full bg-surface-container-low pb-gutter-xl">
<div class="max-w-container-max mx-auto px-gutter-lg pt-gutter-xl">
<!-- Profile Header Summary -->
<div class="flex flex-col lg:flex-row lg:items-center justify-between gap-gutter-lg bg-surface-container-lowest p-gutter-lg rounded-xl shadow-sm">
<div class="flex items-center gap-gutter-md">
<div class="relative">
<div class="w-16 h-16 rounded-full bg-primary-container text-on-primary flex items-center justify-center font-headline-md text-headline-md shadow-md">${fn:substring(sessionScope.currentUser.name, 0, 1)}</div>
<span class="absolute bottom-0 right-0 w-5 h-5 rounded-full bg-tertiary-container text-tertiary-fixed flex items-center justify-center" title="Verified Buyer">
<span class="material-symbols-outlined text-[14px]">verified</span>
</span>
</div>
<div class="space-y-1">
<div class="flex flex-wrap items-center gap-2">
<h1 class="font-headline-lg text-headline-lg text-on-surface">Welcome back, ${sessionScope.currentUser.name} 👋</h1>
<span class="inline-flex items-center gap-1 bg-surface-container-high px-2.5 py-0.5 rounded-full text-on-tertiary-fixed-variant font-label-sm text-label-sm">
<span class="material-symbols-outlined text-[16px] text-tertiary-container" style="font-variation-settings: 'FILL' 1;">check_circle</span>
                Verified Buyer
              </span>
</div>
<p class="font-body-sm text-body-sm text-on-surface-variant">Looking for luxury 2 &amp; 3 BHK residences across Western Mumbai</p>
</div>
</div>
<!-- Profile Completion Widget -->
<div class="w-full lg:w-72 bg-surface-container-low p-3.5 rounded-xl space-y-2">
<div class="flex items-center justify-between font-label-sm text-label-sm">
<span class="text-on-surface-variant">Profile Completion</span>
<span class="text-primary-container font-bold">85% Complete</span>
</div>
<div class="w-full bg-surface-container-highest rounded-full h-2 overflow-hidden">
<div class="bg-primary-container h-2 rounded-full transition-all duration-500" style="width: 85%"></div>
</div>
<p class="font-caption text-caption text-on-surface-variant flex items-center gap-1">
<span class="material-symbols-outlined text-[13px] text-secondary-container">bolt</span>
            Add PAN &amp; Pre-approval to unlock priority broker queues
          </p>
</div>
</div>
<!-- Navigation Segment Tabs -->
<div class="flex items-center gap-2 mt-gutter-md overflow-x-auto pb-1 scrollbar-none">
<button class="flex items-center gap-2 px-4 py-2.5 rounded-full bg-primary-container text-on-primary font-label-md text-label-md shadow-sm shrink-0">
<span class="material-symbols-outlined text-[18px]">dashboard</span>
<span>Overview &amp; Activity</span>
</button>
<button class="flex items-center gap-2 px-4 py-2.5 rounded-full bg-surface-container-lowest hover:bg-surface-container text-on-surface-variant hover:text-on-surface font-label-md text-label-md transition-colors shrink-0">
<span class="material-symbols-outlined text-[18px]">bookmark_border</span>
<span>Saved Searches</span>
<span class="bg-surface-container-high text-on-surface px-1.5 py-0.5 rounded-full font-caption text-caption">4</span>
</button>
<button class="flex items-center gap-2 px-4 py-2.5 rounded-full bg-surface-container-lowest hover:bg-surface-container text-on-surface-variant hover:text-on-surface font-label-md text-label-md transition-colors shrink-0">
<span class="material-symbols-outlined text-[18px]">history</span>
<span>Recently Viewed</span>
<span class="bg-surface-container-high text-on-surface px-1.5 py-0.5 rounded-full font-caption text-caption">12</span>
</button>
<button class="flex items-center gap-2 px-4 py-2.5 rounded-full bg-surface-container-lowest hover:bg-surface-container text-on-surface-variant hover:text-on-surface font-label-md text-label-md transition-colors shrink-0">
<span class="material-symbols-outlined text-[18px]">event_available</span>
<span>My Inquiries &amp; Site Visits</span>
<span class="bg-secondary-container text-on-secondary px-1.5 py-0.5 rounded-full font-caption text-caption">3</span>
</button>
<button class="flex items-center gap-2 px-4 py-2.5 rounded-full bg-surface-container-lowest hover:bg-surface-container text-on-surface-variant hover:text-on-surface font-label-md text-label-md transition-colors shrink-0">
<span class="material-symbols-outlined text-[18px]">auto_awesome</span>
<span>Preferences &amp; AI Match</span>
<span class="bg-tertiary-container text-tertiary-fixed px-1.5 py-0.5 rounded-full font-caption text-caption">98% High</span>
</button>
</div>
</div>
</section>
<!-- Main Multi-Column Content Area -->
<section class="max-w-container-max mx-auto px-gutter-lg -mt-6 w-full mb-gutter-2xl">
<div class="grid grid-cols-1 lg:grid-cols-12 gap-gutter-lg">
<!-- Left Main Column (8 cols) -->
<div class="lg:col-span-8 space-y-gutter-lg">
<!-- 4 Stat Metric Tiles -->
<div class="grid grid-cols-2 sm:grid-cols-4 gap-gutter-md">
<div class="bg-surface-container-lowest p-4 rounded-xl shadow-sm hover:shadow-md transition-shadow">
<div class="flex items-center justify-between mb-2">
<span class="material-symbols-outlined text-primary-container text-[22px]">favorite</span>
<span class="font-caption text-caption text-tertiary-container font-semibold">+2 new</span>
</div>
<div class="font-headline-xl text-headline-xl text-on-surface">${fn:length(favorites)}</div>
<p class="font-label-sm text-label-sm text-on-surface-variant">Saved Properties</p>
</div>
<div class="bg-surface-container-lowest p-4 rounded-xl shadow-sm hover:shadow-md transition-shadow">
<div class="flex items-center justify-between mb-2">
<span class="material-symbols-outlined text-secondary-container text-[22px]">forum</span>
<span class="font-caption text-caption text-on-surface-variant">Active</span>
</div>
<div class="font-headline-xl text-headline-xl text-on-surface">${totalInquiries}</div>
<p class="font-label-sm text-label-sm text-on-surface-variant">Contacted Owners</p>
</div>
<div class="bg-surface-container-lowest p-4 rounded-xl shadow-sm hover:shadow-md transition-shadow">
<div class="flex items-center justify-between mb-2">
<span class="material-symbols-outlined text-primary-container text-[22px]">calendar_today</span>
<span class="bg-secondary-fixed text-on-secondary-container font-caption text-caption px-1.5 py-0.5 rounded">This Wk</span>
</div>
<div class="font-headline-xl text-headline-xl text-on-surface">${totalProperties}</div>
<p class="font-label-sm text-label-sm text-on-surface-variant">Upcoming Visits</p>
</div>
<div class="bg-surface-container-lowest p-4 rounded-xl shadow-sm hover:shadow-md transition-shadow">
<div class="flex items-center justify-between mb-2">
<span class="material-symbols-outlined text-tertiary-container text-[22px]">trending_down</span>
<span class="font-caption text-caption text-tertiary-container font-semibold">-₹12L avg</span>
</div>
<div class="font-headline-xl text-headline-xl text-on-surface">3</div>
<p class="font-label-sm text-label-sm text-on-surface-variant">Price Drop Alerts</p>
</div>
</div>
<!-- Section: Upcoming Site Visits & Appointments -->
<div class="bg-surface-container-lowest rounded-xl p-gutter-lg shadow-sm space-y-gutter-md">
<div class="flex items-center justify-between">
<div class="space-y-0.5">
<h2 class="font-headline-md text-headline-md text-on-surface flex items-center gap-2">
<span class="material-symbols-outlined text-primary-container">tour</span>
                Upcoming Site Visits &amp; Appointments
              </h2>
<p class="font-body-sm text-body-sm text-on-surface-variant">Confirmed property walkthroughs scheduled with accredited seller agents</p>
</div>
<a class="font-label-sm text-label-sm text-primary-container hover:text-primary font-semibold flex items-center gap-1" href="javascript:void(0)">
<span>View All (2)</span>
<span class="material-symbols-outlined text-[16px]">arrow_forward</span>
</a>
</div>
<!-- Schedule Cards List -->
<div class="space-y-gutter-md">
<!-- Visit 1: Confirmed -->
<div class="bg-surface-container-low p-4 rounded-xl flex flex-col md:flex-row items-start md:items-center justify-between gap-4 hover:bg-surface-container transition-colors">
<div class="flex items-start gap-4">
<div class="w-16 h-16 rounded-lg bg-surface-container overflow-hidden shrink-0">
<img class="w-full h-full object-cover" data-alt="Modern high rise luxury apartment building facade in Mumbai at sunset with glass balconies and manicured landscape grounds" src="https://lh3.googleusercontent.com/aida-public/AB6AXuAAOUmnsjAb-WzHEuHZjVcDrMUlE3JSXrXH-gkpiMMXWMgkydbsIEgYeBVS1V0IjeJKrkGRnxTYpgYJrKRZ-lpG7c0q_BhM7hL_2CiGfziiS1J_GaFyy0oSpdlfSOnvbsEufgv8Y-fdE-yFfpnCtfjjOJTdgUgQGELCVTKjb6h1kCVxDPDjxHKJSkEGhmCBIKFW8KOG1GAdo95NevQXn_uspj9QcuDUbLELLEDNwSP2WO7dxj26UmEYrw"/>
</div>
<div class="space-y-1">
<div class="flex flex-wrap items-center gap-2">
<span class="font-headline-sm text-headline-sm text-on-surface">Oberoi Splendor</span>
<span class="inline-flex items-center gap-1 bg-surface-container-highest text-on-tertiary-fixed-variant font-caption text-caption px-2 py-0.5 rounded-full">
<span class="w-1.5 h-1.5 rounded-full bg-tertiary-container"></span>
                      Confirmed
                    </span>
</div>
<p class="font-body-sm text-body-sm text-on-surface-variant">JVLR, Andheri East • 3 BHK Luxury • Tower C, 1402</p>
<div class="flex flex-wrap items-center gap-3 text-on-surface-variant font-caption text-caption">
<span class="flex items-center gap-1 text-on-surface font-semibold">
<span class="material-symbols-outlined text-[15px] text-primary-container">schedule</span> Saturday, 4:00 PM
                    </span>
<span>•</span>
<span class="flex items-center gap-1">
<span class="material-symbols-outlined text-[15px]">badge</span> Agent: Rajesh Sharma (RERA Verified)
                    </span>
</div>
</div>
</div>
<div class="flex items-center gap-2 w-full md:w-auto justify-end shrink-0 pt-2 md:pt-0">
<button class="px-3 py-1.5 rounded-lg bg-surface-container-lowest hover:bg-surface-container-high text-on-surface font-label-sm text-label-sm transition-colors flex items-center gap-1 shadow-sm">
<span class="material-symbols-outlined text-[16px]">edit_calendar</span>
                  Reschedule
                </button>
<button class="px-3 py-1.5 rounded-lg bg-primary-container hover:bg-primary text-on-primary font-label-sm text-label-sm transition-colors flex items-center gap-1 shadow-sm">
<span class="material-symbols-outlined text-[16px]">navigation</span>
                  Directions
                </button>
</div>
</div>
<!-- Visit 2: Pending Owner Confirmation -->
<div class="bg-surface-container-low p-4 rounded-xl flex flex-col md:flex-row items-start md:items-center justify-between gap-4 hover:bg-surface-container transition-colors">
<div class="flex items-start gap-4">
<div class="w-16 h-16 rounded-lg bg-surface-container overflow-hidden shrink-0">
<img class="w-full h-full object-cover" data-alt="Gleaming architectural elevation of ultra-premium skyscraper residences against clear blue sky in South Mumbai" src="https://lh3.googleusercontent.com/aida-public/AB6AXuDmTdTDFiSgGBtei_PMb321N0R4N5uZyv0Tf_yG65_U9-ozX8syCZPfM42MH7aUV-UhGpoyRsVwmLZF_8HwhVShd6sePdXXnrkzCXZ27C8C-Ntzui4UNVBg-P2NntlyFBDDnCYhHirnovLM_iPNEzqBjPLlqcnSdSi93mflDQbyo6kOGySva1HmXvFj32ejFevOK917doPYFGzt4upH2P7MGdkw46pwlSYz6tJOpsKfVdM8hEG33klI2Q"/>
</div>
<div class="space-y-1">
<div class="flex flex-wrap items-center gap-2">
<span class="font-headline-sm text-headline-sm text-on-surface">Lodha Bellissimo</span>
<span class="inline-flex items-center gap-1 bg-surface-container-high text-secondary font-caption text-caption px-2 py-0.5 rounded-full">
<span class="w-1.5 h-1.5 rounded-full bg-secondary-container"></span>
                      Pending Owner Confirmation
                    </span>
</div>
<p class="font-body-sm text-body-sm text-on-surface-variant">Mahalaxmi, South Mumbai • 4 BHK Sky Villa • Penthouse Level</p>
<div class="flex flex-wrap items-center gap-3 text-on-surface-variant font-caption text-caption">
<span class="flex items-center gap-1 text-on-surface font-semibold">
<span class="material-symbols-outlined text-[15px] text-primary-container">schedule</span> Sunday, 11:30 AM
                    </span>
<span>•</span>
<span class="flex items-center gap-1">
<span class="material-symbols-outlined text-[15px]">person</span> Direct Owner Listing (Mr. V. Singhal)
                    </span>
</div>
</div>
</div>
<div class="flex items-center gap-2 w-full md:w-auto justify-end shrink-0 pt-2 md:pt-0">
<button class="px-3 py-1.5 rounded-lg bg-surface-container-lowest hover:bg-surface-container-high text-secondary font-label-sm text-label-sm transition-colors flex items-center gap-1 shadow-sm">
<span class="material-symbols-outlined text-[16px]">close</span>
                  Cancel Request
                </button>
<button class="px-3 py-1.5 rounded-lg bg-surface-container-high text-on-surface-variant font-label-sm text-label-sm cursor-not-allowed flex items-center gap-1">
<span class="material-symbols-outlined text-[16px]">pending</span>
                  Awaiting Host
                </button>
</div>
</div>
</div>
</div>
<!-- Section: Recent Inquiries & Chat Status -->
<div class="bg-surface-container-lowest rounded-xl p-gutter-lg shadow-sm space-y-gutter-md">
<div class="flex items-center justify-between">
<div>
<h2 class="font-headline-md text-headline-md text-on-surface flex items-center gap-2">
<span class="material-symbols-outlined text-primary-container">chat</span>
                Recent Inquiries &amp; Broker Leads
              </h2>
<p class="font-body-sm text-body-sm text-on-surface-variant">Real-time status of phone number releases, documentation shares, and callback queues</p>
</div>
<button class="p-2 rounded-lg hover:bg-surface-container-low text-on-surface-variant transition-colors">
<span class="material-symbols-outlined text-[20px]">filter_list</span>
</button>
</div>
<div class="overflow-x-auto">
<table class="w-full text-left font-body-sm text-body-sm">
<thead class="bg-surface-container-low text-on-surface-variant font-label-sm text-label-sm">
<tr>
<th class="p-3.5 rounded-l-lg">Property &amp; Agent</th>
<th class="p-3.5">Inquiry Type</th>
<th class="p-3.5">Status</th>
<th class="p-3.5">Latest Message Preview</th>
<th class="p-3.5 text-right rounded-r-lg">Quick Action</th>
</tr>
</thead>
<tbody class="divide-y-0 space-y-2">
<c:forEach items="${inquiries}" var="inq">
<tr class="hover:bg-surface-container-low/60 transition-colors">
<td class="p-3.5">
<div class="font-label-md text-label-md text-on-surface">${inq.propertyTitle}</div>
<div class="font-caption text-caption text-on-surface-variant">${inq.propertyLocation} • ${inq.sellerName}</div>
</td>
<td class="p-3.5 text-on-surface">${inq.contactPhone}</td>
<td class="p-3.5">
<span class="bg-surface-container-high text-on-tertiary-fixed-variant font-caption text-caption px-2 py-0.5 rounded-full inline-flex items-center gap-1">
<span class="material-symbols-outlined text-[13px] text-tertiary-container">info</span>
${inq.status}
</span>
</td>
<td class="p-3.5 text-on-surface-variant max-w-xs truncate">
${inq.message}
</td>
<td class="p-3.5 text-right">
<a class="inline-flex items-center gap-1 px-3 py-1 rounded-lg bg-surface-container-high hover:bg-tertiary-container hover:text-tertiary-fixed text-on-surface font-label-sm text-label-sm transition-colors" href="javascript:void(0)">
<span class="material-symbols-outlined text-[16px]">chat</span>
Action
</a>
</td>
</tr>
</c:forEach>
</tbody>
</table>
</div>
</div>
<!-- Section: Recently Viewed Homes -->
<div class="bg-surface-container-lowest rounded-xl p-gutter-lg shadow-sm space-y-gutter-md">
<div class="flex items-center justify-between">
<div class="space-y-0.5">
<h2 class="font-headline-md text-headline-md text-on-surface flex items-center gap-2">
<span class="material-symbols-outlined text-primary-container">visibility</span>
                Recently Viewed Homes
              </h2>
<p class="font-body-sm text-body-sm text-on-surface-variant">Properties you evaluated over the last 48 hours</p>
</div>
<a class="font-label-sm text-label-sm text-primary-container hover:text-primary font-semibold flex items-center gap-1" href="javascript:void(0)">
<span>View History</span>
<span class="material-symbols-outlined text-[16px]">arrow_forward</span>
</a>
</div>
<!-- Cards Grid (3-column) -->
<div class="grid grid-cols-1 md:grid-cols-3 gap-gutter-md">
<!-- Card 1 -->
<div class="bg-surface-container-low rounded-xl overflow-hidden shadow-sm hover:shadow-md transition-all flex flex-col justify-between group">
<div>
<div class="relative aspect-video w-full overflow-hidden">
<img class="w-full h-full object-cover group-hover:scale-105 transition-transform duration-500" data-alt="Elegant interior living room of upscale apartment in Bandra with marble floor panoramic floor-to-ceiling windows and modular kitchen" src="https://lh3.googleusercontent.com/aida-public/AB6AXuBTGU5Sx-0RzFVNjsTJHbZmPzLZ0wo77BFL0q-E6kY_AXkC2VmheBSgsaVBJ03TISouLyFAnpxcSm7ygaFjamTrXOISdGK1o5YjxEdRC2M-K8TeYXE7SVBrD_9VikeOvgP7aIsQHkqJvJDscEd9q8DluZsbVFmXfLrDeSTFwzb3OYegT61Hi_U6fkFvoa4n99Ki_Hbk6b6fe11tI5YtfO22LaRQKL2ljyKyBNVxHcxqDGs64pQUXNDKtA"/>
<div class="absolute top-2 left-2 flex items-center gap-1 bg-surface-container-lowest/90 backdrop-blur-sm text-tertiary-container font-caption text-caption px-2 py-0.5 rounded-full font-semibold">
<span class="material-symbols-outlined text-[13px]" style="font-variation-settings: 'FILL' 1;">verified</span>
                    Verified
                  </div>
<button class="absolute top-2 right-2 w-7 h-7 rounded-full bg-surface-container-lowest/80 backdrop-blur-sm text-secondary-container flex items-center justify-center hover:scale-110 transition-transform">
<span class="material-symbols-outlined text-[16px]" style="font-variation-settings: 'FILL' 1;">favorite</span>
</button>
<span class="absolute bottom-2 right-2 bg-inverse-surface/80 text-inverse-on-surface font-caption text-[10px] px-2 py-0.5 rounded flex items-center gap-1">
<span class="material-symbols-outlined text-[12px]">photo_camera</span> 18
                  </span>
</div>
<div class="p-3.5 space-y-2">
<div>
<div class="font-headline-sm text-headline-sm text-on-surface">₹ 2.85 Cr</div>
<div class="font-caption text-caption text-on-surface-variant">EMI ₹1.82 L / mo</div>
</div>
<h3 class="font-label-md text-label-md text-on-surface truncate">Piramal Mahalaxmi Tower 2</h3>
<p class="font-body-sm text-body-sm text-on-surface-variant flex items-center gap-1">
<span class="material-symbols-outlined text-[15px]">location_on</span>
                    Mahalaxmi, Mumbai
                  </p>
<div class="flex items-center gap-3 text-on-surface-variant font-caption text-caption pt-1">
<span>2 BHK</span>
<span>•</span>
<span>870 sq.ft</span>
<span>•</span>
<span>Ready Poss.</span>
</div>
</div>
</div>
<div class="p-3.5 pt-0 flex items-center gap-2">
<button class="flex-1 py-1.5 rounded-lg bg-surface-container-lowest hover:bg-surface-container-high text-on-surface font-label-sm text-label-sm transition-colors text-center shadow-sm">
                  Details
                </button>
<button class="flex-1 py-1.5 rounded-lg bg-secondary-container hover:bg-secondary text-on-secondary font-label-sm text-label-sm transition-colors text-center shadow-sm">
                  Contact
                </button>
</div>
</div>
<!-- Card 2 -->
<div class="bg-surface-container-low rounded-xl overflow-hidden shadow-sm hover:shadow-md transition-all flex flex-col justify-between group">
<div>
<div class="relative aspect-video w-full overflow-hidden">
<img class="w-full h-full object-cover group-hover:scale-105 transition-transform duration-500" data-alt="Warm sunlight streaming into designer bedroom suite in modern Mumbai high-rise with rich wooden flooring and city skyline vista" src="https://lh3.googleusercontent.com/aida-public/AB6AXuD5Qp51M-ToVvSBRSpOM5uvf9cBTYODKA8huK1i8xzSkQ3hTF-riOE4Z3iD3-G4ev5HbakgypusYiywEkNfQLhSdbrHeYbYUWYw3ngsZsCXEVNjp_ELLzeeuuT9TTaG2vFLmKkjEnctfJJxxhlyX4QMZjey8nO2zEq9ec_hfcJjjtKjPJ1M-yIovGDsYnjZ6z7FgQh6VNdGvRwpE4-JNxdoZR6skYg3aWvAFRbbhANp6sY4FgezSXi-Vw"/>
<div class="absolute top-2 left-2 flex items-center gap-1 bg-surface-container-lowest/90 backdrop-blur-sm text-tertiary-container font-caption text-caption px-2 py-0.5 rounded-full font-semibold">
<span class="material-symbols-outlined text-[13px]" style="font-variation-settings: 'FILL' 1;">verified</span>
                    Verified
                  </div>
<button class="absolute top-2 right-2 w-7 h-7 rounded-full bg-surface-container-lowest/80 backdrop-blur-sm text-on-surface-variant hover:text-secondary-container flex items-center justify-center hover:scale-110 transition-transform">
<span class="material-symbols-outlined text-[16px]">favorite</span>
</button>
<span class="absolute bottom-2 right-2 bg-inverse-surface/80 text-inverse-on-surface font-caption text-[10px] px-2 py-0.5 rounded flex items-center gap-1">
<span class="material-symbols-outlined text-[12px]">photo_camera</span> 24
                  </span>
</div>
<div class="p-3.5 space-y-2">
<div>
<div class="font-headline-sm text-headline-sm text-on-surface">₹ 3.40 Cr</div>
<div class="font-caption text-caption text-on-surface-variant">EMI ₹2.18 L / mo</div>
</div>
<h3 class="font-label-md text-label-md text-on-surface truncate">Adani Western Heights</h3>
<p class="font-body-sm text-body-sm text-on-surface-variant flex items-center gap-1">
<span class="material-symbols-outlined text-[15px]">location_on</span>
                    Andheri West, Mumbai
                  </p>
<div class="flex items-center gap-3 text-on-surface-variant font-caption text-caption pt-1">
<span>3 BHK</span>
<span>•</span>
<span>1,190 sq.ft</span>
<span>•</span>
<span>Under Constr.</span>
</div>
</div>
</div>
<div class="p-3.5 pt-0 flex items-center gap-2">
<button class="flex-1 py-1.5 rounded-lg bg-surface-container-lowest hover:bg-surface-container-high text-on-surface font-label-sm text-label-sm transition-colors text-center shadow-sm">
                  Details
                </button>
<button class="flex-1 py-1.5 rounded-lg bg-secondary-container hover:bg-secondary text-on-secondary font-label-sm text-label-sm transition-colors text-center shadow-sm">
                  Contact
                </button>
</div>
</div>
<!-- Card 3 -->
<div class="bg-surface-container-low rounded-xl overflow-hidden shadow-sm hover:shadow-md transition-all flex flex-col justify-between group">
<div>
<div class="relative aspect-video w-full overflow-hidden">
<img class="w-full h-full object-cover group-hover:scale-105 transition-transform duration-500" data-alt="Rooftop infinity swimming pool overlooking Mumbai Arabian sea coast with contemporary lounge cabanas and moody evening ambient lighting" src="https://lh3.googleusercontent.com/aida-public/AB6AXuDi5mfhIQqei_wLQ5fW2L4mvqzXZtqrEhCPGBgQPRBGB93NqnQBCmT5PJusdNuM5YOu9gTT1M6AgpYJWFVYm4O3td4UxiYX_nw0fl9-mgYCZ4u_NUvEqKf6DLR4M5awCT-xzBNaHVTDQgkrz5CGv_mqTLoI7eFvlTS80CjaXtTxmj_IZtYX24M9J15Hz6LGSHFagL2_TeC5zvytTHkIeznTgfemr_X7BjtVWHYgjkyY1TAZ5Ruo8v96hA"/>
<div class="absolute top-2 left-2 flex items-center gap-1 bg-surface-container-lowest/90 backdrop-blur-sm text-tertiary-container font-caption text-caption px-2 py-0.5 rounded-full font-semibold">
<span class="material-symbols-outlined text-[13px]" style="font-variation-settings: 'FILL' 1;">verified</span>
                    Verified
                  </div>
<button class="absolute top-2 right-2 w-7 h-7 rounded-full bg-surface-container-lowest/80 backdrop-blur-sm text-secondary-container flex items-center justify-center hover:scale-110 transition-transform">
<span class="material-symbols-outlined text-[16px]" style="font-variation-settings: 'FILL' 1;">favorite</span>
</button>
<span class="absolute bottom-2 right-2 bg-inverse-surface/80 text-inverse-on-surface font-caption text-[10px] px-2 py-0.5 rounded flex items-center gap-1">
<span class="material-symbols-outlined text-[12px]">photo_camera</span> 31
                  </span>
</div>
<div class="p-3.5 space-y-2">
<div>
<div class="font-headline-sm text-headline-sm text-on-surface">₹ 4.10 Cr</div>
<div class="font-caption text-caption text-on-surface-variant">EMI ₹2.62 L / mo</div>
</div>
<h3 class="font-label-md text-label-md text-on-surface truncate">Sheth Beaumonte</h3>
<p class="font-body-sm text-body-sm text-on-surface-variant flex items-center gap-1">
<span class="material-symbols-outlined text-[15px]">location_on</span>
                    Sion Circle, Central Mumbai
                  </p>
<div class="flex items-center gap-3 text-on-surface-variant font-caption text-caption pt-1">
<span>3 BHK</span>
<span>•</span>
<span>1,350 sq.ft</span>
<span>•</span>
<span>Dec 2025</span>
</div>
</div>
</div>
<div class="p-3.5 pt-0 flex items-center gap-2">
<button class="flex-1 py-1.5 rounded-lg bg-surface-container-lowest hover:bg-surface-container-high text-on-surface font-label-sm text-label-sm transition-colors text-center shadow-sm">
                  Details
                </button>
<button class="flex-1 py-1.5 rounded-lg bg-secondary-container hover:bg-secondary text-on-secondary font-label-sm text-label-sm transition-colors text-center shadow-sm">
                  Contact
                </button>
</div>
</div>
</div>
</div>
</div>
<!-- Right Aside Column (4 cols) -->
<div class="lg:col-span-4 space-y-gutter-lg">
<!-- Saved Searches & Instant Alerts -->
<div class="bg-surface-container-lowest rounded-xl p-gutter-lg shadow-sm space-y-gutter-md">
<div class="flex items-center justify-between">
<h2 class="font-headline-sm text-headline-sm text-on-surface flex items-center gap-2">
<span class="material-symbols-outlined text-primary-container">notifications_active</span>
              Saved Searches &amp; Alerts
            </h2>
<span class="bg-tertiary-container text-tertiary-fixed font-caption text-[11px] font-bold px-2 py-0.5 rounded-full">4 Active</span>
</div>
<!-- Alert Item 1 -->
<div class="p-3.5 rounded-xl bg-surface-container-low space-y-3">
<div class="flex items-start justify-between">
<div>
<h3 class="font-label-md text-label-md text-on-surface">Andheri West &amp; Lokhandwala</h3>
<p class="font-caption text-caption text-on-surface-variant">2 &amp; 3 BHK • Under ₹2.5 Cr • Multistorey</p>
</div>
<span class="bg-secondary-container text-on-secondary font-caption text-[10px] font-bold px-1.5 py-0.5 rounded">
                +14 New
              </span>
</div>
<div class="flex items-center justify-between pt-1 font-caption text-caption text-on-surface-variant">
<span>Alert via WhatsApp &amp; Email</span>
<label class="relative inline-flex items-center cursor-pointer">
<input checked="" class="sr-only peer" type="checkbox"/>
<div class="w-9 h-5 bg-surface-container-highest peer-focus:outline-none rounded-full peer peer-checked:after:translate-x-full peer-checked:after:border-surface peer-checked:bg-primary-container after:content-[''] after:absolute after:top-[2px] after:left-[2px] after:bg-surface-container-lowest after:rounded-full after:h-4 after:w-4 after:transition-all"></div>
</label>
</div>
</div>
<!-- Alert Item 2 -->
<div class="p-3.5 rounded-xl bg-surface-container-low space-y-3">
<div class="flex items-start justify-between">
<div>
<h3 class="font-label-md text-label-md text-on-surface">Bandra Kurla Complex (BKC)</h3>
<p class="font-caption text-caption text-on-surface-variant">3+ BHK • Ready Possession • High floor</p>
</div>
<span class="bg-surface-container-highest text-on-surface font-caption text-[10px] font-bold px-1.5 py-0.5 rounded">
                +3 New
              </span>
</div>
<div class="flex items-center justify-between pt-1 font-caption text-caption text-on-surface-variant">
<span>Alert via Email Only</span>
<label class="relative inline-flex items-center cursor-pointer">
<input checked="" class="sr-only peer" type="checkbox"/>
<div class="w-9 h-5 bg-surface-container-highest peer-focus:outline-none rounded-full peer peer-checked:after:translate-x-full peer-checked:after:border-surface peer-checked:bg-primary-container after:content-[''] after:absolute after:top-[2px] after:left-[2px] after:bg-surface-container-lowest after:rounded-full after:h-4 after:w-4 after:transition-all"></div>
</label>
</div>
</div>
<button class="w-full py-2.5 rounded-lg bg-surface-container hover:bg-surface-container-high text-primary-container font-label-sm text-label-sm font-semibold transition-colors flex items-center justify-center gap-1">
<span class="material-symbols-outlined text-[16px]">add_circle</span>
            Create New Property Alert
          </button>
</div>
<!-- AI Match Recommendation Teaser -->
<div class="bg-gradient-to-br from-primary-container to-primary text-on-primary rounded-xl p-gutter-lg shadow-md space-y-gutter-md relative overflow-hidden">
<div class="relative z-10 space-y-3">
<div class="flex items-center justify-between">
<span class="inline-flex items-center gap-1 bg-surface-container-lowest/15 backdrop-blur-md px-2.5 py-1 rounded-full font-caption text-caption text-tertiary-fixed">
<span class="material-symbols-outlined text-[14px]">auto_awesome</span>
                98% AI Affinity Match
              </span>
<span class="text-on-primary-container font-caption text-caption">Updated 2h ago</span>
</div>
<div>
<h3 class="font-headline-sm text-headline-sm text-on-primary">Kalpataru Bliss, Santacruz West</h3>
<p class="font-body-sm text-body-sm text-surface-variant">Matches your criteria for walking distance to Metro line 3 &amp; zero west sun exposure.</p>
</div>
<div class="flex items-center justify-between pt-2">
<div>
<span class="font-headline-sm text-headline-sm font-bold">₹ 3.15 Cr</span>
<span class="block font-caption text-[11px] text-surface-variant">2.5 BHK • 945 sq.ft</span>
</div>
<button class="px-3.5 py-2 rounded-lg bg-surface-container-lowest text-primary-container hover:bg-surface-bright font-label-sm text-label-sm font-semibold transition-colors shadow-sm">
                Inspect Match
              </button>
</div>
</div>
<!-- Decorative Ambient Elements -->
<div class="absolute -right-8 -bottom-8 w-32 h-32 rounded-full bg-secondary-container/20 blur-2xl pointer-events-none"></div>
<div class="absolute -left-6 -top-6 w-28 h-28 rounded-full bg-tertiary-fixed/15 blur-2xl pointer-events-none"></div>
</div>
<!-- Home Loan & Financial Eligibility Widget -->
<div class="bg-surface-container-lowest rounded-xl p-gutter-lg shadow-sm space-y-gutter-md">
<div class="flex items-center justify-between">
<div class="flex items-center gap-2">
<div class="w-8 h-8 rounded-lg bg-surface-container-high flex items-center justify-center text-primary-container">
<span class="material-symbols-outlined text-[20px]">account_balance</span>
</div>
<h3 class="font-headline-sm text-headline-sm text-on-surface">Home Loan Eligibility</h3>
</div>
<span class="bg-surface-container-high text-on-tertiary-fixed-variant font-caption text-caption px-2 py-0.5 rounded-full font-semibold">Pre-Approved</span>
</div>
<div class="bg-surface-container-low p-3.5 rounded-xl space-y-2">
<div class="flex items-baseline justify-between">
<span class="font-caption text-caption text-on-surface-variant">Pre-Approved Credit Limit</span>
<span class="font-headline-md text-headline-md text-on-surface font-bold">₹ 1.80 Cr</span>
</div>
<div class="flex items-center justify-between font-caption text-caption text-on-surface-variant">
<span>Preferential Rate: <b class="text-on-surface">8.40% p.a.</b></span>
<span>Tenure: <b class="text-on-surface">25 Yrs</b></span>
</div>
</div>
<div class="space-y-2">
<button class="w-full py-2.5 rounded-lg bg-primary-container hover:bg-primary text-on-primary font-label-sm text-label-sm font-semibold transition-colors shadow-sm flex items-center justify-center gap-2">
<span class="material-symbols-outlined text-[16px]">receipt_long</span>
              Get Instant Sanction Letter
            </button>
<p class="font-caption text-caption text-center text-on-surface-variant">Partnered with HDFC Bank, SBI &amp; ICICI Bank. Zero processing fee.</p>
</div>
</div>
<!-- Dedicated Buyer Concierge / Relationship Manager -->
<div class="bg-surface-container-lowest rounded-xl p-gutter-lg shadow-sm space-y-gutter-md">
<div class="space-y-1">
<span class="text-on-primary-fixed-variant font-caption text-caption uppercase tracking-wider font-semibold">Priority Advisory</span>
<h3 class="font-headline-sm text-headline-sm text-on-surface">Your Dedicated Relationship Concierge</h3>
</div>
<div class="flex items-center gap-3.5 p-3 rounded-xl bg-surface-container-low">
<div class="relative">
<img class="w-12 h-12 rounded-full object-cover" data-alt="Professional Indian corporate woman smiling warmly in contemporary blazer inside modern corporate office" src="https://lh3.googleusercontent.com/aida-public/AB6AXuChVbKJ9WlO6CtQkpmlz6sihr6RWVYbnFHJsfIsKNz7B-9gSG7BYI-a-krKM_wWmAqkzac80uZSz_TtaM1JZX3O9li944G2I4kYXfLF3hCJ2SPeW0uiD2iPg7nPi2mBSaVWACWYCwOaU44H9iECB1kqFhHzDGHQx8KOGTDXCgY-D_7InCjBEnI3nnIw2DkpCE9z-rv03P3iDZ2bxlVuST3sPIzmkK71sQPy3XZqe4I_2ewqVWiIEL0-pQ"/>
<span class="absolute bottom-0 right-0 w-3.5 h-3.5 rounded-full bg-tertiary-container border-2 border-surface-container-lowest" title="Available Online"></span>
</div>
<div>
<h4 class="font-label-md text-label-md text-on-surface">Neha Gupta</h4>
<p class="font-caption text-caption text-on-surface-variant">Senior Buyer Specialist (Western Suburbs)</p>
<div class="flex items-center gap-1 text-tertiary-container font-caption text-[11px] font-semibold mt-0.5">
<span class="material-symbols-outlined text-[13px]" style="font-variation-settings: 'FILL' 1;">star</span>
                4.9/5 • 420+ Deals Closed
              </div>
</div>
</div>
<p class="font-body-sm text-body-sm text-on-surface-variant">
            Have questions on builder reputations, legal clear titles, or hidden maintenance charges? Neha is assigned to your account.
          </p>
<div class="grid grid-cols-2 gap-2">
<button class="py-2 rounded-lg bg-surface-container hover:bg-surface-container-high text-on-surface font-label-sm text-label-sm font-semibold transition-colors flex items-center justify-center gap-1.5 shadow-sm">
<span class="material-symbols-outlined text-[16px] text-primary-container">call</span>
              Call Neha
            </button>
<button class="py-2 rounded-lg bg-secondary-container hover:bg-secondary text-on-secondary font-label-sm text-label-sm font-semibold transition-colors flex items-center justify-center gap-1.5 shadow-sm">
<span class="material-symbols-outlined text-[16px]">chat</span>
              Chat WhatsApp
            </button>
</div>
</div>
</div>
</div>
</section>
</div></main><footer class="w-full bg-inverse-surface text-inverse-on-surface pt-gutter-2xl pb-gutter-xl"><div class="max-w-container-max mx-auto px-gutter-lg"><div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-gutter-xl mb-gutter-2xl"><div class="space-y-gutter-md"><div class="flex items-center gap-2"><img alt="EstateHub Logo" class="h-8 w-auto object-contain brightness-200" src="https://lh3.googleusercontent.com/aida/AEtjO1Xg4rP1x__tmUvhhUEeM-xIYBlSjyhgL-aDvDihhuMxD0bc_kL9kHorsRYR5EvM9wdONnfScP46YL0QssDo1Yzd9XXTo1GpuWC9c1SGhoiGFmbBZZ-L95_tHf_7u7-NnrWpEVNDa3KKfH1MN1eMtrk2ZiwZGYM9sKA4zxHHA9vupb767aMCr2J7zivaAtyK3ypPdo3ZJ1n88WJ1YI5TA-loMe151e9ACRfxjid8X1QrA8mUitrWMg5qDMA"/><span class="font-headline-md text-headline-md text-surface-container-lowest tracking-tight">EstateHub</span></div><p class="font-body-sm text-body-sm text-surface-variant max-w-xs">India's trusted real estate portal for verified homes, apartments, and commercial spaces.</p><div class="pt-gutter-xs flex items-center gap-gutter-sm"><span class="flex items-center gap-1 bg-tertiary-container text-tertiary-fixed font-caption text-caption px-2.5 py-1 rounded-full"><span class="material-symbols-outlined text-[14px]">verified</span> 100% RERA Verified</span></div></div><div class="space-y-gutter-sm"><h3 class="font-label-md text-label-md text-surface-container-lowest uppercase tracking-wider">Popular Searches</h3><ul class="space-y-2 font-body-sm text-body-sm text-surface-variant"><li><a class="hover:text-surface-bright transition-colors" data-path="rent-properties" href="javascript:void(0)">Flats in Mumbai</a></li><li><a class="hover:text-surface-bright transition-colors" data-path="buy-properties" href="javascript:void(0)">Flats in Bangalore</a></li><li><a class="hover:text-surface-bright transition-colors" data-path="new-projects" href="javascript:void(0)">Apartments in Gurgaon</a></li><li><a class="hover:text-surface-bright transition-colors" data-path="buy-properties" href="javascript:void(0)">Villas in Hyderabad</a></li><li><a class="hover:text-surface-bright transition-colors" data-path="commercial-spaces" href="javascript:void(0)">Offices in Pune</a></li></ul></div><div class="space-y-gutter-sm"><h3 class="font-label-md text-label-md text-surface-container-lowest uppercase tracking-wider">Quick Links</h3><ul class="space-y-2 font-body-sm text-body-sm text-surface-variant"><li><a class="hover:text-surface-bright transition-colors" data-path="about-us" href="javascript:void(0)">About Us</a></li><li><a class="hover:text-surface-bright transition-colors" data-path="careers" href="javascript:void(0)">Careers</a></li><li><a class="hover:text-surface-bright transition-colors" data-path="research-insights" href="javascript:void(0)">Research &amp; Insights</a></li><li><a class="hover:text-surface-bright transition-colors" data-path="contact-support" href="javascript:void(0)">Contact Support</a></li><li><a class="hover:text-surface-bright transition-colors" data-path="terms-privacy" href="javascript:void(0)">Terms &amp; Privacy</a></li></ul></div><div class="space-y-gutter-md"><h3 class="font-label-md text-label-md text-surface-container-lowest uppercase tracking-wider">Experience on Mobile</h3><p class="font-body-sm text-body-sm text-surface-variant">Download EstateHub App for instant notifications and direct agent chats.</p><div class="flex flex-col gap-2"><div class="flex items-center gap-3 px-3 py-2 rounded-lg bg-surface-container-high/10 hover:bg-surface-container-high/20 text-surface-bright transition-colors cursor-pointer"><span class="material-symbols-outlined text-primary-fixed">play_arrow</span><div class="text-left"><p class="font-caption text-[10px] text-surface-variant uppercase">GET IT ON</p><p class="font-label-sm text-label-sm font-semibold">Google Play</p></div></div><div class="flex items-center gap-3 px-3 py-2 rounded-lg bg-surface-container-high/10 hover:bg-surface-container-high/20 text-surface-bright transition-colors cursor-pointer"><span class="material-symbols-outlined text-primary-fixed">install_mobile</span><div class="text-left"><p class="font-caption text-[10px] text-surface-variant uppercase">DOWNLOAD ON</p><p class="font-label-sm text-label-sm font-semibold">App Store</p></div></div></div></div></div><div class="pt-gutter-lg mt-gutter-xl border-t border-outline/20 flex flex-col md:flex-row items-center justify-between gap-gutter-md font-caption text-caption text-surface-variant"><div>© 2025 EstateHub Technologies Private Limited. All rights reserved.</div><div class="flex items-center gap-gutter-xs text-surface-dim"><span class="material-symbols-outlined text-tertiary-fixed text-[16px]">shield</span><span>Made with trust for home seekers across India</span></div></div></div></footer></body></html>
