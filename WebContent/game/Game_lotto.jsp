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
    <title>로또</title>
    <style>
      .navbar-dark .navbar-nav .nav-link {
        color: white;
      }

      .lotto-ball {
        width: 150px;
        height: 150px;
        border-radius: 50%;
        text-align: center;
        line-height: 150px;
        font-size: 60px;
        color: #fff;
        margin: 20px;
        display: flex;
        align-items: center;
        justify-content: center;
      }

      /* 모바일 사이즈에서 로또 번호 출력 스타일 변경 */
      @media screen and (max-width: 640px) {
        .lotto-ball {
          width: 110px;
          height: 110px;
          line-height: 110px;
          font-size: 40px;
          margin: 5px;
        }

        .row.justify-content-center > .col-auto {
          display: flex;
          flex-wrap: wrap;
          justify-content: center;
        }
      }

      @media screen and (max-width: 300px) {
        .lotto-ball {
          width: 90px;
          height: 90px;
          line-height: 90px;
          font-size: 40px;
          margin: 5px;
        }

        .row.justify-content-center > .col-auto {
          display: flex;
          flex-wrap: wrap;
          justify-content: center;
        }
      }

      .ball1 {
        background: #fbc400;
      }

      .ball2 {
        background: #69c8f2;
      }

      .ball3 {
        background: #ff7272;
      }

      .ball4 {
        background: #aaa;
      }

      .ball5 {
        background: #b0d840;
      }

      .ball6 {
        background: #bda4d5;
      }
    </style>
  </head>

  <body
    class="d-flex vw-100 vh-100 text-center flex-column justify-content-between"
  >
    <header>

	<%@ include file="/golf_jsp/nav.jsp"%>

    </header>

    <main>
      <!-- 로또 들어가는 자리 -->
      <!-- 로또 번호 출력 -->
      <div class="container">
        <div class="row justify-content-center">
          <div class="col-auto">
            <div class="lotto-ball ball1"></div>
          </div>
          <div class="col-auto">
            <div class="lotto-ball ball2"></div>
          </div>
          <div class="col-auto">
            <div class="lotto-ball ball3"></div>
          </div>
          <div class="col-auto">
            <div class="lotto-ball ball4"></div>
          </div>
          <div class="col-auto">
            <div class="lotto-ball ball5"></div>
          </div>
          <div class="col-auto">
            <div class="lotto-ball ball6"></div>
          </div>
        </div>

        <div class="row mt-5 justify-content-center">
          <!-- 로또 번호 생성 버튼 -->
          <div class="col-auto">
            <button id="generateBtn" class="btn btn-dark">
              로또 번호 생성
            </button>
          </div>
        </div>
      </div>
    </main>

    <script>
      // 로또 번호 생성 함수
      function generateLottoNumbers() {
        const numbers = [];
        while (numbers.length < 6) {
          const randomNumber = Math.floor(Math.random() * 45) + 1;
          if (!numbers.includes(randomNumber)) {
            numbers.push(randomNumber);
          }
        }

        const balls = document.getElementsByClassName("lotto-ball");
        for (let i = 0; i < balls.length; i++) {
          const ballNum = Math.floor((numbers[i] - 1) / 10) + 1;
          balls[i].className = "lotto-ball ball" + ballNum;
          balls[i].textContent = numbers[i];
          balls[i].style.display = "inline-flex";
        }
      }
      // 버튼 클릭 이벤트에 로또 번호 생성 함수 연결
      document
        .getElementById("generateBtn")
        .addEventListener("click", generateLottoNumbers);
    </script>

    <footer>
      <hr />
      <address>Copyright ⓒ 2023. All rights reserved.</address>
    </footer>
  </body>
</html>