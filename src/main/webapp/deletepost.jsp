<%--
  Created by IntelliJ IDEA.
  User: seongju1015
  Date: 2023/11/20
  Time: 1:13 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.example.cseeinfo.dao.CseeDAO" %>
<%@ page import="com.example.cseeinfo.bean.CseeStudentVO" %>

<%
    String StudentId = request.getParameter("StudentID");
    CseeDAO dao = new CseeDAO();
    CseeStudentVO student = dao.getBoard(Integer.parseInt(StudentId));

    int deleteResult = dao.deleteBoard(student);
    boolean isDeleteSuccessful = (deleteResult == 1);
    request.setAttribute("isDeleteSuccessful", isDeleteSuccessful);
%>
<html>

    <head>
        <title>Title</title>
    </head>
    <body>

    <script>
        var isDeleteSuccessful = <%= request.getAttribute("isDeleteSuccessful") %>;

        if (isDeleteSuccessful) {
            alert('데이터 삭제에 성공했습니다.');
            window.location.href = 'index.jsp';
        } else {
            alert('데이터 삭제에 실패했습니다.');
        }
    </script>
    </body>
</html>



