<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="../CSS/pos_index.css">
    <title>Pos Index</title>
</head>
<body>

    <header>
        <div class="logo">
            <img src="../images/logo.png" id="logoimg">
            <span><b>Asangbinsi</b></span>
        </div>
    </header>
    
    
    <div class="container">
        <div class="card" onclick="location.href='pos_sales.do'">
            <div class="imgBx">
                <img src="../images/pos_index_1.png">
                <h3>판매</h3>
            </div>
            <div class="content">
                <p>판매 탭에서는 메뉴 선택부터 결제까지 가능합니다. 결제방식을 선택하고 결제 내역을 확인할 수 있습니다. 
                보다 확실하고 효과적인 프로세스로 최고의 경험을 해보세요</p>
            </div>
        </div>
        <div class="card" onclick="location.href='pos_sales.do'">
            <div class="imgBx">
                <img src="../images/pos_index_2.png">
                <h3>매출</h3>
            </div>
            <div class="content">
                <p>매출 탭에서는 메뉴 선택부터 결제까지 가능합니다. 결제방식을 선택하고 결제 내역을 확인할 수 있습니다. 
                보다 확실하고 효과적인 프로세스로 최고의 경험을 해보세요</p>
            </div>
        </div>
        <div class="card" onclick="location.href='pos_mgmt_list.do'">
            <div class="imgBx">
                <img src="../images/pos_index_3.png">
                <h3>재고</h3>
            </div>
            <div class="content">
                <p>판매 탭에서는 메뉴 선택부터 결제까지 가능합니다. 결제방식을 선택하고 결제 내역을 확인할 수 있습니다. 
                보다 확실하고 효과적인 프로세스로 최고의 경험을 해보세요</p>
            </div>
        </div>
    </div>
</body>
</html>