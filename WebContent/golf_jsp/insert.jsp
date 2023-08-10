<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>

<!DOCTYPE html>
<html>
<head>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

<meta charset="UTF-8">
<title>수강신청</title>
<script src="script.js"></script>
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
	padding: 300px;
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
	background: url('jsp_teamproject_img/golf2.jpg') no-repeat center center
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
</head>

<header>
	<%@ include file="nav.jsp"%>

</header>
<body onload="document.frm.regist_month.focus();">

	<section>
		<form name="frm" action="insert_result.jsp" method="post">
			<div class="section-bg"></div>

			<div class="title">수강신청</div>
			<div class="wrapper">
				<table class="insertBox" style="width: 600px;">
					<colgroup>
						<col width="30%;">
						<col width="70%;">
					</colgroup>
					<tr>
						<th>수강월</th>
						<td><input type="text" name="regist_month" maxlength="6">
							2022년03월 예)202203</td>
					</tr>
					<tr>
						<th>회원명</th>
						<td><input type="text" name="c_name" maxlength="6"></td>
					</tr>
					<tr>
						<th>회원번호</th>
						<td><input type="text" name="c_no" maxlength="5">예)10001</td>
					</tr>
					<tr>
						<th>강의장소</th>
						<td><select name="class_area">
								<option value="">강의장소</option>
								<option value="서울본원">서울본원</option>
								<option value="성남분원">성남분원</option>
								<option value="대전분원">대전분원</option>
								<option value="부산분원">부산분원</option>
								<option value="대구분원">대구분원</option>

						</select></td>
					</tr>
					<tr>
						<th>강의명</th>
						<td><select name="teacher_code" onchange="fn_change2();">
								<option value="">강의신청</option>
								<option value="100">초급반</option>
								<option value="200">중급반</option>
								<option value="300">고급반</option>
								<option value="400">심화반</option>

						</select></td>
					</tr>
					<tr>
						<th>수강료</th>
						<td><select name="tuition">
								<option value="">수강료</option>
								<option value="100000">100000</option>
								<option value="200000">200000</option>
								<option value="300000">300000</option>
								<option value="400000">400000</option>
								<option value="500000">500000</option>
						</select></td>

					</tr>
					<tr>
						<td style="text-align: center;" colspan="2">
							<button class="btn" type="submit"
								onclick="fn_submit(); return false;">수강신청</button>
							<button class="btn" type="button" onclick="fn_reset();">다시쓰기</button>
						</td>
					</tr>
				</table>
			</div>
		</form>
	</section>
	<%@ include file="footer.jsp"%>
</body>
</html>