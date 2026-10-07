<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ taglib uri="jakarta.tags.functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8"/>
    <meta content="width=device-width, initial-scale=1.0" name="viewport"/>
    <title>Customer Dashboard - EstateHub</title>
    <link href="https://fonts.googleapis.com" rel="preconnect"/>
    <link crossorigin="" href="https://fonts.gstatic.com" rel="preconnect"/>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&family=Plus+Jakarta+Sans:wght@600;700;800&display=swap" rel="stylesheet"/>
    <link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" rel="stylesheet"/>
    <style>@layer base { html, body { margin: 0; padding: 0; } body { overscroll-behavior: none; } main > :first-child { margin-top: 0 !important; } main > :last-child { margin-bottom: 0 !important; } } ::-webkit-scrollbar { display: none; }</style>
    <script src="https://cdn.tailwindcss.com"></script>
    <script id="tailwind-config">
    tailwind.config = {
        darkMode: "class",
        theme: {
            extend: {
                "colors": {
                    "primary": "#450081",
                    "primary-container": "#5e239d",
                    "on-primary": "#ffffff",
                    "secondary": "#b52330",
                    "secondary-container": "#ff5a5f",
                    "on-secondary": "#ffffff",
                    "background": "#f9f9ff",
                    "surface": "#f9f9ff",
                    "surface-container": "#ebeef7",
                    "surface-container-low": "#f1f3fd",
                    "surface-container-lowest": "#ffffff",
                    "surface-container-high": "#e5e8f2",
                    "on-surface": "#181c23",
                    "on-surface-variant": "#4b4452",
                    "outline": "#7d7483"
                },
                "spacing": {
                    "container-max": "1280px",
                    "gutter-md": "1rem",
                    "gutter-lg": "1.5rem",
                    "gutter-xl": "2rem"
                },
                "fontFamily": {
                    "body-md": ["Inter"],
                    "headline-md": ["Plus Jakarta Sans"],
                    "headline-lg": ["Plus Jakarta Sans"],
                    "headline-xl": ["Plus Jakarta Sans"]
                }
            }
        }
    };
    </script>
</head>
<body class="bg-background font-body-md text-on-surface antialiased min-h-screen flex flex-col">

<!-- Header Navigation -->
<header class="sticky top-0 z-50 w-full bg-surface-container-lowest shadow-[0_2px_12px_rgba(0,0,0,0.06)]">
    <div class="h-16 max-w-container-max mx-auto px-4 sm:px-gutter-lg flex items-center justify-between gap-4">
        <div class="flex items-center gap-4">
            <a class="flex items-center gap-2" href="${pageContext.request.contextPath}/">
                <span class="material-symbols-outlined text-primary-container text-[32px] font-bold">real_estate_agent</span>
                <span class="font-headline-md text-headline-md text-primary-container tracking-tight">EstateHub</span>
            </a>
        </div>

        <nav class="hidden lg:flex items-center gap-6">
            <a class="font-label-md text-on-surface-variant hover:text-primary transition-colors" href="${pageContext.request.contextPath}/search?purpose=SALE">Buy</a>
            <a class="font-label-md text-on-surface-variant hover:text-primary transition-colors" href="${pageContext.request.contextPath}/search?purpose=RENT">Rent</a>
            <c:if test="${sessionScope.currentUser != null && sessionScope.currentUser.role == 'ADMIN'}">
                <a class="font-label-md text-on-surface-variant hover:text-primary transition-colors" href="${pageContext.request.contextPath}/admin/properties">Admin Properties</a>
                <a class="font-label-md text-on-surface-variant hover:text-primary transition-colors" href="${pageContext.request.contextPath}/admin/users">Admin Users</a>
            </c:if>
        </nav>

        <div class="flex items-center gap-4">
            <c:choose>
                <c:when test="${sessionScope.currentUser == null}">
                    <a class="font-label-sm text-primary-container font-medium" href="${pageContext.request.contextPath}/views/login.jsp">Login</a>
                    <a class="bg-primary-container hover:bg-primary text-on-primary px-3.5 py-1.5 rounded-lg font-label-sm font-semibold transition-all" href="${pageContext.request.contextPath}/views/register.jsp">Register</a>
                </c:when>
                <c:otherwise>
                    <a class="relative flex items-center justify-center p-2 rounded-full hover:bg-surface-container-low text-on-surface-variant hover:text-secondary-container transition-colors" href="${pageContext.request.contextPath}/favorites" title="Saved Favorites">
                        <span class="material-symbols-outlined text-[22px]">favorite</span>
                        <span class="absolute top-1 right-1 flex h-4 w-4 items-center justify-center rounded-full bg-secondary-container text-on-secondary text-[10px] font-bold">
                            <c:out value="${favoritesCount != null ? favoritesCount : 0}"/>
                        </span>
                    </a>
                    <a class="flex items-center gap-2 bg-primary-container hover:bg-primary text-on-primary px-3.5 py-1.5 rounded-lg shadow-sm transition-all" href="${pageContext.request.contextPath}/property/crud">
                        <span class="material-symbols-outlined text-[18px] sm:hidden">add_business</span>
                        <span class="hidden sm:inline font-label-sm font-semibold">Post Property</span>
                    </a>
                    <div class="flex items-center gap-2 pl-2 border-l border-surface-container-high">
                        <div class="w-8 h-8 rounded-full bg-primary text-on-primary flex items-center justify-center font-bold">
                            ${fn:substring(sessionScope.currentUser.name, 0, 1)}
                        </div>
                        <div class="hidden md:flex flex-col">
                            <span class="text-sm font-semibold text-on-surface leading-tight">${sessionScope.currentUser.name}</span>
                            <a href="${pageContext.request.contextPath}/logout" class="text-xs text-secondary hover:underline">Logout</a>
                        </div>
                    </div>
                </c:otherwise>
            </c:choose>
        </div>
    </div>
