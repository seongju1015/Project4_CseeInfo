package com.example.cseeinfo.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.example.cseeinfo.bean.CseeStudentVO;
import com.example.cseeinfo.util.JDBCUtill;

public class CseeDAO {

    Connection conn = null;
    PreparedStatement stmt = null;
    ResultSet rs = null;

    private final String BOARD_INSERT = "insert into CseeInfo (StudentGender, StudentDepartment, StudentMajor, StudentSemester, StudentNumber, StudentName, IsEngCertification,StudentResident,StudentBirthday,StudentGrade) values (?,?,?,?,?,?,?,?,?,?)";
    private final String BOARD_UPDATE = "update CseeInfo set StudentGender=?, StudentDepartment=?, StudentMajor=?, StudentSemester=?, StudentNumber=?, StudentName=?, IsEngCertification=?, StudentResident=?, StudentBirthday=?,StudentGrade=? where StudentID=?";
    private final String BOARD_DELETE = "delete from CseeInfo  where StudentID=?";
    private final String BOARD_GET = "select * from CseeInfo  where StudentID=?";
    private final String BOARD_LIST = "select * from CseeInfo order by StudentID desc";

    public int insertBoard(CseeStudentVO vo) {
        System.out.println("===> JDBC로 insertBoard() 기능 처리");
        try {
            conn = JDBCUtill.getConnection();
            stmt = conn.prepareStatement(BOARD_INSERT);
            stmt.setString(1, vo.getStudentGender());
            stmt.setString(2, vo.getStudentDepartment());
            stmt.setString(3, vo.getStudentMajor());
            stmt.setInt(4, vo.getStudentSemester());
            stmt.setString(5, vo.getStudentNumber());
            stmt.setString(6, vo.getStudentName());
            stmt.setString(7, vo.getIsEngCertification());
            stmt.setString(8, vo.getStudentResident());
            stmt.setString(9,vo.getStudentBirthday());
            stmt.setDouble(10, vo.getStudentGrade());
            stmt.executeUpdate();
            return 1;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }

    // 글 삭제
    public int deleteBoard(CseeStudentVO vo) {
        System.out.println("===> JDBC로 deleteBoard() 기능 처리");
        try {
            conn = JDBCUtill.getConnection();
            stmt = conn.prepareStatement(BOARD_DELETE);
            stmt.setInt(1, vo.getStudentID());
            stmt.executeUpdate();
            return 1;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }
    public int updateBoard(CseeStudentVO vo) {
        System.out.println("===> JDBC로 updateBoard() 기능 처리");
        try {
            conn = JDBCUtill.getConnection();
            stmt = conn.prepareStatement(BOARD_UPDATE);
            stmt.setString(1, vo.getStudentGender());
            stmt.setString(2, vo.getStudentDepartment());
            stmt.setString(3, vo.getStudentMajor());
            stmt.setInt(4, vo.getStudentSemester());
            stmt.setString(5, vo.getStudentNumber());
            stmt.setString(6, vo.getStudentName());
            stmt.setString(7, vo.getIsEngCertification());
            stmt.setString(8, vo.getStudentResident());
            stmt.setString(9, vo.getStudentBirthday());
            stmt.setDouble(10, vo.getStudentGrade());
            stmt.setInt(11, vo.getStudentID());

            System.out.println(vo.getStudentGender() + "-" + vo.getStudentDepartment() + "-" + vo.getStudentMajor() + "-" + vo.getStudentSemester()+ "-" +vo.getStudentNumber()+ "-" +vo.getStudentName()+ "-" +vo.getIsEngCertification()+ "-" +vo.getStudentResident()+ "-" +vo.getStudentBirthday()+ "-" +vo.getStudentGrade() + "-" + vo.getStudentID());
            stmt.executeUpdate();
            return 1;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }

    public CseeStudentVO getBoard(int seq) {
        CseeStudentVO one = new CseeStudentVO();
        System.out.println("===> JDBC로 getBoard() 기능 처리");
        try {
            conn = JDBCUtill.getConnection();
            stmt = conn.prepareStatement(BOARD_GET);
            stmt.setInt(1, seq);
            rs = stmt.executeQuery();
            if(rs.next()) {
                one.setStudentID(rs.getInt("StudentID"));
                one.setStudentGender(rs.getString("StudentGender"));
                one.setStudentDepartment(rs.getString("StudentDepartment"));
                one.setStudentMajor(rs.getString("StudentMajor"));
                one.setStudentSemester(rs.getInt("StudentSemester"));
                one.setStudentNumber(rs.getString("StudentNumber"));
                one.setStudentName(rs.getString("StudentName"));
                one.setIsEngCertification(rs.getString("IsEngCertification"));
                one.setStudentResident(rs.getString("StudentResident"));
                one.setStudentBirthday(rs.getString("StudentBirthday"));
                one.setStudentGrade(rs.getDouble("StudentGrade"));

            }
            rs.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return one;
    }

    public List<CseeStudentVO> getBoardList(){
        List<CseeStudentVO> list = new ArrayList<CseeStudentVO>();
        System.out.println("===> JDBC로 getBoardList() 기능 처리");
        try {
            conn = JDBCUtill.getConnection();
            stmt = conn.prepareStatement(BOARD_LIST);
            rs = stmt.executeQuery();
            while(rs.next()) {
                CseeStudentVO one = new CseeStudentVO();
                one.setStudentID(rs.getInt("StudentID"));
                one.setStudentGender(rs.getString("StudentGender"));
                one.setStudentDepartment(rs.getString("StudentDepartment"));
                one.setStudentMajor(rs.getString("StudentMajor"));
                one.setStudentSemester(rs.getInt("StudentSemester"));
                one.setStudentNumber(rs.getString("StudentNumber"));
                one.setStudentName(rs.getString("StudentName"));
                one.setIsEngCertification(rs.getString("IsEngCertification"));
                one.setStudentResident(rs.getString("StudentResident"));
                one.setStudentBirthday(rs.getString("StudentBirthday"));
                one.setStudentGrade(rs.getDouble("StudentGrade"));
                list.add(one);
            }
            rs.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
}
