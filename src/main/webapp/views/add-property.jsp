<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8"/>
<meta content="width=device-width, initial-scale=1.0" name="viewport"/>
<title>Post New Property - EstateHub</title>
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
<header class="fixed top-0 left-0 right-0 w-full z-40 bg-surface-container-lowest/90 backdrop-blur-xl shadow-[0_1px_12px_rgba(0,0,0,0.06)] border-b border-surface-container-high">
  <div class="h-20 max-w-[1280px] mx-auto px-6 flex items-center justify-between gap-4">
    <a href="${pageContext.request.contextPath}/" class="flex items-center gap-3">
      <img alt="EstateHub Logo" class="h-9 w-auto object-contain" src="https://lh3.googleusercontent.com/aida/AEtjO1Xg4rP1x__tmUvhhUEeM-xIYBlSjyhgL-aDvDihhuMxD0bc_kL9kHorsRYR5EvM9wdONnfScP46YL0QssDo1Yzd9XXTo1GpuWC9c1SGhoiGFmbBZZ-L95_tHf_7u7-NnrWpEVNDa3KKfH1MN1eMtrk2ZiwZGYM9sKA4zxHHA9vupb767aMCr2J7zivaAtyK3ypPdo3ZJ1n88WJ1YI5TA-loMe151e9ACRfxjid8X1QrA8mUitrWMg5qDMA"/>
      <span class="font-heading font-bold text-2xl text-primary tracking-tight">EstateHub</span>
    </a>
    
    <nav class="hidden md:flex items-center gap-6">
      <a class="text-sm font-semibold text-on-surface-variant hover:text-primary transition-colors" href="${pageContext.request.contextPath}/">Home</a>
      <a class="text-sm font-semibold text-on-surface-variant hover:text-primary transition-colors" href="${pageContext.request.contextPath}/search">Explore Properties</a>
      <a class="text-sm font-semibold text-primary font-bold" href="#">Post Property</a>
    </nav>

    <div class="flex items-center gap-3">
      <c:choose>
        <c:when test="${not empty sessionScope.currentUser}">
          <div class="flex items-center gap-3 bg-surface-container-low py-1.5 px-3 rounded-full border border-outline-variant/40">
            <span class="w-8 h-8 rounded-full bg-primary-container text-on-primary flex items-center justify-center font-bold text-xs">
              ${sessionScope.currentUser.name.substring(0, 1).toUpperCase()}
            </span>
            <span class="text-sm font-semibold text-on-surface hidden sm:inline">${sessionScope.currentUser.name}</span>
            <a href="${pageContext.request.contextPath}/logout" class="text-xs text-secondary font-bold hover:underline pl-1">Logout</a>
          </div>
        </c:when>
        <c:otherwise>
          <div class="flex items-center gap-2">
            <a href="${pageContext.request.contextPath}/views/login.jsp" class="px-4 py-2 text-sm font-bold text-primary hover:bg-surface-container-low rounded-lg transition-all">Login</a>
            <a href="${pageContext.request.contextPath}/views/register.jsp" class="px-4 py-2 text-sm font-bold bg-primary text-on-primary hover:bg-primary-container rounded-lg shadow-md hover:shadow-lg transition-all">Register</a>
          </div>
        </c:otherwise>
      </c:choose>
    </div>
  </div>
</header>