</header>

<main class="flex-1 w-full bg-surface pb-12">
    <!-- Welcome Header Banner -->
    <section class="w-full bg-surface-container-low py-8 shadow-sm">
        <div class="max-w-container-max mx-auto px-4 sm:px-gutter-lg flex flex-col md:flex-row items-start md:items-center justify-between gap-4">
            <div class="flex items-center gap-4">
                <div class="w-16 h-16 rounded-2xl bg-primary-container text-on-primary flex items-center justify-center font-headline-lg text-2xl font-bold shadow-md">
                    ${fn:substring(sessionScope.currentUser.name, 0, 1)}
                </div>
                <div>
                    <h1 class="font-headline-lg text-2xl font-bold text-on-surface">Welcome back, ${sessionScope.currentUser.name} 👋</h1>
                    <p class="text-sm text-on-surface-variant">Account Type: <span class="font-semibold text-primary">${sessionScope.currentUser.role}</span> &bull; ${sessionScope.currentUser.email}</p>
                </div>
            </div>
            <div class="flex flex-wrap items-center gap-3">
                <a href="${pageContext.request.contextPath}/search?purpose=SALE" class="px-4 py-2 rounded-xl bg-primary-container hover:bg-primary text-on-primary font-semibold text-sm transition-all shadow-sm flex items-center gap-1.5">
                    <span class="material-symbols-outlined text-[18px]">search</span>
                    <span>Browse Buy Properties</span>
                </a>
                <a href="${pageContext.request.contextPath}/search?purpose=RENT" class="px-4 py-2 rounded-xl bg-surface-container-lowest hover:bg-surface-container text-on-surface font-semibold text-sm transition-all shadow-sm flex items-center gap-1.5">
                    <span class="material-symbols-outlined text-[18px]">key</span>
                    <span>Browse Rent Properties</span>
                </a>
            </div>
        </div>
    </section>

    <!-- Main Container -->
    <div class="max-w-container-max mx-auto px-4 sm:px-gutter-lg mt-6">
        
        <!-- Real Metric Cards -->
        <div class="grid grid-cols-2 sm:grid-cols-4 gap-4 mb-8">
            <a href="${pageContext.request.contextPath}/favorites" class="bg-surface-container-lowest p-5 rounded-2xl shadow-sm hover:shadow-md transition-all block">
                <div class="flex items-center justify-between mb-2">
                    <span class="material-symbols-outlined text-secondary-container text-2xl">favorite</span>
                </div>
                <div class="font-headline-xl text-3xl font-extrabold text-on-surface">${favoritesCount != null ? favoritesCount : 0}</div>
                <p class="text-xs text-on-surface-variant font-medium mt-1">Saved Properties</p>
            </a>

            <a href="${pageContext.request.contextPath}/views/inquiries.jsp" class="bg-surface-container-lowest p-5 rounded-2xl shadow-sm hover:shadow-md transition-all block">
                <div class="flex items-center justify-between mb-2">
                    <span class="material-symbols-outlined text-primary-container text-2xl">forum</span>
                </div>
                <div class="font-headline-xl text-3xl font-extrabold text-on-surface">${inquiriesCount != null ? inquiriesCount : 0}</div>
                <p class="text-xs text-on-surface-variant font-medium mt-1">Contacted Sellers</p>
            </a>

            <div class="bg-surface-container-lowest p-5 rounded-2xl shadow-sm">
                <div class="flex items-center justify-between mb-2">
                    <span class="material-symbols-outlined text-primary text-2xl">visibility</span>
                </div>
                <div class="font-headline-xl text-3xl font-extrabold text-on-surface">${recentlyViewedCount != null ? recentlyViewedCount : 0}</div>
                <p class="text-xs text-on-surface-variant font-medium mt-1">Recently Viewed</p>
            </div>

            <div class="bg-surface-container-lowest p-5 rounded-2xl shadow-sm">
                <div class="flex items-center justify-between mb-2">
                    <span class="material-symbols-outlined text-emerald-600 text-2xl">auto_awesome</span>
                </div>
                <div class="font-headline-xl text-3xl font-extrabold text-on-surface">${recommendationsCount != null ? recommendationsCount : 0}</div>
                <p class="text-xs text-on-surface-variant font-medium mt-1">Recommended Matches</p>
            </div>
        </div>

        <!-- 2-Column Dashboard Grid -->
        <div class="grid grid-cols-1 lg:grid-cols-12 gap-8">

            <!-- Main Content Area (8 Cols) -->
            <div class="lg:col-span-8 space-y-8">

                <!-- Real Inquiries & Messages Section -->
                <div class="bg-surface-container-lowest rounded-2xl p-6 shadow-sm">
                    <div class="flex items-center justify-between mb-4">
                        <div>
                            <h2 class="font-headline-md text-xl font-bold text-on-surface flex items-center gap-2">
                                <span class="material-symbols-outlined text-primary-container">chat</span>
                                My Inquiries &amp; Messages
                            </h2>
                            <p class="text-xs text-on-surface-variant">Real status of inquiries sent to sellers &amp; brokers</p>
                        </div>
                        <a href="${pageContext.request.contextPath}/views/inquiries.jsp" class="text-xs text-primary font-semibold hover:underline flex items-center gap-1">
                            <span>View All</span>
                            <span class="material-symbols-outlined text-sm">arrow_forward</span>
                        </a>
                    </div>

                    <c:choose>
                        <c:when test="${not empty inquiries}">
                            <div class="space-y-3">
                                <c:forEach items="${inquiries}" var="inq">
                                    <div class="p-4 rounded-xl bg-surface-container-low flex flex-col md:flex-row items-start md:items-center justify-between gap-4">
                                        <div class="space-y-1">
                                            <div class="flex items-center gap-2">
                                                <h3 class="font-semibold text-on-surface text-sm">${inq.propertyTitle}</h3>
                                                <span class="px-2 py-0.5 rounded-full text-xs font-semibold bg-surface-container-high text-primary">${inq.status}</span>
                                            </div>
                                            <p class="text-xs text-on-surface-variant">${inq.propertyLocation} &bull; Seller: <span class="font-medium text-on-surface">${inq.sellerName}</span></p>
                                            <p class="text-xs text-on-surface-variant italic">&ldquo;${inq.message}&rdquo;</p>
                                            <c:if test="${not empty inq.sellerReply}">
                                                <div class="mt-2 p-2 rounded-lg bg-surface-container-lowest text-xs text-primary font-medium">
                                                    <strong>Seller Reply:</strong> ${inq.sellerReply}
                                                </div>
                                            </c:if>
                                        </div>
                                        <div class="text-right shrink-0">
                                            <span class="text-xs text-on-surface-variant font-medium">${inq.createdAt}</span>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                        </c:when>
                        <c:otherwise>
                            <div class="p-8 text-center bg-surface-container-low rounded-xl text-on-surface-variant">
                                <span class="material-symbols-outlined text-4xl mb-2 text-outline">mail</span>
                                <p class="text-sm font-medium">You haven't sent any inquiries yet.</p>
                                <p class="text-xs text-on-surface-variant mt-1">Browse properties and click "Contact Seller" to submit an inquiry.</p>
                            </div>
                        </c:otherwise>
                    </c:choose>
                </div>

                <!-- Real Saved Favorites Section -->
                <div class="bg-surface-container-lowest rounded-2xl p-6 shadow-sm">
                    <div class="flex items-center justify-between mb-4">
                        <div>
                            <h2 class="font-headline-md text-xl font-bold text-on-surface flex items-center gap-2">
                                <span class="material-symbols-outlined text-secondary-container">favorite</span>
                                Saved / Shortlisted Properties
                            </h2>
                            <p class="text-xs text-on-surface-variant">Properties you bookmarked for quick access</p>
                        </div>
                        <a href="${pageContext.request.contextPath}/favorites" class="text-xs text-primary font-semibold hover:underline flex items-center gap-1">
                            <span>Manage Favorites</span>
                            <span class="material-symbols-outlined text-sm">arrow_forward</span>
                        </a>
                    </div>

                    <c:choose>
                        <c:when test="${not empty favorites}">
                            <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
                                <c:forEach items="${favorites}" var="fav">
                                    <div class="bg-surface-container-low rounded-xl overflow-hidden shadow-sm hover:shadow-md transition-all flex flex-col justify-between">
                                        <div>
                                            <div class="relative aspect-video w-full overflow-hidden bg-surface-container-high">
                                                <img class="w-full h-full object-cover" src="${fav.primaryImageUrl}" alt="${fav.title}" onerror="this.onerror=null; this.src='https://images.unsplash.com/photo-1600596542815-ffad4c1539a9?auto=format&fit=crop&w=1200&q=80';"/>
                                                <a href="${pageContext.request.contextPath}/favorites?action=remove&propertyId=${fav.propertyId}&redirect=${pageContext.request.contextPath}/customer/dashboard" class="absolute top-2 right-2 w-8 h-8 rounded-full bg-white/90 flex items-center justify-center text-secondary shadow hover:scale-110 transition-transform" title="Remove">
                                                    <span class="material-symbols-outlined text-lg" style="font-variation-settings: 'FILL' 1;">favorite</span>
                                                </a>
                                            </div>
                                            <div class="p-4 space-y-1">
                                                <div class="font-bold text-lg text-primary">₹ ${fav.price}</div>
                                                <h3 class="font-semibold text-sm text-on-surface truncate">${fav.title}</h3>
                                                <p class="text-xs text-on-surface-variant flex items-center gap-1">
                                                    <span class="material-symbols-outlined text-sm">location_on</span>
                                                    <span>${fav.location}, ${fav.city}</span>
                                                </p>
                                                <div class="text-xs text-on-surface-variant pt-2 flex items-center gap-3">
                                                    <span>${fav.bedrooms} BHK</span> &bull; 
                                                    <span>${fav.areaSqft} sq.ft</span> &bull; 
                                                    <span>${fav.purpose}</span>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="p-4 pt-0">
                                            <a href="${pageContext.request.contextPath}/property/details?id=${fav.propertyId}" class="w-full py-2 rounded-lg bg-primary-container text-on-primary text-xs font-semibold block text-center hover:bg-primary transition-colors">
                                                View Details
                                            </a>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                        </c:when>
                        <c:otherwise>
                            <div class="p-8 text-center bg-surface-container-low rounded-xl text-on-surface-variant">
                                <span class="material-symbols-outlined text-4xl mb-2 text-outline">bookmark_border</span>
                                <p class="text-sm font-medium">No saved properties yet.</p>
                                <p class="text-xs text-on-surface-variant mt-1">Browse properties and click the heart icon on any listing to save it here.</p>
                            </div>
                        </c:otherwise>
                    </c:choose>
                </div>

                <!-- Real Recommendations Section -->
                <c:if test="${not empty recommendations}">
                    <div class="bg-surface-container-lowest rounded-2xl p-6 shadow-sm">
                        <div class="flex items-center justify-between mb-4">
                            <div>
                                <h2 class="font-headline-md text-xl font-bold text-on-surface flex items-center gap-2">
                                    <span class="material-symbols-outlined text-emerald-600">auto_awesome</span>
                                    Recommended For You
                                </h2>
                                <p class="text-xs text-on-surface-variant">Personalized property recommendations based on your activity</p>
                            </div>
                        </div>
                        <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
                            <c:forEach items="${recommendations}" var="rec">
                                <div class="bg-surface-container-low rounded-xl p-4 flex gap-3 items-center">
                                    <div class="w-20 h-20 rounded-lg overflow-hidden shrink-0 bg-surface-container-high">
                                        <img class="w-full h-full object-cover" src="${rec.property.primaryImageUrl}" alt="${rec.property.title}" onerror="this.onerror=null; this.src='https://images.unsplash.com/photo-1600596542815-ffad4c1539a9?auto=format&fit=crop&w=1200&q=80';"/>
                                    </div>
                                    <div class="space-y-1 min-w-0 flex-1">
                                        <div class="font-bold text-sm text-primary">₹ ${rec.property.price}</div>
                                        <h3 class="font-semibold text-xs text-on-surface truncate">${rec.property.title}</h3>
                                        <p class="text-xs text-on-surface-variant truncate">${rec.property.location}, ${rec.property.city}</p>
                                        <a href="${pageContext.request.contextPath}/property/details?id=${rec.property.propertyId}" class="inline-block text-xs text-primary font-semibold hover:underline">View Details &rarr;</a>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                </c:if>

            </div>

            <!-- Sidebar (4 Cols) -->
            <div class="lg:col-span-4 space-y-6">

                <!-- User Account Profile Summary -->
                <div class="bg-surface-container-lowest rounded-2xl p-6 shadow-sm space-y-4">
                    <h2 class="font-headline-md text-lg font-bold text-on-surface flex items-center gap-2">
                        <span class="material-symbols-outlined text-primary">account_circle</span>
                        Account Information
                    </h2>
                    <div class="space-y-3 text-sm">
                        <div class="flex justify-between py-1 border-b border-surface-container-high">
                            <span class="text-on-surface-variant">Full Name</span>
                            <span class="font-semibold text-on-surface">${sessionScope.currentUser.name}</span>
                        </div>
                        <div class="flex justify-between py-1 border-b border-surface-container-high">
                            <span class="text-on-surface-variant">Email Address</span>
                            <span class="font-semibold text-on-surface truncate max-w-[180px]">${sessionScope.currentUser.email}</span>
                        </div>
                        <div class="flex justify-between py-1 border-b border-surface-container-high">
                            <span class="text-on-surface-variant">Account Role</span>
                            <span class="font-semibold text-primary uppercase text-xs px-2 py-0.5 rounded bg-surface-container-high">${sessionScope.currentUser.role}</span>
                        </div>
                        <div class="flex justify-between py-1">
                            <span class="text-on-surface-variant">Status</span>
                            <span class="font-semibold text-emerald-600 text-xs px-2 py-0.5 rounded bg-emerald-50">${sessionScope.currentUser.verificationStatus}</span>
                        </div>
                    </div>
                </div>

                <!-- Quick Navigation Shortcuts -->
                <div class="bg-surface-container-lowest rounded-2xl p-6 shadow-sm space-y-4">
                    <h2 class="font-headline-md text-lg font-bold text-on-surface flex items-center gap-2">
                        <span class="material-symbols-outlined text-primary">explore</span>
                        Quick Actions
                    </h2>
                    <div class="space-y-2">
                        <a href="${pageContext.request.contextPath}/search?purpose=SALE" class="w-full py-2.5 px-4 rounded-xl bg-surface-container-low hover:bg-surface-container text-on-surface font-semibold text-xs transition-colors flex items-center justify-between">
                            <span>Browse Properties for Sale</span>
                            <span class="material-symbols-outlined text-sm">arrow_forward</span>
                        </a>
                        <a href="${pageContext.request.contextPath}/search?purpose=RENT" class="w-full py-2.5 px-4 rounded-xl bg-surface-container-low hover:bg-surface-container text-on-surface font-semibold text-xs transition-colors flex items-center justify-between">
                            <span>Browse Properties for Rent</span>
                            <span class="material-symbols-outlined text-sm">arrow_forward</span>
                        </a>
                        <a href="${pageContext.request.contextPath}/favorites" class="w-full py-2.5 px-4 rounded-xl bg-surface-container-low hover:bg-surface-container text-on-surface font-semibold text-xs transition-colors flex items-center justify-between">
                            <span>Manage Saved Favorites</span>
                            <span class="material-symbols-outlined text-sm">arrow_forward</span>
                        </a>
                        <a href="${pageContext.request.contextPath}/views/inquiries.jsp" class="w-full py-2.5 px-4 rounded-xl bg-surface-container-low hover:bg-surface-container text-on-surface font-semibold text-xs transition-colors flex items-center justify-between">
                            <span>View Sent Inquiries</span>
                            <span class="material-symbols-outlined text-sm">arrow_forward</span>
                        </a>
                    </div>
                </div>

            </div>
        </div>

    </div>
</main>

<footer class="w-full bg-surface-container-lowest shadow-[0_-1px_8px_rgba(0,0,0,0.03)] py-6 mt-auto">
    <div class="max-w-container-max mx-auto px-4 text-center text-xs text-on-surface-variant">
        &copy; 2026 EstateHub Technologies. All rights reserved.
    </div>
</footer>

</body>
</html>
