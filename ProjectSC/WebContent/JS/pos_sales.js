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
        
        alert(span1);
        
        if(span == $('#' + span1).text()){
//        	alert($('#' + span1).text().replace(" ", ""));
                addquan;
                price;
                total += span2;
                $('#totalprice').text(total);
        } else {
                html += '<tr>';
                html += '<td>' + cnt + '</td>';
                html += '<td id="'+ span1 + '">' + span + '</td>';
                html += '<td class="'+ span1 + '">'+ cntdft +'<i class="fas fa-sort-down"/></td>'; 
                html += '<td class="'+ span1 + "p" + '">' + span2 + '</td>';
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
                    $('.' + span1).html($('.' + span1).text() -1).append('<i class="fas fa-sort-down"/>');
                    total -= span2;
                    $('#totalprice').text(total);
                     }
                  })
        }

       
        
    });

    
    
    $("#btn2").click(function(){
    	for(var j = 0; j < i; j++){
    		var menu_name = $("#menu_name" + i).text(); 
    	    alert(menu_name);
    	}
    });
    
    var name = 0;

    

    

    

    