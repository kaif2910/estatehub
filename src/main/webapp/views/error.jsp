<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isErrorPage="true" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8"/>
<meta content="width=device-width, initial-scale=1.0" name="viewport"/>
<title>EstateHub — System Notification</title>
<link href="https://fonts.googleapis.com" rel="preconnect"/>
<link crossorigin="" href="https://fonts.gstatic.com" rel="preconnect"/>
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600&family=Plus+Jakarta+Sans:wght@600;700;800&display=swap" rel="stylesheet"/>
<link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" rel="stylesheet"/>
<script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-slate-50 font-sans text-slate-800 min-h-screen flex flex-col justify-between antialiased">
<header class="w-full bg-white border-b border-slate-200 py-4 shadow-sm">
    <div class="max-w-6xl mx-auto px-6 flex items-center justify-between">
        <a href="${pageContext.request.contextPath}/" class="flex items-center gap-2 font-bold text-xl text-purple-900">
            <span class="material-symbols-outlined text-purple-700 text-2xl">apartment</span>
            EstateHub
        </a>
        <a href="${pageContext.request.contextPath}/" class="text-sm font-semibold text-purple-700 hover:text-purple-900">Return to Home</a>
    </div>
</header>

<main class="flex-1 max-w-2xl mx-auto px-6 flex flex-col items-center justify-center text-center py-16">
    <div class="w-20 h-20 rounded-full bg-purple-100 text-purple-800 flex items-center justify-center mb-6 shadow-inner">
        <span class="material-symbols-outlined text-4xl">warning</span>
    </div>
    
    <h1 class="text-3xl font-extrabold text-slate-900 mb-3 tracking-tight">Something unexpected occurred</h1>
    <p class="text-slate-600 text-base mb-8 max-w-lg leading-relaxed">
        The page or action you requested could not be completed at this moment. Our technical team has been notified.
    </p>

    <div class="flex flex-col sm:flex-row items-center justify-center gap-4 w-full max-w-xs">
        <a href="${pageContext.request.contextPath}/views/login.jsp" class="w-full py-3 px-6 rounded-xl bg-purple-900 hover:bg-purple-800 text-white font-semibold text-sm transition-all shadow-md">
            Go to Login Page
        </a>
        <a href="${pageContext.request.contextPath}/" class="w-full py-3 px-6 rounded-xl bg-white border border-slate-300 hover:bg-slate-100 text-slate-700 font-semibold text-sm transition-all">
            Back to Home
        </a>
    </div>
</main>

<footer class="w-full bg-white border-t border-slate-200 py-6 text-center text-xs text-slate-500">
    © 2026 EstateHub Technologies. All rights reserved.
</footer>
</body>
</html>
