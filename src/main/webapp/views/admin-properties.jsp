<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8"/>
    <meta content="width=device-width, initial-scale=1.0" name="viewport"/>
    <title>EstateHub Admin Console</title>
    <link href="https://fonts.googleapis.com" rel="preconnect"/>
    <link crossorigin="" href="https://fonts.gstatic.com" rel="preconnect"/>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600&amp;family=Plus+Jakarta+Sans:wght@600;700;800&amp;display=swap" rel="stylesheet"/>
    <link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" rel="stylesheet"/>
    <link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&amp;display=swap" rel="stylesheet"/>
    <style>@layer base{html,body{margin:0;padding:0;}body{overscroll-behavior:none;}main>:first-child{margin-top:0!important;}main>:last-child{margin-bottom:0!important;}}::-webkit-scrollbar{display:none;}</style>
    <script src="https://cdn.tailwindcss.com"></script>
    <script id="tailwind-config">tailwind.config = {"darkMode": "class", "theme": {"extend": {"colors": {"on-secondary-container": "#60000e", "surface-container-highest": "#dfe2ec", "on-tertiary-container": "#36ca9b", "tertiary-fixed-dim": "#50ddad", "secondary": "#b52330", "error": "#ba1a1a", "surface-container": "#ebeef7", "on-surface": "#181c23", "on-primary-fixed": "#2a0053", "on-primary-container": "#cca0ff", "surface-container-low": "#f1f3fd", "surface": "#f9f9ff", "secondary-container": "#ff5a5f", "on-background": "#181c23", "surface-bright": "#f9f9ff", "surface-container-high": "#e5e8f2", "secondary-fixed-dim": "#ffb3b0", "on-tertiary-fixed": "#002116", "tertiary-fixed": "#71fac8", "surface-tint": "#7841b8", "on-error": "#ffffff", "primary-fixed-dim": "#dab9ff", "inverse-surface": "#2d3138", "primary-fixed": "#eedbff", "on-tertiary": "#ffffff", "surface-container-lowest": "#ffffff", "secondary-fixed": "#ffdad8", "outline": "#7d7483", "on-primary": "#ffffff", "on-secondary": "#ffffff", "on-tertiary-fixed-variant": "#00513b", "primary-container": "#5e239d", "on-error-container": "#93000a", "tertiary-container": "#00503a", "surface-variant": "#dfe2ec", "background": "#f9f9ff", "inverse-on-surface": "#eef0fa", "outline-variant": "#cec3d4", "primary": "#450081", "on-secondary-fixed": "#410007", "surface-dim": "#d7dae3", "error-container": "#ffdad6", "inverse-primary": "#dab9ff", "on-surface-variant": "#4b4452", "on-primary-fixed-variant": "#5f259e", "tertiary": "#003727", "on-secondary-fixed-variant": "#92001b"}, "borderRadius": {"DEFAULT": "0.25rem", "lg": "0.5rem", "xl": "0.75rem", "full": "9999px"}, "spacing": {"gutter-md": "1rem", "search-bar-height": "4rem", "gutter-xl": "2rem", "gutter-2xl": "3rem", "container-max": "1280px", "gutter-sm": "0.5rem", "gutter-lg": "1.5rem", "gutter-xs": "0.25rem"}, "fontFamily": {"body-lg": ["Inter"], "headline-md": ["Plus Jakarta Sans"], "label-md": ["Plus Jakarta Sans"], "body-sm": ["Inter"], "display-hero-mobile": ["Plus Jakarta Sans"], "display-hero": ["Plus Jakarta Sans"], "body-md": ["Inter"], "headline-xl": ["Plus Jakarta Sans"], "caption": ["Inter"], "label-sm": ["Plus Jakarta Sans"], "headline-sm": ["Plus Jakarta Sans"], "headline-lg": ["Plus Jakarta Sans"], "headline-xl-mobile": ["Plus Jakarta Sans"]}, "fontSize": {"body-lg": ["16px", {"lineHeight": "26px", "letterSpacing": "-0.005em", "fontWeight": "400"}], "headline-md": ["20px", {"lineHeight": "28px", "letterSpacing": "-0.01em", "fontWeight": "600"}], "label-md": ["14px", {"lineHeight": "20px", "letterSpacing": "0.01em", "fontWeight": "600"}], "body-sm": ["12px", {"lineHeight": "18px", "letterSpacing": "0.005em", "fontWeight": "400"}], "display-hero-mobile": ["30px", {"lineHeight": "38px", "letterSpacing": "-0.02em", "fontWeight": "800"}], "display-hero": ["44px", {"lineHeight": "54px", "letterSpacing": "-0.025em", "fontWeight": "800"}], "body-md": ["14px", {"lineHeight": "22px", "letterSpacing": "0", "fontWeight": "400"}], "headline-xl": ["32px", {"lineHeight": "40px", "letterSpacing": "-0.02em", "fontWeight": "700"}], "caption": ["11px", {"lineHeight": "14px", "letterSpacing": "0.02em", "fontWeight": "500"}], "label-sm": ["12px", {"lineHeight": "16px", "letterSpacing": "0.02em", "fontWeight": "600"}], "headline-sm": ["16px", {"lineHeight": "24px", "letterSpacing": "0", "fontWeight": "600"}], "headline-lg": ["24px", {"lineHeight": "32px", "letterSpacing": "-0.015em", "fontWeight": "700"}], "headline-xl-mobile": ["24px", {"lineHeight": "32px", "letterSpacing": "-0.015em", "fontWeight": "700"}]}}}};</script>
