<% if (request.getAttribute("favorites") == null) { response.sendRedirect(request.getContextPath() + "/favorites"); return; } %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ taglib uri="jakarta.tags.functions" prefix="fn" %>
<!DOCTYPE html>

<html lang="en"><head><meta charset="utf-8"/><meta content="width=device-width, initial-scale=1.0" name="viewport"/><title>EstateHub</title><link href="https://fonts.googleapis.com" rel="preconnect"/><link crossorigin="" href="https://fonts.gstatic.com" rel="preconnect"/><link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&amp;family=Plus+Jakarta+Sans:wght@600;700;800&amp;display=swap" rel="stylesheet"/><link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" rel="stylesheet"/>
<link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&amp;display=swap" rel="stylesheet"/><style>@layer base { html, body { margin: 0; padding: 0; } body { overscroll-behavior: none; } main > :first-child { margin-top: 0 !important; } main > :last-child { margin-bottom: 0 !important; } } ::-webkit-scrollbar { display: none; }</style><script src="https://cdn.tailwindcss.com"></script><script id="tailwind-config">tailwind.config = { darkMode: "class", theme: { extend: { "colors": { "on-tertiary-fixed-variant": "#00513b", "on-primary": "#ffffff", "outline": "#7d7483", "surface-bright": "#f9f9ff", "surface-dim": "#d7dae3", "surface-container-high": "#e5e8f2", "tertiary-fixed": "#71fac8", "surface-container-lowest": "#ffffff", "outline-variant": "#cec3d4", "on-primary-fixed": "#2a0053", "background": "#f9f9ff", "secondary-container": "#ff5a5f", "on-background": "#181c23", "secondary-fixed": "#ffdad8", "error": "#ba1a1a", "on-tertiary": "#ffffff", "primary": "#450081", "surface-container-low": "#f1f3fd", "on-primary-fixed-variant": "#5f259e", "surface-container-highest": "#dfe2ec", "tertiary-fixed-dim": "#50ddad", "secondary": "#b52330", "secondary-fixed-dim": "#ffb3b0", "primary-fixed": "#eedbff", "on-secondary-container": "#60000e", "on-secondary-fixed-variant": "#92001b", "on-secondary-fixed": "#410007", "inverse-surface": "#2d3138", "on-surface": "#181c23", "on-error-container": "#93000a", "surface-container": "#ebeef7", "surface-tint": "#7841b8", "primary-container": "#5e239d", "on-tertiary-fixed": "#002116", "on-secondary": "#ffffff", "on-tertiary-container": "#36ca9b", "on-primary-container": "#cca0ff", "inverse-on-surface": "#eef0fa", "tertiary-container": "#00503a", "error-container": "#ffdad6", "surface-variant": "#dfe2ec", "tertiary": "#003727", "on-surface-variant": "#4b4452", "on-error": "#ffffff", "surface": "#f9f9ff", "inverse-primary": "#dab9ff", "primary-fixed-dim": "#dab9ff" }, "borderRadius": { "DEFAULT": "0.25rem", "lg": "0.5rem", "xl": "0.75rem", "full": "9999px" }, "spacing": { "container-max": "1280px", "gutter-sm": "0.5rem", "search-bar-height": "4rem", "gutter-xs": "0.25rem", "gutter-2xl": "3rem", "gutter-lg": "1.5rem", "gutter-md": "1rem", "gutter-xl": "2rem" }, "fontFamily": { "caption": [ "Inter" ], "body-sm": [ "Inter" ], "label-md": [ "Plus Jakarta Sans" ], "headline-xl-mobile": [ "Plus Jakarta Sans" ], "headline-lg": [ "Plus Jakarta Sans" ], "body-lg": [ "Inter" ], "body-md": [ "Inter" ], "headline-xl": [ "Plus Jakarta Sans" ], "headline-sm": [ "Plus Jakarta Sans" ], "display-hero-mobile": [ "Plus Jakarta Sans" ], "headline-md": [ "Plus Jakarta Sans" ], "display-hero": [ "Plus Jakarta Sans" ], "label-sm": [ "Plus Jakarta Sans" ] }, "fontSize": { "caption": [ "11px", { "lineHeight": "14px", "letterSpacing": "0.02em", "fontWeight": "500" } ], "body-sm": [ "12px", { "lineHeight": "18px", "letterSpacing": "0.005em", "fontWeight": "400" } ], "label-md": [ "14px", { "lineHeight": "20px", "letterSpacing": "0.01em", "fontWeight": "600" } ], "headline-xl-mobile": [ "24px", { "lineHeight": "32px", "letterSpacing": "-0.015em", "fontWeight": "700" } ], "headline-lg": [ "24px", { "lineHeight": "32px", "letterSpacing": "-0.015em", "fontWeight": "700" } ], "body-lg": [ "16px", { "lineHeight": "26px", "letterSpacing": "-0.005em", "fontWeight": "400" } ], "body-md": [ "14px", { "lineHeight": "22px", "letterSpacing": "0", "fontWeight": "400" } ], "headline-xl": [ "32px", { "lineHeight": "40px", "letterSpacing": "-0.02em", "fontWeight": "700" } ], "headline-sm": [ "16px", { "lineHeight": "24px", "letterSpacing": "0", "fontWeight": "600" } ], "display-hero-mobile": [ "30px", { "lineHeight": "38px", "letterSpacing": "-0.02em", "fontWeight": "800" } ], "headline-md": [ "20px", { "lineHeight": "28px", "letterSpacing": "-0.01em", "fontWeight": "600" } ], "display-hero": [ "44px", { "lineHeight": "54px", "letterSpacing": "-0.025em", "fontWeight": "800" } ], "label-sm": [ "12px", { "lineHeight": "16px", "letterSpacing": "0.02em", "fontWeight": "600" } ] } } } };</script></head><body class="bg-background font-body-md text-on-surface antialiased min-h-screen flex flex-col"><header class="sticky top-0 z-50 w-full bg-surface-container-lowest shadow-[0_2px_12px_rgba(0,0,0,0.06)]">
<div class="h-16 max-w-container-max mx-auto px-2 sm:px-gutter-lg flex items-center justify-between gap-1 sm:gap-gutter-md">
<div class="flex items-center gap-2 sm:gap-gutter-lg">
<a class="flex items-center gap-gutter-xs" data-path="explore-homes" href="${pageContext.request.contextPath}/">
<span class="material-symbols-outlined text-primary-container text-[32px] font-bold">real_estate_agent</span>
<span class="hidden sm:inline font-headline-md text-headline-md text-primary-container tracking-tight">EstateHub</span>
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
<span class="material-symbols-outlined text-[18px] sm:hidden">add_business</span><span class="hidden sm:inline font-label-sm text-label-sm font-semibold">Post Property</span>
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
</header><main class="max-w-[1280px] mx-auto w-full px-6 py-8 pb-24">
<h1 class="text-3xl font-bold">My Shortlisted Properties</h1>
<p class="my-4">${fn:length(favorites)} homes saved</p>
<div class="flex flex-wrap gap-4 my-4">
<label>Sort by <select id="saved-sort" class="p-2 rounded border"><option value="recent">Recently saved</option><option value="low">Price: Low to High</option><option value="high">Price: High to Low</option><option value="area">Area: Largest First</option></select></label>
<button type="button" id="compare-button" class="p-2 rounded border" disabled>Compare selected (0)</button>
<button type="button" id="alert-button" class="p-2 rounded border">Manage Alert Preferences</button>
</div>
<p id="saved-status" role="status" class="my-4"></p>
<div id="saved-grid" class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
<c:forEach items="${favorites}" var="fav" varStatus="row">
<article class="bg-white rounded-xl shadow p-5" data-price="${fav.price}" data-area="${fav.areaSqft}" data-order="${row.index}">
<c:if test="${not empty fav.primaryImageUrl}"><img class="w-full h-48 object-cover rounded-lg mb-4" src="${fn:escapeXml(fav.primaryImageUrl)}" alt="${fn:escapeXml(fav.title)}"></c:if>
<h2 class="text-xl font-bold"><a href="${pageContext.request.contextPath}/property/details?id=${fav.propertyId}"><c:out value="${fav.title}"/></a></h2>
<p data-spec="Location"><c:out value="${fav.location}"/>, <c:out value="${fav.city}"/></p>
<p data-spec="Price"><c:out value="${fav.formattedPrice}"/></p>
<p data-spec="Purpose"><c:out value="${fav.purpose}"/></p>
<p data-spec="Bedrooms">${fav.bedrooms}</p><p data-spec="Bathrooms">${fav.bathrooms}</p>
<p data-spec="Area">${fav.areaSqft} sq.ft</p><p data-spec="Furnishing"><c:out value="${fav.furnishing}"/></p>
<label class="block my-3"><input type="checkbox" class="compare-choice"> Compare this property</label>
<form action="${pageContext.request.contextPath}/favorites" method="post">
<input type="hidden" name="action" value="remove"><input type="hidden" name="propertyId" value="${fav.propertyId}">
<input type="hidden" name="redirect" value="${pageContext.request.contextPath}/favorites">
<button type="submit" class="underline">Remove from saved</button></form>
</article>
</c:forEach>
<c:if test="${empty favorites}"><div class="col-span-full bg-white p-8 rounded-xl"><h2 class="text-xl">No Shortlisted Properties Yet</h2><p>Save listings using the heart button while browsing.</p><a class="underline" href="${pageContext.request.contextPath}/search">Explore Properties</a></div></c:if>
</div>
<dialog id="compare-dialog" class="rounded-xl p-6 max-w-[95vw]"><h2 class="text-xl font-bold">Property comparison</h2><div id="comparison-content" class="overflow-x-auto my-4"></div><form method="dialog"><button class="p-2 border rounded">Close</button></form></dialog>
<dialog id="alerts-dialog" class="rounded-xl p-6 max-w-lg"><h2 class="text-xl font-bold">Alert preferences</h2><p class="my-4">Automatic price-drop, WhatsApp and SMS alerts are not available yet. No alert subscription is active.</p><a class="underline" href="${pageContext.request.contextPath}/preferences">Edit your property search preferences</a><form method="dialog"><button class="p-2 border rounded mt-4">Close</button></form></dialog>
<script>
const choices = [...document.querySelectorAll('.compare-choice')];
const compareButton = document.getElementById('compare-button');
choices.forEach(box => box.addEventListener('change', () => {
 const count = choices.filter(c => c.checked).length;
 compareButton.textContent = 'Compare selected (' + count + ')'; compareButton.disabled = count < 2;
 document.getElementById('saved-status').textContent = count === 1 ? 'Select one more property to compare.' : '';
}));
compareButton.addEventListener('click', () => {
 const cards = choices.filter(c => c.checked).map(c => c.closest('article'));
 const table = document.createElement('table'); table.className='border-collapse';
 const heading = table.insertRow(); heading.insertCell().textContent='Property';
 cards.forEach(c => heading.insertCell().textContent=c.querySelector('h2').textContent);
 ['Location','Price','Purpose','Bedrooms','Bathrooms','Area','Furnishing'].forEach(spec => {
  const row=table.insertRow(); row.insertCell().textContent=spec;
  cards.forEach(c => row.insertCell().textContent=c.querySelector('[data-spec="'+spec+'"]').textContent);
 });
 table.querySelectorAll('td').forEach(td => {td.style.padding='12px';td.style.border='1px solid #ddd';});
 document.getElementById('comparison-content').replaceChildren(table); document.getElementById('compare-dialog').showModal();
});
document.getElementById('alert-button').addEventListener('click', () => document.getElementById('alerts-dialog').showModal());
document.getElementById('saved-sort').addEventListener('change', e => {
 const grid=document.getElementById('saved-grid');
 [...grid.querySelectorAll('article')].sort((a,b) => e.target.value==='low' ? a.dataset.price-b.dataset.price : e.target.value==='high' ? b.dataset.price-a.dataset.price : e.target.value==='area' ? b.dataset.area-a.dataset.area : a.dataset.order-b.dataset.order).forEach(c => grid.append(c));
});
</script></main><footer class="w-full bg-inverse-surface text-inverse-on-surface pt-gutter-2xl pb-24 md:pb-gutter-xl"><div class="max-w-container-max mx-auto px-gutter-lg"><div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-gutter-xl mb-gutter-2xl"><div class="space-y-gutter-md"><div class="flex items-center gap-2"><span class="material-symbols-outlined text-primary-container text-[32px] font-bold">real_estate_agent</span><span class="font-headline-md text-headline-md text-surface-container-lowest tracking-tight">EstateHub</span></div><p class="font-body-sm text-body-sm text-surface-variant max-w-xs">India's trusted real estate portal for verified homes, apartments, and commercial spaces.</p><div class="pt-gutter-xs flex items-center gap-gutter-sm"><span class="flex items-center gap-1 bg-tertiary-container text-tertiary-fixed font-caption text-caption px-2.5 py-1 rounded-full"><span class="material-symbols-outlined text-[14px]">verified</span> 100% RERA Verified</span></div></div><div class="space-y-gutter-sm"><h3 class="font-label-md text-label-md text-surface-container-lowest uppercase tracking-wider">Popular Searches</h3><ul class="space-y-2 font-body-sm text-body-sm text-surface-variant"><li><a class="hover:text-surface-bright transition-colors" data-path="rent-properties" href="${pageContext.request.contextPath}/search?keyword=Mumbai">Flats in Mumbai</a></li><li><a class="hover:text-surface-bright transition-colors" data-path="buy-properties" href="${pageContext.request.contextPath}/search?keyword=Bangalore">Flats in Bangalore</a></li><li><a class="hover:text-surface-bright transition-colors" data-path="new-projects" href="${pageContext.request.contextPath}/search?keyword=Gurgaon">Apartments in Gurgaon</a></li><li><a class="hover:text-surface-bright transition-colors" data-path="buy-properties" href="${pageContext.request.contextPath}/search?keyword=Hyderabad">Villas in Hyderabad</a></li><li><a class="hover:text-surface-bright transition-colors" data-path="commercial-spaces" href="${pageContext.request.contextPath}/search?keyword=Pune">Offices in Pune</a></li></ul></div><div class="space-y-gutter-sm"><h3 class="font-label-md text-label-md text-surface-container-lowest uppercase tracking-wider">Quick Links</h3><ul class="space-y-2 font-body-sm text-body-sm text-surface-variant"><li><a class="hover:text-surface-bright transition-colors" data-path="about-us" href="${pageContext.request.contextPath}/views/information.jsp#about">About Us</a></li><li><a class="hover:text-surface-bright transition-colors" data-path="careers" href="${pageContext.request.contextPath}/views/information.jsp#careers">Careers</a></li><li><a class="hover:text-surface-bright transition-colors" data-path="research-insights" href="${pageContext.request.contextPath}/views/information.jsp#research">Research &amp; Insights</a></li><li><a class="hover:text-surface-bright transition-colors" data-path="contact-support" href="${pageContext.request.contextPath}/views/information.jsp#support">Contact Support</a></li><li><a class="hover:text-surface-bright transition-colors" data-path="terms-privacy" href="${pageContext.request.contextPath}/views/information.jsp#terms">Terms &amp; Privacy</a></li></ul></div><div class="space-y-gutter-md"><h3 class="font-label-md text-label-md text-surface-container-lowest uppercase tracking-wider">Experience on Mobile</h3><p class="font-body-sm text-body-sm text-surface-variant">Download EstateHub App for instant notifications and direct agent chats.</p><div class="flex flex-col gap-2"><div class="flex items-center gap-3 px-3 py-2 rounded-lg bg-surface-container-high/10 hover:bg-surface-container-high/20 text-surface-bright transition-colors cursor-pointer"><span class="material-symbols-outlined text-primary-fixed">play_arrow</span><div class="text-left"><p class="font-caption text-[10px] text-surface-variant uppercase">GET IT ON</p><p class="font-label-sm text-label-sm font-semibold">Google Play</p></div></div><div class="flex items-center gap-3 px-3 py-2 rounded-lg bg-surface-container-high/10 hover:bg-surface-container-high/20 text-surface-bright transition-colors cursor-pointer"><span class="material-symbols-outlined text-primary-fixed">install_mobile</span><div class="text-left"><p class="font-caption text-[10px] text-surface-variant uppercase">DOWNLOAD ON</p><p class="font-label-sm text-label-sm font-semibold">App Store</p></div></div></div></div></div><div class="pt-gutter-lg mt-gutter-xl border-t border-outline/20 flex flex-col md:flex-row items-center justify-between gap-gutter-md font-caption text-caption text-surface-variant"><div>© 2025 EstateHub Technologies Private Limited. All rights reserved.</div><div class="flex items-center gap-gutter-xs text-surface-dim"><span class="material-symbols-outlined text-tertiary-fixed text-[16px]">shield</span><span>Made with trust for home seekers across India</span></div></div></div></footer>

