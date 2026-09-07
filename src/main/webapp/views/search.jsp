<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ taglib uri="jakarta.tags.functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8"/>
<meta content="width=device-width, initial-scale=1.0" name="viewport"/>
<title>Search Properties - EstateHub</title>
<link href="https://fonts.googleapis.com" rel="preconnect"/>
<link crossorigin="" href="https://fonts.gstatic.com" rel="preconnect"/>
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&family=Plus+Jakarta+Sans:wght@600;700;800&display=swap" rel="stylesheet"/>
<link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&display=swap" rel="stylesheet"/>
<style>
  @layer base {
    html, body { margin: 0; padding: 0; }
    body { overscroll-behavior: none; }
    main > :first-child { margin-top: 0 !important; }
    main > :last-child { margin-bottom: 0 !important; }
  }
  ::-webkit-scrollbar { display: none; }
</style>
<script src="https://cdn.tailwindcss.com"></script>
<link rel="stylesheet" href="https://unpkg.com/leaflet@1.9.4/dist/leaflet.css" />
<script src="https://unpkg.com/leaflet@1.9.4/dist/leaflet.js"></script>
<script id="tailwind-config">
  tailwind.config = {
    darkMode: "class",
    theme: {
      extend: {
        colors: {
          "primary": "#450081",
          "primary-container": "#5e239d",
          "on-primary": "#ffffff",
          "secondary": "#b52330",
          "secondary-container": "#ff5a5f",
          "tertiary": "#003727",
          "tertiary-container": "#00503a",
          "surface": "#f9f9ff",
          "surface-container-low": "#f1f3fd",
          "surface-container": "#ebeef7",
          "surface-container-high": "#e5e8f2",
          "surface-container-lowest": "#ffffff",
          "on-surface": "#181c23",
          "on-surface-variant": "#4b4452",
          "outline": "#7d7483",
          "outline-variant": "#cec3d4",
          "error": "#ba1a1a",
          "error-container": "#ffdad6",
          "on-error-container": "#93000a"
        },
        fontFamily: {
          "body": ["Inter", "sans-serif"],
          "heading": ["Plus Jakarta Sans", "sans-serif"]
        }
      }
    }
  };
</script>
</head>
<body class="bg-surface font-body text-on-surface min-h-screen flex flex-col selection:bg-primary-container selection:text-on-primary">

<!-- HEADER -->
<header class="sticky top-0 z-50 w-full bg-surface-container-lowest/90 backdrop-blur-xl shadow-[0_1px_12px_rgba(0,0,0,0.06)] border-b border-surface-container-high">
  <div class="h-16 max-w-[1280px] mx-auto px-6 flex items-center justify-between gap-4">
    <a href="${pageContext.request.contextPath}/" class="flex items-center gap-3">
      <img alt="EstateHub Logo" class="h-8 w-auto object-contain" src="https://lh3.googleusercontent.com/aida/AEtjO1Xg4rP1x__tmUvhhUEeM-xIYBlSjyhgL-aDvDihhuMxD0bc_kL9kHorsRYR5EvM9wdONnfScP46YL0QssDo1Yzd9XXTo1GpuWC9c1SGhoiGFmbBZZ-L95_tHf_7u7-NnrWpEVNDa3KKfH1MN1eMtrk2ZiwZGYM9sKA4zxHHA9vupb767aMCr2J7zivaAtyK3ypPdo3ZJ1n88WJ1YI5TA-loMe151e9ACRfxjid8X1QrA8mUitrWMg5qDMA"/>
      <span class="font-heading font-bold text-xl text-primary tracking-tight">EstateHub</span>
    </a>
    
    <nav class="hidden md:flex items-center gap-6">
      <a class="text-sm font-semibold text-on-surface-variant hover:text-primary transition-colors" href="${pageContext.request.contextPath}/">Home</a>
      <a class="text-sm font-bold text-primary" href="${pageContext.request.contextPath}/search">Buy</a>
      <a class="text-sm font-semibold text-on-surface-variant hover:text-primary transition-colors" href="${pageContext.request.contextPath}/search?purpose=RENT">Rent</a>
      <a class="text-sm font-semibold text-on-surface-variant hover:text-primary transition-colors" href="${pageContext.request.contextPath}/search?categoryId=4">Commercial</a>
    </nav>

    <div class="flex items-center gap-3">
      <a href="${pageContext.request.contextPath}/property/crud" class="px-3.5 py-1.5 rounded-lg bg-primary text-on-primary font-bold text-xs hover:bg-primary-container transition-all flex items-center gap-1.5 shadow-sm">
        <span>Post Property</span>
        <span class="bg-tertiary-container text-tertiary-fixed text-[10px] px-1.5 py-0.5 rounded font-extrabold">FREE</span>
      </a>
      
      <c:choose>
        <c:when test="${not empty sessionScope.currentUser}">
          <a href="${pageContext.request.contextPath}/customer/dashboard" class="w-8 h-8 rounded-full bg-primary-container text-on-primary flex items-center justify-center font-bold text-xs">
            ${sessionScope.currentUser.name.substring(0, 1).toUpperCase()}
          </a>
        </c:when>
        <c:otherwise>
          <a href="${pageContext.request.contextPath}/views/login.jsp" class="text-xs font-bold text-primary hover:underline">Login</a>
        </c:otherwise>
      </c:choose>
    </div>
  </div>
