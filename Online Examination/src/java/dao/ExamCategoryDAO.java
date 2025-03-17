/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import dto.ExamCategoryDTO;
import dto.UserDTO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import utils.DBUtils;

/**
 *
 * @author ducmi
 */
public class ExamCategoryDAO implements IDAO<ExamCategoryDTO, String> {
    @Override
    public boolean create(ExamCategoryDTO entity) {
        String sql = "INSERT INTO tblExamCategories (category_name, description) VALUES (?, ?)";
        try (Connection conn = DBUtils.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, entity.getCategory_name());
            ps.setString(2, entity.getDescription());
            int rowsAffected = ps.executeUpdate();
            return rowsAffected > 0;
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(ExamCategoryDAO.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
    }

    @Override
    public List<ExamCategoryDTO> readAll() {
        List<ExamCategoryDTO> list = new ArrayList<>();
        String sql = "SELECT * FROM tblExamCategories";
        try (Connection conn = DBUtils.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                ExamCategoryDTO category = new ExamCategoryDTO(
                        rs.getInt("category_id"),
                        rs.getString("category_name"),
                        rs.getString("description")
                );
                list.add(category);
            }
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(ExamCategoryDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    @Override
    public ExamCategoryDTO readById(String id) {
        String sql = "SELECT * FROM tblExamCategories WHERE category_id = ?";
        try (Connection conn = DBUtils.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, Integer.parseInt(id));
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return new ExamCategoryDTO(
                            rs.getInt("category_id"),
                            rs.getString("category_name"),
                            rs.getString("description")
                    );
                }
            }
        } catch (ClassNotFoundException | SQLException | NumberFormatException ex) {
            Logger.getLogger(ExamCategoryDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    @Override
    public boolean update(ExamCategoryDTO entity) {
        String sql = "UPDATE tblExamCategories SET category_name = ?, description = ? WHERE category_id = ?";
        try (Connection conn = DBUtils.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, entity.getCategory_name());
            ps.setString(2, entity.getDescription());
            ps.setInt(3, entity.getCategory_id());
            int rowsAffected = ps.executeUpdate();
            return rowsAffected > 0;
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(ExamCategoryDAO.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
    }

    @Override
    public boolean delete(String id) {
        String sql = "DELETE FROM tblExamCategories WHERE category_id = ?";
        try (Connection conn = DBUtils.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, Integer.parseInt(id));
            int rowsAffected = ps.executeUpdate();
            return rowsAffected > 0;
        } catch (ClassNotFoundException | SQLException | NumberFormatException ex) {
            Logger.getLogger(ExamCategoryDAO.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
    }

    @Override
    public List<ExamCategoryDTO> search(String searchTerm) {
        List<ExamCategoryDTO> list = new ArrayList<>();
        String sql = "SELECT * FROM tblExamCategories WHERE category_name LIKE ? OR description LIKE ?";
        try (Connection conn = DBUtils.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            String searchPattern = "%" + searchTerm + "%";
            ps.setString(1, searchPattern);
            ps.setString(2, searchPattern);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    ExamCategoryDTO category = new ExamCategoryDTO(
                            rs.getInt("category_id"),
                            rs.getString("category_name"),
                            rs.getString("description")
                    );
                    list.add(category);
                }
            }
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(ExamCategoryDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }
}