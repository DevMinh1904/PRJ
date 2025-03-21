/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import model.Result;
import util.DBConnection;

public class ResultDAO {
    
    public List<Result> getResultsByUsername(String username) {
        List<Result> results = new ArrayList<>();
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        
        try {
            conn = DBConnection.getConnection();
            String sql = "SELECT r.*, e.exam_title, e.total_marks FROM tblExamResults r " +
                         "JOIN tblExams e ON r.exam_id = e.exam_id " +
                         "WHERE r.username = ? " +
                         "ORDER BY r.date_taken DESC";
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, username);
            
            rs = stmt.executeQuery();
            
            while (rs.next()) {
                Result result = new Result();
                result.setResultId(rs.getInt("result_id"));
                result.setUsername(rs.getString("username"));
                result.setExamId(rs.getInt("exam_id"));
                result.setScore(rs.getInt("score"));
                result.setDateTaken(rs.getTimestamp("date_taken"));
                result.setExamTitle(rs.getString("exam_title"));
                result.setTotalMarks(rs.getInt("total_marks"));
                
                results.add(result);
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
        
        return results;
    }
    
    public Result getResultById(int resultId) {
        Result result = null;
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        
        try {
            conn = DBConnection.getConnection();
            String sql = "SELECT r.*, e.exam_title, e.total_marks FROM tblExamResults r " +
                         "JOIN tblExams e ON r.exam_id = e.exam_id " +
                         "WHERE r.result_id = ?";
            stmt = conn.prepareStatement(sql);
            stmt.setInt(1, resultId);
            
            rs = stmt.executeQuery();
            
            if (rs.next()) {
                result = new Result();
                result.setResultId(rs.getInt("result_id"));
                result.setUsername(rs.getString("username"));
                result.setExamId(rs.getInt("exam_id"));
                result.setScore(rs.getInt("score"));
                result.setDateTaken(rs.getTimestamp("date_taken"));
                result.setExamTitle(rs.getString("exam_title"));
                result.setTotalMarks(rs.getInt("total_marks"));
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
        
        return result;
    }
    
    public int saveExamResult(String username, int examId, Map<Integer, Character> answers) {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        int resultId = -1;
        
        try {
            conn = DBConnection.getConnection();
            conn.setAutoCommit(false);
            
            // Calculate score
            int score = calculateScore(conn, examId, answers);
            
            // Save exam result
            String sql = "INSERT INTO tblExamResults (username, exam_id, score, date_taken) " +
                         "VALUES (?, ?, ?, GETDATE())";
            stmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            stmt.setString(1, username);
            stmt.setInt(2, examId);
            stmt.setInt(3, score);
            
            int rowsAffected = stmt.executeUpdate();
            
            if (rowsAffected > 0) {
                rs = stmt.getGeneratedKeys();
                if (rs.next()) {
                    resultId = rs.getInt(1);
                    
                    // Save student answers
                    saveStudentAnswers(conn, resultId, answers);
                }
            }
            
            conn.commit();
        } catch (SQLException e) {
            try {
                if (conn != null) conn.rollback();
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
                if (stmt != null) stmt.close();
                if (conn != null) {
                    conn.setAutoCommit(true);
                    DBConnection.closeConnection(conn);
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        
        return resultId;
    }
    
    private int calculateScore(Connection conn, int examId, Map<Integer, Character> answers) throws SQLException {
        PreparedStatement stmt = null;
        ResultSet rs = null;
        int score = 0;
        
        try {
            String sql = "SELECT question_id, correct_option FROM tblQuestions WHERE exam_id = ? AND question_id = ?";
            stmt = conn.prepareStatement(sql);
            
            for (Map.Entry<Integer, Character> entry : answers.entrySet()) {
                int questionId = entry.getKey();
                char studentAnswer = entry.getValue();
                
                stmt.setInt(1, examId);
                stmt.setInt(2, questionId);
                
                rs = stmt.executeQuery();
                
                if (rs.next()) {
                    char correctAnswer = rs.getString("correct_option").charAt(0);
                    if (studentAnswer == correctAnswer) {
                        score++;
                    }
                }
                
                rs.close();
            }
        } finally {
            if (rs != null) rs.close();
            if (stmt != null) stmt.close();
        }
        
        return score;
    }
    
    private void saveStudentAnswers(Connection conn, int resultId, Map<Integer, Character> answers) throws SQLException {
        PreparedStatement stmt = null;
        
        try {
            String sql = "INSERT INTO tblStudentAnswers (result_id, question_id, student_answer) VALUES (?, ?, ?)";
            stmt = conn.prepareStatement(sql);
            
            for (Map.Entry<Integer, Character> entry : answers.entrySet()) {
                int questionId = entry.getKey();
                char studentAnswer = entry.getValue();
                
                stmt.setInt(1, resultId);
                stmt.setInt(2, questionId);
                stmt.setString(3, String.valueOf(studentAnswer));
                
                stmt.executeUpdate();
            }
        } finally {
            if (stmt != null) stmt.close();
        }
    }
}