<%-- 
    Document   : inc_theloaigame
    Created on : Mar 17, 2025, 4:46:57 PM
    Author     : as
--%>

<%@page import="dto.advertisingDTO"%>
<%@page import="tools.helper"%>
<%@page import="dto.gameDTO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.List"%>
<%@page import="dao.advertisingDAO"%>
<%@page import="dao.gameDAO"%>
<%
    int id_theloai = Integer.parseInt(request.getParameter("id"));
    gameDAO gdao = new gameDAO();
    advertisingDAO adao = new advertisingDAO();
    List<gameDTO> listGameHot = gdao.getListGameHotByCategoty(id_theloai);
    List<gameDTO> listGameYeuThichNhat = gdao.getListGameYeuThichNhatByCategory(id_theloai);

%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<section class="content-left">
    <section class="game-hot">
        <section class="slider">
            <div id="wowslider-container1">
                <div class="ws_images">
                    <ul>  
                        <%for (int i = 0; i < listGameHot.size(); i++) {%>
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
                        <%for (int i = 0; i < listGameHot.size(); i++) {%>
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
                    for (int i = 0; i < listGameHot.size(); i++) {
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
    <section class="game-cung-theloai">
        <header class="title-game-cung-theloai">
            <section class="tentheloai"><a href="#">Game bắn súng</a></section>
        </header>
        <section class="list-game">
            <article class="box-game">
                <a href="#"><img src="<%= request.getContextPath()%>/template/images/image-game.jpg" alt=""></a>
                <section>
                    <a href="#"><h5>Đua xe địa hình</h5></a>
                    <p>Lượt chơi: 25034</p>
                </section>
            </article>

            <div style="text-align: center;">
                <ul class="pagination">
                    <li><a href="#">« </a></li>
                    <li><a href="#">1</a></li>
                    <li><a href="#" class="active">2</a></li>
                    <li><a href="#">3</a></li>
                    <li><a href="#">4</a></li>
                    <li><a href="#">5</a></li>
                    <li><a href="#"> »</a></li>
                </ul>
            </div>
        </section>
    </section>
</section>
<aside class="content-right">
    <section class="quangcao">
        <%
            for (advertisingDTO item : adao.getListAds(1)) {
        %>
        <a href="<%= item.getAdsURL()%>" target="<%= item.getAdsTarget()%>">
            <img src="<%= request.getContextPath()%>/template/images/quangcao/<%= item.getAdsFile()%>" 
                 alt="<%= item.getAdsTitle()%>"></a>
            <%}%>
    </section>
    <section class="game-choinhieunhat">
        <header class="title-game-choinhieunhat">Game yêu thích nhiều nhất</header>
        <section class="content-game-choinhieunhat">
            <article class="box-game-choinhieunhat">
                <%
                    int count_2 = 0;
                    int size_2 = listGameYeuThichNhat.size();
                    for (gameDTO item : listGameYeuThichNhat) {
                        count_2++;
                        String className = (count_2 % size_2 == 0) ? "box-game-choinhieunhat-last" : "box-game-choinhieunhat";
                %>
                <article class="<%= className%>">
                    <a href="playgame.jsp?idGame=<%= item.getGameID()%>">
                        <img src="<%= request.getContextPath()%>/template/games/img/<%= item.getGameImage()%>" 
                             alt="<%= item.getGameName()%>"></a>
                    <section>
                        <a href="playgame.jsp?idGame=<%= item.getGameID()%>"><h5><%= helper.cutString(item.getGameName(), 20)%></h5></a>
                        <p>Lượt thích: <%= helper.formatNumber(item.getGameLuotChoi())%></p>
                    </section>
                </article>
                <%}%>
        </section>
    </section>
</aside>
