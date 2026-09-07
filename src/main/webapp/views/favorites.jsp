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
<!-- Top Sub-Navigation / Profile Header Bar -->
<section class="w-full bg-surface-container-low shadow-sm">
<div class="max-w-container-max mx-auto px-gutter-lg pt-gutter-lg pb-0">
<!-- Profile Status Bar -->
<div class="flex flex-col md:flex-row md:items-center justify-between gap-gutter-md pb-gutter-md">
<div class="flex items-center gap-gutter-md">
<div class="relative">
<div class="w-14 h-14 rounded-full bg-primary-container text-on-primary flex items-center justify-center font-headline-md text-headline-md shadow-md">${fn:substring(sessionScope.currentUser.name, 0, 1)}</div>
<span class="absolute bottom-0 right-0 w-4 h-4 rounded-full bg-tertiary-container text-tertiary-fixed flex items-center justify-center shadow-sm" title="Verified Buyer">
<span class="material-symbols-outlined text-[12px]" style="font-variation-settings: 'FILL' 1;">verified</span>
</span>
</div>
<div>
<div class="flex items-center gap-2">
<h1 class="font-headline-lg text-headline-lg text-on-surface">${sessionScope.currentUser.name}</h1>
<span class="bg-tertiary-container text-tertiary-fixed font-caption text-caption px-2 py-0.5 rounded-full flex items-center gap-1 font-semibold">
<span class="material-symbols-outlined text-[13px]">verified_user</span> RERA Pre-Approved Buyer
              </span>
</div>
<p class="font-body-sm text-body-sm text-on-surface-variant flex items-center gap-2 mt-0.5">
<span>Looking for 2, 3 BHK in Western Suburbs &amp; BKC</span>
<span class="w-1 h-1 rounded-full bg-outline"></span>
<span class="text-primary-container font-semibold">Budget: ₹1.5 Cr – ₹4.0 Cr</span>
</p>
</div>
</div>
<!-- Quick Activity Stats Strip -->
<div class="flex items-center gap-gutter-sm">
<div class="bg-surface-container-lowest px-3.5 py-2 rounded-lg shadow-sm flex items-center gap-2.5">
<span class="material-symbols-outlined text-primary-container text-[20px]">calendar_month</span>
<div class="text-left">
<p class="font-caption text-caption text-on-surface-variant">Next Site Visit</p>
<p class="font-label-sm text-label-sm text-on-surface font-bold">Tomorrow, 11:30 AM</p>
</div>
</div>
<div class="bg-surface-container-lowest px-3.5 py-2 rounded-lg shadow-sm flex items-center gap-2.5">
<span class="material-symbols-outlined text-secondary-container text-[20px]">mark_email_unread</span>
<div class="text-left">
<p class="font-caption text-caption text-on-surface-variant">Agent Replies</p>
<p class="font-label-sm text-label-sm text-on-surface font-bold">3 Unread</p>
</div>
</div>
</div>
</div>
<!-- Navigation Tabs Strip -->
<div class="flex items-center gap-gutter-sm overflow-x-auto scrollbar-none pt-2">
<a class="font-label-md text-label-md text-on-surface-variant hover:text-on-surface py-3 px-3 transition-colors flex items-center gap-1.5 whitespace-nowrap" href="javascript:void(0)">
<span class="material-symbols-outlined text-[18px]">dashboard</span>
<span>Dashboard</span>
</a>
<a class="font-label-md text-label-md text-on-primary bg-primary-container py-2.5 px-4 rounded-t-lg shadow-sm flex items-center gap-2 whitespace-nowrap font-bold" href="javascript:void(0)">
<span class="material-symbols-outlined text-[18px]" style="font-variation-settings: 'FILL' 1;">bookmark</span>
<span>Favorites &amp; Shortlist</span>
<span class="bg-secondary-container text-on-secondary font-caption text-[11px] px-1.5 py-0.5 rounded-full font-bold">8</span>
</a>
<a class="font-label-md text-label-md text-on-surface-variant hover:text-on-surface py-3 px-3 transition-colors flex items-center gap-1.5 whitespace-nowrap" href="javascript:void(0)">
<span class="material-symbols-outlined text-[18px]">saved_search</span>
<span>Saved Searches</span>
<span class="bg-surface-container-high text-on-surface-variant font-caption text-[11px] px-1.5 py-0.2 rounded-full">4</span>
</a>
<a class="font-label-md text-label-md text-on-surface-variant hover:text-on-surface py-3 px-3 transition-colors flex items-center gap-1.5 whitespace-nowrap" href="javascript:void(0)">
<span class="material-symbols-outlined text-[18px]">auto_awesome</span>
<span>AI Recommendations</span>
<span class="w-2 h-2 rounded-full bg-secondary-container"></span>
</a>
<a class="font-label-md text-label-md text-on-surface-variant hover:text-on-surface py-3 px-3 transition-colors flex items-center gap-1.5 whitespace-nowrap" href="javascript:void(0)">
<span class="material-symbols-outlined text-[18px]">tour</span>
<span>My Site Visits</span>
<span class="bg-surface-container-high text-on-surface-variant font-caption text-[11px] px-1.5 py-0.2 rounded-full">2</span>
</a>
</div>
</div>
</section>
<!-- Main Content Layout -->
<div class="max-w-container-max mx-auto w-full px-gutter-lg py-gutter-xl">
<!-- Header Controls: Title & Bulk Utilities -->
<div class="flex flex-col lg:flex-row lg:items-center justify-between gap-gutter-md mb-gutter-lg">
<div>
<div class="flex items-center gap-3">
<h2 class="font-headline-xl text-headline-xl text-on-surface">My Shortlisted Properties</h2>
<span class="bg-primary-fixed text-on-primary-fixed font-label-sm text-label-sm px-2.5 py-0.5 rounded-full font-bold">8 Homes Saved</span>
</div>
<p class="font-body-md text-body-md text-on-surface-variant mt-1">
          Compare specs side-by-side, record private visit notes, or reach RERA registered builders directly.
        </p>
