<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>학년별 이수 학점 조회</title>
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
        .total-row {
            background-color: #FFFF00;
            font-weight: bold;
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
    <h1>학년별 이수 학점 조회</h1>

    <table>
        <thead>
        <tr>
            <th>년도</th>
            <th>학기</th>
            <th>취득 학점</th>
            <th>상세보기</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="credit" items="${creditsByYearAndSemester}">
            <tr>
                <td>${credit[0]}</td>
                <td>${credit[1]}</td>
                <td>${credit[2]}</td>
                <td>
                    <a href="${pageContext.request.contextPath}/courseDetail?year=${credit[0]}&semester=${credit[1]}">링크</a>
                </td>
            </tr>
        </c:forEach>
        <tr class="total-row">
            <td>총계</td>
            <td></td>
            <td>${totalCredits}</td>
            <td></td>
        </tr>
        </tbody>
    </table>

    <a href="${pageContext.request.contextPath}/" class="home-btn">홈으로 돌아가기</a>
</div>
</body>
</html>