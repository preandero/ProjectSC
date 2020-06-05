

     

    var cnt = 1;
    var total = 0;
    $(".menu-items li").click(function () {
        
        var html = '';
        var cntdft = 1;
        var span1 = $(this).children('.item').text();
        var span2 = parseInt($(this).children('.price').text());
        var Quantity = parseInt($('.' + span1).html());
        var addquan = $('.' + span1).html(Quantity + 1);
        var price = parseInt($('.' + span1 + "p").html( (Quantity +1) * span2));
        
        
        if(span1 == ($('#' + span1).html())){
                addquan;
                price;
                total += span2;
                $('#totalprice').text(total);
        } else {
                html += '<tr>';
                html += '<td>' + cnt + '</td>';
                html += '<td id="'+ span1 + '">' + span1 + '</td>';
                html += '<td class="'+ span1 + '">' + cntdft + '</td>';
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
        }

       
        
    })

    

    

    

    