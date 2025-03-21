<%-- 
    Document   : footer
    Created on : Mar 15, 2025, 9:04:34 AM
    Author     : as
--%>

<%@page import="dao.CategoryDAO"%>
<%@page import="dto.CategoryDTO"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    CategoryDAO cdao = new CategoryDAO();
%>
<section class="sitemap">

    <%
        int count = 0;
        for (CategoryDTO item : cdao.getListCategory()) {
            count ++;
            String className = (count % 5 == 0) ? "box-sitemap-last" : "box-sitemap";
    %>
    <div class="<%= className%>"><a href="theloaigame.jsp?id=<%= item.getCategoryID()%>"><%= item.getCategoryName()%></a></div>
    <%   
        }    
    %>
    
    <div class="box-sitemap"><a href="#">Game Đua xe</a></div>
    <div class="box-sitemap"><a href="#">Game Thể thao</a></div>
    <div class="box-sitemap"><a href="#">Game Thể thao</a></div>
    <div class="box-sitemap-last"><a href="#">Game Bạn gái</a></div>
    <div class="box-sitemap"><a href="#">Game Phiêu lưu</a></div>
    <div class="box-sitemap"><a href="#">Game Nhập vai</a></div>
    <div class="box-sitemap"><a href="#">Game Hành động</a></div>
    <div class="box-sitemap"><a href="#">Game Thể thao</a></div>
    <div class="box-sitemap-last"><a href="#">Game Văn phòng</a></div>
</section>

<footer class="footer">
    <a href="#"><img src="<%= request.getContextPath()%>/template/images/facebook.png" /></a>
    <a href="#"><img src="<%= request.getContextPath()%>/template/images/gmail.png" /></a>
    <a href="#"><img src="<%= request.getContextPath()%>/template/images/contact.png" /></a>
    <a href="#"><img src="<%= request.getContextPath()%>/template/images/map.png" /></a>
    <div>
        <p>Chơi game lành mạnh, vui vẻ, sắp xếp thời gian hợp lý, tận hưởng cuộc sống lành mạnh, học tập tốt và lao động
            tốt.
            </br>
            Chịu trách nhiệm nội dung: Nhật Tường - Minh Huy. ©2018 học viên Công Nghê Bưu Chính Viễn Thông, Địa chỉ: Man Thiện, Q9,
            tp.HCM . Điện thoại: 024 2242 6188.</p>
    </div>

</footer>