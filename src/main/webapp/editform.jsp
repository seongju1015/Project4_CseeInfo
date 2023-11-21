<%@ page import="com.example.cseeinfo.bean.CseeStudentVO" %>
<%@ page import="com.example.cseeinfo.dao.CseeDAO" %><%--
  Created by IntelliJ IDEA.
  User: seongju1015
  Date: 2023/11/20
  Time: 1:13 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <link rel="stylesheet" type="text/css" href="my.css">
    <link rel="stylesheet" type="text/css" href="edit.css">
    <link rel="stylesheet" type="text/css" href="addpostform.css">
    <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
            rel="stylesheet"
            integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9"
            crossorigin="anonymous">
</head>
<body>
<%
    String StudentId = request.getParameter("StudentID");
    CseeDAO dao = new CseeDAO();
    CseeStudentVO student = dao.getBoard(Integer.parseInt(StudentId));
%>

<div class="top">
    <nav class="navbar navbar-expand navbar-dark bg-dark" aria-label="Second navbar example">
        <a class="navbar-brand" href="index.jsp">HGU 전산전자 공학부</a>
    </nav>
</div>

<div class="container-fluid">
    <a class="navbar-brand" href="index.jsp">학생정보 리스트</a>
    <a class="navbar-brand" id="view_page" href="index.jsp">Home</a>
</div>

<div class="header">
    <h2> 전산전자 공학부 인적사항 기입 페이지 </h2><br>
</div>

<form id="sForm" action="./editform_ok.jsp"
      method="post"
      onsubmit="return isValid()"
>
    <input type = "hidden" name = "index" value = <%=student.getStudentID()%>>
    <div class="gender_page">
        <label>[ 성별 ]</label><br>
        <label>male </label>
        <input type="radio" name="StudentGender" value="male" <%=student.getStudentGender().equals("male") ? "checked" : ""%>>
        <label>female </label>
        <input type="radio" name="StudentGender" value="female" <%= student.getStudentGender().equals("female") ? "checked" : "" %>><br>
        <br>
    </div>

    <div class="major">
        <label>[ 전공 ]</label><br>
        <label>전산전자 공학부(필수 체크)</label>
        <input type="checkbox" name="StudentDepartment" value="전산전자공학부" checked><br>
        <label>=> Ai 컴퓨터공학 심화</label>
        <input type="radio" name="StudentMajor" value="only_computer" <%= student.getStudentMajor().equals("only_computer") ? "checked" : "" %>>
        <label> 전자공학 심화</label>
        <input type="radio" name="StudentMajor" value="only_electronic" <%= student.getStudentMajor().equals("only_electronic") ? "checked" : "" %>><br>
        <br>
    </div>

    <div class="semester">
        <label>학기 수 : </label>
        <input type="text"  name="StudentSemester" value="<%=student.getStudentSemester()%>">
        <br>
    </div>
    <br>

    <div class="student_number">
        <label>[ 학번 ]</label>
        <input type="text" name="StudentNumber" value="<%=student.getStudentNumber()%>" >
        <br>
    </div><br>

    <div class="name_page">
        <p>[ 이름 ]</p>
        <label>Name : </label>
        <input type="text" name="StudentName" placeholder="이름" value="<%=student.getStudentName()%>">
        <br>
    </div><br>

    <div class="grade">
        <label>학점 : </label>
        <input type="text" name="StudentGrade" value="<%=student.getStudentGrade()%>">
        <br>
    </div>
    <br>

    <div class="engineering_certification">
        <label>[ 공학인증 신청여부 ]</label><br>
        <label> 신청 </label>
        <input type="radio" name="IsEngCertification" value="신청" <%= student.getIsEngCertification().equals("신청") ? "checked" : "" %>>
        <label> 미신청 </label>
        <input type="radio" name="IsEngCertification" value="미신청" <%= student.getIsEngCertification().equals("미신청") ? "checked" : "" %>><br>
        <br>
    </div>

    <div class="region">
        <label>[ 현재 거주 지역 ]</label><br>
        <select name="StudentResident">
            <optgroup label="포항시">
                <option value ="양덕동"
                        <%= student.getStudentResident().equals("양덕동") ? "selected" : "" %>>양덕동</option>
                <option value ="흥해읍(기숙사)"
                        <%= student.getStudentResident().equals("흥해읍(기숙사)") ? "selected" : "" %>>흥해읍(기숙사)</option>
                <option value ="장성동"
                        <%= student.getStudentResident().equals("장성동") ? "selected" : "" %>>장성동</option>
                <option value ="두호동"
                        <%= student.getStudentResident().equals("두호동") ? "selected" : "" %>>두호동</option>
            </optgroup>
            <br>
        </select>
    </div>

    <div className="birthday"><br>
        <label>[ 생년월일 ]</label>
        <input type ='text' name ='StudentBirthday' value="<%=student.getStudentBirthday()%>">
    </div><br>

    <div className ="final">
        <input type = 'submit' value = '수정' >
        <input type = 'reset'  style="color: red" value = 'reset'><br>
    </div><br>

</form>

<script>

    function isValid(){
        var result = true;

        var gender = document.getElementsByName("user_gender");
        if(!(gender[0].checked) && !(gender[1].checked)){
            alert("성별을 체크해주세요");
            result = false;
            return result;
        }else{
            result = true;
        }

        var essential_check = document.getElementsByName("essential_check");
        if(!essential_check[0].checked){
            alert("필수체크 항목을 체크해주세요");
            result = false;
            return result;
        }
        else{
            result = true;
        }

        var major = document.getElementsByName("user_major");
        if(!(major[0].checked) && !(major[1].checked)){
            alert("전공을 체크해주세요");
            result = false;
            return result;
        }
        else{
            result = true;
        }

        var number=document.getElementById("number");
        var numberValue = number.value;
        if(numberValue === ""){
            alert("학번을 입력하시오")
            result = false;
            return result;
        }
        else{
            result = true;
        }

        var student_name=document.getElementById("student_name");
        var student_nameValue = student_name.value;
        if(student_nameValue === ""){
            alert("이름을 입력하시오")
            result = false;
            return result;
        }
        else{
            result = true;
        }

        var birthday_input=document.getElementById("birthday_date").value;
        if(!birthday_input){
            alert("생년월일을 입력하시오")
            result = false;
            return result;
        }
        else{
            result = true;
        }
        if(result == true){
            alert("게시물이 추가됩니다.");
        }
        return result;
    }
</script>
</body>
</html>
