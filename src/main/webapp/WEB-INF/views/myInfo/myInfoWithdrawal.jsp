<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<body>
   <div class="col-md-10 col-xs-12">
      <h4 style="text-align:center;">회원탈퇴</h4>
      <div style="border:2px solid crimson; border-radius:10px; padding:20px 10px;">
      <ul style="  font-size: medium;">
         <li>고객님께서 회원 탈퇴를 원하신다니 저희 The CatHouse의 서비스가 많이 부족하고 미흡했나 봅니다.</li>
         <li>불편하셨던 점이나 불만사항을 알려주시면 적극 반영해서 고객님의 불편함을 해결해 드리도록 노력하겠습니다.</li>
         <li>회원탈퇴 시 The CatHouse 서비스 이용이 불가합니다.</li>
         <li>거래정보가 있는 경우, 전자상거래 등에서의 소비자 보호에 관한 법률에 따라 계약 또는 청약철회에 관한 기록, 대금결제 및 재화 등의 공급에 관한 기록은 5년동안 보존됩니다.</li>
         <li>보유하셨던 포인트는 탈퇴와 함께 삭제되며 환불되지 않습니다.</li>
         <li>회원탈퇴 후 등록하신 상품문의 및 후기, 댓글은 삭제되지 않으며, 회원정보 삭제로 인해 작성자 본인을 확인할 수 없어 편집 및 삭제처리가 원천적으로 불가능 합니다.</li>
         <li>이미 결제가 완료된 건은 탈퇴로 취소되지 않습니다.</li>
      </ul>
      <div style="width: 100%; margin-bottom:10px; box-sizing: border-box; border: thin; border-style: solid; border-color: lightgray; border-radius: 10px; padding-top: 10px; padding-left: 10px; padding-right: 10px; padding-bottom: 5px;">
         <input type="checkbox" id="customCheck">
         <label for="customCheck" style="display:inline;">회원탈퇴 시 유의사항 안내를 확인하였으며 이에 동의합니다.</label>
      </div>
      <form action="mdelete" method="post" style="text-align:center;">
         <button class="btn btn-dark">회원 탈퇴임</button>
      </form>
      </div>
   </div>
</body>
</html>