</head>
<body class="bg-background font-body-md text-on-surface antialiased min-h-screen">
<header class="fixed top-0 left-0 right-0 h-16 bg-surface-container-lowest shadow-[0_1px_8px_rgba(0,0,0,0.04)] z-50">
    <div class="h-16 w-full px-6 flex items-center justify-between gap-4">
        <div class="flex items-center gap-4 min-w-[260px]">
            <img alt="Brand logo" class="h-8 w-auto object-contain" src="https://lh3.googleusercontent.com/aida/AEtjO1Xg4rP1x__tmUvhhUEeM-xIYBlSjyhgL-aDvDihhuMxD0bc_kL9kHorsRYR5EvM9wdONnfScP46YL0QssDo1Yzd9XXTo1GpuWC9c1SGhoiGFmbBZZ-L95_tHf_7u7-NnrWpEVNDa3KKfH1MN1eMtrk2ZiwZGYM9sKA4zxHHA9vupb767aMCr2J7zivaAtyK3ypPdo3ZJ1n88WJ1YI5TA-loMe151e9ACRfxjid8X1QrA8mUitrWMg5qDMA"/>
            <div class="flex flex-col">
                <span class="font-headline-sm text-headline-sm text-primary leading-none tracking-tight">EstateHub</span>
                <span class="font-caption text-caption text-on-surface-variant font-medium tracking-wide uppercase mt-0.5">Admin Console</span>
            </div>
        </div>
        <div class="flex items-center gap-3">
            <div class="h-8 w-[1px] bg-surface-container-highest hidden sm:block"></div>
            <div class="flex items-center gap-3 pl-1">
                <div class="w-8 h-8 rounded-full bg-primary flex items-center justify-center text-on-primary font-label-sm text-label-sm shadow-sm">
                    <span class="material-symbols-outlined text-on-primary text-[18px]">person</span>
                </div>
                <div class="hidden xl:flex flex-col text-left">
                    <span class="font-label-md text-label-md text-on-surface leading-tight">${sessionScope.currentUser.name}</span>
                    <span class="font-caption text-caption text-primary-container font-semibold uppercase tracking-wider">Admin</span>
                </div>
                <a href="${pageContext.request.contextPath}/logout" class="text-outline hover:text-on-surface p-1 rounded">
                    <span class="material-symbols-outlined text-[18px]">logout</span>
                </a>
            </div>
        </div>
    </div>
