    var cnt = 1;
    var total = 0;
    $(".menu-items li").click(function () {
        
        var html = '';
        var cntdft = 1;
        var span = $(this).children('.item').text();
        var span1 = $(this).children('.item').text().replace(" ", "");
        var span2 = parseInt($(this).children('.price').text());
        var Quantity = parseInt($('.' + span1).html());
        var addquan = $('.' + span1).html((Quantity + 1) +'<i class="fas fa-sort-down"/>');
        var price = parseInt($('.' + span1 + "p").html( (Quantity +1) * span2));
        
        
        if(span == $('#' + span1).text()){
//        	alert($('#' + span1).text().replace(" ", ""));
//        	 $('.' + span1).attr("value", parseInt($('.' + span1).text()));
        	 
        	 $('.' + span1).html((Quantity + 1) +'<i class="fas fa-sort-down"/>').attr("value", parseInt($('.' + span1).text()));
                price;
               
                total += span2;
                $('#totalprice').text(total);
        } else {
                html += '<tr>';
                html += '<td id="'+ span1 + '" name="menu" value="'+span1+'">' + span + '</td>';
                html += '<td class="'+ span1 + '"name="quantity" value="0">'+ cntdft +'<i class="fas fa-sort-down"/></td>'; 
                html += '<td class="'+ span1 + 'p" name = "price" value="'+span2+'">' + span2 + '</td>';
                html += '<td class="'+ span1  + 'd"> <i class="fas fa-times"></i> </td>';
                html += '</tr>';
                
                $("#addable").append(html);
                total += span2;
                $('#totalprice').text(total);
                cnt++;

                $('.' + span1 +'d').click(function () { 
                    total = total - $('.' + span1 + "p").text();
                    $('#totalprice').text(total);
                    $(this).closest('tr').remove();
                 })   

                 $('.' + span1).click(function () { 
                     if($('.' + span1).text() > 1){
                    $('.' + span1).html($('.' + span1).text() - 1).append('<i class="fas fa-sort-down"/>');
                    $('.' + span1 + 'p').html($('.' + span1 + 'p').text() - span2);
                    $('.' + span1).attr("value", parseInt($('.' + span1).text()));
                    total -= span2;
                    $('#totalprice').text(total);
                     }
                  })
        }

    });

    $('#payment').click(function(){
    	$("#totalPriceSend").attr("value", $("#totalprice").text());
    	alert($("#totalPriceSend").attr("value", $("#totalprice").text()));
    	var formData = $('#insertorder').serialize();
    	var formData2 = $('#insertorder').serializeArray();
//    	alert(formData);
//    	alert(formData2[0].name);
//    	console.log(formData );
    	$.ajax({
    		type : "POST",
    		url : "order.do",
    		cache : false,
    		data : formData2,
    		success : function(){
    			
    		}
    		, error : function(){
    			
    		}
    	})	
    })

    

    

    