</header>

<main class="flex-1 w-full bg-surface pb-16">
  
  <!-- SEARCH BAR & FILTER HEADER -->
  <section class="w-full bg-surface-container-lowest shadow-sm border-b border-surface-container-high py-6">
    <div class="max-w-[1280px] mx-auto px-6 flex flex-col gap-4">
      
      <!-- BREADCRUMB -->
      <nav class="flex items-center gap-2 text-xs text-on-surface-variant">
        <a href="${pageContext.request.contextPath}/" class="hover:text-primary transition-colors">Home</a>
        <span class="material-symbols-outlined text-[14px]">chevron_right</span>
        <a href="${pageContext.request.contextPath}/search" class="hover:text-primary transition-colors">Search Properties</a>
        <c:if test="${not empty keyword}">
          <span class="material-symbols-outlined text-[14px]">chevron_right</span>
          <span class="text-on-surface font-bold">${keyword}</span>
        </c:if>
      </nav>

      <!-- DYNAMIC SEARCH HEADER TITLE & COUNTS -->
      <div class="flex flex-col md:flex-row md:items-center justify-between gap-4">
        <div>
          <h1 class="font-heading text-2xl md:text-3xl font-extrabold text-on-surface tracking-tight flex items-center gap-3">
            <c:choose>
              <c:when test="${not empty keyword}">
                Properties in "${keyword}"
              </c:when>
              <c:when test="${not empty purpose}">
                Properties for ${purpose}
              </c:when>
              <c:otherwise>
                All Verified Properties
              </c:otherwise>
            </c:choose>
            <span class="px-3 py-1 rounded-full bg-primary-container/10 text-primary-container text-xs font-bold">
              ${fn:length(properties)} Available
            </span>
          </h1>
          <p class="text-xs text-on-surface-variant mt-1">
            Verified direct listings with RERA compliance, exact carpet area & 100% on-ground property records.
          </p>
        </div>

        <!-- SEARCH FORM BAR -->
        <form action="${pageContext.request.contextPath}/search" method="GET" class="flex items-center gap-2 bg-surface-container-low p-1.5 rounded-xl border border-outline-variant/50 max-w-md w-full">
          <span class="material-symbols-outlined text-primary pl-2">search</span>
          <input type="text" name="keyword" value="${keyword}" placeholder="Search City, Locality, or Project..." 
                 class="w-full bg-transparent text-sm font-medium text-on-surface outline-none py-1.5 px-1"/>
          <button type="submit" class="px-4 py-2 rounded-lg bg-primary hover:bg-primary-container text-on-primary text-xs font-bold shadow-sm transition-all">
            Search
          </button>
        </form>
      </div>

    </div>
  </section>

  <!-- TWO COLUMN LAYOUT (FILTERS SIDEBAR & PROPERTY CARDS) -->
  <div class="max-w-[1280px] mx-auto px-6 py-8">
    <div class="grid grid-cols-1 lg:grid-cols-12 gap-8 items-start">
      
      <!-- SIDEBAR FILTERS (3 COLUMNS) -->
      <aside class="lg:col-span-4 w-full bg-surface-container-lowest p-6 rounded-2xl shadow-sm border border-outline-variant/30 space-y-6">
        <form action="${pageContext.request.contextPath}/search" method="GET" class="space-y-6">
          <c:if test="${not empty keyword}">
            <input type="hidden" name="keyword" value="${keyword}"/>
          </c:if>

          <div class="flex items-center justify-between border-b border-surface-container-high pb-3">
            <div class="flex items-center gap-2">
              <span class="material-symbols-outlined text-primary">tune</span>
              <h2 class="font-heading text-lg font-bold text-on-surface">Filter Results</h2>
            </div>
            <a href="${pageContext.request.contextPath}/search" class="text-xs text-primary font-bold hover:underline">Reset All</a>
          </div>

          <!-- CATEGORY FILTER -->
          <div>
            <label class="block font-heading text-xs font-bold uppercase tracking-wider text-on-surface-variant mb-2">Category</label>
            <select name="categoryId" onchange="this.form.submit()" class="w-full h-11 px-3 bg-surface-container-low rounded-xl text-sm font-medium border border-outline-variant/40 outline-none focus:ring-2 focus:ring-primary">
              <option value="">All Categories</option>
              <c:forEach items="${categories}" var="cat">
                <option value="${cat.categoryId}" ${categoryId == cat.categoryId ? 'selected' : ''}>${cat.name}</option>
              </c:forEach>
            </select>
          </div>

          <!-- PURPOSE FILTER -->
          <div>
            <label class="block font-heading text-xs font-bold uppercase tracking-wider text-on-surface-variant mb-2">Listing Purpose</label>
            <div class="grid grid-cols-2 gap-2">
              <label class="flex items-center justify-center py-2.5 px-3 rounded-xl border border-outline-variant/40 cursor-pointer font-bold text-xs transition-colors ${purpose == 'SALE' ? 'bg-primary-container text-on-primary border-primary-container' : 'bg-surface-container-low text-on-surface hover:bg-surface-container'}">
                <input type="radio" name="purpose" value="SALE" ${purpose == 'SALE' ? 'checked' : ''} onchange="this.form.submit()" class="sr-only"/>
                For Sale
              </label>
              <label class="flex items-center justify-center py-2.5 px-3 rounded-xl border border-outline-variant/40 cursor-pointer font-bold text-xs transition-colors ${purpose == 'RENT' ? 'bg-primary-container text-on-primary border-primary-container' : 'bg-surface-container-low text-on-surface hover:bg-surface-container'}">
                <input type="radio" name="purpose" value="RENT" ${purpose == 'RENT' ? 'checked' : ''} onchange="this.form.submit()" class="sr-only"/>
                For Rent
              </label>
            </div>
          </div>

          <!-- BEDROOMS FILTER -->
          <div>
            <label class="block font-heading text-xs font-bold uppercase tracking-wider text-on-surface-variant mb-2">Bedrooms (BHK)</label>
            <select name="bedrooms" onchange="this.form.submit()" class="w-full h-11 px-3 bg-surface-container-low rounded-xl text-sm font-medium border border-outline-variant/40 outline-none focus:ring-2 focus:ring-primary">
              <option value="">Any Bedrooms</option>
              <option value="1" ${bedrooms == 1 ? 'selected' : ''}>1 BHK</option>
              <option value="2" ${bedrooms == 2 ? 'selected' : ''}>2 BHK</option>
              <option value="3" ${bedrooms == 3 ? 'selected' : ''}>3 BHK</option>
              <option value="4" ${bedrooms == 4 ? 'selected' : ''}>4+ BHK</option>
            </select>
          </div>

          <!-- FURNISHING FILTER -->
          <div>
            <label class="block font-heading text-xs font-bold uppercase tracking-wider text-on-surface-variant mb-2">Furnishing Status</label>
            <select name="furnishing" onchange="this.form.submit()" class="w-full h-11 px-3 bg-surface-container-low rounded-xl text-sm font-medium border border-outline-variant/40 outline-none focus:ring-2 focus:ring-primary">
              <option value="">Any Furnishing</option>
              <option value="UNFURNISHED" ${furnishing == 'UNFURNISHED' ? 'selected' : ''}>Unfurnished</option>
              <option value="SEMI_FURNISHED" ${furnishing == 'SEMI_FURNISHED' ? 'selected' : ''}>Semi-Furnished</option>
              <option value="FURNISHED" ${furnishing == 'FURNISHED' ? 'selected' : ''}>Fully Furnished</option>
            </select>
          </div>

          <!-- APPLY BUTTON -->
          <button type="submit" class="w-full py-3 rounded-xl bg-primary hover:bg-primary-container text-on-primary font-bold text-xs shadow-md transition-all">
            Apply Filters
          </button>
        </form>
      </aside>

      <!-- PROPERTY RESULTS FEED (8 COLUMNS) -->
      <div class="lg:col-span-8 w-full space-y-6">
        
        <c:choose>
          <c:when test="${empty properties}">
            <!-- CASE 1: NO PROPERTIES FOUND IN SEARCH LOCATION (SORRY PAGE VIEW) -->
            <div class="bg-surface-container-lowest p-8 sm:p-12 rounded-3xl shadow-sm border border-outline-variant/30 text-center flex flex-col items-center space-y-6">
              
              <div class="w-20 h-20 rounded-full bg-error-container/20 flex items-center justify-center text-error mb-2 shadow-inner">
                <span class="material-symbols-outlined text-4xl">wrong_location</span>
              </div>

              <div class="max-w-md space-y-2">
                <h3 class="font-heading text-2xl font-extrabold text-on-surface tracking-tight">
                  Sorry! No Properties Available
                  <c:if test="${not empty keyword}">
                    in "${keyword}"
                  </c:if>
                </h3>
                <p class="text-sm text-on-surface-variant leading-relaxed">
                  We currently do not have verified listings in this exact location or matching your criteria. New properties are listed daily across top Indian cities!
                </p>
              </div>

              <!-- ACTION BUTTONS -->
              <div class="flex flex-col sm:flex-row items-center gap-3 pt-2 w-full max-w-sm">
                <a href="${pageContext.request.contextPath}/search" 
                   class="w-full py-3 px-6 rounded-xl bg-primary hover:bg-primary-container text-on-primary font-bold text-xs shadow-md transition-all flex items-center justify-center gap-2">
                  <span class="material-symbols-outlined text-base">explore</span>
                  <span>View All Available Properties</span>
                </a>

                <a href="${pageContext.request.contextPath}/property/crud" 
                   class="w-full py-3 px-6 rounded-xl bg-surface-container-low hover:bg-surface-container-high text-on-surface border border-outline-variant/50 font-bold text-xs transition-all flex items-center justify-center gap-2">
                  <span class="material-symbols-outlined text-base">add_circle</span>
                  <span>Post Property Here</span>
                </a>
              </div>

              <!-- POPULAR CITIES CHIPS -->
              <div class="pt-6 border-t border-surface-container-high w-full">
                <span class="block font-heading text-xs font-bold uppercase tracking-wider text-outline mb-3">Try Searching Popular Metro Cities:</span>
                <div class="flex flex-wrap items-center justify-center gap-2">
                  <a href="${pageContext.request.contextPath}/search?keyword=Mumbai" class="px-3.5 py-1.5 rounded-full bg-surface-container-low hover:bg-primary-container hover:text-on-primary text-xs font-semibold transition-colors">Mumbai</a>
                  <a href="${pageContext.request.contextPath}/search?keyword=Bangalore" class="px-3.5 py-1.5 rounded-full bg-surface-container-low hover:bg-primary-container hover:text-on-primary text-xs font-semibold transition-colors">Bangalore</a>
                  <a href="${pageContext.request.contextPath}/search?keyword=Pune" class="px-3.5 py-1.5 rounded-full bg-surface-container-low hover:bg-primary-container hover:text-on-primary text-xs font-semibold transition-colors">Pune</a>
                  <a href="${pageContext.request.contextPath}/search?keyword=Hyderabad" class="px-3.5 py-1.5 rounded-full bg-surface-container-low hover:bg-primary-container hover:text-on-primary text-xs font-semibold transition-colors">Hyderabad</a>
                  <a href="${pageContext.request.contextPath}/search?keyword=Gurgaon" class="px-3.5 py-1.5 rounded-full bg-surface-container-low hover:bg-primary-container hover:text-on-primary text-xs font-semibold transition-colors">Gurgaon</a>
                </div>
              </div>

            </div>
          </c:when>

          <c:otherwise>
            <!-- CASE 2: MATCHING PROPERTIES FOUND (DYNAMIC CARDS LIST & MAP AT BOTTOM) -->
            <div class="space-y-6">

              <c:forEach items="${properties}" var="p">
                <article class="bg-surface-container-lowest rounded-2xl shadow-sm hover:shadow-xl transition-all duration-300 overflow-hidden border border-outline-variant/30 flex flex-col md:flex-row group">
                  
                  <!-- PHOTO IMAGE -->
                  <div class="md:w-5/12 h-56 md:h-auto bg-surface-container relative overflow-hidden shrink-0">
                    <img src="${p.primaryImageUrl}" alt="${p.title}" class="w-full h-full object-cover group-hover:scale-105 transition-transform duration-500"/>
                    <span class="absolute top-3 left-3 bg-surface-container-lowest/90 backdrop-blur-md text-tertiary text-[11px] font-bold px-2.5 py-1 rounded-md shadow-xs flex items-center gap-1">
                      <span class="material-symbols-outlined text-[14px]">verified</span> Verified
                    </span>
                  </div>

                  <!-- PROPERTY DETAILS -->
                  <div class="p-6 md:w-7/12 flex flex-col justify-between space-y-4">
                    <div>
                      <div class="flex items-baseline justify-between mb-1">
                        <span class="font-heading text-2xl font-extrabold text-on-surface">₹ ${p.price}</span>
                        <span class="text-xs font-bold text-primary uppercase">${p.purpose}</span>
                      </div>

                      <h3 class="font-heading text-lg font-bold text-on-surface group-hover:text-primary transition-colors line-clamp-1">
                        <a href="${pageContext.request.contextPath}/property/details?id=${p.propertyId}">${p.title}</a>
                      </h3>

                      <p class="text-xs text-on-surface-variant flex items-center gap-1 mt-1">
                        <span class="material-symbols-outlined text-primary text-base">location_on</span>
                        <span>${p.location}, ${p.city}</span>
                      </p>

                      <!-- SPECIFICATIONS GRID -->
                      <div class="grid grid-cols-4 gap-2 mt-4 p-3 bg-surface-container-low rounded-xl text-xs font-semibold text-on-surface text-center">
                        <div>
                          <span class="block text-[10px] text-outline uppercase font-medium">BHK</span>
                          <span>${p.bedrooms} Beds</span>
                        </div>
                        <div>
                          <span class="block text-[10px] text-outline uppercase font-medium">Area</span>
                          <span>${p.areaSqft} sqft</span>
                        </div>
                        <div>
                          <span class="block text-[10px] text-outline uppercase font-medium">Baths</span>
                          <span>${p.bathrooms} Baths</span>
                        </div>
                        <div>
                          <span class="block text-[10px] text-outline uppercase font-medium">Type</span>
                          <span class="truncate block">${p.categoryName}</span>
                        </div>
                      </div>
                    </div>

                    <!-- FOOTER & CONTACT -->
                    <div class="flex items-center justify-between pt-3 border-t border-surface-container-high">
                      <span class="text-xs font-bold text-on-surface-variant">Owner: ${p.ownerName}</span>
                      <div class="flex items-center gap-2">
                        <a href="https://www.google.com/maps/dir/?api=1&destination=${fn:escapeXml(p.location)}+${fn:escapeXml(p.city)}" target="_blank" 
                           class="px-3 py-2 rounded-xl bg-surface-container-low hover:bg-surface-container text-primary text-xs font-bold transition-all flex items-center gap-1">
                          <span class="material-symbols-outlined text-base">directions</span>
                          <span>Directions</span>
                        </a>
                        <a href="https://wa.me/${p.ownerWhatsapp}" target="_blank" 
                           class="px-4 py-2 rounded-xl bg-tertiary-container hover:bg-tertiary text-on-tertiary text-xs font-bold shadow-xs transition-all flex items-center gap-1.5">
                          <span class="material-symbols-outlined text-base">chat</span>
                          <span>Contact Owner</span>
                        </a>
                      </div>
                    </div>
                  </div>

                </article>
              </c:forEach>

              <!-- INTERACTIVE MAP WIDGET AT THE BOTTOM AFTER ALL AD LISTINGS -->
              <div class="bg-surface-container-lowest p-4 rounded-2xl border border-outline-variant/30 shadow-sm space-y-3 mt-8">
                <div class="flex items-center justify-between">
                  <div class="flex items-center gap-2">
                    <span class="material-symbols-outlined text-primary text-lg">map</span>
                    <h3 class="font-heading text-sm font-bold text-on-surface">Interactive Locality Map & Directions</h3>
                    <span class="text-[10px] font-bold px-2 py-0.5 rounded-full bg-tertiary-container text-tertiary-fixed">Live Location</span>
                  </div>
                  <span class="text-xs text-on-surface-variant font-medium">Click markers for Google Maps directions</span>
                </div>
                <div id="searchMap" class="w-full h-72 sm:h-80 rounded-xl border border-outline-variant/40 overflow-hidden z-0"></div>
              </div>

            </div>
          </c:otherwise>

        </c:choose>

      </div>

    </div>
  </div>
