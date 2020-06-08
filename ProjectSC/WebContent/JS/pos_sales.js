    var order_num = 1;
    var total = 0;
    var i = 0;
    
//    주문이 들어와서 메뉴들을 눌렀을때 (li 안에 담겨져 있다)
    $(".menu-items li").click(function () {
        var html = '';
        var default_qty = 1;
        var menu_name = $(this).children('.item').text();
        var menu_price = parseInt($(this).children('.price').text());
        var quantity = parseInt($("#menu_qty").html());
        var qty_add = $("#menu_qty").html((quantity + 1) +'<i class="fas fa-sort-down"/>');
        var price = parseInt($("#menu_price").html( (quantity +1) * menu_price));
        
        // 
        if(menu_name == ($("#menu_name").html())){
                qty_add;
                price;
                total += menu_price;
                $('#totalprice').text(total);
                
        } else {
                html += '<tr id="order_list' + i + '">';
                html += '<td>' + order_num + '</td>';
                html += '<td id="menu_name' + i + '">' + menu_name + '</td>';
                html += '<td id="menu_qty' + i + '">'+ default_qty +'<i class="fas fa-sort-down"/></td>';
                html += '<td id="menu_price' + i + '">' + menu_price + '</td>';
                html += '<td id="menu_delete' + i + '"> <i class="fas fa-times"></i> </td>';
                html += '</tr>';

                $("#addable").append(html);
                i++;
                total += menu_price;
                $('#totalprice').text(total);
                order_num++;

                $("#menu_delete" + i).click(function () { 
                    total = total - $("#menu_price" + i).text();
                    $('#totalprice').text(total);
                    $(this).closest('tr').remove();
                 })   

                 $("#menu_qty" + i).click(function () { 
                     if($("#menu_qty" + i).text() > 1){
                    $("#menu_qty" + i).html($("#menu_qty" + i).text() -1).append('<i class="fas fa-sort-down"/>');
                    total -= menu_price;
                    parseInt($("#menu_price" + i).html(parseInt($("#menu_qty" + i).html()) * menu_price));
                    $('#totalprice').text(total);
                     }
                  })
                  
        }
        
    });
    
    $("#btn2").click(function(){
    	for(var j = 0; j < i; j++){
    		var menu_name = $(".menu-items li").children('.item').text();
    	    alert(menu_name);
    	}
    });
    

    

    

    

    