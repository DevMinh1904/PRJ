/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import dto.gameDTO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import utils.DBUtils;

/**
 *
 * @author ducmi
 */
public class gameDAO {

    private List<Integer> listGameHot = new ArrayList<>();
    private List<Integer> listGameChoiNhieuNhat = new ArrayList<>();
    private List<Integer> listGameYeuThichNhat = new ArrayList<>();
    private List<Integer> listGameHotByCategory = new ArrayList<>();

    private String arrayID(List<Integer> array) {
        String str = "";
        if (array.size() != 0) {
            for (Integer integer : array) {
                str += integer.toString() + ",";
            }
            str = str.substring(0, str.length() - 1);
        }
        return str;
    }

    public List<gameDTO> getListGameHot() throws SQLException, ClassNotFoundException {
        Connection connection = DBUtils.getConnection();
        String query = "SELECT TOP 11 * FROM game WHERE hot = 1 AND kiemduyet = 1 ORDER BY luotchoi DESC";

        PreparedStatement ps = connection.prepareStatement(query);
        ResultSet result = ps.executeQuery();
        List<gameDTO> list = new ArrayList<>();

        while (result.next()) {
            gameDTO game = new gameDTO();
            game.setGameID(result.getInt("id_game"));
            game.setGameName(result.getString("tengame"));
            game.setGameImage(result.getString("hinhgame"));
            game.setGameFile(result.getString("taptingame"));
            game.setGameContent(result.getString("noidunggame"));
            game.setGameLuotChoi(result.getLong("luotchoi"));
            game.setGameLuotYeuThich(result.getLong("luotyeuthich"));
            game.setGameHot(result.getByte("hot") != 0);
            list.add(game);
            listGameHot.add(game.getGameID());
        }

        DBUtils.closeConnection(connection);
        return list;
    }

    public List<gameDTO> getListGameChoiNhieuNhat() throws SQLException, ClassNotFoundException {
        Connection connection = DBUtils.getConnection();
        String query = "SELECT TOP 5 * FROM game "
                + "WHERE kiemduyet = 1"
                + "AND id_game NOT IN (" + arrayID(listGameHot) + ")"
                + "ORDER BY luotchoi DESC";  // Lấy 8 game có lượt chơi cao nhất trong số còn lại  

        PreparedStatement ps = connection.prepareStatement(query);
        ResultSet result = ps.executeQuery();
        List<gameDTO> list = new ArrayList<>();

        while (result.next()) {
            gameDTO game = new gameDTO();
            game.setGameID(result.getInt("id_game"));
            game.setGameName(result.getString("tengame"));
            game.setGameImage(result.getString("hinhgame"));
            game.setGameFile(result.getString("taptingame"));
            game.setGameContent(result.getString("noidunggame"));
            game.setGameLuotChoi(result.getLong("luotchoi"));
            game.setGameLuotYeuThich(result.getLong("luotyeuthich"));
            game.setGameHot(result.getByte("hot") != 0);
            list.add(game);
            listGameChoiNhieuNhat.add(game.getGameID());
        }

        DBUtils.closeConnection(connection);
        return list;
    }

    public List<gameDTO> getListGameYeuThichNhat() throws SQLException, ClassNotFoundException {
        Connection connection = DBUtils.getConnection();
        String arrayID = arrayID(listGameHot) + "," + arrayID(listGameChoiNhieuNhat);
        System.out.println(arrayID);
        String query = "SELECT TOP 3 * FROM game "
                + "WHERE kiemduyet = 1 and id_game NOT IN ("
                + "    SELECT TOP 20 id_game FROM game WHERE hot = 1 AND kiemduyet = 1 ORDER BY luotchoi DESC"
                + ") "
                + "AND id_game NOT IN (" + arrayID + ") "
                + "ORDER BY luotyeuthich DESC";

        PreparedStatement ps = connection.prepareStatement(query);
        ResultSet result = ps.executeQuery();
        List<gameDTO> list = new ArrayList<>();

        while (result.next()) {
            gameDTO game = new gameDTO();
            game.setGameID(result.getInt("id_game"));
            game.setGameName(result.getString("tengame"));
            game.setGameImage(result.getString("hinhgame"));
            game.setGameFile(result.getString("taptingame"));
            game.setGameContent(result.getString("noidunggame"));
            game.setGameLuotChoi(result.getLong("luotchoi"));
            game.setGameLuotYeuThich(result.getLong("luotyeuthich"));
            game.setGameHot(result.getByte("hot") != 0);
            list.add(game);
            listGameYeuThichNhat.add(game.getGameID());
        }

        DBUtils.closeConnection(connection);
        return list;
    }

