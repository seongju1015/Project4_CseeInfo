<%--
  Created by IntelliJ IDEA.
  User: seongju1015
  Date: 2023/11/20
  Time: 1:12 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="com.example.cseeinfo.dao.CseeDAO" %>
<%@ page import="com.example.cseeinfo.bean.CseeStudentVO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

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
</head>
<body>
<%
    int studentID = Integer.parseInt(request.getParameter("id"));

    CseeDAO dao = new CseeDAO();
    CseeStudentVO student = dao.getBoard(studentID);

    String studentGender = student.getStudentGender();
    String studentDepartment = student.getStudentDepartment();
    String studentMajor = student.getStudentMajor();
    int studentSemester = student.getStudentSemester();
    String studentNumber = student.getStudentNumber();
    String studentName = student.getStudentName();
    String IsEngCertification = student.getIsEngCertification();
    String studentResident = student.getStudentResident();
    String studentBirthday = student.getStudentBirthday();
    double studentGrade = student.getStudentGrade();
%>
    <div class="top">
        <nav class="navbar navbar-expand navbar-dark bg-dark" aria-label="Second navbar example">
            <a class="navbar-brand" href="index.jsp">HGU 전산전자 공학부</a>
            <div id = "my_a1">
                <a class="nav-link" aria-current="page" href="index.jsp">Home</a>
            </div>
        </nav>
    </div>

    <div class="container-fluid">
        <a class="navbar-brand" href="index.jsp">학생정보 리스트</a>
        <a class="navbar-brand" id="view_page" onclick="editRecord()">Edit</a>
    </div>
    <div class="needs-validation" >
        <div class="row g-3">

            <div class="col-sm-6">
                <label class="form-label">학번</label>
                <input type="text" class="form-control" name="StudentNumber" value="<%=studentNumber%>" disabled>
            </div>

            <div class="col-sm-6">
                <label class="form-label">학점 :</label>
                <input type="text" class="form-control" name="StudentGrade" value="<%=studentGrade%>" disabled>
            </div>

            <div class="col-sm-6">
                <label class="form-label">Name</label>
                <input type="text" class="form-control" name="StudentName" placeholder="" value="<%=studentName%>" disabled>
            </div>

            <div class="col-sm-6">
                <label  class="form-label">공학인증여부</label>
                <input type="text" class="form-control" name="IsEngCertification" placeholder="" value="<%=IsEngCertification%>" disabled>
            </div>

            <div class="col-sm-6">
                <label class="form-label">전공</label>
                <div class="input-group has-validation">
                    <span class="input-group-text">학부</span>
                    <input type="text" class="form-control" name="StudentDepartment" value="<%=studentDepartment%>" disabled>
                </div>
            </div>

            <div class="col-sm-6">
                <label  class="form-label"> 세부 전공 </label>
                <input type="text" class="form-control" name="StudentDepartment" value="<%=studentMajor%>" disabled>
            </div>

            <div class="col-sm-6">
                <label class="form-label">성별</label>
                <input type="text" class="form-control" name="StudentGender" value="<%=studentGender%>" disabled>
            </div>

            <div class="col-sm-6">
                <label class="form-label">학기수</label>
                <input type="text" class="form-control" name="StudentSemester" placeholder="" value="<%=studentSemester%>" disabled>
            </div>

            <div class="col-12">
                <label class="form-label"> 현재 거주 지역 </label>
                <input type="text" class="form-control" name="StudentResident" value="<%=studentResident%>" disabled>
            </div>

            <div class="col-12">
                <label class="form-label"> 생년월일 </label>
                <input type="text" class="form-control" name="StudentBirthday" value="<%=studentBirthday%>" disabled>
            </div>

            <a id="delete_button"> <input type="button" name="deletebutton" class="btn btn-danger" value="Delete" onclick="deleteRecord()"></a>


            <hr class="my-4">
        </div>
    </div>

    <div class="container">
        <footer class="d-flex flex-wrap justify-content-between align-items-center py-3 my-4 border-top">
            <div class="col-md-4 d-flex align-items-center">
                <a href="/" class="mb-3 me-2 mb-md-0 text-body-secondary text-decoration-none lh-1">
                    <svg class="bi" width="30" height="24"><use xlink:href="#bootstrap"></use></svg>
                </a>
                <span class="mb-3 mb-md-0 text-body-secondary">© 2023 Company, Inc</span>
            </div>

        </footer>
    </div>

</body>
<script>
    function deleteRecord() {
        // 삭제를 수행하는 코드
        window.location.href = "deletepost.jsp?StudentID=<%=studentID%>";
    }
    function editRecord(){
        window.location.href = "editform.jsp?StudentID=<%=studentID%>";
    }
</script>

</html>
