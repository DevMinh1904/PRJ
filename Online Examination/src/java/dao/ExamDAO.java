/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import dto.ExamDTO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import utils.DBUtils;

/**
 *
 * @author ducmi
 */
public class ExamDAO implements IDAO<ExamDTO, String> {
    
    @Override
    public boolean create(ExamDTO entity) {
        String sql = "INSERT INTO tblExams (exam_title, subject, category_id, total_marks, duration) VALUES (?, ?, ?, ?, ?)";
        try (Connection conn = DBUtils.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, entity.getExam_title());
            ps.setString(2, entity.getSubject());
            ps.setInt(3, entity.getCategory_id());
            ps.setInt(4, entity.getTotal_marks());
            ps.setInt(5, entity.getDuration());
            int rowsAffected = ps.executeUpdate();
            return rowsAffected > 0;
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(ExamDAO.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
    }

    @Override
    public List<ExamDTO> readAll() {
        List<ExamDTO> list = new ArrayList<>();
        String sql = "SELECT * FROM tblExams";
        try (Connection conn = DBUtils.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                ExamDTO exam = new ExamDTO(
                        rs.getInt("exam_id"),
                        rs.getString("exam_title"),
                        rs.getString("subject"),
                        rs.getInt("category_id"),
                        rs.getInt("total_marks"),
                        rs.getInt("duration")
                );
                list.add(exam);
            }
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(ExamDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    @Override
    public ExamDTO readById(String id) {
        String sql = "SELECT * FROM tblExams WHERE exam_id = ?";
        try (Connection conn = DBUtils.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, Integer.parseInt(id));
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return new ExamDTO(
                            rs.getInt("exam_id"),
                            rs.getString("exam_title"),
                            rs.getString("subject"),
                            rs.getInt("category_id"),
                            rs.getInt("total_marks"),
                            rs.getInt("duration")
                    );
                }
            }
        } catch (ClassNotFoundException | SQLException | NumberFormatException ex) {
            Logger.getLogger(ExamDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    @Override
    public boolean update(ExamDTO entity) {
        String sql = "UPDATE tblExams SET exam_title = ?, subject = ?, category_id = ?, total_marks = ?, duration = ? WHERE exam_id = ?";
        try (Connection conn = DBUtils.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, entity.getExam_title());
            ps.setString(2, entity.getSubject());
            ps.setInt(3, entity.getCategory_id());
            ps.setInt(4, entity.getTotal_marks());
            ps.setInt(5, entity.getDuration());
            ps.setInt(6, entity.getExam_id());
            int rowsAffected = ps.executeUpdate();
            return rowsAffected > 0;
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(ExamDAO.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
    }

    @Override
    public boolean delete(String id) {
        String sql = "DELETE FROM tblExams WHERE exam_id = ?";
        try (Connection conn = DBUtils.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, Integer.parseInt(id));
            int rowsAffected = ps.executeUpdate();
            return rowsAffected > 0;
        } catch (ClassNotFoundException | SQLException | NumberFormatException ex) {
            Logger.getLogger(ExamDAO.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
    }

    @Override
    public List<ExamDTO> search(String searchTerm) {
        List<ExamDTO> list = new ArrayList<>();
        String sql = "SELECT * FROM tblExams WHERE exam_title LIKE ? OR subject LIKE ?";
        try (Connection conn = DBUtils.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            String searchPattern = "%" + searchTerm + "%";
            ps.setString(1, searchPattern);
            ps.setString(2, searchPattern);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    ExamDTO exam = new ExamDTO(
                            rs.getInt("exam_id"),
                            rs.getString("exam_title"),
                            rs.getString("subject"),
                            rs.getInt("category_id"),
                            rs.getInt("total_marks"),
                            rs.getInt("duration")
                    );
                    list.add(exam);
                }
            }
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(ExamDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }
    
    /**
     * Get all exams by category ID
     * @param categoryId The ID of the category
     * @return List of exams for the category
     */
    public List<ExamDTO> getExamsByCategory(String categoryId) {
        List<ExamDTO> list = new ArrayList<>();
        String sql = "SELECT * FROM tblExams WHERE category_id = ?";
        try (Connection conn = DBUtils.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, Integer.parseInt(categoryId));
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    ExamDTO exam = new ExamDTO(
                            rs.getInt("exam_id"),
                            rs.getString("exam_title"),
                            rs.getString("subject"),
                            rs.getInt("category_id"),
                            rs.getInt("total_marks"),
                            rs.getInt("duration")
                    );
                    list.add(exam);
                }
            }
        } catch (ClassNotFoundException | SQLException | NumberFormatException ex) {
            Logger.getLogger(ExamDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }
    
    /**
     * Get the ID of the last inserted exam
     * @return The last inserted exam ID or -1 if error
     */
    public int getLastInsertedId() {
        String sql = "SELECT MAX(exam_id) as last_id FROM tblExams";
        try (Connection conn = DBUtils.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {
            if (rs.next()) {
                return rs.getInt("last_id");
            }
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(ExamDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return -1;
    }
}