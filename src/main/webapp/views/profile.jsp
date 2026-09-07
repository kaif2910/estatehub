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
<div class="w-16 h-16 rounded-full bg-primary-container text-on-primary flex items-center justify-center font-headline-md text-headline-md shadow-md">
              VM
            </div>
<span class="absolute bottom-0 right-0 w-5 h-5 rounded-full bg-tertiary-container text-tertiary-fixed flex items-center justify-center" title="Verified Buyer">
<span class="material-symbols-outlined text-[14px]">verified</span>
</span>
</div>
<div class="space-y-1">
<div class="flex flex-wrap items-center gap-2">
<h1 class="font-headline-lg text-headline-lg text-on-surface">Welcome back, Vikram 👋</h1>
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

<div class="max-w-3xl mx-auto bg-surface-container-lowest p-gutter-xl rounded-2xl shadow-sm mt-gutter-xl mb-gutter-2xl">
<h2 class="font-headline-lg text-headline-lg text-on-surface mb-gutter-lg flex items-center gap-2"><span class="material-symbols-outlined text-primary-container text-[28px]">person</span> Edit Profile</h2>
<form action="${pageContext.request.contextPath}/profile" method="POST" class="space-y-gutter-md">
    <div class="grid grid-cols-1 md:grid-cols-2 gap-gutter-md">
        <div class="md:col-span-2">
            <label class="block font-label-sm text-label-sm text-on-surface mb-1">Full Name</label>
            <input type="text" name="name" value="${sessionScope.currentUser.name}" class="w-full px-4 py-3 rounded-xl bg-surface-container-low text-on-surface font-body-md text-body-md focus:outline-none focus:ring-2 focus:ring-primary-container">
        </div>
        <div class="md:col-span-2">
            <label class="block font-label-sm text-label-sm text-on-surface mb-1">Email</label>
            <input type="email" name="email" value="${sessionScope.currentUser.email}" class="w-full px-4 py-3 rounded-xl bg-surface-container-low text-on-surface font-body-md text-body-md focus:outline-none focus:ring-2 focus:ring-primary-container" readonly>
        </div>
        <div>
            <label class="block font-label-sm text-label-sm text-on-surface mb-1">Phone Number</label>
            <input type="tel" name="phone" value="${sessionScope.currentUser.phone}" class="w-full px-4 py-3 rounded-xl bg-surface-container-low text-on-surface font-body-md text-body-md focus:outline-none focus:ring-2 focus:ring-primary-container">
        </div>
        <div>
            <label class="block font-label-sm text-label-sm text-on-surface mb-1">WhatsApp Number</label>
            <input type="tel" name="whatsappNumber" value="${sessionScope.currentUser.whatsappNumber}" class="w-full px-4 py-3 rounded-xl bg-surface-container-low text-on-surface font-body-md text-body-md focus:outline-none focus:ring-2 focus:ring-primary-container">
        </div>
    </div>
    <div class="pt-gutter-md">
        <button type="submit" class="w-full py-3 rounded-xl bg-primary-container hover:bg-primary text-on-primary font-label-md text-label-md font-semibold transition-all shadow-sm">Save Profile</button>
    </div>
</form>
</div>

