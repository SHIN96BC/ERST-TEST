
$(document).ready(
    $(document).on('click', '#product_apply', function (){

        // 회사명 체크
        const companyName = $('#tab01').find('.company_name').val();
        if(companyName.trim().length < 1) {
            alert('회사명을 입력해주세요.');
            return;
        }

        // 성함 체크
        const customerName = $('#tab01').find('.customer_name').val();
        if(customerName.trim().length < 1) {
            alert('성함을 입력해주세요.');
            return;
        }

        // 핸드폰 번호 체크
        const customerPhone = $('#tab01').find('.customer_phone').val();
        if(customerPhone.trim().length < 1) {
            alert('전화번호를 입력해주세요.');
            return;
        }else {
            const checkPhoneNumber = /^01([0|1|6|7|8|9])-?([0-9]{3,4})-?([0-9]{4})$/;
            if(!checkPhoneNumber.test(customerPhone)) {
                alert('전화번호는 숫자와 - 만 입력해주세요.');
                return;
            }
        }

        // 이메일 체크
        const customerEmail = $('#tab01').find('.customer_email').val();
        if(customerEmail.trim().length < 1) {
            alert('이메일을 입력해주세요.');
            return;
        }else {
            const checkEmail = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/;
            if(!checkEmail.test(customerEmail)) {
                alert('올바른 이메일을 입력해주세요.');
                return;
            }
        }

        // 문의 내용 체크
        const inquiryContent = $('#tab01').find('.inquiry_content').val();
        if(inquiryContent.trim().length < 30) {
            alert('문의내용은 최소 30자 이상 입력해주세요.');
            return;
        }

        // 문의 제품 체크
        const inquiryProductNameList = [];
        const inquiryProductLength = $('#tab01').find('.item_list').children().length;
        // input 태그에 체크여부를 확인해서 체크가 된 것만 배열에 담습니다.
        for(let i = 0; i < inquiryProductLength; i++) {
            // jquery 의 prop 함수는 checked 여부를 확인할 수 있는 함수입니다.
            let checked = $('#tab01').find(`#chk${i+1}`).prop('checked');
            if(checked == true) {
                let inquiryProductName = $('#tab01').find(`#chk${i+1}`).siblings('label').text();
                inquiryProductNameList.push(inquiryProductName);
            }
        }
        if(inquiryProductNameList.length < 1) {
            alert('문의제품은 반드시 하나 이상 선택해주세요.');
            return;
        }

        $.ajax({
            url: "/customer/product_apply",
            type: "POST",
            data: {
                companyName: companyName, customerName: customerName, phone: customerPhone,
                email: customerEmail, inquiryContent: inquiryContent,
                inquiryProductNameList: inquiryProductNameList
            },
            success: function (data) {
                if(data) {
                    alert('문의 등록이 완료되었습니다.');
                    location.reload();
                }else {
                    alert('알수없는 오류에 의해 등록에 실패했습니다.\n 다시 시도해주세요.');
                }
            },
            error: function () {
                alert('알수없는 오류에 의해 등록에 실패했습니다.\n 다시 시도해주세요.');
            }
        });
    }),

    $(document).on('click', '#alliance_apply', function (){

        // 회사명 체크
        const companyName = $('#tab02').find('.company_name').val();
        if(companyName.trim().length < 1) {
            alert('회사명을 입력해주세요.');
            return;
        }

        // 성함 체크
        const customerName = $('#tab02').find('.customer_name').val();
        if(customerName.trim().length < 1) {
            alert('성함을 입력해주세요.');
            return;
        }

        // 핸드폰 번호 체크
        const customerPhone = $('#tab02').find('.customer_phone').val();
        if(customerPhone.trim().length < 1) {
            alert('전화번호를 입력해주세요.');
            return;
        }else {
            const checkPhoneNumber = /^01([0|1|6|7|8|9])-?([0-9]{3,4})-?([0-9]{4})$/;
            if(!checkPhoneNumber.test(customerPhone)) {
                alert('전화번호는 숫자와 - 만 입력해주세요.');
                return;
            }
        }

        // 이메일 체크
        const customerEmail = $('#tab02').find('.customer_email').val();
        if(customerEmail.trim().length < 1) {
            alert('이메일을 입력해주세요.');
            return;
        }else {
            const checkEmail = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/;
            if(!checkEmail.test(customerEmail)) {
                alert('올바른 이메일을 입력해주세요.');
                return;
            }
        }

        // 문의 내용 체크
        const inquiryContent = $('#tab02').find('.inquiry_content').val();
        if(inquiryContent.trim().length < 30) {
            alert('문의내용은 최소 30자 이상 입력해주세요.');
            return;
        }

        $.ajax({
            url: "/customer/alliance_apply",
            type: "POST",
            data: {
                companyName: companyName, customerName: customerName, phone: customerPhone,
                email: customerEmail, inquiryContent: inquiryContent
            },
            success: function (data) {
                if(data) {
                    alert('문의 등록이 완료되었습니다.');
                    location.reload();
                }else {
                    alert('알수없는 오류에 의해 등록에 실패했습니다.\n 다시 시도해주세요.');
                }
            },
            error: function (error) {
                alert('알수없는 오류에 의해 등록에 실패했습니다.\n 다시 시도해주세요.');
            }
        });
    })
);