<!-- MAIN CONTENT -->
<main class="w-full pt-20 flex-1">
  
  <!-- HERO BANNER -->
  <section class="w-full bg-gradient-to-r from-primary/10 via-primary-container/5 to-surface border-b border-surface-container-high py-10 px-6">
    <div class="max-w-[1280px] mx-auto flex flex-col md:flex-row md:items-center justify-between gap-4">
      <div>
        <div class="inline-flex items-center gap-2 px-3 py-1 rounded-full bg-tertiary-container/10 text-tertiary text-xs font-bold mb-3">
          <span class="material-symbols-outlined text-[16px]">verified</span> 100% Direct Owner & Broker Listings
        </div>
        <h1 class="font-heading text-3xl md:text-4xl font-extrabold text-on-surface tracking-tight">
          Publish New Exclusive Property
        </h1>
        <p class="text-on-surface-variant text-base mt-2 max-w-2xl">
          List your residential or commercial property on India's premier real estate platform and connect with thousands of verified buyers and tenants.
        </p>
      </div>
      
      <div class="flex items-center gap-4 bg-surface-container-lowest p-4 rounded-xl shadow-sm border border-outline-variant/30">
        <div class="w-12 h-12 rounded-full bg-tertiary-container/15 flex items-center justify-center text-tertiary">
          <span class="material-symbols-outlined text-[24px]">workspace_premium</span>
        </div>
        <div>
          <h4 class="font-heading text-sm font-bold text-on-surface">Zero Brokerage Option</h4>
          <p class="text-xs text-on-surface-variant">Post FREE with 256-bit secure encryption</p>
        </div>
      </div>
    </div>
  </section>

  <!-- RESTORED DRAFT BANNER (HIDDEN BY DEFAULT) -->
  <div id="draft-banner" class="hidden max-w-[1280px] mx-auto px-6 mt-6">
    <div class="p-4 rounded-xl bg-amber-50 border border-amber-200 text-amber-900 flex items-center justify-between gap-4 shadow-sm">
      <div class="flex items-center gap-3">
        <span class="material-symbols-outlined text-amber-600 text-2xl">edit_note</span>
        <div>
          <p class="font-heading font-bold text-sm">Draft Restored!</p>
          <p class="text-xs text-amber-800">We automatically restored your previously entered property details. Review and click "Publish Property" when ready.</p>
        </div>
      </div>
      <button type="button" id="discard-draft-btn" class="px-3 py-1.5 rounded-lg bg-amber-200/60 hover:bg-amber-200 text-xs font-bold text-amber-950 transition-colors">
        Discard Draft
      </button>
    </div>
  </div>

  <!-- FORM CONTAINER -->
  <div class="max-w-[1280px] mx-auto px-6 py-8">
    <form id="post-property-form" action="${pageContext.request.contextPath}/property/crud" method="POST" enctype="multipart/form-data" class="grid grid-cols-1 lg:grid-cols-12 gap-8 items-start">
      <input type="hidden" name="action" value="create"/>

      <!-- LEFT COLUMN (FORM SECTIONS) -->
      <div class="lg:col-span-8 flex flex-col gap-8">
        
        <!-- SECTION 1: BASIC PROPERTY INFORMATION -->
        <section class="bg-surface-container-lowest p-6 md:p-8 rounded-2xl shadow-sm border border-outline-variant/30 space-y-6">
          <div class="flex items-center justify-between border-b border-surface-container-high pb-4">
            <div class="flex items-center gap-3">
              <span class="w-8 h-8 rounded-lg bg-primary-container/10 text-primary-container flex items-center justify-center font-bold text-sm">1</span>
              <h2 class="font-heading text-xl font-bold text-on-surface">Basic Property Details</h2>
            </div>
            <span class="text-xs text-outline font-medium">* Mandatory fields</span>
          </div>

          <div>
            <label class="block font-heading text-sm font-semibold text-on-surface mb-2" for="title-input">
              Property Title <span class="text-secondary font-bold">*</span>
            </label>
            <input type="text" id="title-input" name="title" required 
                   class="w-full h-12 px-4 bg-surface-container-low border border-outline-variant/50 rounded-xl focus:bg-surface-container-lowest focus:ring-2 focus:ring-primary focus:border-transparent outline-none transition-all text-sm font-medium"
                   placeholder="e.g. Luxurious 3 BHK Apartment with Sea View in Bandra West"/>
          </div>

          <div class="grid grid-cols-1 md:grid-cols-2 gap-5">
            <div>
              <label class="block font-heading text-sm font-semibold text-on-surface mb-2" for="category-select">
                Property Category <span class="text-secondary font-bold">*</span>
              </label>
              <select id="category-select" name="categoryId" required class="w-full h-12 px-4 bg-surface-container-low border border-outline-variant/50 rounded-xl focus:bg-surface-container-lowest focus:ring-2 focus:ring-primary outline-none transition-all text-sm font-medium">
                <c:choose>
                  <c:when test="${not empty categories}">
                    <c:forEach items="${categories}" var="cat">
                      <option value="${cat.categoryId}">${cat.name}</option>
                    </c:forEach>
                  </c:when>
                  <c:otherwise>
                    <option value="1">Apartment</option>
                    <option value="2">Luxury Villa</option>
                    <option value="3">Independent House</option>
                    <option value="4">Commercial Office</option>
                    <option value="5">Residential Plot</option>
                  </c:otherwise>
                </c:choose>
              </select>
            </div>

            <div>
              <label class="block font-heading text-sm font-semibold text-on-surface mb-2" for="purpose-select">
                Listing Purpose <span class="text-secondary font-bold">*</span>
              </label>
              <select id="purpose-select" name="purpose" required class="w-full h-12 px-4 bg-surface-container-low border border-outline-variant/50 rounded-xl focus:bg-surface-container-lowest focus:ring-2 focus:ring-primary outline-none transition-all text-sm font-medium">
                <option value="SALE">For Sale</option>
                <option value="RENT">For Rent / Lease</option>
              </select>
            </div>
          </div>

          <div class="grid grid-cols-1 md:grid-cols-2 gap-5">
            <div>
              <label class="block font-heading text-sm font-semibold text-on-surface mb-2" for="price-input">
                Expected Price (₹) <span class="text-secondary font-bold">*</span>
              </label>
              <div class="relative flex items-center">
                <span class="absolute left-4 text-on-surface-variant font-bold text-sm">₹</span>
                <input type="number" id="price-input" name="price" min="0" step="1000" required 
                       class="w-full h-12 pl-9 pr-4 bg-surface-container-low border border-outline-variant/50 rounded-xl focus:bg-surface-container-lowest focus:ring-2 focus:ring-primary outline-none transition-all text-sm font-semibold"
                       placeholder="e.g. 12500000"/>
              </div>
            </div>

            <div>
              <label class="block font-heading text-sm font-semibold text-on-surface mb-2" for="area-input">
                Super Built-up Area (Sq.Ft) <span class="text-secondary font-bold">*</span>
              </label>
              <div class="relative flex items-center">
                <input type="number" id="area-input" name="areaSqft" min="0" required 
                       class="w-full h-12 pl-4 pr-16 bg-surface-container-low border border-outline-variant/50 rounded-xl focus:bg-surface-container-lowest focus:ring-2 focus:ring-primary outline-none transition-all text-sm font-semibold"
                       placeholder="e.g. 1450"/>
                <span class="absolute right-4 text-on-surface-variant text-xs font-bold">sq.ft</span>
              </div>
            </div>
          </div>

          <div class="grid grid-cols-1 sm:grid-cols-3 gap-4">
            <div>
              <label class="block font-heading text-sm font-semibold text-on-surface mb-2" for="bedrooms-input">Bedrooms (BHK)</label>
              <select id="bedrooms-input" name="bedrooms" class="w-full h-12 px-4 bg-surface-container-low border border-outline-variant/50 rounded-xl focus:bg-surface-container-lowest focus:ring-2 focus:ring-primary outline-none text-sm font-medium">
                <option value="1">1 BHK</option>
                <option value="2" selected>2 BHK</option>
                <option value="3">3 BHK</option>
                <option value="4">4 BHK</option>
                <option value="5">5+ BHK</option>
              </select>
            </div>

            <div>
              <label class="block font-heading text-sm font-semibold text-on-surface mb-2" for="bathrooms-input">Bathrooms</label>
              <select id="bathrooms-input" name="bathrooms" class="w-full h-12 px-4 bg-surface-container-low border border-outline-variant/50 rounded-xl focus:bg-surface-container-lowest focus:ring-2 focus:ring-primary outline-none text-sm font-medium">
                <option value="1">1 Bathroom</option>
                <option value="2" selected>2 Bathrooms</option>
                <option value="3">3 Bathrooms</option>
                <option value="4">4+ Bathrooms</option>
              </select>
            </div>

            <div>
              <label class="block font-heading text-sm font-semibold text-on-surface mb-2" for="furnishing-select">Furnishing</label>
              <select id="furnishing-select" name="furnishing" class="w-full h-12 px-4 bg-surface-container-low border border-outline-variant/50 rounded-xl focus:bg-surface-container-lowest focus:ring-2 focus:ring-primary outline-none text-sm font-medium">
                <option value="UNFURNISHED">Unfurnished</option>
                <option value="SEMI_FURNISHED" selected>Semi-Furnished</option>
                <option value="FURNISHED">Fully Furnished</option>
              </select>
            </div>
          </div>
        </section>

        <!-- SECTION 2: LOCATION INFORMATION -->
        <section class="bg-surface-container-lowest p-6 md:p-8 rounded-2xl shadow-sm border border-outline-variant/30 space-y-6">
          <div class="flex items-center gap-3 border-b border-surface-container-high pb-4">
            <span class="w-8 h-8 rounded-lg bg-primary-container/10 text-primary-container flex items-center justify-center font-bold text-sm">2</span>
            <h2 class="font-heading text-xl font-bold text-on-surface">Property Location</h2>
          </div>

          <div>
            <label class="block font-heading text-sm font-semibold text-on-surface mb-2" for="location-input">
              Full Address / Society Name <span class="text-secondary font-bold">*</span>
            </label>
            <input type="text" id="location-input" name="location" required 
                   class="w-full h-12 px-4 bg-surface-container-low border border-outline-variant/50 rounded-xl focus:bg-surface-container-lowest focus:ring-2 focus:ring-primary outline-none transition-all text-sm font-medium"
                   placeholder="e.g. Flat 802, Hiranandani Gardens, Powai"/>
          </div>

          <div class="grid grid-cols-1 md:grid-cols-2 gap-5">
            <div>
              <label class="block font-heading text-sm font-semibold text-on-surface mb-2" for="city-input">
                City <span class="text-secondary font-bold">*</span>
              </label>
              <input type="text" id="city-input" name="city" required 
                     class="w-full h-12 px-4 bg-surface-container-low border border-outline-variant/50 rounded-xl focus:bg-surface-container-lowest focus:ring-2 focus:ring-primary outline-none transition-all text-sm font-medium"
                     placeholder="e.g. Mumbai"/>
            </div>

            <div>
              <label class="block font-heading text-sm font-semibold text-on-surface mb-2" for="state-input">
                State <span class="text-secondary font-bold">*</span>
              </label>
              <input type="text" id="state-input" name="state" required 
                     class="w-full h-12 px-4 bg-surface-container-low border border-outline-variant/50 rounded-xl focus:bg-surface-container-lowest focus:ring-2 focus:ring-primary outline-none transition-all text-sm font-medium"
                     placeholder="e.g. Maharashtra"/>
            </div>
          </div>
        </section>

        <!-- SECTION 3: DESCRIPTION & MEDIA -->
        <section class="bg-surface-container-lowest p-6 md:p-8 rounded-2xl shadow-sm border border-outline-variant/30 space-y-6">
          <div class="flex items-center gap-3 border-b border-surface-container-high pb-4">
            <span class="w-8 h-8 rounded-lg bg-primary-container/10 text-primary-container flex items-center justify-center font-bold text-sm">3</span>
            <h2 class="font-heading text-xl font-bold text-on-surface">Description & High-Res Photos</h2>
          </div>

          <div>
            <label class="block font-heading text-sm font-semibold text-on-surface mb-2" for="description-input">Detailed Description</label>
            <textarea id="description-input" name="description" rows="4" 
                      class="w-full p-4 bg-surface-container-low border border-outline-variant/50 rounded-xl focus:bg-surface-container-lowest focus:ring-2 focus:ring-primary outline-none transition-all text-sm font-medium"
                      placeholder="Highlight key features such as metro connectivity, nearby schools, balcony views, ventilation, RERA status, and security amenities..."></textarea>
          </div>

          <div>
            <label class="block font-heading text-sm font-semibold text-on-surface mb-3">Upload Property Images (Up to 4)</label>
            <div class="grid grid-cols-1 sm:grid-cols-2 gap-4">
              <div class="p-4 bg-surface-container-low rounded-xl border border-dashed border-outline-variant hover:border-primary transition-colors flex flex-col items-center justify-center text-center">
                <span class="material-symbols-outlined text-primary text-2xl mb-1">add_a_photo</span>
                <span class="text-xs font-bold text-on-surface mb-2">Main Cover Photo *</span>
                <input type="file" name="propertyPhoto1" accept="image/*" class="text-xs text-on-surface-variant w-full"/>
              </div>

              <div class="p-4 bg-surface-container-low rounded-xl border border-dashed border-outline-variant hover:border-primary transition-colors flex flex-col items-center justify-center text-center">
                <span class="material-symbols-outlined text-on-surface-variant text-2xl mb-1">photo_library</span>
                <span class="text-xs font-bold text-on-surface mb-2">Living Room Photo</span>
                <input type="file" name="propertyPhoto2" accept="image/*" class="text-xs text-on-surface-variant w-full"/>
              </div>

              <div class="p-4 bg-surface-container-low rounded-xl border border-dashed border-outline-variant hover:border-primary transition-colors flex flex-col items-center justify-center text-center">
                <span class="material-symbols-outlined text-on-surface-variant text-2xl mb-1">bedroom_parent</span>
                <span class="text-xs font-bold text-on-surface mb-2">Bedroom Photo</span>
                <input type="file" name="propertyPhoto3" accept="image/*" class="text-xs text-on-surface-variant w-full"/>
              </div>

              <div class="p-4 bg-surface-container-low rounded-xl border border-dashed border-outline-variant hover:border-primary transition-colors flex flex-col items-center justify-center text-center">
                <span class="material-symbols-outlined text-on-surface-variant text-2xl mb-1">countertops</span>
                <span class="text-xs font-bold text-on-surface mb-2">Kitchen / Exterior</span>
                <input type="file" name="propertyPhoto4" accept="image/*" class="text-xs text-on-surface-variant w-full"/>
              </div>
            </div>
          </div>
        </section>

        <!-- SUBMIT BUTTON -->
        <div class="flex items-center justify-end gap-4 pt-2">
          <button type="submit" id="submit-btn" 
                  class="w-full sm:w-auto px-8 py-4 rounded-xl bg-primary hover:bg-primary-container text-on-primary font-heading font-bold text-base shadow-lg hover:shadow-xl active:scale-[0.99] transition-all flex items-center justify-center gap-3">
            <span>Publish Property Listing</span>
            <span class="material-symbols-outlined text-xl">send</span>
          </button>
        </div>

      </div>

      <!-- RIGHT COLUMN (BENEFITS & TIPS SIDEBAR) -->
      <div class="lg:col-span-4 flex flex-col gap-6">
        
        <div class="bg-surface-container-lowest p-6 rounded-2xl shadow-sm border border-outline-variant/30 space-y-4">
          <div class="flex items-center gap-3 text-tertiary">
            <span class="material-symbols-outlined text-2xl">verified_user</span>
            <h3 class="font-heading font-bold text-base text-on-surface">Why List on EstateHub?</h3>
          </div>
          <ul class="space-y-3 text-xs text-on-surface-variant font-medium">
            <li class="flex items-start gap-2.5">
              <span class="material-symbols-outlined text-tertiary text-base shrink-0">check_circle</span>
              <span><strong>50,000+ Active Buyers & Tenants</strong> searching daily across top metros.</span>
            </li>
            <li class="flex items-start gap-2.5">
              <span class="material-symbols-outlined text-tertiary text-base shrink-0">check_circle</span>
              <span><strong>Direct Inquiries:</strong> Receive buyer messages and calls directly on your dashboard.</span>
            </li>
            <li class="flex items-start gap-2.5">
              <span class="material-symbols-outlined text-tertiary text-base shrink-0">check_circle</span>
              <span><strong>RERA Compliance Badge:</strong> Certified listings get 3x higher inquiries.</span>
            </li>
          </ul>
        </div>

        <div class="bg-surface-container-low p-6 rounded-2xl space-y-4 border border-outline-variant/30">
          <div class="flex items-center gap-3 text-primary">
            <span class="material-symbols-outlined text-2xl">tips_and_updates</span>
            <h3 class="font-heading font-bold text-base text-on-surface">Tips for Fast Responses</h3>
          </div>
          <p class="text-xs text-on-surface-variant leading-relaxed">
            Properties with accurate price estimates and high-resolution photos receive <strong>80% more views</strong> within the first 48 hours of posting!
          </p>
        </div>

      </div>

    </form>
  </div>