</header>
<aside class="fixed left-0 top-16 bottom-0 w-64 bg-surface-container-lowest shadow-[0_1px_8px_rgba(0,0,0,0.04)] z-40 flex flex-col justify-between overflow-y-auto">
    <div class="p-4 flex flex-col gap-6">
        <nav class="flex flex-col gap-1">
            <a class="flex items-center justify-between px-3 py-2.5 rounded-lg text-on-surface-variant hover:bg-surface-container-high hover:text-on-surface transition-all group" href="${pageContext.request.contextPath}/admin/dashboard">
                <div class="flex items-center gap-3">
                    <span class="material-symbols-outlined text-[20px] text-on-surface-variant group-hover:text-on-surface">speed</span>
                    <span class="font-label-md text-label-md">Overview</span>
                </div>
            </a>
            <a aria-current="page" class="flex items-center justify-between px-3 py-2.5 transition-all group bg-primary-container text-on-primary font-label-md rounded-lg shadow-sm" href="${pageContext.request.contextPath}/admin/properties">
                <div class="flex items-center gap-3">
                    <span class="material-symbols-outlined text-[20px]">real_estate_agent</span>
                    <span class="font-label-md text-label-md">Property Approvals</span>
                </div>
                <span class="font-label-sm text-label-sm px-2 py-0.5 rounded-full bg-secondary-container text-on-secondary-container font-semibold">${pendingProperties} Pending</span>
            </a>
            <a class="flex items-center justify-between px-3 py-2.5 rounded-lg text-on-surface-variant hover:bg-surface-container-high hover:text-on-surface transition-all group" href="${pageContext.request.contextPath}/admin/verification">
                <div class="flex items-center gap-3">
                    <span class="material-symbols-outlined text-[20px] text-on-surface-variant group-hover:text-on-surface">verified_user</span>
                    <span class="font-label-md text-label-md">KYC &amp; Verification</span>
                </div>
                <span class="font-label-sm text-label-sm px-2 py-0.5 rounded-full bg-surface-container-high text-on-surface font-semibold">${pendingVerifications} Review</span>
            </a>
            <a class="flex items-center justify-between px-3 py-2.5 rounded-lg text-on-surface-variant hover:bg-surface-container-high hover:text-on-surface transition-all group" href="${pageContext.request.contextPath}/admin/users">
                <div class="flex items-center gap-3">
                    <span class="material-symbols-outlined text-[20px] text-on-surface-variant group-hover:text-on-surface">group</span>
                    <span class="font-label-md text-label-md">User Management</span>
                </div>
            </a>
            <a class="flex items-center justify-between px-3 py-2.5 rounded-lg text-on-surface-variant hover:bg-surface-container-high hover:text-on-surface transition-all group" href="${pageContext.request.contextPath}/admin/categories">
                <div class="flex items-center gap-3">
                    <span class="material-symbols-outlined text-[20px] text-on-surface-variant group-hover:text-on-surface">map</span>
                    <span class="font-label-md text-label-md">Category Management</span>
                </div>
            </a>
            <a class="flex items-center justify-between px-3 py-2.5 rounded-lg text-on-surface-variant hover:bg-surface-container-high hover:text-on-surface transition-all group" href="${pageContext.request.contextPath}/admin/inquiries">
                <div class="flex items-center gap-3">
                    <span class="material-symbols-outlined text-[20px] text-on-surface-variant group-hover:text-on-surface">flag</span>
                    <span class="font-label-md text-label-md">Inquiries</span>
                </div>
                <span class="font-label-sm text-label-sm px-2 py-0.5 rounded-full bg-surface-container-high text-on-surface font-semibold">${totalInquiries}</span>
            </a>
        </nav>
    </div>
