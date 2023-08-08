<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>totalhome</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

<style>
footer {
	margin-top: 200px;
}

.btn {
	margin-top: 10px;
}
</style>

</head>


<body
	class="d-flex vw-100 vh-100 text-center flex-column justify-content-between">

	<%@ include file="nav.jsp"%>

	<main>
		<div id="homepage">
			<h2>원하는 서비스를 클릭하세요</h2>
			<div class="container">
				<div class="row justify-content-around">

					<div class="golf" style="width: 18rem;">
						<img id="golfImg" class="card-img-top"
							src="jsp_teamproject_img/golf1.png">
						<div class="card-body">
							<a href="golf_index.jsp" class="btn btn-success"> <i
								class="bi bi-hand-rock"></i> 골프
							</a>




						</div>
					</div>

					<div class="homeshopping" style="width: 18rem;">
						<img id="homeshoppingImg" class="card-img-top"
							src="jsp_teamproject_img/homeshoppin.jpg">
						<div class="card-body">
							<a href="index.jsp" class="btn btn-secondary"> <i
								class="bi bi-hand-rock"></i> 홈쇼핑
							</a>

						</div>
					</div>

					<div class="vote" style="width: 18rem;">
						<img id="voteImg" class="card-img-top"
							src="jsp_teamproject_img/vote.png">
						<div class="card-body">
							<a href="#" class="btn btn-primary"> <i
								class="bi bi-hand-rock"></i> 투표
							</a>

						</div>
					</div>

					<div class="game" style="width: 18rem;">
						<img id="gameImg" class="card-img-top"
							src="jsp_teamproject_img/game.jpg">
						<div class="card-body">
							<a href="#" class="btn btn-info"> <i class="bi bi-hand-rock"></i>
								게임
							</a>

						</div>
					</div>




				</div>
			</div>
		</div>
		</div>

	</main>

	<footer> from @gigaginny </footer>