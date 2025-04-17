<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>수강 신청 조회</title>
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
        h1, h2 {
            color: #333;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        th, td {
            padding: 12px;
            text-align: center;
            border: 1px solid #ddd;
        }
        th {
            background-color: #90EE90;
            color: black;
        }
        tr:nth-child(even) {
            background-color: #f2f2f2;
        }
        tr:hover {
            background-color: #ddd;
        }
        .empty-message {
            text-align: center;
            padding: 20px;
            background-color: #f8f8f8;
            margin-top: 20px;
            border-radius: 5px;
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
    <h1>수강 신청 조회</h1>
    <h2>2025년 2학기 수강 신청 내역</h2>

    <c:choose>
        <c:when test="${empty courses}">
            <div class="empty-message">
                <p>2025년 2학기에 신청한 과목이 없습니다.</p>
                <a href="${pageContext.request.contextPath}/registerCourse">수강 신청하기</a>
            </div>
        </c:when>
        <c:otherwise>
            <table>
                <thead>
                <tr>
                    <th>년도</th>
                    <th>학기</th>
                    <th>교과목명</th>
                    <th>교과구분</th>
                    <th>담당교수</th>
                    <th>학점</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="course" items="${courses}">
                    <tr>
                        <td>${course.year}</td>
                        <td>${course.semester}</td>
                        <td>${course.courseName}</td>
                        <td>${course.courseType}</td>
                        <td>${course.professor}</td>
                        <td>${course.credits}</td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </c:otherwise>
    </c:choose>

    <a href="${pageContext.request.contextPath}/" class="home-btn">홈으로 돌아가기</a>
</div>
</body>
</html>