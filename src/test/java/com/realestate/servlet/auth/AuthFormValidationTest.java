package com.realestate.servlet.auth;

import com.realestate.util.CsrfTokenUtil;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.lang.reflect.Proxy;
import java.util.HashMap;
import java.util.Map;
import org.junit.Test;
import static org.junit.Assert.*;

public class AuthFormValidationTest {
    private final Map<String, Object> attributes = new HashMap<>();
    private final Map<String, Object> sessionValues = new HashMap<>();
    private final Map<String, String> parameters = new HashMap<>();
    private String forwardedTo;

    @SuppressWarnings("unchecked")
    private <T> T proxy(Class<T> type, java.lang.reflect.InvocationHandler handler) {
        return (T) Proxy.newProxyInstance(type.getClassLoader(), new Class<?>[]{type}, handler);
    }

    private HttpServletRequest request() {
        HttpSession session = proxy(HttpSession.class, (p, m, a) -> {
            if (m.getName().equals("getAttribute")) return sessionValues.get(a[0]);
            if (m.getName().equals("setAttribute")) sessionValues.put((String) a[0], a[1]);
            return null;
        });
        CsrfTokenUtil.generateToken(session);
        parameters.put("csrf_token", (String) sessionValues.get("csrf_token"));
        return proxy(HttpServletRequest.class, (p, m, a) -> {
            switch (m.getName()) {
                case "getSession": return session;
                case "getParameter": return parameters.get(a[0]);
                case "setAttribute": attributes.put((String) a[0], a[1]); return null;
                case "getRequestDispatcher":
                    String path = (String) a[0];
                    return proxy(RequestDispatcher.class, (d, method, args) -> {
                        if (method.getName().equals("forward")) forwardedTo = path;
                        return null;
                    });
                default: return null;
            }
        });
    }

    @Test public void emptyLoginIsRejectedBeforeAuthentication() throws Exception {
        parameters.put("email", ""); parameters.put("password", "");
        new LoginServlet().doPost(request(), proxy(HttpServletResponse.class, (p,m,a) -> null));
        assertEquals("/views/login.jsp", forwardedTo);
        assertEquals("Enter a valid email address and your password.", attributes.get("errorMessage"));
    }

    @Test public void missingPasswordIsRejected() throws Exception {
        parameters.put("email", "test@example.invalid");
        new LoginServlet().doPost(request(), proxy(HttpServletResponse.class, (p,m,a) -> null));
        assertEquals("/views/login.jsp", forwardedTo);
        assertNotNull(attributes.get("errorMessage"));
    }

    @Test public void malformedRecoveryEmailIsRejectedBeforeLookup() throws Exception {
        parameters.put("email", "not-an-email");
        new ForgotPasswordServlet().doPost(request(), proxy(HttpServletResponse.class, (p,m,a) -> null));
        assertEquals("/views/forgot-password.jsp", forwardedTo);
        assertEquals("Please provide a valid email address.", attributes.get("errorMessage"));
    }
}
