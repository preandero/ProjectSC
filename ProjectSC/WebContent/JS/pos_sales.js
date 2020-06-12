var cnt = 1;
var totalPrice = 0;
var menu_uid = 0;
var qtyid = 0;
var qty_id = "q" + qtyid;
$(".menu-items li").on('mousedown', function() {
	
	menu_uid = parseInt($(this).children('input[name=menu_uid]').val());
	
	var html = '';
	var cntdft = 1;
	var item = $(this).children('.item').text();
	var item_sub = $(this).children('.item').text().replace(" ", "");
	var price = parseInt($(this).children('.price').text());
	var quantity = parseInt($('.' + item_sub).html());
	var addquan = $('.' + item_sub).html((quantity + 1) + '<i class="fas fa-sort-down"/>');
	var rowPrice = parseInt($('.' + item_sub + "p").html((quantity + 1) * price));

	if (item == $('#' + item_sub).text()) {
		$('td.' + item_sub).html((quantity + 1)+ '<i class="fas fa-sort-down"/>').attr("value", parseInt($('.' + item_sub).text()));
		
		parseInt($('#' + item_sub + 'p').val(quantity + 1));
		
		rowPrice;
		totalPrice += price;
		$('#totalprice').text(totalPrice);
		parseInt($('#totalPriceSend').val(totalPrice));
	} else {
		 html += '<tr>';	
         html += '<td id="'+ item_sub + '" name="menu" value="'+ item_sub +'">' + item + 
         		 '</td><input type="hidden" name="menu_uid" value=' + menu_uid + '>';	
         html += '<td class="'+ item_sub + '"name="quantity" value="' + cntdft + '">'+ cntdft +'<i class="fas fa-sort-down"/>' + 
         		 '</td><input type="hidden" id="' + item_sub + 'p' + '" name="quantity" value="0">'; 	
         html += '<td class="'+ item_sub + 'p" name = "price" value="'+ price +'">' + price + '</td>';	
         html += '<td class="'+ item_sub  + 'd"> <i class="fas fa-times"></i> </td>';	
         html += '</tr>';

		$("#addable").append(html);
		totalPrice += price;
		$('#totalprice').text(totalPrice);
		cnt++;
		parseInt($('#totalPriceSend').val(totalPrice));
		qty_id++;

		// 선택된 주문 취소(삭제) 할 때
		$('.' + item_sub + 'd').click(function() {
			totalPrice = totalPrice - $('.' + item_sub + "p").text();
			$('#totalprice').text(totalPrice);
			$(this).closest('tr').remove();
		})
		
		// down btn 누를때 수량 & 가격 감소
		$('.' + item_sub).click(function() {
			if ($('.' + item_sub).text() > 1) {
				$('td.' + item_sub).html((parseInt($('.' + item_sub).text()) - 1)+ '<i class="fas fa-sort-down"/>').attr("value", parseInt($('.' + item_sub).text()));
				$('.' + item_sub + 'p').html($('.' + item_sub + 'p').text()- price);
				$('.' + item_sub).attr("value", parseInt($('.' + item_sub).text()));
				totalPrice -= price;
				$('#totalprice').text(totalPrice);
				$
				parseInt($('#totalPriceSend').val(totalPrice));
				$('#' + item_sub + 'p').val((parseInt($('.' + item_sub).text())));
			} else{
				// 1보다 작을 경우
				
			}
		})

	}
});

$('#payment').click(function() {
	var data = $('#insertorder').serialize();
	

	if (data.length <= 12) {
		$(document).ready(function() {
			swal({
				title : 'Order Fail',
				text : 'Please add items in order to process payment',
				icon : 'warning',
				button : {
					text : 'back',
					value : true,
					}
				})
		});
	} else {
		$.ajax({
			url : "orderInsert.ajax",
			type : "POST",
			cache : false,
			data : data,
			success : function(data, status) {
				if (status == "success") {
					if (data.status == "OK") {
							$(document).ready(function() {
								swal({
									title : 'Order Success',
									text : 'Please add items in order to process payment',
									icon : 'success',
									button : {
									text : 'back',
									value : true,
										}
									})
							});

					// TODO table 안에 있는 tr 지워주고
					// totalPrice 0으로 바꿔주기
					$('#menu-col').siblings().remove();
					$('#totalprice').text(0);

					} else {
						alert("INSERT 실패 : " + data.status + " : " + data.message);
							$(document).ready(function() {
								swal({
									title : 'Order Fail',
									text : 'Please add items in order to process payment',
									icon : 'warning',
									button : {
									text : 'back',
									value : true,
									}
								})
						});
					}
				} // if
			}
		});
	}
});