</div>
<!-- Action Utility Bar -->
<div class="flex flex-wrap items-center gap-2">
<button class="px-3.5 py-2 rounded-lg bg-surface-container-lowest text-primary-container font-label-md text-label-md font-semibold shadow-sm hover:bg-surface-container-low transition-all flex items-center gap-1.5" id="toggle-compare-mode">
<span class="material-symbols-outlined text-[18px]">compare_arrows</span>
<span>Compare (2 Selected)</span>
</button>
<button class="px-3.5 py-2 rounded-lg bg-surface-container-lowest text-on-surface font-label-md text-label-md font-semibold shadow-sm hover:bg-surface-container-low transition-all flex items-center gap-1.5">
<span class="material-symbols-outlined text-[18px]">picture_as_pdf</span>
<span class="hidden sm:inline">Export PDF</span>
</button>
<button class="px-3.5 py-2 rounded-lg bg-tertiary-container text-tertiary-fixed font-label-md text-label-md font-semibold shadow-sm hover:bg-tertiary transition-all flex items-center gap-1.5">
<span class="material-symbols-outlined text-[18px]">share</span>
<span>WhatsApp List</span>
</button>
</div>
</div>
<!-- Filter & Sorter Toolbar -->
<div class="bg-surface-container-lowest p-gutter-md rounded-xl shadow-sm mb-gutter-xl flex flex-col md:flex-row items-start md:items-center justify-between gap-gutter-md">
<!-- Quick Filter Chips -->
<div class="flex items-center gap-1.5 flex-wrap">
<button class="bg-primary-container text-on-primary font-label-sm text-label-sm px-3 py-1.5 rounded-full font-semibold shadow-sm">
          All (8)
        </button>
<button class="bg-surface-container-low text-on-surface hover:bg-surface-container font-label-sm text-label-sm px-3 py-1.5 rounded-full transition-colors flex items-center gap-1">
<span class="w-2 h-2 rounded-full bg-secondary-container"></span>
<span>Price Dropped (2)</span>
</button>
<button class="bg-surface-container-low text-on-surface hover:bg-surface-container font-label-sm text-label-sm px-3 py-1.5 rounded-full transition-colors">
          Ready to Move (5)
        </button>
<button class="bg-surface-container-low text-on-surface hover:bg-surface-container font-label-sm text-label-sm px-3 py-1.5 rounded-full transition-colors">
          Under Construction (3)
        </button>
<button class="bg-surface-container-low text-on-surface hover:bg-surface-container font-label-sm text-label-sm px-3 py-1.5 rounded-full transition-colors">
          Direct Owner (3)
        </button>
