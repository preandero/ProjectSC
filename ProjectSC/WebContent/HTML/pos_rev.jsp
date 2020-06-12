<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.sql.*" import="pos_mgmt.beans.*" import="java.util.*"%>
   
   <% int store_uid = (Integer)session.getAttribute("store_uid"); 
   	  System.out.println(store_uid);
   %>
   
<%!
	// JDBC 관련 기본 객체 객체변수 선언
	Connection conn = null;
	Statement stmt = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;   // SELECT 결과, executeQuery() 
	int cnt = 0;   // DML 결과, executeUpdate()
	
	// Connection 에 필요한 값 세팅
	String DRIVER = "oracle.jdbc.driver.OracleDriver";
	String URL = "jdbc:oracle:thin:@winetree94.io:1521:XE";
	String USERID = "bini1004";
	String USERPW = "soonmo1004";
%>

<% 
	List<String> regArr = new ArrayList<String>();
	List<Integer> tpArr = new ArrayList<Integer>();
	String regdateStr = "";
	String tprceStr = "";
%>

<%
	try{
		Class.forName(DRIVER);
		conn = DriverManager.getConnection(URL, USERID, USERPW );
		final String SQL_REVENUE_SELECT =
				"SELECT SUM(order_totalprice) totalprice, " +
				"to_char(order_regdate, 'YYYY-MM-DD') AS daily " +
				"FROM " + 
				"order_tb " +
				"WHERE " +
				"to_char(ORDER_REGDATE , 'YYYY-MM-DD') >= '2013-05-01' " +
				"AND " +
				"to_char(ORDER_REGDATE , 'YYYY-MM-DD') <= (SYSDATE + 30) " +
				"AND " +
				"STORE_UID = ? " +
				"GROUP BY " +
				"to_char(ORDER_REGDATE , 'YYYY-MM-DD') " +
				"ORDER BY daily";
				
		//트랜잭션 실행
		// TODO
		pstmt = conn.prepareStatement(SQL_REVENUE_SELECT);
		pstmt.setInt(1, store_uid);
		rs = pstmt.executeQuery();
		
		//많아야 한개의 record 만 select 된다
		// 한개만 있기때문에 while 돌리지 않는다
		
			
		while(rs.next()){
			int totalPrice = rs.getInt("totalprice");
			String regdate = rs.getString("daily");
			
			regArr.add(regdate);
			tpArr.add(totalPrice);
			
		} // while(rs)
			
		for(int i = 0 ; i < regArr.size(); i++){
			regdateStr += "'" + regArr.get(i) + "'" + ", ";
		}
		regdateStr = regdateStr.substring(0, regdateStr.length() - 2);
		System.out.println(regdateStr);
		
		for(int i = 0 ; i < tpArr.size(); i++){
			tprceStr += "'" + tpArr.get(i) + "'" + ", ";
		}
		tprceStr = tprceStr.substring(0, tprceStr.length() - 2);
		System.out.println(tprceStr);
	
// 		System.out.println(regArr.size() + " " + tpArr.size());
			
		
	}catch(Exception e){
		e.printStackTrace();
		//예외처리
	}finally{
		//리소트 해제
		try{
			if(rs!=null) rs.close();
			if(stmt!=null) stmt.close();
			if(pstmt!=null) pstmt.close();
			if(conn!=null) conn.close();
		}catch(Exception e){
			e.printStackTrace();
		}
	}
%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>메뉴 관리창</title>


<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
	integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css"
	integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p"
	crossorigin="anonymous" />
<script src="https://code.jquery.com/jquery-3.5.1.js"
	integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.bundle.min.js"
	integrity="sha384-1CmrxMRARb6aLqgBO7yyAxTOQE2AKb9GfXnEo760AUcUmFx3ibVJJAzGytlQcNXd"
	crossorigin="anonymous"></script>
