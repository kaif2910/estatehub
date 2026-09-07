<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<nav class="navbar navbar-expand-lg navbar-light bg-white border-bottom sticky-top py-2">
    <div class="container">
        <a class="navbar-brand d-flex align-items-center gap-2 fw-bold text-dark" href="${pageContext.request.contextPath}/views/index.jsp">
            <span class="d-inline-flex align-items-center justify-content-center bg-primary-emerald text-white rounded-3 p-2" style="width: 38px; height: 38px;">
                <i class="bi bi-buildings"></i>
            </span>
            <span style="font-size: 1.35rem; letter-spacing: -0.5px;">Estate<span class="text-emerald">Hub</span></span>
        </a>
        <button class="navbar-toggler border-0 shadow-none" type="button" data-bs-toggle="collapse" data-bs-target="#navbarMain">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarMain">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4 gap-1">
                <li class="nav-item">
                    <a class="nav-link fw-medium text-secondary" href="${pageContext.request.contextPath}/search"><i class="bi bi-search me-1"></i> Browse Properties</a>
                </li>
                <c:if test="${sessionScope.currentUser != null && sessionScope.currentUser.role == 'CUSTOMER'}">
                    <li class="nav-item">
                        <a class="nav-link fw-medium text-secondary" href="${pageContext.request.contextPath}/recommendations"><i class="bi bi-stars text-warning me-1"></i> Recommendations</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link fw-medium text-secondary" href="${pageContext.request.contextPath}/favorites"><i class="bi bi-heart me-1 text-danger"></i> Saved</a>
                    </li>
                </c:if>
                <c:if test="${sessionScope.currentUser != null && (sessionScope.currentUser.role == 'SELLER' || sessionScope.currentUser.role == 'BROKER')}">
                    <li class="nav-item">
                        <a class="nav-link fw-medium text-secondary" href="${pageContext.request.contextPath}/property/crud"><i class="bi bi-plus-circle me-1 text-emerald"></i> Add Property</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link fw-medium text-secondary" href="${pageContext.request.contextPath}/${sessionScope.currentUser.role.name().toLowerCase()}/verification"><i class="bi bi-patch-check me-1"></i> Verification</a>
                    </li>
                </c:if>
                <c:if test="${sessionScope.currentUser != null && sessionScope.currentUser.role == 'ADMIN'}">
                    <li class="nav-item">
                        <a class="nav-link fw-medium text-secondary" href="${pageContext.request.contextPath}/admin/dashboard"><i class="bi bi-speedometer2 me-1"></i> Dashboard</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link fw-medium text-secondary" href="${pageContext.request.contextPath}/admin/properties"><i class="bi bi-shield-check me-1"></i> Approvals</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link fw-medium text-secondary" href="${pageContext.request.contextPath}/admin/verification"><i class="bi bi-person-check me-1"></i> Verifications</a>
                    </li>
                </c:if>
            </ul>

            <div class="d-flex align-items-center gap-2">
                <!-- Dark Mode Toggle -->
                <button class="btn btn-light border rounded-circle d-flex align-items-center justify-content-center" id="themeToggleBtn" style="width: 40px; height: 40px; margin-right: 8px;" title="Toggle Dark/Light Mode">
                    <i class="bi bi-moon-stars-fill text-dark" id="themeIcon"></i>
                </button>

                <c:choose>
                    <c:when test="${sessionScope.currentUser != null}">
                        <div class="dropdown">
                            <button class="btn btn-light border dropdown-toggle d-flex align-items-center gap-2 rounded-pill px-3 py-1" type="button" data-bs-toggle="dropdown">
                                <div class="rounded-circle bg-primary-emerald text-white d-flex align-items-center justify-content-center fw-bold" style="width: 32px; height: 32px; font-size: 0.85rem;">
                                    ${sessionScope.currentUser.name.substring(0, 1).toUpperCase()}
                                </div>
                                <div class="text-start d-none d-sm-block">
                                    <div class="fw-semibold text-dark" style="font-size: 0.85rem; line-height: 1.1;">${sessionScope.currentUser.name}</div>
                                    <small class="text-muted" style="font-size: 0.72rem;">${sessionScope.currentUser.role}</small>
                                </div>
                            </button>
                            <ul class="dropdown-menu dropdown-menu-end shadow border-0 mt-2">
                                <li>
                                    <h6 class="dropdown-header d-flex align-items-center justify-content-between">
                                        <span>${sessionScope.currentUser.role}</span>
                                        <c:if test="${sessionScope.currentUser.verificationStatus == 'VERIFIED'}">
                                            <span class="badge badge-verified"><i class="bi bi-patch-check-fill"></i> Verified</span>
                                        </c:if>
                                    </h6>
                                </li>
                                <li><hr class="dropdown-divider"></li>
                                <c:choose>
                                    <c:when test="${sessionScope.currentUser.role == 'ADMIN'}">
                                        <li><a class="dropdown-item" href="${pageContext.request.contextPath}/admin/dashboard"><i class="bi bi-speedometer2 me-2"></i> Admin Panel</a></li>
                                        <li><a class="dropdown-item" href="${pageContext.request.contextPath}/admin/users"><i class="bi bi-people me-2"></i> Manage Users</a></li>
                                        <li><a class="dropdown-item" href="${pageContext.request.contextPath}/admin/categories"><i class="bi bi-tag me-2"></i> Categories</a></li>
                                    </c:when>
                                    <c:when test="${sessionScope.currentUser.role == 'SELLER'}">
                                        <li><a class="dropdown-item" href="${pageContext.request.contextPath}/seller/dashboard"><i class="bi bi-grid me-2"></i> Seller Dashboard</a></li>
                                        <li><a class="dropdown-item" href="${pageContext.request.contextPath}/property/crud"><i class="bi bi-plus-circle me-2"></i> Add Property</a></li>
                                        <li><a class="dropdown-item" href="${pageContext.request.contextPath}/inquiries"><i class="bi bi-envelope me-2"></i> Inquiries</a></li>
                                    </c:when>
                                    <c:when test="${sessionScope.currentUser.role == 'BROKER'}">
                                        <li><a class="dropdown-item" href="${pageContext.request.contextPath}/broker/dashboard"><i class="bi bi-grid me-2"></i> Broker Dashboard</a></li>
                                        <li><a class="dropdown-item" href="${pageContext.request.contextPath}/property/crud"><i class="bi bi-plus-circle me-2"></i> Add Property</a></li>
                                        <li><a class="dropdown-item" href="${pageContext.request.contextPath}/inquiries"><i class="bi bi-envelope me-2"></i> Inquiries</a></li>
                                    </c:when>
                                    <c:otherwise>
                                        <li><a class="dropdown-item" href="${pageContext.request.contextPath}/customer/dashboard"><i class="bi bi-speedometer2 me-2"></i> My Dashboard</a></li>
                                        <li><a class="dropdown-item" href="${pageContext.request.contextPath}/preferences"><i class="bi bi-sliders me-2"></i> Match Preferences</a></li>
                                        <li><a class="dropdown-item" href="${pageContext.request.contextPath}/inquiries"><i class="bi bi-envelope me-2"></i> My Inquiries</a></li>
                                    </c:otherwise>
                                </c:choose>
                                <li><a class="dropdown-item" href="${pageContext.request.contextPath}/views/profile.jsp"><i class="bi bi-person me-2"></i> Profile & Security</a></li>
                                <li><hr class="dropdown-divider"></li>
                                <li><a class="dropdown-item text-danger" href="${pageContext.request.contextPath}/logout"><i class="bi bi-box-arrow-right me-2"></i> Logout</a></li>
                            </ul>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <a href="${pageContext.request.contextPath}/views/login.jsp" class="btn btn-light border px-3 fw-medium">Log In</a>
                        <a href="${pageContext.request.contextPath}/views/register.jsp" class="btn btn-emerald px-3">Register</a>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
    </div>
</nav>

<!-- Alert messages banner -->
<c:if test="${not empty successMessage || not empty sessionScope.successMessage}">
    <div class="alert alert-success alert-dismissible fade show rounded-0 mb-0 py-2 text-center" role="alert">
        <i class="bi bi-check-circle-fill me-2"></i>
        ${not empty successMessage ? successMessage : sessionScope.successMessage}
        <button type="button" class="btn-close py-2" data-bs-dismiss="alert"></button>
    </div>
    <c:remove var="successMessage" scope="session"/>
</c:if>
<c:if test="${not empty errorMessage || not empty sessionScope.errorMessage}">
    <div class="alert alert-danger alert-dismissible fade show rounded-0 mb-0 py-2 text-center" role="alert">
        <i class="bi bi-exclamation-triangle-fill me-2"></i>
        ${not empty errorMessage ? errorMessage : sessionScope.errorMessage}
        <button type="button" class="btn-close py-2" data-bs-dismiss="alert"></button>
    </div>
    <c:remove var="errorMessage" scope="session"/>
</c:if>
