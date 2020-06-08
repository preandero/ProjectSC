<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="pos_mgmt.beans.*"%>
    
    
    <%
	//controller 로 부터 결과 데이터를 받는다.
	WriteDTO[] arr = (WriteDTO[]) request.getAttribute("pos_mgmt_list");
%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
        integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous" />
    <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css"
        integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous" />
    <script src="https://code.jquery.com/jquery-3.5.1.js"
        integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.bundle.min.js"
        integrity="sha384-1CmrxMRARb6aLqgBO7yyAxTOQE2AKb9GfXnEo760AUcUmFx3ibVJJAzGytlQcNXd" crossorigin="anonymous">
    </script>

    <link href="../CSS/pos_sales.css" rel="stylesheet" type="text/css">
    <meta charset="UTF-8">
    <title>POS_SALES</title>
</head>

<body>
    <nav class="navbar navbar-expand-md navbar-dark fixed-top bg-dark">
        <a class="navbar-brand h2" href="pos_index.jsp">POS WEBAPP!</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExampleDefault"
            aria-controls="navbarsExampleDefault" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse " id="navbarsExampleDefault">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item active">
                    <a class="nav-link h3 px-4" href="history.back()"><i class="fas fa-arrow-circle-left icon-2x"></i></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link bg-white text-dark h3 px-4" href="pos_sales.do">ORDER</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link h3 px-4" href="">SALES</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link h3 px-2" href="pos_mgmt_list.do">MENU CUSTOM</a>
                </li>
            </ul>

            <div class="btn-group">
                <a class="nav-link h3 mr-2 text-white" href="#"> <i class="fas fa-home"></i></a>
                <button type="button" class="btn btn-secondary dropdown-toggle bg-dark border-dark"
                    data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    Side Menu
                </button>
                <div class="dropdown-menu dropdown-menu-right ">
                    <button class="dropdown-item" type="button">My page</button>
                    <button class="dropdown-item" type="button">CS Board</button>
                    <div class="dropdown-divider"></div>
                    <button class="dropdown-item" type="button">LogOut</button>
                </div>
            </div>

        </div>
    </nav>

    <!-- bootstrap  ------------------------------------------------------------------------------------------------------------ -->

    <div class="register">
        <div class="left">
            <div class="order-window">
             <form id="insertorder" action="order.do" method="post">
                <table>
               
                    <tbody id="addable">
                        <tr>
                            <td>#</td>
                            <td>Item</td>
                            <td>Quantity</td>
                            <td>Price</td>
                        </tr>
                    </tbody>
                   
                </table>
                 </form>
            </div>

            <div class="order-total">
                <pre>Total  <span id="totalprice">0</span>₩ </pre>
            </div>
            </div>	
        <div class="right">
            <div class="menu-items">
                <ul>
                    <%
			if(arr != null){
				for (int i =0; i<arr.length; i++){
		%>
				
				<li>
				<span class="item"><%= arr[i].getMenu_name() %></span>
				<span class="price"> <%= arr[i].getMenu_price() %></span>
				</li>
		<% 
				}//end for
			}
		%>
                   
                </ul>
            </div>
            <div class="payment-keys">
                    <ul>
                        <li id="orderlist">    
                        <i   class="fas fa-check-square fa-2x fa-fw" data-fa-transform="up-2"></i> 
                            OrderList
                        <li id="payment">
                        <i  class="fas fa-credit-card fa-2x fa-fw" data-fa-transform="up-2"></i> 
                         PayMent
                        </li>
                        </ul>
            </div>
        </div>
    </div>

     <!-- Modal -->
     <div class="modal fade" id="elegantModalForm" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
     aria-hidden="true">
     <div class="modal-dialog" role="document">
         <!--Content-->
         <div class="modal-content form-elegant">
             <!--Header-->
             <div class="modal-header text-center">
                 <h3 class="modal-title w-100 dark-grey-text font-weight-bold my-3" id="myModalLabel">
                     <strong>ORDER</strong></h3>
                 <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                     <span aria-hidden="true">&times;</span>
                 </button>
             </div>
             <!--Body-->
             <div class="modal-body mx-4">
                 <!--Body-->
                 <div class="md-form mb-5">
                     <table class="table">
                         <thead>
                             <tr>
                                 <th scope="col">#</th>
                                 <th scope="col">메뉴</th>
                                 <th scope="col">가격</th>
                             </tr>
                         </thead>
                         <tbody>
                             <tr>
                                 <th scope="row">1</th>
                                 <td>Mark</td>
                                 <td>Otto</td>
                             </tr>
                             <tr>
                                 <th scope="row">2</th>
                                 <td>Jacob</td>
                                 <td>Thornton</td>
                             </tr>
                             <tr>
                                 <th scope="row">3</th>
                                 <td>Larry</td>
                                 <td>the Bird</td>
                             </tr>
                         </tbody>
                     </table>
                 </div>

                 
                 <div >
                     <button type="button" class="btn btn-rounded z-depth-1a">back</button>
                     <button style="margin-left: 180px;"type="button" class="btn blue-gradient  btn-rounded z-depth-1a">Delete</button>
                 </div>
                
                
             </div>
         </div>
     </div>
 </div>
 <!— Modal —>



</body>
<script src="../JS/pos_sales.js" type="text/javascript">
</script>

</html>