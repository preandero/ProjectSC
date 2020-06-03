//화면 넘어가는거-----------------------------------------------------------------------------
const signUpButton = document.getElementById('signUp');
const signInButton = document.getElementById('signIn');
const container = document.getElementById('container');
const signInContainer = document.getElementsByClassName('sign-in-container')[0];
const signInBtn = document.getElementById('signInBtn');
const signUpBtn = document.getElementById('signUpBtn');


signUpButton.addEventListener('click', function() {
    container.classList.add("right-panel-active");
    signInContainer.style.display = "none";
    
});

 signInButton.addEventListener('click', function() {
     container.classList.remove("right-panel-active");
     signInContainer.style.display = "block";
 });


// 유효성 검사---------------------------------------------------------------------------------
  $("#formsignup").validate({ // joinForm에 validate를 적용
    rules: {
        Id: {
            required: true,
            rangelength: [5, 10]
        },
        // required는 필수, rangelength는 글자 개수(5~10개 사이)
        Password: {
        	required:true,
            rangelength: [8, 15]
        },
        ConfirmPw: {
        	required:true,
            equalTo: "#Password"
        },
        // equalTo : id가 pwd인 값과 같아야함
        PhoneNumber: {
            required: true,
            number: true,
            rangelength: [10, 11]
        },

        Email: {
            required: true,
            email: true
        },
       

    },
    messages: {
        Id: "아이디를 다시 입력해주세요",
        PhoneNumber: {
            required: "전화번호는 필수 입니다",
            number:"숫자만 입력하세요",
            rangelength: "전화번호는 10자리 이상입니다."
        },
        Password: {
            required: "비밀번호는 필수 입니다",
            rangelength: "비밀번호는 8자리 이상입니다."
        },
        ConfirmPw: "똑같은 비밀번호를 입력해주세요",
        Email: "유효한 이메일을 입력해주세요"
    	},

});

$("#formstore").validate({ // joinForm에 validate를 적용
    rules: {
       
        StoreName: {
            required: true
        },
        StoreNumber: {
            required: true,
            number: true,
            rangelength: [10, 15]
        },
        
    },
        messages:{
        	
        	StoreNumber: {
                required: "매장번호는 필수 입니다",
                number:"숫자만 입력해주세요",
                rangelength: "매장번호는 10자리 이상입니다."
            },
 
}
});




// 주소찾기---------------------------------------------------------------------------
//본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    function juso() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample4_post').value = data.zonecode;
                document.getElementById("sample4_roadAddress").value = roadAddr;
                document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
                
                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
                if(roadAddr !== ''){
                    document.getElementById("sample4_extraAddress").value = extraRoadAddr;
                } else {
                    document.getElementById("sample4_extraAddress").value = '';
                }

                // var guideTextBox = document.getElementById("guide");
                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                // if(data.autoRoadAddress) {
                //     var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                //     guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                //     guideTextBox.style.display = 'block';

                // } else if(data.autoJibunAddress) {
                //     var expJibunAddr = data.autoJibunAddress;
                //     guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                //     guideTextBox.style.display = 'block';
                // } else {
                //     guideTextBox.innerHTML = '';
                //     guideTextBox.style.display = 'none';
                // }
            }
        }).open();
    }