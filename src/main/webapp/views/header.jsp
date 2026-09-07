<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${param.title != null ? param.title : 'EstateHub — Real Estate Marketplace'}</title>
    <!-- Google Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@300;400;500;600;700;800&family=Playfair+Display:wght@600;700&display=swap" rel="stylesheet">
    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Bootstrap Icons -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    <!-- Custom Global CSS Variables (Can be overridden by Dark Mode) -->
    <style>
        :root {
            --bs-emerald: #10b981;
            --bs-emerald-rgb: 16, 185, 129;
            --bs-emerald-hover: #059669;
        }
    </style>
    <!-- Dark Mode Init (Run immediately to prevent flash) -->
    <script>
        (function() {
            var theme = localStorage.getItem('theme');
            if (theme === 'dark' || (!theme && window.matchMedia('(prefers-color-scheme: dark)').matches)) {
                document.documentElement.setAttribute('data-bs-theme', 'dark');
            }
        })();
    </script>
    <style>
        :root {
            --primary-emerald: #0f766e;
            --primary-emerald-hover: #0d9488;
            --emerald-light: #f0fdf4;
            --dark-navy: #0f172a;
            --card-border: #e2e8f0;
            --font-sans: 'Plus Jakarta Sans', sans-serif;
            --font-serif: 'Playfair Display', serif;
        }
        body {
            font-family: var(--font-sans);
            color: #334155;
            background-color: #f8fafc;
            min-height: 100vh;
            display: flex;
            flex-direction: column;
        }
        .font-serif { font-family: var(--font-serif); }
        .bg-primary-emerald { background-color: var(--primary-emerald) !important; color: white !important; }
        .text-emerald { color: var(--primary-emerald) !important; }
        .btn-emerald {
            background-color: var(--primary-emerald);
            color: white;
            border-radius: 8px;
            padding: 8px 18px;
            font-weight: 600;
            transition: all 0.2s ease;
        }
        .btn-emerald:hover {
            background-color: var(--primary-emerald-hover);
            color: white;
            transform: translateY(-1px);
        }
        .btn-outline-emerald {
            border: 1.5px solid var(--primary-emerald);
            color: var(--primary-emerald);
            border-radius: 8px;
            font-weight: 600;
        }
        .btn-outline-emerald:hover {
            background-color: var(--primary-emerald);
            color: white;
        }
        .badge-verified {
            background-color: #dcfce7;
            color: #15803d;
            font-weight: 600;
            border: 1px solid #bbf7d0;
            border-radius: 6px;
            padding: 4px 8px;
            font-size: 0.75rem;
        }
        .badge-match {
            background-color: #fef08a;
            color: #854d0e;
            font-weight: 700;
            border-radius: 6px;
            padding: 4px 8px;
            font-size: 0.75rem;
        }
        .card-property {
            border: 1px solid var(--card-border);
            border-radius: 12px;
            overflow: hidden;
            background: white;
            transition: transform 0.2s ease, box-shadow 0.2s ease;
        }
        .card-property:hover {
            transform: translateY(-4px);
            box-shadow: 0 12px 24px -10px rgba(15, 23, 42, 0.12);
        }
        .property-img-wrapper {
            position: relative;
            height: 210px;
            overflow: hidden;
            background-color: #e2e8f0;
        }
        .property-img-wrapper img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            transition: transform 0.3s ease;
        }
        .card-property:hover .property-img-wrapper img {
            transform: scale(1.04);
        }
    </style>
</head>
<body>
