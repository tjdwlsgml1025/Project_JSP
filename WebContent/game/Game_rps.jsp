<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
      rel="stylesheet"
    />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
    <title>가위바위보</title>
    <style>
      .navbar-dark .navbar-nav .nav-link {
        color: white;
      }

      /* 결과 메시지의 스타일 */
      #result {
        font-size: 30px;
        font-weight: bold;
      }

      .score {
        font-size: 17px;
        font-weight: bold;
      }

      .card-title {
        font-weight: bold;
      }

      .card-img-top {
        /* width: 15rem; */
        height: 16rem;
        display: block;
        margin-left: auto;
        margin-right: auto;
      }
    </style>
  </head>

  <body
    class="d-flex vw-100 vh-100 text-center flex-column justify-content-between"
  >
    <header>
     <nav class="navbar navbar-expand-lg bg-body-tertiary">
		<div class="container-fluid">
			<a class="navbar-brand" href="totalhome.jsp">home</a>
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
							<li><a class="dropdown-item" href="golf_index.jsp">골프홈</a></li>
							<li><a class="dropdown-item" href="teacher.jsp">강사조회</a></li>
							<li><a class="dropdown-item" href="insert.jsp">수강신청</a></li>
							<li><a class="dropdown-item" href="member.jsp">회원정보조회</a></li>
							<li><a class="dropdown-item" href="result.jsp">강사매출현황</a></li>
						</ul></li>

					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" role="button"
						data-bs-toggle="dropdown" aria-expanded="false"> homeshopping
					</a>
						<ul class="dropdown-menu">
							<li><a class="dropdown-item" href="golf_index.jsp">골프홈</a></li>
							<li><a class="dropdown-item" href="teacher.jsp">강사조회</a></li>
							<li><a class="dropdown-item" href="insert.jsp">수강신청</a></li>
							<li><a class="dropdown-item" href="member.jsp">회원정보조회</a></li>
							<li><a class="dropdown-item" href="result.jsp">강사매출현황</a></li>
						</ul></li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" role="button"
						data-bs-toggle="dropdown" aria-expanded="false"> vote </a>
						<ul class="dropdown-menu">
							<li><a class="dropdown-item" href="golf_index.jsp">골프홈</a></li>
							<li><a class="dropdown-item" href="teacher.jsp">강사조회</a></li>
							<li><a class="dropdown-item" href="insert.jsp">수강신청</a></li>
							<li><a class="dropdown-item" href="member.jsp">회원정보조회</a></li>
							<li><a class="dropdown-item" href="result.jsp">강사매출현황</a></li>
						</ul></li>

					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" role="button"
						data-bs-toggle="dropdown" aria-expanded="false"> game </a>
						<ul class="dropdown-menu">
							<li><a class="dropdown-item" href="Game_rps.jsp">rsp</a></li>
							<li><a class="dropdown-item" href="Game_lotto.jsp">lotto</a></li>
						</ul></li>
				</ul>
			</div>
		</div>

	</nav>
     
     
     
    </header>

    <main class="d-flex flex-column align-items-center">
      <!-- 로또와 가위바위보 들어가는 자리 -->
      <div class="container">
        <div class="row d-flex justify-content-around">
          <div class="card" style="width: 19rem">
            <img
              class="card-img-top"
              id="com"
              src="gs_img/character.png"
              alt="Card image cap"
            />
            <div class="card-body">
              <h5 class="card-title">Com</h5>
              <!-- <p class="card-text"></p> -->
              <!-- <a href="#" class="btn btn-primary"></a> -->
            </div>
          </div>
          <div class="card" style="width: 19rem">
            <img
              class="card-img-top"
              src="gs_img/character.png"
              alt="Card image cap"
            />
            <div class="card-body">
              <h5 class="card-title">result</h5>
              <div
                class="d-flex align-items-center justify-content-center"
                style="height: 100px"
              >
                <p class="card-text" id="result">welcome!!</p>
              </div>
              <!-- 스코어 추가 -->
              <p class="score">
                승: <span id="win-count">0</span>, 무:
                <span id="draw-count">0</span>, 패:
                <span id="lose-count">0</span>
              </p>
              <!-- <a href="#" class="btn btn-primary"></a> -->
            </div>
          </div>
          <div class="card" style="width: 19rem">
            <img
              class="card-img-top"
              id="player"
              src="gs_img/character.png"
              alt="Card image cap"
            />
            <div class="card-body">
              <h5 class="card-title">Player</h5>
              <!-- <p class="card-text"></p> -->
              <br /><br /><br />
              <!-- 버튼을 가로로 정렬하기 위해 추가한 div -->
              <div class="d-flex justify-content-around">
                <a href="#" id="scissors-btn" class="btn btn-dark">가위</a>
                <a href="#" id="rock-btn" class="btn btn-dark">바위</a>
                <a href="#" id="paper-btn" class="btn btn-dark">보</a>
              </div>
            </div>
          </div>
        </div>
      </div>
    </main>

    <script>
      // 가위바위보 게임 함수
      function play(player) {
        const rps = ["가위", "바위", "보"];
        const com = rps[Math.floor(Math.random() * rps.length)];
        let result = "";

        /* 방법1 */
        // 컴퓨터가 선택한 이미지 업데이트
        if (com === "가위") {
          document.querySelector("#com").src = "gs_img/scissors.jpg";
        } else if (com === "바위") {
          document.querySelector("#com").src = "gs_img/rock.jpg";
        } else if (com === "보") {
          document.querySelector("#com").src = "gs_img/paper.jpg";
        }

        // 사용자가 선택한 이미지 업데이트
        if (player === "가위") {
          document.querySelector("#player").src = "gs_img/scissors.jpg";
        } else if (player === "바위") {
          document.querySelector("#player").src = "gs_img/rock.jpg";
        } else if (player === "보") {
          document.querySelector("#player").src = "gs_img/paper.jpg";
        }

        /* 방법2 */
        // // 컴퓨터와 사용자의 이미지 업데이트 함수
        // function updateImages(image, value) {
        //   let fileName;
        //   if (value === "가위") {
        //     fileName = "scissors";
        //   } else if (value === "바위") {
        //     fileName = "rock";
        //   } else if (value === "보") {
        //     fileName = "paper";
        //   }
        //   document.querySelector(image).src = `gs_img/${fileName}.jpg`;
        // }
        // // 컴퓨터와 사용자 이미지 업데이트
        // updateImages("#com", com);
        // updateImages("#player", player);

        /* 방법3 */
        // GameSite_rps2.html

        // 승패 결정 조건 비교
        if (com === player) {
          result = "비겼습니다!";
          drawCount++;
        } else if (
          (com === "가위" && player === "보") ||
          (com === "바위" && player === "가위") ||
          (com === "보" && player === "바위")
        ) {
          result = "패배!";
          loseCount++;
        } else {
          result = "승리!";
          winCount++;
        }

        // 결과 메시지 출력
        const resultElement = document.getElementById("result");
        resultElement.textContent = result;

        /* 업데이트된 승패 횟수를 출력 */
        const winCountElement = document.getElementById("win-count");
        const drawCountElement = document.getElementById("draw-count");
        const loseCountElement = document.getElementById("lose-count");
        winCountElement.textContent = winCount;
        drawCountElement.textContent = drawCount;
        loseCountElement.textContent = loseCount;
      }
      let winCount = 0; // 승리 횟수를 저장하는 변수
      let loseCount = 0; // 패배 횟수를 저장하는 변수
      let drawCount = 0; // 무승부 횟수를 저장하는 변수

      // 버튼에 클릭 이벤트 리스너 추가
      document
        .querySelector("#scissors-btn")
        .addEventListener("click", function () {
          play("가위");
        });

      document
        .querySelector("#rock-btn")
        .addEventListener("click", function () {
          play("바위");
        });

      document
        .querySelector("#paper-btn")
        .addEventListener("click", function () {
          play("보");
        });
    </script>

    <footer>
      <hr />
      <address>Copyright ⓒ 2023. All rights reserved.</address>
    </footer>
  </body>
</html>