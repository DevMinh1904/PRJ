<%@page import="utils.AuthUtils"%>
<%@page import="dto.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<header class="header">
    <link rel="stylesheet" href="assets/css/header.css"/>
    <div class="container">
        <nav class="nav">
            <a href="#" class="logo">SHOP ONLINE</a>
            <ul class="menu">
                <li class="menu-item"><a href="index.jsp">Trang chủ</a></li>
                <li class="menu-item"><a href="#">Sản phẩm</a></li>
                <li class="menu-item"><a href="#">Giỏ hàng</a></li>
                <li class="menu-item"><a href="#">Liên hệ</a></li>
            </ul>
            <div class="right-section">
                <div class="search-bar">
                    <input type="text" class="search-input" placeholder="Tìm kiếm...">
                    <button class="search-button">🔍</button>
                </div>
                <c:if test="${not empty sessionScope.user}">
                <div class="user-section">
                    <span class="welcome-text">Xin chào, <span class="user-name">${user.fullName}</span>!</span>
                    <form action="MainController" method="post" style="margin: 0;">
                        <input type="hidden" name="action" value="logout"/>
                        <input type="submit" value="Đăng xuất" class="logout-btn"/>
                    </form>
                </div>
                </c:if>
            </div>
        </nav>
    </div>
</header>