</main>

<!-- FOOTER -->
<footer class="w-full bg-surface-container-low border-t border-surface-container-high py-6 px-6">
  <div class="max-w-[1280px] mx-auto flex flex-col md:flex-row items-center justify-between gap-4 text-xs text-on-surface-variant">
    <p>© 2026 EstateHub Technologies Pvt. Ltd. All rights reserved.</p>
    <div class="flex items-center gap-6">
      <a href="#" class="hover:underline">Privacy Policy</a>
      <a href="#" class="hover:underline">Terms of Service</a>
      <a href="#" class="hover:underline">Contact Support</a>
    </div>
  </div>
</footer>

<script>
  document.addEventListener("DOMContentLoaded", function() {
    var mapContainer = document.getElementById('searchMap');
    if (!mapContainer) return;

    var locationCoords = {
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
      "gurgaon": [28.4595, 77.0266],
      "delhi": [28.6139, 77.2090]
    };

    var propertyList = [
      <c:forEach items="${properties}" var="p" varStatus="loop">
        {
          id: ${p.propertyId},
          title: "${fn:escapeXml(p.title)}",
          location: "${fn:escapeXml(p.location)}",
          city: "${fn:escapeXml(p.city)}",
          price: "${p.price}",
          image: "${p.primaryImageUrl}",
          url: "${pageContext.request.contextPath}/property/details?id=${p.propertyId}"
        }${!loop.last ? ',' : ''}
      </c:forEach>
    ];

    var defaultLat = 19.0760;
    var defaultLng = 72.8777;
    var keywordLower = "${fn:escapeXml(keyword)}".toLowerCase().trim();

    for (var key in locationCoords) {
      if (keywordLower.indexOf(key) !== -1) {
        defaultLat = locationCoords[key][0];
        defaultLng = locationCoords[key][1];
        break;
      }
    }

    var map = L.map('searchMap').setView([defaultLat, defaultLng], 12);
    L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
      maxZoom: 19,
      attribution: '© OpenStreetMap'
    }).addTo(map);

    var bounds = [];

    // Detect User GPS location and place "My Location" marker
    if (navigator.geolocation) {
      navigator.geolocation.getCurrentPosition(function(pos) {
        var uLat = pos.coords.latitude;
        var uLng = pos.coords.longitude;
        var myIcon = L.divIcon({
          className: 'user-gps-marker',
          html: '<div style="background:#00503a; color:white; border:2px solid white; border-radius:12px; padding:3px 7px; font-size:10px; font-weight:800; shadow:0 2px 6px rgba(0,0,0,0.3);">📍 My Location</div>',
          iconSize: [80, 25]
        });
        L.marker([uLat, uLng], { icon: myIcon }).addTo(map).bindPopup("<b>You are here!</b>");
      }, function() {});
    }

    propertyList.forEach(function(item, idx) {
      var itemLoc = (item.location + ' ' + item.city + ' ' + item.title).toLowerCase();
      var pLat = defaultLat + (Math.sin(idx + 1) * 0.008);
      var pLng = defaultLng + (Math.cos(idx + 1) * 0.008);

      for (var k in locationCoords) {
        if (itemLoc.indexOf(k) !== -1) {
          pLat = locationCoords[k][0] + (Math.sin(idx + 1) * 0.004);
          pLng = locationCoords[k][1] + (Math.cos(idx + 1) * 0.004);
          break;
        }
      }

      bounds.push([pLat, pLng]);

      var gMapsDirUrl = "https://www.google.com/maps/dir/?api=1&destination=" + encodeURIComponent(item.location + " " + item.city);

      var marker = L.marker([pLat, pLng]).addTo(map);
      var popupContent = 
        '<div style="width: 180px; font-family: Inter, sans-serif;">' +
        '  <img src="' + item.image + '" style="width: 100%; height: 85px; object-fit: cover; border-radius: 6px; margin-bottom: 6px;"/>' +
        '  <div style="font-weight: 700; font-size: 12px; color: #181c23; margin-bottom: 2px; text-overflow: ellipsis; overflow: hidden; white-space: nowrap;">' + item.title + '</div>' +
        '  <div style="font-weight: 800; font-size: 13px; color: #450081; margin-bottom: 4px;">₹ ' + item.price + '</div>' +
        '  <div style="font-size: 11px; color: #4b4452; margin-bottom: 6px;">📍 ' + item.location + ', ' + item.city + '</div>' +
        '  <div style="display: flex; gap: 4px;">' +
        '    <a href="' + item.url + '" style="flex:1; text-align: center; background: #450081; color: white; padding: 5px; border-radius: 6px; text-decoration: none; font-size: 10px; font-weight: 700;">View</a>' +
        '    <a href="' + gMapsDirUrl + '" target="_blank" style="flex:1; text-align: center; background: #00503a; color: white; padding: 5px; border-radius: 6px; text-decoration: none; font-size: 10px; font-weight: 700;">Directions</a>' +
        '  </div>' +
        '</div>';

      marker.bindPopup(popupContent);
    });

    if (bounds.length > 0) {
      map.fitBounds(bounds, { padding: [30, 30] });
    }
  });
</script>

</body>
</html>