</div></main><footer class="w-full bg-inverse-surface text-inverse-on-surface pt-gutter-2xl pb-gutter-xl"><div class="max-w-container-max mx-auto px-gutter-lg"><div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-gutter-xl mb-gutter-2xl"><div class="space-y-gutter-md"><div class="flex items-center gap-2"><img alt="EstateHub Logo" class="h-8 w-auto object-contain brightness-200" src="https://lh3.googleusercontent.com/aida/AEtjO1Xg4rP1x__tmUvhhUEeM-xIYBlSjyhgL-aDvDihhuMxD0bc_kL9kHorsRYR5EvM9wdONnfScP46YL0QssDo1Yzd9XXTo1GpuWC9c1SGhoiGFmbBZZ-L95_tHf_7u7-NnrWpEVNDa3KKfH1MN1eMtrk2ZiwZGYM9sKA4zxHHA9vupb767aMCr2J7zivaAtyK3ypPdo3ZJ1n88WJ1YI5TA-loMe151e9ACRfxjid8X1QrA8mUitrWMg5qDMA"/><span class="font-headline-md text-headline-md text-surface-container-lowest tracking-tight">EstateHub</span></div><p class="font-body-sm text-body-sm text-surface-variant max-w-xs">India's trusted real estate portal for verified homes, apartments, and commercial spaces.</p><div class="pt-gutter-xs flex items-center gap-gutter-sm"><span class="flex items-center gap-1 bg-tertiary-container text-tertiary-fixed font-caption text-caption px-2.5 py-1 rounded-full"><span class="material-symbols-outlined text-[14px]">verified</span> 100% RERA Verified</span></div></div><div class="space-y-gutter-sm"><h3 class="font-label-md text-label-md text-surface-container-lowest uppercase tracking-wider">Popular Searches</h3><ul class="space-y-2 font-body-sm text-body-sm text-surface-variant"><li><a class="hover:text-surface-bright transition-colors" data-path="rent-properties" href="javascript:void(0)">Flats in Mumbai</a></li><li><a class="hover:text-surface-bright transition-colors" data-path="buy-properties" href="javascript:void(0)">Flats in Bangalore</a></li><li><a class="hover:text-surface-bright transition-colors" data-path="new-projects" href="javascript:void(0)">Apartments in Gurgaon</a></li><li><a class="hover:text-surface-bright transition-colors" data-path="buy-properties" href="javascript:void(0)">Villas in Hyderabad</a></li><li><a class="hover:text-surface-bright transition-colors" data-path="commercial-spaces" href="javascript:void(0)">Offices in Pune</a></li></ul></div><div class="space-y-gutter-sm"><h3 class="font-label-md text-label-md text-surface-container-lowest uppercase tracking-wider">Quick Links</h3><ul class="space-y-2 font-body-sm text-body-sm text-surface-variant"><li><a class="hover:text-surface-bright transition-colors" data-path="about-us" href="javascript:void(0)">About Us</a></li><li><a class="hover:text-surface-bright transition-colors" data-path="careers" href="javascript:void(0)">Careers</a></li><li><a class="hover:text-surface-bright transition-colors" data-path="research-insights" href="javascript:void(0)">Research &amp; Insights</a></li><li><a class="hover:text-surface-bright transition-colors" data-path="contact-support" href="javascript:void(0)">Contact Support</a></li><li><a class="hover:text-surface-bright transition-colors" data-path="terms-privacy" href="javascript:void(0)">Terms &amp; Privacy</a></li></ul></div><div class="space-y-gutter-md"><h3 class="font-label-md text-label-md text-surface-container-lowest uppercase tracking-wider">Experience on Mobile</h3><p class="font-body-sm text-body-sm text-surface-variant">Download EstateHub App for instant notifications and direct agent chats.</p><div class="flex flex-col gap-2"><div class="flex items-center gap-3 px-3 py-2 rounded-lg bg-surface-container-high/10 hover:bg-surface-container-high/20 text-surface-bright transition-colors cursor-pointer"><span class="material-symbols-outlined text-primary-fixed">play_arrow</span><div class="text-left"><p class="font-caption text-[10px] text-surface-variant uppercase">GET IT ON</p><p class="font-label-sm text-label-sm font-semibold">Google Play</p></div></div><div class="flex items-center gap-3 px-3 py-2 rounded-lg bg-surface-container-high/10 hover:bg-surface-container-high/20 text-surface-bright transition-colors cursor-pointer"><span class="material-symbols-outlined text-primary-fixed">install_mobile</span><div class="text-left"><p class="font-caption text-[10px] text-surface-variant uppercase">DOWNLOAD ON</p><p class="font-label-sm text-label-sm font-semibold">App Store</p></div></div></div></div></div><div class="pt-gutter-lg mt-gutter-xl border-t border-outline/20 flex flex-col md:flex-row items-center justify-between gap-gutter-md font-caption text-caption text-surface-variant"><div>© 2025 EstateHub Technologies Private Limited. All rights reserved.</div><div class="flex items-center gap-gutter-xs text-surface-dim"><span class="material-symbols-outlined text-tertiary-fixed text-[16px]">shield</span><span>Made with trust for home seekers across India</span></div></div></div></footer></body></html>