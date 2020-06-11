var cnt = 1;
var total = 0;
var menu_uid = 0;
$(".menu-items li")
		.click(
				function() {
					menu_uid = parseInt($(this).children('input[name=menu_uid]').val());

					var html = '';
					var cntdft = 1;
					var span = $(this).children('.item').text();
					var span1 = $(this).children('.item').text().replace(" ",
							"");
					var span2 = parseInt($(this).children('.price').text());
					var Quantity = parseInt($('.' + span1).html());
					var addquan = $('.' + span1).html(
							(Quantity + 1) + '<i class="fas fa-sort-down"/>');
					var price = parseInt($('.' + span1 + "p").html(
							(Quantity + 1) * span2));
					//alert(menu_uid);
					
					if (span == $('#' + span1).text()) {
						$('td.' + span1).html(
								(Quantity + 1)
										+ '<i class="fas fa-sort-down"/>')
								.attr("value", parseInt($('.' + span1).text()));
						var cntChg = Quantity + 1;
						$('input.' + span1).val(cntChg);
						price;
						total += span2;
						$('#totalprice').text(total);
						parseInt($('#totalPriceSend').val(total));
					} else {
						html += '<tr>';
						html += '<td id="' + span1 + '">' + span + '</td>';
						html += '<td class="' + span1
								+ '" name="quantity" value="0">' + cntdft
								+ '<i class="fas fa-sort-down"/></td>';
						html += '<td class="' + span1 + 'p">' + span2 + '</td>';
						html += '<td class="' + span1
								+ 'd"> <i class="fas fa-times"></i> </td>';
						html += '<td><input type="hidden" name="menu_uid" value=' + menu_uid + '>';
						html += '<input type="hidden" class="' + span1 + '" name="quantity" value="' + cntdft + '"></td>';
						html += '</tr>';
						

						$("#addable").append(html);
						total += span2;
						$('#totalprice').text(total);
						parseInt($('#totalPriceSend').val(total));
						cnt++;
						
						// 선택된 주문 취소(삭제) 할 때
						$('.' + span1 + 'd').click(function() {
							total = total - $('.' + span1 + "p").text();
							$('#totalprice').text(total);
							$(this).closest('tr').remove();
						})

						$('.' + span1)
								.click(
										function() {
											// 
											if ($('.' + span1).text() > 1) {
												$('.' + span1)
														.html(
																$('.' + span1)
																		.text() - 1)
														.append(
																'<i class="fas fa-sort-down"/>');
												$('.' + span1 + 'p').html(
														$('.' + span1 + 'p')
																.text()
																- span2);
												$('.' + span1).attr(
														"value",
														parseInt($('.' + span1)
																.text()));
												total -= span2;
												$('#totalprice').text(total);
												parseInt($('#totalPriceSend').val(total));
											}
										})

					}

				});

$('#payment').click(function() {
	var data = $('#insertorder').serialize();

	if(data.length <= 12){
		 $(document).ready(function () {
		        swal({
		            title: 'Order Fail',
		            text: 'Please add items in order to process payment',
		            icon: 'warning',
		            button:{
		                  text : 'back',
		                  value : true,
		            }
		        })});
	}else{
	$.ajax({
		url : "orderInsert.ajax"
		, type : "POST"
		, cache : false
		, data : data
		, success : function(data, status){
			if(status == "success"){
				if(data.status == "OK"){
					 $(document).ready(function () {
					        swal({
					            title: 'Order Success',
					            text: 'Please add items in order to process payment',
					            icon: 'success',
					            button:{
					                  text : 'back',
					                  value : true,
					            }
					        })});
					 
					 //TODO table 안에 있는 tr 지워주고 totalPrice 0으로 바꿔주기
					 $('#menu-col').siblings().remove();
					 $('#totalprice').text(0);
					
				} else{
					alert("INSERT 실패 : " + data.status + " : " + data.message);
					$(document).ready(function () {
				        swal({
				            title: 'Order Fail',
				            text: 'Please add items in order to process payment',
				            icon: 'warning',
				            button:{
				                  text : 'back',
				                  value : true,
				            }
				        })});
				}
			}
		}
	});
	}
});
