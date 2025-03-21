package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import model.Exam;
import util.DBConnection;

public class ExamDAO {
    
    public List<Exam> getAllExams() {
        List<Exam> exams = new ArrayList<>();
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        
        try {
            conn = DBConnection.getConnection();
            String sql = "SELECT e.*, c.category_name FROM tblExams e " +
                         "JOIN tblExamCategories c ON e.category_id = c.category_id " +
                         "ORDER BY e.exam_title";
            stmt = conn.prepareStatement(sql);
            
            rs = stmt.executeQuery();
            
            while (rs.next()) {
                Exam exam = new Exam();
                exam.setExamId(rs.getInt("exam_id"));
                exam.setExamTitle(rs.getString("exam_title"));
                exam.setSubject(rs.getString("Subject"));
                exam.setCategoryId(rs.getInt("category_id"));
                exam.setCategoryName(rs.getString("category_name"));
                exam.setTotalMarks(rs.getInt("total_marks"));
                exam.setDuration(rs.getInt("Duration"));
                
                exams.add(exam);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
                if (stmt != null) stmt.close();
                if (conn != null) DBConnection.closeConnection(conn);
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        
        return exams;
    }
    
    public List<Exam> getExamsByCategory(int categoryId) {
        List<Exam> exams = new ArrayList<>();
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        
        try {
            conn = DBConnection.getConnection();
            String sql = "SELECT e.*, c.category_name FROM tblExams e " +
                         "JOIN tblExamCategories c ON e.category_id = c.category_id " +
                         "WHERE e.category_id = ? " +
                         "ORDER BY e.exam_title";
            stmt = conn.prepareStatement(sql);
            stmt.setInt(1, categoryId);
            
            rs = stmt.executeQuery();
            
            while (rs.next()) {
                Exam exam = new Exam();
                exam.setExamId(rs.getInt("exam_id"));
                exam.setExamTitle(rs.getString("exam_title"));
                exam.setSubject(rs.getString("Subject"));
                exam.setCategoryId(rs.getInt("category_id"));
                exam.setCategoryName(rs.getString("category_name"));
                exam.setTotalMarks(rs.getInt("total_marks"));
                exam.setDuration(rs.getInt("Duration"));
                
                exams.add(exam);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
                if (stmt != null) stmt.close();
                if (conn != null) DBConnection.closeConnection(conn);
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        
        return exams;
    }
    
    public Exam getExamById(int examId) {
        Exam exam = null;
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        
        try {
            conn = DBConnection.getConnection();
            String sql = "SELECT e.*, c.category_name FROM tblExams e " +
                         "JOIN tblExamCategories c ON e.category_id = c.category_id " +
                         "WHERE e.exam_id = ?";
            stmt = conn.prepareStatement(sql);
            stmt.setInt(1, examId);
            
            rs = stmt.executeQuery();
            
            if (rs.next()) {
                exam = new Exam();
                exam.setExamId(rs.getInt("exam_id"));
                exam.setExamTitle(rs.getString("exam_title"));
                exam.setSubject(rs.getString("Subject"));
                exam.setCategoryId(rs.getInt("category_id"));
                exam.setCategoryName(rs.getString("category_name"));
                exam.setTotalMarks(rs.getInt("total_marks"));
                exam.setDuration(rs.getInt("Duration"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
                if (stmt != null) stmt.close();
                if (conn != null) DBConnection.closeConnection(conn);
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        
        return exam;
    }
    
    public int createExam(Exam exam) {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        int examId = -1;
        
        try {
            conn = DBConnection.getConnection();
            String sql = "INSERT INTO tblExams (exam_title, Subject, category_id, total_marks, Duration) " +
                         "VALUES (?, ?, ?, ?, ?)";
            stmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            stmt.setString(1, exam.getExamTitle());
            stmt.setString(2, exam.getSubject());
            stmt.setInt(3, exam.getCategoryId());
            stmt.setInt(4, exam.getTotalMarks());
            stmt.setInt(5, exam.getDuration());
            
            int rowsAffected = stmt.executeUpdate();
            
            if (rowsAffected > 0) {
                rs = stmt.getGeneratedKeys();
                if (rs.next()) {
                    examId = rs.getInt(1);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
                if (stmt != null) stmt.close();
                if (conn != null) DBConnection.closeConnection(conn);
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        
        return examId;
    }
}