</div>
<!-- Sorting Select -->
<div class="flex items-center gap-2 self-end md:self-auto shrink-0">
<span class="font-caption text-caption text-on-surface-variant whitespace-nowrap">Sort by:</span>
<div class="relative">
<select class="bg-surface-container-low text-on-surface font-label-sm text-label-sm py-1.5 pl-3 pr-8 rounded-lg appearance-none cursor-pointer focus:outline-none focus:ring-2 focus:ring-primary-container">
<option selected="">Date Saved (Recent first)</option>
<option>Price: Low to High</option>
<option>Price: High to Low</option>
<option>Highest Match Score (AI)</option>
<option>Area: Largest First</option>
</select>
<span class="material-symbols-outlined text-[16px] text-on-surface-variant absolute right-2 top-1/2 -translate-y-1/2 pointer-events-none">expand_more</span>
</div>
</div>
</div>
<!-- Properties Grid -->
<div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-gutter-lg">
<c:choose>
  <c:when test="${not empty favorites}">
    <c:forEach items="${favorites}" var="fav">
      <div class="group bg-surface-container-lowest rounded-2xl overflow-hidden shadow-sm hover:shadow-xl transition-all duration-300 flex flex-col justify-between border border-outline-variant/30">
        <div class="relative aspect-video w-full overflow-hidden bg-surface-container-high">
          <img class="w-full h-full object-cover group-hover:scale-105 transition-transform duration-500" src="${fav.primaryImageUrl}" alt="${fav.title}"/>
          <div class="absolute top-3 left-3 flex flex-col gap-1.5 items-start">
            <span class="bg-tertiary-container/95 backdrop-blur text-tertiary-fixed font-caption text-caption px-2.5 py-1 rounded-full font-bold flex items-center gap-1 shadow-sm">
              <span class="material-symbols-outlined text-[14px]">verified</span> Verified
            </span>
          </div>
          <a href="${pageContext.request.contextPath}/favorites?action=remove&propertyId=${fav.propertyId}&redirect=${pageContext.request.contextPath}/favorites" 
             class="absolute top-3 right-3 w-9 h-9 rounded-full bg-surface-container-lowest/95 backdrop-blur flex items-center justify-center text-secondary-container shadow-md hover:scale-110 transition-transform" 
             title="Remove from favorites">
            <span class="material-symbols-outlined text-[20px]" style="font-variation-settings: 'FILL' 1;">favorite</span>
          </a>
        </div>
        <div class="p-4 space-y-2">
          <div class="flex items-baseline justify-between gap-2 mb-1">
            <span class="font-headline-xl text-headline-xl text-on-surface font-extrabold text-primary">₹ ${fav.price}</span>
            <span class="font-caption text-caption text-on-surface-variant font-semibold uppercase">${fav.purpose}</span>
          </div>
          <h3 class="font-headline-sm text-headline-sm text-on-surface font-bold truncate group-hover:text-primary transition-colors">
            <a href="${pageContext.request.contextPath}/property/details?id=${fav.propertyId}">${fav.title}</a>
          </h3>
          <p class="font-body-sm text-body-sm text-on-surface-variant flex items-center gap-1 mt-0.5">
            <span class="material-symbols-outlined text-primary text-[16px]">location_on</span>
            <span>${fav.location}, ${fav.city}</span>
          </p>
          <div class="grid grid-cols-3 gap-2 my-3 p-2 rounded-lg bg-surface-container-low text-center font-caption text-caption">
            <div>
              <p class="text-[10px] uppercase text-on-surface-variant">BHK</p>
              <p class="font-bold text-on-surface">${fav.bedrooms} Beds</p>
            </div>
            <div class="border-x border-outline-variant/30">
              <p class="text-[10px] uppercase text-on-surface-variant">Area</p>
              <p class="font-bold text-on-surface">${fav.areaSqft} sq.ft</p>
            </div>
            <div>
              <p class="text-[10px] uppercase text-on-surface-variant">Baths</p>
              <p class="font-bold text-on-surface">${fav.bathrooms} Baths</p>
            </div>
          </div>
        </div>
        <div class="p-4 pt-0 flex items-center gap-2">
          <a href="${pageContext.request.contextPath}/property/details?id=${fav.propertyId}" class="flex-1 bg-primary-container hover:bg-primary text-on-primary py-2.5 px-3 rounded-xl font-label-md text-label-md font-semibold transition-all shadow-sm text-center block">
            View Details
          </a>
          <a href="https://www.google.com/maps/dir/?api=1&destination=${fn:escapeXml(fav.location)}+${fn:escapeXml(fav.city)}" target="_blank" class="px-3.5 py-2.5 rounded-xl bg-tertiary-container hover:bg-tertiary text-on-tertiary font-label-md text-label-md font-semibold transition-all shadow-sm flex items-center gap-1">
            <span class="material-symbols-outlined text-base">directions</span>
            <span>Directions</span>
          </a>
        </div>
      </div>
    </c:forEach>
  </c:when>
  <c:otherwise>
    <div class="col-span-full bg-surface-container-lowest p-12 rounded-3xl shadow-sm border border-outline-variant/30 text-center flex flex-col items-center space-y-4">
      <div class="w-16 h-16 rounded-full bg-surface-container-low flex items-center justify-center text-primary">
        <span class="material-symbols-outlined text-3xl">favorite_border</span>
      </div>
      <h3 class="font-heading text-xl font-bold text-on-surface">No Shortlisted Properties Yet</h3>
      <p class="text-sm text-on-surface-variant max-w-md">Save properties by clicking the heart icon on search listings or property detail pages.</p>
      <a href="${pageContext.request.contextPath}/search" class="mt-2 px-6 py-3 rounded-xl bg-primary hover:bg-primary-container text-on-primary font-bold text-xs shadow-md transition-all">Explore Properties</a>
    </div>
  </c:otherwise>
