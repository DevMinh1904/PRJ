/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import dto.CategoryDTO;
import java.sql.SQLException;

/**
 *
 * @author ducmi
 */
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import utils.DBUtils;

public class CategoryDAO {

    public List<CategoryDTO> getListCategory() throws SQLException {
        String sql = "SELECT * FROM [theloaigame] WHERE [visiable] = 1 ORDER BY [ordering] ASC;";
        List<CategoryDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            conn = DBUtils.getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();

            while (rs.next()) {
                int id = rs.getInt("id_theloai");
                String name = rs.getString("tentheloai");
                boolean visiableMenu = rs.getByte("visiable_menu") != 0;

                CategoryDTO c = new CategoryDTO(id, name, visiableMenu);
                list.add(c);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ps != null) {
                ps.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return list;
    }

    public ArrayList<CategoryDTO> getListCategoryByAmount(int amount) throws SQLException, ClassNotFoundException {
        Connection connection = DBUtils.getConnection();

        String query = "SELECT TOP " + amount + " * FROM theloaigame WHERE visiable = 1 ORDER BY ordering ASC";
        PreparedStatement ps = connection.prepareStatement(query);
        // Xóa dòng `ps.setInt(1, amount);` vì không có `?` trong query

        ResultSet result = ps.executeQuery();

        ArrayList<CategoryDTO> list = new ArrayList<>();
        while (result.next()) {
            CategoryDTO category = new CategoryDTO();
            category.setCategoryID(result.getInt("id_theloai"));
            category.setCategoryName(result.getString("tentheloai"));
            boolean visiableMenu = result.getByte("visiable_menu") != 0;
            category.setVisiableMenu(visiableMenu);
            list.add(category);
        }

        DBUtils.closeConnection(connection);
        return list;
    }

    public static void main(String[] args) throws SQLException {
        CategoryDAO ca = new CategoryDAO();
        for (CategoryDTO c : ca.getListCategory()) {
            System.out.println(c.getCategoryID() + " " + c.getCategoryName());
        }
    }

}
