<%-- 
    Document   : header
    Created on : Mar 15, 2025, 9:04:21 AM
    Author     : as
--%>
<%@page import="dto.CategoryDTO"%>
<%@page import="dao.CategoryDAO"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<!-- Start Header -->
<header class="header-top">
    <section class="container">
        <section class="logo">
            <img src="<%= request.getContextPath()%>/template/images/logo.gif" alt="Logo">
        </section>
        <form action="#" class="searchform cf" method="post">
            <input type="text" placeholder="Bạn muốn chơi game gì?">
            <button type="submit" name="search">Search</button>
        </form>
        <button type="submit" id="button-login"><a href="login.html">Đăng nhập</a></button>
        <button type="submit" id="button-register"><a href="register.html">Đăng ký</a></button>
    </section>
</header>
<!-- End Header -->


<!-- Start Menu -->
<%
    CategoryDAO cdao = new CategoryDAO();
%>
<nav class="menu">
    <section class="container">
        <ul>
            <li><a href="index.html">Trang chủ</a></li>
                <%
                    for (CategoryDTO item : cdao.getListCategory()) {
                        if (item.isVisiableMenu()) {
                %>
            <li><a href="theloaigame.jsp?id=<%= item.getCategoryID()%>"><%= item.getCategoryName()%></a></li>
                <%        }
                    }
                %>
             <li><a href="#">Thể loại khác</a></li>



        </ul>
    </section>
</nav>

<!-- End Menu -->
