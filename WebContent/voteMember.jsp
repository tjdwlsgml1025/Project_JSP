<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<meta charset="UTF-8">
<title>voteMember</title>
<style>
.table-smaller {
	max-width: 80%; /* Adjust the width as needed */
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
<body>
<%@ include file="/golf_jsp/nav.jsp"%>
<%-- <%@ include file="votetopmenu.jsp" %> --%>
<section>
<div class="title">투표하기</div>
<form id="form" name="frm" method="post" >
<div class="table">
	<table class="table table-striped table-hover">
		<tr>
			<th>주민번호</th>
			<td>
			<input type="text" name="v_ssnum"> 예 : 8906153154726
			</td>
		</tr>
		<tr>
			<th>성명</th>
			<td>
			<input type="text" name="v_name">
			</td>
		</tr>
		<tr>
			<th>투표번호</th>
			<td>
			<select name="m_no">
				<option></option>
				<option value="1">[1]김후보</option>
				<option value="2">[2]이후보</option>
				<option value="3">[3]박후보</option>
				<option value="4">[4]조후보</option>
				<option value="5">[5]최후보</option>
			</select>		
			</td>
		</tr>
		<tr>
			<th>투표시간</th>
			<td>
			<input type="text" name="v_time" placeholder="예)0930">
			</td>
		</tr>
		<tr>
			<th>투표장소</th>
			<td>
			<input type="text" name="v_area" placeholder="예)제1투표장">
			</td>
		</tr>
		<tr>
			<th>유권자확인</th>
			<td>
			<input style="float:none;" type="radio" name="v_confirm" value="Y">확인 
			<input style="float:none;" type="radio" name="v_confirm" value="N">미확인
			</td>
		</tr>
		<tr>
			<td colspan="2" style="text-align:center">
         	<input type="button" id="submit-btn" class="btn" value="투표하기"/>
         	<button class="btn" type="button" onclick="fn_reset()">다시하기</button>
         	</td>
		</tr>
	</table>
</div>
</form>
<%@ include file="/golf_jsp/footer.jsp"%>
</section>
</body>
<script src="script.js"></script>
</html>