/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.Date;

public class Result {
    private int resultId;
    private String username;
    private int examId;
    private int score;
    private Date dateTaken;
    
    // Additional fields for display
    private String examTitle;
    private int totalMarks;
    
    public Result() {
    }
    
    public Result(int resultId, String username, int examId, int score, Date dateTaken) {
        this.resultId = resultId;
        this.username = username;
        this.examId = examId;
        this.score = score;
        this.dateTaken = dateTaken;
    }
    
    // Getters and setters
    public int getResultId() {
        return resultId;
    }
    
    public void setResultId(int resultId) {
        this.resultId = resultId;
    }
    
    public String getUsername() {
        return username;
    }
    
    public void setUsername(String username) {
        this.username = username;
    }
    
    public int getExamId() {
        return examId;
    }
    
    public void setExamId(int examId) {
        this.examId = examId;
    }
    
    public int getScore() {
        return score;
    }
    
    public void setScore(int score) {
        this.score = score;
    }
    
    public Date getDateTaken() {
        return dateTaken;
    }
    
    public void setDateTaken(Date dateTaken) {
        this.dateTaken = dateTaken;
    }
    
    public String getExamTitle() {
        return examTitle;
    }
    
    public void setExamTitle(String examTitle) {
        this.examTitle = examTitle;
    }
    
    public int getTotalMarks() {
        return totalMarks;
    }
    
    public void setTotalMarks(int totalMarks) {
        this.totalMarks = totalMarks;
    }
    
    public double getPercentage() {
        return (double) score / totalMarks * 100;
    }
}