package com.example.cseeinfo.bean;
import java.util.Date;

public class CseeStudentVO {
    private int StudentID;
    private String StudentGender;
    private String StudentDepartment;
    private String StudentMajor;
    private int StudentSemester;
    private String StudentNumber;
    private String StudentName;
    private String IsEngCertification;
    private String StudentResident;
    private String StudentBirthday;
    private double StudentGrade;

    // 생성자
    public CseeStudentVO() {
        // 기본 생성자
    }

    // Getter와 Setter 메서드
    public int getStudentID() {
        return StudentID;
    }

    public void setStudentID(int studentID) {
        this.StudentID = studentID;
    }

    public String getStudentGender() {
        return StudentGender;
    }

    public void setStudentGender(String studentGender) {
        this.StudentGender = studentGender;
    }

    public String getStudentDepartment() {
        return StudentDepartment;
    }

    public String getStudentMajor() {
        return StudentMajor;
    }

    public void setStudentMajor(String studentMajor) {
        StudentMajor = studentMajor;
    }

    public void setStudentDepartment(String studentDepartment) {
        StudentDepartment = studentDepartment;
    }

    public int getStudentSemester() {
        return StudentSemester;
    }

    public String getStudentNumber() {
        return StudentNumber;
    }

    public String getStudentName() {
        return StudentName;
    }

    public String getIsEngCertification() {
        return IsEngCertification;
    }

    public String getStudentResident() {
        return StudentResident;
    }

    public void setStudentResident(String studentResident) {
        StudentResident = studentResident;
    }

    public String getStudentBirthday() {
        return StudentBirthday;
    }

    public double getStudentGrade() {
        return StudentGrade;
    }

    public void setStudentGrade(double studentGrade) {
        StudentGrade = studentGrade;
    }

    public void setStudentBirthday(String studentBirthday) {
        StudentBirthday = studentBirthday;
    }

    public void setIsEngCertification(String isEngCertification) {
        IsEngCertification = isEngCertification;
    }

    public void setStudentName(String studentName) {
        StudentName = studentName;
    }

    public void setStudentNumber(String studentNumber) {
        StudentNumber = studentNumber;
    }

    public void setStudentSemester(int studentSemester) {
        StudentSemester = studentSemester;
    }
    // 나머지 필드에 대한 Getter와 Setter 메서드를 유사하게 작성해주세요.
    // 날짜 데이터인 studentBirthday는 Date 타입으로 처리할 수 있습니다.
}