<!-- MOBILE BOTTOM NAVIGATION BAR -->
<nav class="md:hidden fixed bottom-0 left-0 right-0 z-50 bg-white/95 backdrop-blur-md border-t border-surface-container-high px-4 py-2 flex items-center justify-around shadow-[0_-4px_20px_rgba(0,0,0,0.08)]">
  <a href="${pageContext.request.contextPath}/" class="flex flex-col items-center gap-0.5 text-xs font-semibold text-on-surface-variant hover:text-primary transition-colors">
    <span class="material-symbols-outlined text-[22px]">explore</span>
    <span>Explore</span>
  </a>
  <a href="${pageContext.request.contextPath}/search" class="flex flex-col items-center gap-0.5 text-xs font-semibold text-on-surface-variant hover:text-primary transition-colors">
    <span class="material-symbols-outlined text-[22px]">search</span>
    <span>Search</span>
  </a>
  <a href="${pageContext.request.contextPath}/views/add-property.jsp" class="flex flex-col items-center gap-0.5 text-xs font-semibold text-white bg-primary rounded-full p-2.5 -mt-5 shadow-lg border-2 border-white hover:scale-105 active:scale-95 transition-transform">
    <span class="material-symbols-outlined text-[20px]">add</span>
  </a>
  <a href="${pageContext.request.contextPath}/favorites" class="flex flex-col items-center gap-0.5 text-xs font-semibold text-primary relative">
    <span class="material-symbols-outlined text-[22px]">favorite</span>
    <span>Saved</span>
  </a>
  <c:choose>
    <c:when test="${not empty sessionScope.currentUser}">
      <c:set var="mDashUrl" value="${pageContext.request.contextPath}/customer/dashboard" />
      <c:if test="${sessionScope.currentUser.role == 'ADMIN'}"><c:set var="mDashUrl" value="${pageContext.request.contextPath}/admin/dashboard" /></c:if>
      <c:if test="${sessionScope.currentUser.role == 'BROKER'}"><c:set var="mDashUrl" value="${pageContext.request.contextPath}/broker/dashboard" /></c:if>
      <c:if test="${sessionScope.currentUser.role == 'SELLER'}"><c:set var="mDashUrl" value="${pageContext.request.contextPath}/seller/dashboard" /></c:if>
      <a href="${mDashUrl}" class="flex flex-col items-center gap-0.5 text-xs font-semibold text-on-surface-variant hover:text-primary transition-colors">
        <span class="material-symbols-outlined text-[22px]">account_circle</span>
        <span>Account</span>
      </a>
    </c:when>
    <c:otherwise>
      <a href="${pageContext.request.contextPath}/views/login.jsp" class="flex flex-col items-center gap-0.5 text-xs font-semibold text-on-surface-variant hover:text-primary transition-colors">
        <span class="material-symbols-outlined text-[22px]">login</span>
        <span>Login</span>
      </a>
    </c:otherwise>
  </c:choose>
</nav>

<script src="${pageContext.request.contextPath}/js/optimistic-ui.js"></script></body></html>




