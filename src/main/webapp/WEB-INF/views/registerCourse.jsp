<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>수강 신청하기</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 20px;
            background-color: #f0f8ff;
        }
        .container {
            width: 80%;
            margin: 0 auto;
            background-color: white;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
        }
        h1 {
            color: #333;
        }
        .formtable {
            width: 100%;
            border: 1px solid #ddd;
            margin: 20px 0;
            padding: 20px;
            border-radius: 5px;
        }
        .label {
            text-align: right;
            vertical-align: top;
            padding: 10px;
            width: 30%;
            font-weight: bold;
        }
        .control {
            margin-left: 10px;
            width: 300px;
            padding: 8px;
            border: 1px solid #ddd;
            border-radius: 4px;
        }
        .error {
            font-size: small;
            color: red;
            margin-left: 10px;
        }
        input[type=submit] {
            display: block;
            width: 50%;
            margin: 0 auto;
            padding: 10px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        input[type=submit]:hover {
            background-color: #45a049;
        }
        .note {
            background-color: #f8f8f8;
            padding: 10px;
            border-left: 4px solid #4CAF50;
            margin-bottom: 20px;
        }
        .home-btn {
            display: block;
            margin-top: 20px;
            padding: 10px 20px;
            background-color: #4CAF50;
            color: white;
            text-align: center;
            text-decoration: none;
            border-radius: 4px;
        }
    </style>
</head>
<body>
<div class="container">
    <h1>수강 신청하기</h1>

    <div class="note">
        <p>2025년 2학기 수강 신청을 위한 교과목 정보를 입력해주세요.</p>
    </div>

    <sf:form method="post" action="${pageContext.request.contextPath}/doRegister" modelAttribute="course">
        <!-- year와 semester 필드는 숨김 처리 -->
        <sf:hidden path="year" value="2025" />
        <sf:hidden path="semester" value="2" />
        <table class="formtable">
            <tr>
                <td class="label">교과코드:</td>
                <td>
                    <sf:input class="control" type="text" path="courseCode" />
                    <br/>
                    <sf:errors path="courseCode" class="error" />
                </td>
            </tr>
            <tr>
                <td class="label">교과목명:</td>
                <td>
                    <sf:input class="control" type="text" path="courseName" />
                    <br/>
                    <sf:errors path="courseName" class="error" />
                </td>
            </tr>
            <tr>
                <td class="label">교과구분:</td>
                <td>
                    <sf:input class="control" type="text" path="courseType" />
                    <br/>
                    <sf:errors path="courseType" class="error" />
                </td>
            </tr>
            <tr>
                <td class="label">담당교수:</td>
                <td>
                    <sf:input class="control" type="text" path="professor" />
                    <br/>
                    <sf:errors path="professor" class="error" />
                </td>
            </tr>
            <tr>
                <td class="label">학점:</td>
                <td>
                    <sf:input class="control" type="number" path="credits" min="1" max="3" />
                    <br/>
                    <sf:errors path="credits" class="error" />
                </td>
            </tr>
            <tr>
                <td></td>
                <td><input type="submit" value="수강 신청" /></td>
            </tr>
        </table>
    </sf:form>

    <a href="${pageContext.request.contextPath}/" class="home-btn">홈으로 돌아가기</a>
</div>
</body>
</html>