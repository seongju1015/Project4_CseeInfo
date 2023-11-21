<%@ page import="com.example.cseeinfo.dao.CseeDAO" %>
<%@ page import="com.example.cseeinfo.bean.CseeStudentVO" %><%--
  Created by IntelliJ IDEA.
  User: seongju1015
  Date: 2023/11/21
  Time: 2:48 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    request.setCharacterEncoding("UTF-8");
    // 양식에서 데이터 가져오기
    String StudentGender = request.getParameter("StudentGender");
    String StudentDepartment = request.getParameter("StudentDepartment");
    String StudentMajor = request.getParameter("StudentMajor");
    String StudentSemester = request.getParameter("StudentSemester");
    String StudentNumber = request.getParameter("StudentNumber");
    String StudentName = request.getParameter("StudentName");
    String StudentGrade = request.getParameter("StudentGrade");
    String IsEngCertification = request.getParameter("IsEngCertification");
    String StudentResident = request.getParameter("StudentResident");
    String StudentBirthday = request.getParameter("StudentBirthday");
    String StudentId = request.getParameter("index");

    System.out.println("editform_ok.jps로 넘겨진 student id값 : " + StudentId);
    System.out.println("url : " + request.getRequestURI());

    CseeStudentVO vo = new CseeStudentVO();
    CseeDAO dao = new CseeDAO();

    vo.setStudentGender(StudentGender);
    vo.setStudentDepartment(StudentDepartment);
    vo.setStudentMajor(StudentMajor);
    vo.setStudentSemester(Integer.parseInt(StudentSemester));
    vo.setStudentNumber(StudentNumber);
    vo.setStudentName(StudentName);
    vo.setStudentGrade(Double.parseDouble(StudentGrade));
    vo.setIsEngCertification(IsEngCertification);
    vo.setStudentResident(StudentResident);
    vo.setStudentBirthday(StudentBirthday);
    vo.setStudentID(Integer.parseInt(StudentId));

    dao.updateBoard(vo);
%>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    response.sendRedirect("./index.jsp");
%>
</body>
</html>
