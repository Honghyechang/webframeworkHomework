<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>학사 정보 시스템</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      margin: 0;
      padding: 0;
      background-color: #f0f8ff;
    }
    .container {
      width: 80%;
      margin: 0 auto;
      text-align: center;
      padding: 20px;
    }
    .header {
      background-color: #ffff00;
      padding: 10px;
      margin-bottom: 20px;
    }
    .menu-container {
      display: flex;
      justify-content: space-around;
      margin-top: 40px;
    }
    .menu-item {
      width: 30%;
      padding: 20px;
      background-color: white;
      border: 1px solid #ddd;
      border-radius: 5px;
      box-shadow: 0 2px 5px rgba(0,0,0,0.1);
    }
    .submit-btn {
      background-color: purple;
      color: white;
      border: none;
      padding: 10px 20px;
      border-radius: 20px;
      cursor: pointer;
      margin-top: 20px;
    }
    .menu-item img {
      width: 100%;
      max-height: 120px;
      object-fit: contain;
    }

  </style>
</head>
<body>
<div class="container">
  <div class="header">
    <h1>학사 정보 시스템</h1>
  </div>

  <div class="menu-container">
    <div class="menu-item">
      <h3>학기별 이수 학점 조회</h3>
      <p>
        각 년도의 1,2학기의 이수 학점을 조회할 수 있어요!
      </p>
      <a href="${pageContext.request.contextPath}/creditsByYear">
        <button class="submit-btn">submit</button>
      </a>
    </div>

    <div class="menu-item">
      <h3>수강 신청하기</h3>
      <p>
        2025년 2학기에 수강할 교과목을 신청합니다.
        교과목 정보를 입력하여 등록하세요.
      </p>
      <a href="${pageContext.request.contextPath}/registerCourse">
        <button class="submit-btn">submit</button>
      </a>
    </div>

    <div class="menu-item">
      <h3>수강 신청 조회</h3>
      <p>
        2025년 2학기에 신청한 교과목 목록을
        확인할 수 있습니다.
      </p>
      <a href="${pageContext.request.contextPath}/viewRegistration">
        <button class="submit-btn">submit</button>
      </a>
    </div>
  </div>
</div>
</body>
</html>