<script type="text/javascript" src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.min.js" integrity="sha256-R4pqcOYV8lt7snxMQO/HSbVCFRPMdrhAFMH+vr9giYI=" crossorigin="anonymous"></script>
<link href="../CSS/pos_rev.css" rel="stylesheet" type="text/css">
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</head>
<body>
	<!-- 포스 메뉴 화면 틀 시작-->
	<nav class="navbar navbar-expand-md navbar-dark fixed-top bg-dark">
		<a class="navbar-brand h2" href="pos_index.jsp">POS WEBAPP!</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarsExampleDefault"
			aria-controls="navbarsExampleDefault" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse " id="navbarsExampleDefault">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item active"><a class="nav-link h3 px-4"
					onclick="history.back()"><i class="fas fa-arrow-circle-left icon-2x"></i></a></li>
				<li class="nav-item"><a class="nav-link h3 px-2" href="pos_sales.do">ORDER</a></li>
				<li class="nav-item"><a class="nav-link bg-white text-dark h3 px-4" href="pos_rev.jsp">SALES</a></li>
				<li class="nav-item"><a class="nav-link h3 px-4" href="pos_mgmt_list.do">MENU CUSTOM</a></li>
			</ul>

		<div class="btn-group">
			<a class="nav-link h3 mr-2 text-white" href="index.jsp"><i class="fas fa-home"></i></a>
				<button type="button"
					class="btn btn-secondary dropdown-toggle bg-dark border-dark"
					data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
					Side Menu
				</button>
			<div class="dropdown-menu dropdown-menu-right ">
				<button class="dropdown-item" type="button" onclick="location.href='my_page.do'">My page</button>
				<button class="dropdown-item" type="button" onclick="location.href='cs_list.do'">CS Board</button>
				<div class="dropdown-divider"></div>
				<button class="dropdown-item" type="button" onclick="location.href='logout.jsp'">LogOut</button>
			</div>
		</div>
		</div>
	</nav>
	<!-- 포스 메뉴 화면 틀 끝-->
	
	<div id="rev-title">
		<h1>DAILY REVENUE</h1>
	</div>
	
	<div class="myChart" style="
    display: inline-block;
    float: left;">
	<canvas id="myChart" ></canvas>
	<div id="clear"></div>
	</div>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.min.js" integrity="sha256-R4pqcOYV8lt7snxMQO/HSbVCFRPMdrhAFMH+vr9giYI=" crossorigin="anonymous"></script>
	<script>
		var ctx = document.getElementById('myChart').getContext('2d');
		var myChart = new Chart(ctx,
				{
					type : 'line',			//line 형태   bar 한번 바꾸고 fill 값 true 로 주면 bar chart 가 됨
										//현재 type이 line이라 bordercolor 는 'rgba(255, 99, 132, 1)' 이거만 먹히는중
					data : {
						// 일별로 x축 찍어주기
						labels : [ 
							<%= regdateStr %>
						],
						datasets : [ {
							fill : false,		// 채워줄지 말지 정해주는 attr  (Default : true)
							label : '# of Votes',    		//위에 라벨
							data : [ 
								<%= tprceStr %>
								
							],    //데이터 수치   현재 uid는 20으로 고정시켜준 값
							backgroundColor : [ 'rgba(255, 99, 132, 0.2)',   //동그라미 친구들 색갈
									'rgba(54, 162, 235, 0.2)',
									'rgba(255, 206, 86, 0.2)',
									'rgba(75, 192, 192, 0.2)',
									'rgba(153, 102, 255, 0.2)',
									'rgba(255, 159, 64, 0.2)' ],
							borderColor : [ 'rgba(255, 99, 132, 1)',
									'rgba(54, 162, 235, 1)',             
									'rgba(255, 206, 86, 1)',
									'rgba(75, 192, 192, 1)',
									'rgba(153, 102, 255, 1)',
									'rgba(255, 159, 64, 1)' ],
							borderWidth : 1
						} ]
					},
					options : {
						responsive: false,  //jquery 가 자동으로 max 해주는 걸 막아줌
						scales : {
							yAxes : [ {
								ticks : {
									beginAtZero : true
								}
							} ]
						}
					}
				});
		
		
	</script>
	<div class="myChart">
	<canvas id="myChart2" width="400px" height="400px"></canvas>
	</div>
	<script>
	var ctx = document.getElementById('myChart2').getContext('2d');
	var myDoughnutChart = new Chart(ctx, {
		    type: 'doughnut',
		    data: data = {
		    	    datasets: [{    
		    	        data: [10, 20, 30],			//데이터 셋의 개수만큼 배경색 배열안에 추가해주면됨 아래 labels도 추가해줘야함
		    	        backgroundColor : [ 'rgba(255, 99, 132, 0.2)',
							'rgba(54, 162, 235, 0.2)',
							'rgba(255, 206, 86, 0.2)',
							]
		    	    }],

		    	    // These labels appear in the legend and in the tooltips when hovering different arcs
		    	    labels: [
		    	        'Red',
		    	        'Blue',
		    	        'Yellow'
		    	    ]
		    	},
		    	options : {
					responsive: false,  //jquery 가 자동으로 max 해주는 걸 막아줌
		    	}
		});
	</script>
	</body>
</html>