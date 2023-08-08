<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HomeShopping</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
	crossorigin="anonymous"></script>
</head>
<body
	class="d-flex vw-100 vh-100 text-center flex-column justify-content-between">
	<header>
		<%@ include file="nav.jsp"%>
		<style>
.wrapper {
	display: flex;
	justify-content: center;
	align-items: center;
	height: 80vh; /* 뷰포트의 높이에 맞춰 가운데 정렬 */
}

.insertBox {
	width: 600px;
	max-width: 100%;
	border: 3px solid #000;
	padding: 500px;
	box-sizing: border-box;
}

.table-smaller {
	max-width: 80%;
	margin: 0 auto;
}

.table-outer {
	border: 1px solid #ccc;
	padding: 10px;
	margin: 0 auto;
	max-width: 80%; /* Adjust the width as needed */
}

.table-wrapper {
	text-align: center;
}

.table {
	margin-top: 10px;
}

.section-bg {
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	z-index: -1;
	opacity: 0.3; /* 흐림 효과 설정 */
	filter: blur(5px); /* 흐림 효과 블러 적용 */
	background: url('mart.jpg') no-repeat center center
		fixed;
	background-size: cover;
}

.title {
	text-align: center;
	text-transform: uppercase;
	font-size: 26px;
	letter-spacing: 1px;
	display: grid;
	grid-template-columns: 1fr auto 1fr;
	grid-template-rows: 30px 0;
	grid-gap: 22px;
	margin-top: 20px;
	position: relative; /* 배경 이미지와 겹치기 위해 상대 위치 설정 */
	z-index: 1; /* 배경 이미지 뒤에 배치하기 위한 z-index 설정 */
}

.title:before, .title:after {
	content: '[';
	display: inline-block;
	position: relative;
	top: 1px;
	height: 100%;
	font-size: 1.25em;
	color: tomato;
	transition: all 0.5s ease;
}

.title:after {
	content: ']';
}

.title:hover:before {
	transform: translateX(-5px);
}

.title:hover:after {
	transform: translateX(5px);
}
</style>
	</header>

	<section class="d-flex flex-column align-items-center">
		<div class="section-bg"></div>
	
		<h1>쇼핑몰 회원등록</h1>
		<br>
		<form action="write.do" method="post">
			<table class="insertBox" style="width: 600px;">
				<colgroup>
					<col width="30%;">
					<col width="70%;">
				</colgroup>
				<tr>
					<th>회원번호(자동발생)</th>
				</tr>
				<tr>
					<th>회원 성명</th>
					<td><input type="text" name="custName"></td>
				</tr>
				<tr>
					<th>회원전화</th>
					<td><input type="text" name="custTel"></td>
				</tr>
				<tr>
					<th>회원주소</th>
					<td><input type="text" name="custAdress"></td>
				</tr>
				<tr>
					<th>가입일자</th>
					<td><input type="text" name="custRegiDate"></td>
				</tr>
				<tr>
					<th>고객등급[A:VIP, B:일반, C:직원]</th>
					<td><input type="text" name="custGrade"></td>
				</tr>
				<tr>
					<th>도시코드</th>
					<td><input type="text" name="cityCode"></td>
				</tr>
				<tr>
					<th colspan="2"><input type="submit" value="등록"> <input
						type="button" value="조회" onclick="return moveList()"></th>
				</tr>

			</table>
		</form>
	</section>

	<footer class="align-bottom p-4">
		<p>ⓒ AliceSeo 2023</p>
	</footer>
</body>
<script>
	function moveList() {
		location.href = "listViewMember.do";
	}
</script>
</html>