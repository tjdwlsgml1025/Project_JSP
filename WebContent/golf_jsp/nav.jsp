<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%-- <!DOCTYPE html>
 <html>
<head> 
<meta charset="UTF-8">
<title>nav</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</head> --%>
<!-- <body -->
	<nav class="navbar navbar-expand-lg bg-body-tertiary">
		<div class="container-fluid">
			<a class="navbar-brand"
				href="${pageContext.request.contextPath}/totalhome.jsp">home</a>
				
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#home"
				aria-controls="navbarNavDropdown" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			
			<div class="collapse navbar-collapse" id="home">
				<ul class="navbar-nav">
				
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" role="button"
						data-bs-toggle="dropdown" aria-expanded="false"> golf </a>
						<ul class="dropdown-menu">
							<li><a class="dropdown-item" href="${pageContext.request.contextPath}/golf/teacher.do">강사조회</a></li>
							<li><a class="dropdown-item" href="${pageContext.request.contextPath}/golf_jsp/insert.jsp">수강신청</a></li>
							<li><a class="dropdown-item" href="${pageContext.request.contextPath}/golf/member.do">회원정보조회</a></li>
							<li><a class="dropdown-item" href="${pageContext.request.contextPath}/golf_jsp/result.jsp">강사매출현황</a></li>
						</ul></li>

					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" role="button"
						data-bs-toggle="dropdown" aria-expanded="false"> vote</a>
						<ul class="dropdown-menu">
 							<li><a class="dropdown-item" href="${pageContext.request.contextPath}/vote/voteMemberList.do">후보조회</a></li>
							<li><a class="dropdown-item" href="${pageContext.request.contextPath}/vote/voteMember.do">투표하기</a></li>
							<li><a class="dropdown-item" href="${pageContext.request.contextPath}/vote/voteList.do">투표검수조회</a></li>
							<li><a class="dropdown-item" href="${pageContext.request.contextPath}/vote/voteResult.do">후보자등수</a></li>
							<li><a class="dropdown-item" href="${pageContext.request.contextPath}/vote/votemain.do">홈으로</a></li> 
						</ul></li>
						
					<li class="nav-item dropdown"><a class="nav-link dropdown-toggle" href="#" role="button"
						data-bs-toggle="dropdown" aria-expanded="false"> Shopping </a>
						<ul class="dropdown-menu">
							<li><a class="dropdown-item" href="${pageContext.request.contextPath}/hs/regMember.do">회원등록</a></li>
							<li><a class="dropdown-item" href="${pageContext.request.contextPath}/hs/listViewMember.do">회원목록</a></li>
							<li><a class="dropdown-item" href="${pageContext.request.contextPath}/hs/salesView.do">회원매출조회</a></li>
						</ul></li>

					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" role="button"
						data-bs-toggle="dropdown" aria-expanded="false"> game </a>
						<ul class="dropdown-menu">
							<li><a class="dropdown-item"
								href="${pageContext.request.contextPath}/game/Game_lotto.jsp">로또게임</a></li>
							<li><a class="dropdown-item"
								href="${pageContext.request.contextPath}/game/Game_rps.jsp">가위바위보게임</a></li>
						</ul></li>
				</ul>
			</div>
		</div>

	</nav>
 <!-- </body> -->
<!-- </html>  --!>