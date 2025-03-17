/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;
import dto.QuestionDTO;
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
public class QuestionDAO implements IDAO<QuestionDTO, String> {
    @Override
    public boolean create(QuestionDTO entity) {
        String sql = "INSERT INTO tblQuestions (exam_id, question_text, option_a, option_b, option_c, option_d, correct_option) VALUES (?, ?, ?, ?, ?, ?, ?)";
        try (Connection conn = DBUtils.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, entity.getExam_id());
            ps.setString(2, entity.getQuestion_text());
            ps.setString(3, entity.getOption_a());
            ps.setString(4, entity.getOption_b());
            ps.setString(5, entity.getOption_c());
            ps.setString(6, entity.getOption_d());
            ps.setString(7, String.valueOf(entity.getCorrect_option()));
            int rowsAffected = ps.executeUpdate();
            return rowsAffected > 0;
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(QuestionDAO.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
    }

    @Override
    public List<QuestionDTO> readAll() {
        List<QuestionDTO> list = new ArrayList<>();
        String sql = "SELECT * FROM tblQuestions";
        try (Connection conn = DBUtils.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                QuestionDTO question = new QuestionDTO(
                        rs.getInt("question_id"),
                        rs.getInt("exam_id"),
                        rs.getString("question_text"),
                        rs.getString("option_a"),
                        rs.getString("option_b"),
                        rs.getString("option_c"),
                        rs.getString("option_d"),
                        rs.getString("correct_option").charAt(0)
                );
                list.add(question);
            }
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(QuestionDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    @Override
    public QuestionDTO readById(String id) {
        String sql = "SELECT * FROM tblQuestions WHERE question_id = ?";
        try (Connection conn = DBUtils.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, Integer.parseInt(id));
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return new QuestionDTO(
                            rs.getInt("question_id"),
                            rs.getInt("exam_id"),
                            rs.getString("question_text"),
                            rs.getString("option_a"),
                            rs.getString("option_b"),
                            rs.getString("option_c"),
                            rs.getString("option_d"),
                            rs.getString("correct_option").charAt(0)
                    );
                }
            }
        } catch (ClassNotFoundException | SQLException | NumberFormatException ex) {
            Logger.getLogger(QuestionDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    @Override
    public boolean update(QuestionDTO entity) {
        String sql = "UPDATE tblQuestions SET exam_id = ?, question_text = ?, option_a = ?, option_b = ?, option_c = ?, option_d = ?, correct_option = ? WHERE question_id = ?";
        try (Connection conn = DBUtils.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, entity.getExam_id());
            ps.setString(2, entity.getQuestion_text());
            ps.setString(3, entity.getOption_a());
            ps.setString(4, entity.getOption_b());
            ps.setString(5, entity.getOption_c());
            ps.setString(6, entity.getOption_d());
            ps.setString(7, String.valueOf(entity.getCorrect_option()));
            ps.setInt(8, entity.getQuestion_id());
            int rowsAffected = ps.executeUpdate();
            return rowsAffected > 0;
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(QuestionDAO.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
    }

    @Override
    public boolean delete(String id) {
        String sql = "DELETE FROM tblQuestions WHERE question_id = ?";
        try (Connection conn = DBUtils.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, Integer.parseInt(id));
            int rowsAffected = ps.executeUpdate();
            return rowsAffected > 0;
        } catch (ClassNotFoundException | SQLException | NumberFormatException ex) {
            Logger.getLogger(QuestionDAO.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
    }

    @Override
    public List<QuestionDTO> search(String searchTerm) {
        List<QuestionDTO> list = new ArrayList<>();
        String sql = "SELECT * FROM tblQuestions WHERE question_text LIKE ?";
        try (Connection conn = DBUtils.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, "%" + searchTerm + "%");
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    QuestionDTO question = new QuestionDTO(
                            rs.getInt("question_id"),
                            rs.getInt("exam_id"),
                            rs.getString("question_text"),
                            rs.getString("option_a"),
                            rs.getString("option_b"),
                            rs.getString("option_c"),
                            rs.getString("option_d"),
                            rs.getString("correct_option").charAt(0)
                    );
                    list.add(question);
                }
            }
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(QuestionDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }
    
    // Additional useful methods
    
    public List<QuestionDTO> getQuestionsByExamId(int examId) {
        List<QuestionDTO> list = new ArrayList<>();
        String sql = "SELECT * FROM tblQuestions WHERE exam_id = ?";
        try (Connection conn = DBUtils.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, examId);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    QuestionDTO question = new QuestionDTO(
                            rs.getInt("question_id"),
                            rs.getInt("exam_id"),
                            rs.getString("question_text"),
                            rs.getString("option_a"),
                            rs.getString("option_b"),
                            rs.getString("option_c"),
                            rs.getString("option_d"),
                            rs.getString("correct_option").charAt(0)
                    );
                    list.add(question);
                }
            }
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(QuestionDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }
}