</c:choose>
</div>
<!-- Empty State / Helpful Guidance Strip -->
<div class="mt-gutter-2xl p-gutter-lg rounded-2xl bg-surface-container-low flex flex-col md:flex-row items-center justify-between gap-gutter-md">
<div class="flex items-center gap-gutter-md">
<div class="w-12 h-12 rounded-xl bg-tertiary-container text-tertiary-fixed flex items-center justify-center shrink-0">
<span class="material-symbols-outlined text-[28px]">notifications_active</span>
</div>
<div>
<h4 class="font-headline-sm text-headline-sm text-on-surface font-bold">Never miss a price reduction or direct developer deal</h4>
<p class="font-body-sm text-body-sm text-on-surface-variant">Instant WhatsApp &amp; SMS alerts are active for all your 8 shortlisted projects.</p>
</div>
</div>
<button class="bg-surface-container-lowest hover:bg-surface-container text-on-surface font-label-md text-label-md px-4 py-2.5 rounded-lg shadow-sm font-semibold transition-all whitespace-nowrap">
        Manage Alert Preferences
      </button>
</div>
</div>
<!-- Floating Sticky Compare Drawer Bar -->
<div class="sticky bottom-4 z-40 max-w-container-max mx-auto px-gutter-lg w-full" id="compare-bar">
<div class="bg-inverse-surface/95 backdrop-blur-md text-inverse-on-surface p-3.5 sm:p-4 rounded-xl shadow-[0_12px_40px_rgba(30,34,41,0.24)] flex flex-col sm:flex-row items-center justify-between gap-gutter-md">
<!-- Selection Summary -->
<div class="flex items-center gap-3">
<span class="w-8 h-8 rounded-lg bg-primary-container text-on-primary flex items-center justify-center font-label-sm font-bold">
          2
        </span>
<div>
<p class="font-label-md text-label-md text-surface-container-lowest font-bold">
            Properties selected to compare:
          </p>
<p class="font-caption text-caption text-surface-variant flex items-center gap-1.5 truncate max-w-sm sm:max-w-md">
<span class="text-primary-fixed font-semibold">Oberoi Sky City</span>
<span class="text-outline">vs</span>
<span class="text-primary-fixed font-semibold">Adani Western Heights</span>
</p>
</div>
</div>
<!-- Action Buttons -->
<div class="flex items-center gap-2.5 w-full sm:w-auto justify-end">
<button class="font-label-sm text-label-sm text-surface-variant hover:text-surface-bright px-2 py-1.5 transition-colors" id="clear-compare">
          Clear
        </button>
<button class="bg-secondary-container hover:bg-secondary text-on-secondary px-5 py-2.5 rounded-lg font-label-md text-label-md font-bold transition-all shadow-md flex items-center gap-2 shrink-0">
<span class="material-symbols-outlined text-[18px]">balance</span>
<span>Compare Detailed Specs side-by-side</span>
</button>
</div>
</div>
</div>
</div>
<script>
  // Simple micro-interaction for clearing comparison selection
  document.getElementById('clear-compare')?.addEventListener('click', function() {
    const checkboxes = document.querySelectorAll('input[type="checkbox"]');
    checkboxes.forEach(cb => cb.checked = false);
    const bar = document.getElementById('compare-bar');
    if (bar) bar.style.display = 'none';
  });
