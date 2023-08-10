<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html>
<html>
<head>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<meta charset="UTF-8">
<meta charset="UTF-8">
<title>voteResult</title>
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
<%-- <%@ include file="votetopmenu.jsp" %>--%>
<section>
		<div class="title">후보자 등수</div>
<div class="table">
	<table class="table table-striped table-hover">
		<tr>
			<th>후보번호</th>
			<th>성명</th>
			<th>총투표건수</th>
		</tr>
		<c:forEach var="dto" items="${voteResult}">
         <tr>
            <td>${dto.m_no}</td>
            <td>${dto.m_name}</td>
            <td>${dto.v_total}</td>           
         </tr>
      </c:forEach>
	</table>
</div>
</section>
<%@ include file="/golf_jsp/footer.jsp"%>

</body>
</html>