</main>

<!-- LOGIN / REGISTER REQUIRED MODAL POPUP -->
<div id="auth-modal" class="fixed inset-0 z-50 hidden flex items-center justify-center p-4 bg-black/60 backdrop-blur-md transition-opacity duration-300">
  <div class="bg-surface-container-lowest rounded-2xl shadow-2xl border border-outline-variant/40 max-w-md w-full p-6 md:p-8 relative transform scale-95 transition-transform duration-300" id="modal-card">
    
    <!-- CLOSE BUTTON -->
    <button type="button" id="close-modal-btn" class="absolute top-4 right-4 w-9 h-9 rounded-full bg-surface-container-low text-on-surface-variant hover:text-on-surface flex items-center justify-center transition-colors">
      <span class="material-symbols-outlined text-xl">close</span>
    </button>

    <div class="flex flex-col items-center text-center space-y-4">
      <div class="w-16 h-16 rounded-2xl bg-primary-container/10 flex items-center justify-center text-primary-container shadow-inner">
        <span class="material-symbols-outlined text-3xl">lock_person</span>
      </div>

      <h3 class="font-heading text-2xl font-extrabold text-on-surface tracking-tight">
        Login or Create Account
      </h3>

      <p class="text-sm text-on-surface-variant leading-relaxed">
        Your property details have been <strong>safely saved as a draft</strong>! Please log in or create a free EstateHub account to complete publishing your property.
      </p>

      <div class="w-full pt-2 flex flex-col gap-3">
        <a href="${pageContext.request.contextPath}/views/login.jsp?fromDraft=true" 
           class="w-full py-3.5 px-4 rounded-xl bg-primary hover:bg-primary-container text-on-primary font-heading font-bold text-sm shadow-md transition-all flex items-center justify-center gap-2">
          <span>Log In to Publish</span>
          <span class="material-symbols-outlined text-lg">login</span>
        </a>

        <a href="${pageContext.request.contextPath}/views/register.jsp?fromDraft=true" 
           class="w-full py-3.5 px-4 rounded-xl bg-surface-container-low hover:bg-surface-container-high text-on-surface font-heading font-bold text-sm transition-all flex items-center justify-center gap-2 border border-outline-variant/50">
          <span>Create Free Account</span>
          <span class="material-symbols-outlined text-lg">person_add</span>
        </a>
      </div>

      <button type="button" id="cancel-modal-btn" class="text-xs font-semibold text-outline hover:underline pt-2">
        Continue Editing Form
      </button>
    </div>
  </div>
