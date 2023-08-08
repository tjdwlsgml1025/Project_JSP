<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="jsp_team_project_golf_dto.Tbl_gmember_Dto"%>
<%@ page import="jsp_team_project_golf_dao.Tbl_gmember_Dao"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<title>수강신청 완료</title>
<script src="script.js"></script>
<style>
.section-bg {
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	z-index: -1;
	opacity: 0.3; /* 흐림 효과 설정 */
	filter: blur(5px); /* 흐림 효과 블러 적용 */
	background: url('jsp_teamproject_img/golf2.jpg') no-repeat center center
		fixed;
	background-size: cover;
}

section {
	margin-bottom: 5rem;
}

body {
	font-family: Arial, sans-serif;
	background-color: #f5f5f5;
	margin: 0;
	padding: 0;
}

.container {
	max-width: 800px;
	margin: 50px auto;
	background-color: #fff;
	padding: 20px;
	box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
	border-radius: 5px;
}

h1 {
	color: #333;
	text-align: center;
	margin-bottom: 20px;
}

p {
	text-align: center;
	font-size: 18px;
	color: #666;
	margin-bottom: 30px;
}

.btn {
	display: inline-block;
	padding: 10px 20px;
	background-color: #007bff;
	color: #fff;
	font-size: 16px;
	border: none;
	cursor: pointer;
	border-radius: 5px;
}

.btn:hover {
	background-color: #0056b3;
}
</style>
</head>
<body onload="document.frm.regist_month.focus();">
<body>
	<%@ include file="nav.jsp"%>

	<div class="section-bg"></div>

	<div class="container">
		<h1>수강신청 완료</h1>
		<p>수강신청이 정상적으로 완료되었습니다.</p>
		<div style="text-align: center;"></div>
	</div>

</body>
</html>

