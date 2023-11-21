<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.example.cseeinfo.dao.CseeDAO" %>
<%@ page import="com.example.cseeinfo.bean.CseeStudentVO" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
            rel="stylesheet"
            integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9"
            crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="my.css">
    <script src="index.js"></script>

</head>
<body>
<div class="top">
    <nav class="navbar navbar-expand navbar-dark bg-dark" aria-label="Second navbar example">
        <a class="navbar-brand" >HGU 전산전자 공학부</a>
        <div id = "my_a1">
            <a class="nav-link" aria-current="page" href="addpostform.jsp">Add</a>
        </div>
    </nav>
</div>

<div class="container-fluid">
    <a class="navbar-brand">학생정보 리스트</a>
</div>
<div class="table-responsive">
    <table class="table table-striped table-sm" >
        <thead>
        <tr>
            <th>학번</th>
            <th>이름</th>
            <th>전공</th>
            <th>성별</th>
            <th>상세정보</th>
        </tr>
        </thead>
        <%
            CseeDAO dao = new CseeDAO();
            List<CseeStudentVO> list = dao.getBoardList();
            request.setAttribute("list", list);
        %>
        <tbody>

<c:forEach items="${list}" var="u" varStatus="status">
<tr>
    <td>${status.index + 1}</td>
    <td>${u.studentNumber}</td>
    <td>${u.studentName}</td>
    <td>${u.studentMajor}</td>
    <td>${u.studentGender}</td>
<%--    <td><a href="./view.jsp?index=${u.getIndex()}" id="my_a1">${u.title}</a></td>&ndash;%&gt;--%>
<%--    <td><a href="view.jsp"><button type="button" class="btn btn-sm btn-outline-secondary">View</button></a></td>--%>
    <td>
        <a href="view.jsp?id=${u.studentID}">
            <button type="button" class="btn btn-sm btn-outline-secondary">View</button>
        </a>
    </td>

</tr>
<tr>
    </c:forEach>
        </tbody>
    </table>
</div>

<div class="container">
    <footer class="d-flex flex-wrap justify-content-between align-items-center py-3 my-4 border-top">
        <div class="col-md-4 d-flex align-items-center">
            <a href="/" class="mb-3 me-2 mb-md-0 text-body-secondary text-decoration-none lh-1">
                <svg class="bi" width="30" height="24"><use xlink:href="#bootstrap"></use></svg>
            </a>
            <span class="mb-3 mb-md-0 text-body-secondary" id="foot_copyright">© 2023 Company, Inc</span>
        </div>

    </footer>
</div>

</body>
</html>