</div>

<!-- FOOTER -->
<footer class="w-full bg-surface-container-low border-t border-surface-container-high py-6 px-6 mt-12">
  <div class="max-w-[1280px] mx-auto flex flex-col md:flex-row items-center justify-between gap-4 text-xs text-on-surface-variant">
    <p>© 2026 EstateHub Technologies Pvt. Ltd. All rights reserved.</p>
    <div class="flex items-center gap-6">
      <a href="#" class="hover:underline">Privacy Policy</a>
      <a href="#" class="hover:underline">Terms of Service</a>
      <a href="#" class="hover:underline">Contact Support</a>
    </div>
  </div>
</footer>

<!-- INTERACTIVE JS SCRIPT FOR DRAFT RESTORE & POPUP -->
<script>
  (function() {
    const isLoggedIn = ${not empty sessionScope.currentUser};
    const form = document.getElementById('post-property-form');
    const authModal = document.getElementById('auth-modal');
    const closeModalBtn = document.getElementById('close-modal-btn');
    const cancelModalBtn = document.getElementById('cancel-modal-btn');
    const draftBanner = document.getElementById('draft-banner');
    const discardDraftBtn = document.getElementById('discard-draft-btn');

    // Field elements
    const fields = ['title', 'categoryId', 'purpose', 'price', 'areaSqft', 'bedrooms', 'bathrooms', 'furnishing', 'location', 'city', 'state', 'description'];

    // 1. Restore draft if available
    const savedDraft = sessionStorage.getItem('estatehub_property_draft');
    if (savedDraft) {
      try {
        const draftData = JSON.parse(savedDraft);
        fields.forEach(field => {
          if (draftData[field] !== undefined) {
            const input = form.querySelector(`[name="${field}"]`);
            if (input) input.value = draftData[field];
          }
        });
        if (draftBanner) draftBanner.classList.remove('hidden');
      } catch (e) {
        console.error('Error parsing property draft', e);
      }
    }

    // Discard draft button
    if (discardDraftBtn) {
      discardDraftBtn.addEventListener('click', function() {
        sessionStorage.removeItem('estatehub_property_draft');
        if (draftBanner) draftBanner.classList.add('hidden');
      });
    }

    // 2. Handle form submission
    form.addEventListener('submit', function(e) {
      if (!isLoggedIn) {
        e.preventDefault();

        // Save current form text data into sessionStorage draft
        const draftData = {};
        fields.forEach(field => {
          const input = form.querySelector(`[name="${field}"]`);
          if (input) draftData[field] = input.value;
        });
        sessionStorage.setItem('estatehub_property_draft', JSON.stringify(draftData));

        // Show popup modal
        openModal();
      } else {
        // Clear draft on logged-in submission
        sessionStorage.removeItem('estatehub_property_draft');
      }
    });

    function openModal() {
      if (authModal) {
        authModal.classList.remove('hidden');
        setTimeout(() => {
          const card = document.getElementById('modal-card');
          if (card) card.classList.remove('scale-95');
        }, 10);
      }
    }

    function closeModal() {
      if (authModal) {
        authModal.classList.add('hidden');
      }
    }

    if (closeModalBtn) closeModalBtn.addEventListener('click', closeModal);
    if (cancelModalBtn) cancelModalBtn.addEventListener('click', closeModal);
    if (authModal) {
      authModal.addEventListener('click', function(e) {
        if (e.target === authModal) closeModal();
      });
    }
  })();
</script>

</body>
</html>
