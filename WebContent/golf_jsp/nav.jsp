<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>nav</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
	<nav class="navbar navbar-expand-lg bg-body-tertiary">
		<div class="container-fluid">
			<a class="navbar-brand"
				href="${pageContext.request.contextPath}/totalhome.jsp">home</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown"
				aria-controls="navbarNavDropdown" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarNavDropdown">
				<ul class="navbar-nav">
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" role="button"
						data-bs-toggle="dropdown" aria-expanded="false"> golf </a>
						<ul class="dropdown-menu">
							<li><a class="dropdown-item" href="teacher.jsp">강사조회</a></li>
							<li><a class="dropdown-item" href="insert.jsp">수강신청</a></li>
							<li><a class="dropdown-item" href="member.jsp">회원정보조회</a></li>
							<li><a class="dropdown-item" href="result.jsp">강사매출현황</a></li>
						</ul></li>

					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" role="button"
						data-bs-toggle="dropdown" aria-expanded="false"> vote</a>
						<ul class="dropdown-menu">
							<li><a class="dropdown-item" href="golf_index.jsp">골프홈</a></li>
							<li><a class="dropdown-item" href="teacher.jsp">강사조회</a></li>
							<li><a class="dropdown-item" href="insert.jsp">수강신청</a></li>
							<li><a class="dropdown-item" href="member.jsp">회원정보조회</a></li>
							<li><a class="dropdown-item" href="result.jsp">강사매출현황</a></li>
						</ul></li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" role="button"
						data-bs-toggle="dropdown" aria-expanded="false"> Shopping </a>
						<ul class="dropdown-menu">
							<li><a class="dropdown-item" href="${pageContext.request.contextPath}/homeshopping_jsp/regMember.jsp">회원등록</a></li>
							<li><a class="dropdown-item" href="${pageContext.request.contextPath}/homeshopping_jsp/listViewMember.jsp">회원목록</a></li>
							<li><a class="dropdown-item" href="${pageContext.request.contextPath}/homeshopping_jsp/salesView.jsp">회원매출조회</a></li>
						</ul></li>

					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" role="button"
						data-bs-toggle="dropdown" aria-expanded="false"> game </a>
						<ul class="dropdown-menu">
							<li><a class="dropdown-item"
								href="${pageContext.request.contextPath}/game/Game_lotto.jsp">lotto</a></li>
							<li><a class="dropdown-item"
								href="${pageContext.request.contextPath}/game/Game_rps.jsp">rps</a></li>
						</ul></li>
				</ul>
			</div>
		</div>

	</nav>
</body>
</html>