</aside>
<div class="pl-64 flex flex-col min-h-screen">
    <main class="relative pt-16 flex-1 w-full px-8 pb-12 bg-background">
        <div class="flex flex-col w-full">
            <div class="bg-surface-container-lowest p-6 rounded-2xl shadow-sm mb-6 mt-4">
                <div class="flex flex-col lg:flex-row lg:items-center lg:justify-between gap-4 pb-6">
                    <div>
                        <h1 class="font-headline-xl text-headline-xl text-on-surface">Property Listing Moderation</h1>
                        <p class="font-body-md text-body-md text-on-surface-variant mt-1">Verify details before publication.</p>
                    </div>
                </div>
                
                <c:if test="${not empty sessionScope.successMessage}">
                    <div class="p-4 bg-tertiary-container text-on-tertiary-container rounded-lg mb-4">
                        ${sessionScope.successMessage}
                        <c:remove var="successMessage" scope="session"/>
                    </div>
                </c:if>
                <c:if test="${not empty sessionScope.errorMessage}">
                    <div class="p-4 bg-error-container text-on-error-container rounded-lg mb-4">
                        ${sessionScope.errorMessage}
                        <c:remove var="errorMessage" scope="session"/>
                    </div>
                </c:if>

                <div class="flex-1 w-full bg-surface-container-lowest rounded-2xl overflow-hidden flex flex-col mt-4">
                    <div class="overflow-x-auto">
                        <table class="w-full text-left">
                            <thead>
                                <tr class="bg-surface-container-low font-label-sm text-label-sm text-on-surface-variant">
                                    <th class="py-3.5 px-3">Property Preview</th>
                                    <th class="py-3.5 px-3">Property &amp; Locality</th>
                                    <th class="py-3.5 px-3">Seller</th>
                                    <th class="py-3.5 px-3">Pricing</th>
                                    <th class="py-3.5 px-3">Review Status</th>
                                    <th class="py-3.5 pr-5 pl-3 text-right">Moderation Actions</th>
                                </tr>
                            </thead>
                            <tbody class="divide-y-0 text-body-md text-body-md">
                                <c:forEach items="${properties}" var="p">
                                    <tr class="hover:bg-surface-container-low/60 transition-colors group">
                                        <td class="py-4 px-3">
                                            <div class="relative w-28 h-18 aspect-video rounded-lg overflow-hidden bg-surface-container shadow-sm">
                                                <img class="w-full h-full object-cover" src="${p.primaryImageUrl}"/>
                                            </div>
                                        </td>
                                        <td class="py-4 px-3">
                                            <div class="flex flex-col min-w-[200px]">
                                                <span class="font-headline-sm text-headline-sm text-on-surface font-semibold group-hover:text-primary transition-colors"><c:out value="${p.title}"/></span>
                                                <span class="font-caption text-caption text-outline flex items-center gap-1 mt-1">
                                                    <span class="material-symbols-outlined text-[14px]">pin_drop</span> <c:out value="${p.location}"/>, <c:out value="${p.city}"/>
                                                </span>
                                            </div>
                                        </td>
                                        <td class="py-4 px-3">
                                            <div class="flex flex-col min-w-[170px]">
                                                <span class="font-label-md text-label-md text-on-surface"><c:out value="${p.ownerName}"/></span>
                                            </div>
                                        </td>
                                        <td class="py-4 px-3">
                                            <div class="flex flex-col min-w-[150px]">
                                                <span class="font-headline-sm text-headline-sm text-on-surface font-bold">₹<c:out value="${p.price}"/></span>
                                            </div>
                                        </td>
                                        <td class="py-4 px-3">
                                            <span class="inline-flex items-center px-2.5 py-1 rounded-full bg-surface-container-high text-primary-container font-label-sm text-label-sm font-semibold">
                                              <c:out value="${p.verificationStatus}"/>
                                            </span>
                                        </td>
                                        <td class="py-4 pr-5 pl-3 text-right">
                                            <div class="flex items-center justify-end gap-1.5">
                                                <form action="${pageContext.request.contextPath}/admin/properties" method="post" class="inline">
                                                    <input type="hidden" name="action" value="approve">
                                                    <input type="hidden" name="propertyId" value="${p.propertyId}">
                                                    <button type="submit" class="p-2 rounded-lg bg-tertiary-container text-on-tertiary hover:opacity-90 transition-opacity" title="Approve">
                                                        <span class="material-symbols-outlined text-[18px]">check</span>
                                                    </button>
                                                </form>
                                                
                                                <form action="${pageContext.request.contextPath}/admin/properties" method="post" class="inline flex items-center gap-2">
                                                    <input type="hidden" name="action" value="reject">
                                                    <input type="hidden" name="propertyId" value="${p.propertyId}">
                                                    <input type="text" name="rejectionReason" placeholder="Reason..." class="px-2 py-1 text-sm border rounded" required>
                                                    <button type="submit" class="p-2 rounded-lg bg-secondary-fixed text-secondary hover:bg-secondary-container hover:text-on-secondary transition-colors" title="Reject">
                                                        <span class="material-symbols-outlined text-[18px]">close</span>
                                                    </button>
                                                </form>
                                            </div>
                                        </td>
                                    </tr>
                                </c:forEach>
                                <c:if test="${empty properties}">
                                    <tr>
                                        <td colspan="6" class="text-center py-4">No properties pending moderation.</td>
                                    </tr>
                                </c:if>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </main>
</div>
</body>
</html>