    public ArrayList<gameDTO> getListGameDetail(int id_theloai) throws SQLException, ClassNotFoundException {
        Connection connection = DBUtils.getConnection();
        String arrayID = arrayID(listGameHot) + "," + arrayID(listGameChoiNhieuNhat) + "," + arrayID(listGameYeuThichNhat);

        String query = "SELECT TOP 8 * FROM game "
                + "WHERE kiemduyet = 1 AND id_game NOT IN (" + arrayID + ") "
                + "AND id_theloai = ? "
                + "ORDER BY luotchoi DESC";

        PreparedStatement ps = connection.prepareStatement(query);
        ps.setInt(1, id_theloai);
        ResultSet result = ps.executeQuery();

        ArrayList<gameDTO> list = new ArrayList<>();
        while (result.next()) {
            gameDTO game = new gameDTO();
            game.setGameID(result.getInt("id_game"));
            game.setGameName(result.getString("tengame"));
            game.setGameImage(result.getString("hinhgame"));
            game.setGameFile(result.getString("taptingame"));
            game.setGameContent(result.getString("noidunggame"));
            game.setGameLuotChoi(result.getLong("luotchoi"));
            game.setGameLuotYeuThich(result.getLong("luotyeuthich"));
            game.setGameHot(result.getByte("hot") != 0);
            list.add(game);
        }

        DBUtils.closeConnection(connection);
        return list;
    }

    public List<gameDTO> getListGameHotByCategoty(int id_theloai) throws SQLException, ClassNotFoundException {
        Connection connection = DBUtils.getConnection();
        String query = "SELECT TOP 5 * FROM game "
                + "WHERE hot = 1 AND kiemduyet = 1 AND id_theloai = ? "
                + "ORDER BY luotchoi DESC";

        PreparedStatement ps = connection.prepareStatement(query);
        ps.setInt(1, id_theloai);
        ResultSet result = ps.executeQuery();
        List<gameDTO> list = new ArrayList<>();
        while (result.next()) {
            gameDTO game = new gameDTO();
            game.setGameID(result.getInt("id_game"));
            game.setGameName(result.getString("tengame"));
            game.setGameImage(result.getString("hinhgame"));
            game.setGameFile(result.getString("taptingame"));
            game.setGameContent(result.getString("noidunggame"));
            game.setGameLuotChoi(result.getLong("luotchoi"));
            game.setGameLuotYeuThich(result.getLong("luotyeuthich"));
            game.setGameHot(result.getByte("hot") != 0);
            list.add(game);
            listGameHotByCategory.add(game.getGameID());

        }

        DBUtils.closeConnection(connection);
        return list;
    }

    public List<gameDTO> getListGameYeuThichNhatByCategory(int id_theloai) throws SQLException, ClassNotFoundException {
        Connection connection = DBUtils.getConnection();
        String query = "SELECT TOP 3 * FROM game "
                + "WHERE kiemduyet = 1 and id_game NOT IN ("
                + "    SELECT TOP 20 id_game FROM game WHERE hot = 1 AND kiemduyet = 1 ORDER BY luotchoi DESC"
                + ") "
                + "AND id_game NOT IN (" + arrayID(listGameHotByCategory) + ") AND id_theloai = ? "
                + "ORDER BY luotyeuthich DESC";

        PreparedStatement ps = connection.prepareStatement(query);
        ps.setInt(1, id_theloai);
        ResultSet result = ps.executeQuery();
        List<gameDTO> list = new ArrayList<>();

        while (result.next()) {
            gameDTO game = new gameDTO();
            game.setGameID(result.getInt("id_game"));
            game.setGameName(result.getString("tengame"));
            game.setGameImage(result.getString("hinhgame"));
            game.setGameFile(result.getString("taptingame"));
            game.setGameContent(result.getString("noidunggame"));
            game.setGameLuotChoi(result.getLong("luotchoi"));
            game.setGameLuotYeuThich(result.getLong("luotyeuthich"));
            game.setGameHot(result.getByte("hot") != 0);
            list.add(game);
            listGameYeuThichNhat.add(game.getGameID());
        }

        DBUtils.closeConnection(connection);
        return list;
    }

    public static void main(String[] args) throws SQLException, ClassNotFoundException {
        gameDAO ga = new gameDAO();

//        System.out.println("===== Danh sách game hot =====");
//        for (gameDTO g : ga.getListGameHot()) {
//            System.out.println(g.getGameID() + "__" + g.getGameName() + "__" + g.getGameLuotChoi());
//        }
//
//        System.out.println("\n===== Danh sách game có lượt chơi cao nhất (không trùng game hot) =====");
//        for (gameDTO g : ga.getListGameChoiNhieuNhat()) {
//            System.out.println(g.getGameID() + "__" + g.getGameName() + "__" + g.getGameLuotChoi());
//        }
//
//        System.out.println("\n===== Danh sách game được yêu thích nhất (không trùng game hot và lượt chơi cao nhất) =====");
//        for (gameDTO g : ga.getListGameYeuThichNhat()) {
//            System.out.println(g.getGameID() + "__" + g.getGameName() + "__" + g.getGameLuotYeuThich());
        for (gameDTO g : ga.getListGameHotByCategoty(1)) {
            System.out.println(g.getGameID() + "__" + g.getGameName() + "__" + g.getGameLuotChoi());
        }
        System.out.println("\n===== ");
        for (gameDTO g : ga.getListGameYeuThichNhatByCategory(1)) {
            System.out.println(g.getGameID() + "__" + g.getGameName() + "__" + g.getGameLuotChoi());
        }

    }
}


