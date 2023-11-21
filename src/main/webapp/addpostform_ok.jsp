<%--
  Created by IntelliJ IDEA.
  User: seongju1015
  Date: 2023/11/20
  Time: 3:02 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.example.cseeinfo.dao.CseeDAO" %>
<%@ page import="com.example.cseeinfo.bean.CseeStudentVO" %>
<%@ page import="com.example.cseeinfo.util.JDBCUtill" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.ParseException" %>
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

  CseeDAO dao = new CseeDAO();
  CseeStudentVO vo = new CseeStudentVO();

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

  dao.insertBoard(vo);

%>

<html>
<head>
  <title>양식 제출 결과</title>
</head>
<body>
<%
  response.sendRedirect("./index.jsp");
%>

</body>
</html>
