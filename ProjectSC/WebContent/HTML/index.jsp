<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link href="../CSS/index.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic+Coding&display=swap" rel="stylesheet">

    <title>Index Page</title>
</head>

<body>
    <header>
        <div class="logo">
            <img src="../images/logo.png" id="logoimg">
            <span><b>Asangbinsi</b></span>
        </div>
    </header>
    <!--div class="header"-->


    <!--div class="body"-->
    <section id="video_banner">
        <div id="main">
            <video playsinline autoplay muted loop poster="https://nrsplus.com/ext/bg-still.jpg" id="bgvideo" width="x"
                height="y">
                <source src="https://nrsplus.com/ext/hero-banner-EDITED.mp4" type="video/mp4">
            </video>
            <div class="vid-text">

                <h1 class="vid-h1">Asangbinsi POS SYSTEM은 최고의 경험을 제공합니다</h1>
                <h2 class="vid-h2">자영업자들을 위한 최고의 비지니스 파트너</h2>
                <h2 class="vid-h3">스마트폰이나 태블릿을 편리한 POS 기기로 사용해보세요. 재고와 판매관리 및 직원 관리, 고객 관리 및 매출 증대를 도와드립니다. 매장이 몇 개가 있든
                    괜찮습니다. 로이버스 POS 시스템으로 사업 운영을 효율적으로 관리해보세요!</h2>
                <div class="vid-txt-1">
                    <div>
                        <a class="vid-txt-a1" onclick="location.href='login.do'">정회원이신가요?&emsp;<br> 지금바로 POS 를 이용해보세요</a>
                    </div>
                    <div>
                        <a class="vid-txt-a2" onclick="location.href='joinUs.do'">비회원이신가요?&emsp; <br>새로운 계정을 생성해보세요</a>
                    </div>
                </div>
            </div>



        </div>
    </section>

    <!--div class="foot"-->
    <div class="language">
        <div class="lan"> © 2020 ASANGBINSI COMPANY Inc, All Rights Reserved<br>
            상호명 : Asangbinsi 대표자명 : 아상빈씨TEAM 사업자등록번호 : 123-456-7891</div>
    </div>

</body>


</html>