</script></main><footer class="w-full bg-inverse-surface text-inverse-on-surface pt-gutter-2xl pb-gutter-xl"><div class="max-w-container-max mx-auto px-gutter-lg"><div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-gutter-xl mb-gutter-2xl"><div class="space-y-gutter-md"><div class="flex items-center gap-2"><img alt="EstateHub Logo" class="h-8 w-auto object-contain brightness-200" src="https://lh3.googleusercontent.com/aida/AEtjO1Xg4rP1x__tmUvhhUEeM-xIYBlSjyhgL-aDvDihhuMxD0bc_kL9kHorsRYR5EvM9wdONnfScP46YL0QssDo1Yzd9XXTo1GpuWC9c1SGhoiGFmbBZZ-L95_tHf_7u7-NnrWpEVNDa3KKfH1MN1eMtrk2ZiwZGYM9sKA4zxHHA9vupb767aMCr2J7zivaAtyK3ypPdo3ZJ1n88WJ1YI5TA-loMe151e9ACRfxjid8X1QrA8mUitrWMg5qDMA"/><span class="font-headline-md text-headline-md text-surface-container-lowest tracking-tight">EstateHub</span></div><p class="font-body-sm text-body-sm text-surface-variant max-w-xs">India's trusted real estate portal for verified homes, apartments, and commercial spaces.</p><div class="pt-gutter-xs flex items-center gap-gutter-sm"><span class="flex items-center gap-1 bg-tertiary-container text-tertiary-fixed font-caption text-caption px-2.5 py-1 rounded-full"><span class="material-symbols-outlined text-[14px]">verified</span> 100% RERA Verified</span></div></div><div class="space-y-gutter-sm"><h3 class="font-label-md text-label-md text-surface-container-lowest uppercase tracking-wider">Popular Searches</h3><ul class="space-y-2 font-body-sm text-body-sm text-surface-variant"><li><a class="hover:text-surface-bright transition-colors" data-path="rent-properties" href="javascript:void(0)">Flats in Mumbai</a></li><li><a class="hover:text-surface-bright transition-colors" data-path="buy-properties" href="javascript:void(0)">Flats in Bangalore</a></li><li><a class="hover:text-surface-bright transition-colors" data-path="new-projects" href="javascript:void(0)">Apartments in Gurgaon</a></li><li><a class="hover:text-surface-bright transition-colors" data-path="buy-properties" href="javascript:void(0)">Villas in Hyderabad</a></li><li><a class="hover:text-surface-bright transition-colors" data-path="commercial-spaces" href="javascript:void(0)">Offices in Pune</a></li></ul></div><div class="space-y-gutter-sm"><h3 class="font-label-md text-label-md text-surface-container-lowest uppercase tracking-wider">Quick Links</h3><ul class="space-y-2 font-body-sm text-body-sm text-surface-variant"><li><a class="hover:text-surface-bright transition-colors" data-path="about-us" href="javascript:void(0)">About Us</a></li><li><a class="hover:text-surface-bright transition-colors" data-path="careers" href="javascript:void(0)">Careers</a></li><li><a class="hover:text-surface-bright transition-colors" data-path="research-insights" href="javascript:void(0)">Research &amp; Insights</a></li><li><a class="hover:text-surface-bright transition-colors" data-path="contact-support" href="javascript:void(0)">Contact Support</a></li><li><a class="hover:text-surface-bright transition-colors" data-path="terms-privacy" href="javascript:void(0)">Terms &amp; Privacy</a></li></ul></div><div class="space-y-gutter-md"><h3 class="font-label-md text-label-md text-surface-container-lowest uppercase tracking-wider">Experience on Mobile</h3><p class="font-body-sm text-body-sm text-surface-variant">Download EstateHub App for instant notifications and direct agent chats.</p><div class="flex flex-col gap-2"><div class="flex items-center gap-3 px-3 py-2 rounded-lg bg-surface-container-high/10 hover:bg-surface-container-high/20 text-surface-bright transition-colors cursor-pointer"><span class="material-symbols-outlined text-primary-fixed">play_arrow</span><div class="text-left"><p class="font-caption text-[10px] text-surface-variant uppercase">GET IT ON</p><p class="font-label-sm text-label-sm font-semibold">Google Play</p></div></div><div class="flex items-center gap-3 px-3 py-2 rounded-lg bg-surface-container-high/10 hover:bg-surface-container-high/20 text-surface-bright transition-colors cursor-pointer"><span class="material-symbols-outlined text-primary-fixed">install_mobile</span><div class="text-left"><p class="font-caption text-[10px] text-surface-variant uppercase">DOWNLOAD ON</p><p class="font-label-sm text-label-sm font-semibold">App Store</p></div></div></div></div></div><div class="pt-gutter-lg mt-gutter-xl border-t border-outline/20 flex flex-col md:flex-row items-center justify-between gap-gutter-md font-caption text-caption text-surface-variant"><div>© 2025 EstateHub Technologies Private Limited. All rights reserved.</div><div class="flex items-center gap-gutter-xs text-surface-dim"><span class="material-symbols-outlined text-tertiary-fixed text-[16px]">shield</span><span>Made with trust for home seekers across India</span></div></div></div></footer></body></html>