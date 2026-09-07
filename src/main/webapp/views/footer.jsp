<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<footer class="bg-white border-top mt-auto py-5 text-secondary">
    <div class="container">
        <div class="row g-4">
            <div class="col-lg-4 col-md-6">
                <div class="d-flex align-items-center gap-2 mb-3">
                    <span class="d-inline-flex align-items-center justify-content-center bg-primary-emerald text-white rounded-3 p-2" style="width: 34px; height: 34px;">
                        <i class="bi bi-buildings"></i>
                    </span>
                    <span class="fw-bold text-dark fs-5">Estate<span class="text-emerald">Hub</span></span>
                </div>
                <p class="small text-muted mb-3" style="max-width: 320px;">
                    Find a place you'll love to call home. A verified marketplace for premium real estate with intelligent recommendation matching and direct seller communication.
                </p>
                <div class="d-flex gap-2">
                    <span class="badge bg-light text-secondary border"><i class="bi bi-shield-check text-emerald me-1"></i> 100% Verified Listings</span>
                    <span class="badge bg-light text-secondary border"><i class="bi bi-whatsapp text-success me-1"></i> WhatsApp Ready</span>
                </div>
            </div>

            <div class="col-lg-2 col-md-6">
                <h6 class="text-dark fw-bold mb-3">Marketplace</h6>
                <ul class="list-unstyled small d-flex flex-column gap-2 mb-0">
                    <li><a href="${pageContext.request.contextPath}/search?purpose=SALE" class="text-secondary text-decoration-none hover-emerald">Properties for Sale</a></li>
                    <li><a href="${pageContext.request.contextPath}/search?purpose=RENT" class="text-secondary text-decoration-none hover-emerald">Properties for Rent</a></li>
                    <li><a href="${pageContext.request.contextPath}/search?categoryId=2" class="text-secondary text-decoration-none hover-emerald">Luxury Villas</a></li>
                    <li><a href="${pageContext.request.contextPath}/search?categoryId=1" class="text-secondary text-decoration-none hover-emerald">Skyline Apartments</a></li>
                    <li><a href="${pageContext.request.contextPath}/search?categoryId=4" class="text-secondary text-decoration-none hover-emerald">Commercial Suites</a></li>
                </ul>
            </div>

            <div class="col-lg-3 col-md-6">
                <h6 class="text-dark fw-bold mb-3">User Portals</h6>
                <ul class="list-unstyled small d-flex flex-column gap-2 mb-0">
                    <li><a href="${pageContext.request.contextPath}/views/login.jsp" class="text-secondary text-decoration-none">Customer Sign In</a></li>
                    <li><a href="${pageContext.request.contextPath}/views/register.jsp?role=SELLER" class="text-secondary text-decoration-none">List as a Property Seller</a></li>
                    <li><a href="${pageContext.request.contextPath}/views/register.jsp?role=BROKER" class="text-secondary text-decoration-none">Join as Licensed Broker</a></li>
                    <li><a href="${pageContext.request.contextPath}/views/login.jsp?demo=admin" class="text-secondary text-decoration-none">Admin Control Center</a></li>
                </ul>
            </div>

            <div class="col-lg-3 col-md-6">
                <h6 class="text-dark fw-bold mb-3">Academic Architecture</h6>
                <p class="small text-muted mb-2">
                    Built with <strong>Java 17</strong>, <strong>JSP</strong>, <strong>Servlets</strong>, <strong>JDBC</strong>, <strong>MySQL 8</strong> & <strong>Apache Tomcat 10</strong>.
                </p>
                <div class="p-2 bg-light border rounded-3 small text-muted">
                    <i class="bi bi-code-slash text-emerald me-1"></i> Pure MVC Architecture: Model &rarr; DAO &rarr; Service &rarr; Servlet &rarr; JSP
                </div>
            </div>
        </div>

        <hr class="my-4 text-muted opacity-25">

        <div class="d-flex flex-column flex-sm-row justify-content-between align-items-center small text-muted">
            <div>&copy; 2026 EstateHub Inc. All rights reserved.</div>
            <div class="d-flex gap-3 mt-2 mt-sm-0">
                <span>Privacy Policy</span>
                <span>Terms of Service</span>
                <span>Compliance & Verification Guidelines</span>
            </div>
        </div>
    </div>
</footer>

<!-- Bootstrap 5 Bundle JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script>
    document.addEventListener("DOMContentLoaded", function() {
        const themeToggleBtn = document.getElementById('themeToggleBtn');
        const themeIcon = document.getElementById('themeIcon');
        
        function updateIcon() {
            if (document.documentElement.getAttribute('data-bs-theme') === 'dark') {
                themeIcon.classList.remove('bi-moon-stars-fill', 'text-dark');
                themeIcon.classList.add('bi-brightness-high-fill', 'text-warning');
            } else {
                themeIcon.classList.remove('bi-brightness-high-fill', 'text-warning');
                themeIcon.classList.add('bi-moon-stars-fill', 'text-dark');
            }
        }

        // Set initial icon
        if (themeToggleBtn) {
            updateIcon();
            
            themeToggleBtn.addEventListener('click', () => {
                const currentTheme = document.documentElement.getAttribute('data-bs-theme');
                const newTheme = currentTheme === 'dark' ? 'light' : 'dark';
                
                document.documentElement.setAttribute('data-bs-theme', newTheme);
                localStorage.setItem('theme', newTheme);
                updateIcon();
            });
        }
    });
</script>
</body>
</html>
