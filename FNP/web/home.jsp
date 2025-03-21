<%-- 
    Document   : home
    Created on : Mar 15, 2025, 9:04:43 AM
    Author     : as
--%>
<%@page import="dto.CategoryDTO"%>
<%@page import="dao.CategoryDAO"%>
<%@page import="dao.advertisingDAO"%>
<%@page import="dto.advertisingDTO"%>
<%@page import="tools.helper"%>
<%@page import="dto.gameDTO"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@page import="dao.gameDAO"%>

<%
    gameDAO gdao = new gameDAO();
    advertisingDAO adao = new advertisingDAO();
    CategoryDAO cdao = new CategoryDAO();
    List<gameDTO> listGameHot = gdao.getListGameHot();
    List<gameDTO> listGameChoiNhieuNhat = gdao.getListGameChoiNhieuNhat();
    List<gameDTO> listGameYeuThichNhat = gdao.getListGameYeuThichNhat();

%>


<section class="content-left">
    <section class="game-hot">
        <section class="slider">
            <div id="wowslider-container1">
                <div class="ws_images">
                    <ul>
                        <%for (int i = 0; i < 5; i++) {%>
                            <li><a href="playgame.jsp?idGame=<%= listGameHot.get(i).getGameID()%>" target="_self">
                                    <img src="<%= request.getContextPath()%>/template/games/img/<%= listGameHot.get(i).getGameImage()%>" 
                                         alt="<%= listGameHot.get(i).getGameName()%>" title="<%= listGameHot.get(i).getGameName()%>"/>
                                </a>
                            </li>
                        <%}%>
                    </ul>
                </div>
                <div class="ws_bullets">
                    <div>
                        <%for (int i = 0; i < 5; i++) {%>
                        <a href="playgame.jsp?idGame=<%= listGameHot.get(i).getGameID()%>" title="<%= listGameHot.get(i).getGameName()%>"><%=(i + 1)%></a>
                        <%}%>
                    </div>
                </div>
            </div>
        </section>
        <aside class="sidebar">
            <header class="title-gamehot">Game hay</header>
            <section class="content-gamehot">
                <%
                    int count_1 = 0;
                    for (int i = 5; i < 11; i++) {
                        count_1++;
                        String className = (count_1 % 3 == 0) ? "box-gamehot-last" : "box-gamehot";
                %>
                <article class="<%= className%>">
                    <a href="playgame.jsp?idGame=<%= listGameHot.get(i).getGameID()%>">
                        <img src="<%= request.getContextPath()%>/template/games/img/<%= listGameHot.get(i).getGameImage()%>" 
                             alt="<%= listGameHot.get(i).getGameName()%>"></a>
                    <h3><a href="playgame.jsp?idGame=<%= listGameHot.get(i).getGameID()%>"><%= helper.cutString(listGameHot.get(i).getGameName(), 18)%></a></h3>
                </article>
                <%}%>    
            </section>
        </aside>
    </section>
                <%
                    for (CategoryDTO itemMaster : cdao.getListCategoryByAmount(5)) {
                %>
                    <section class="theloai-game">
                        <header><a href="theloaigame.jsp?id=<%= itemMaster.getCategoryID()%>"><%= itemMaster.getCategoryName() %></a></header>
                        <p class="xthem">
                            <a href="theloaigame.jsp?id=<%= itemMaster.getCategoryID()%>">
                                <input name="xemthem" type="button" value="Xem Thêm &gt;&gt;">
                            </a></p>
                            <%
                                for (gameDTO item : gdao.getListGameDetail(itemMaster.getCategoryID())) {
                            %>
                        <article class="game-theloai-game">
                            <a href="playgame.jsp?id=<%= item.getGameID() %>">
                                <img src="<%= request.getContextPath()%>/template/games/img/<%= item.getGameImage() %>" 
                                     alt="<%= item.getGameName() %>"></a>
                            <h3><a href="playgame.jsp?id=<%= item.getGameID() %>">
                                    <%= helper.cutString(item.getGameName(), 20)%> </a></h3>
                        </article>
                            <%}%>
                        <div class="overflow"></div>
                    </section>
                <%}%>
</section>

<aside class="content-right">
    <section class="quangcao">
        <%
            for (advertisingDTO item : adao.getListAds(2)) {      
        %>
        <a href="<%= item.getAdsURL() %>" target="<%= item.getAdsTarget()%>">
            <img src="<%= request.getContextPath()%>/template/images/quangcao/<%= item.getAdsFile()%>" 
                 alt="<%= item.getAdsTitle()%>"></a>
        <%}%>
    </section>
    <section class="game-choinhieunhat">
        <header class="title-game-choinhieunhat">Game chơi nhiều nhất</header>
        <section class="content-game-choinhieunhat">
            <%
                int count_2 = 0;
                int size_2 = listGameChoiNhieuNhat.size();
                for (gameDTO item : listGameChoiNhieuNhat) {
                    count_2++;
                    String className = (count_2 % size_2 == 0) ? "box-game-choinhieunhat-last" : "box-game-choinhieunhat";
            %>
            <article class="<%= className%>">
                <a href="playgame.jsp?idGame=<%= item.getGameID()%>">
                    <img src="<%= request.getContextPath()%>/template/games/img/<%= item.getGameImage()%>" 
                         alt="<%= item.getGameName()%>"></a>
                <section>
                    <a href="playgame.jsp?idGame=<%= item.getGameID()%>"><h5><%= helper.cutString(item.getGameName(), 20)%></h5></a>
                    <p>Lượt chơi: <%= helper.formatNumber(item.getGameLuotChoi())%></p>
                </section>
            </article>
            <%}%>
        </section>
    </section>
    <section class="game-choinhieunhat">
        <header class="title-game-choinhieunhat">Game yêu thích nhiều nhất</header>
        <section class="content-game-choinhieunhat">
            <%
                int count_3 = 0;
                int size_3 = listGameYeuThichNhat.size();
                for (gameDTO item : listGameYeuThichNhat) {
                    count_3++;
                    String className = (count_3 % size_3 == 0) ? "box-game-choinhieunhat-last" : "box-game-choinhieunhat";
            %>
            <article class="<%= className%>">
                <a href="playgame.jsp?idGame=<%= item.getGameID()%>">
                    <img src="<%= request.getContextPath()%>/template/games/img/<%=  item.getGameImage()%>" 
                         alt="<%= item.getGameName()%>"></a>
                <section>
                    <a href="playgame.jsp?idGame=<%= item.getGameID()%>"><h5><%= helper.cutString(item.getGameName(), 20)%></h5></a>
                    <p>Lượt yêu thích: <%= helper.formatNumber(item.getGameLuotYeuThich())%></p>
                </section>
            </article>
            <%}%>
        </section>
    </section>
</aside>

