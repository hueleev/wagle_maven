<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<title>ȸ����������</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<style>

.row {
  display: table-row;
  background: #fff;
}

.row.header {
  color: #ffffff;
  background: #FCB043;
}

@media screen and (max-width: 768px) {
  .row {
    display: block;
  }

  .row.header .cell {
    display: none;
  }

  .row .cell:before {
    line-height: 1.2;
    text-transform: uppercase;
    font-weight: unset !important;
    margin-bottom: 13px;
    content: attr(data-title);
    min-width: 98px;
    display: block;
  }
}

.cell {
  display: table-cell;
}


.row .cell {
  color: #666666;
  line-height: 1.2;
  padding-top: 15px;
  padding-bottom: 15px;
  border-bottom: 1px solid #f2f2f2;
}

.row.header .cell {
  color: #fff;
  line-height: 1.2;
  text-align: center;
}

.row .cell:nth-child(1) {
  width: 300px;
  text-align: center;
  padding-left:40px;
}

.row .cell:nth-child(2) {
  width: 500px;
  padding-right:40px;
}

.table, .row {
  width: 800px !important;
}

.row:hover {
  background-color: lightyellow;
}

@media (max-width: 768px) {
  .row {
    border-bottom: 1px solid #f2f2f2;
    padding-bottom: 18px;
    padding-top: 30px;
    padding-right: 15px;
    margin: 0;
  }
  
  .row .cell {
    color: #555555;
    line-height: 1.2;
  }

}
</style>
<script>
	//confirm pwd
 function checkPwd(){
        var f1 = document.forms[0];
        var pw1 = f1.pwd.value;
        var pw2 = f1.confirmPwd.value;
        if(pw1!=pw2){
         document.getElementById('checkPwd').style.color = "red";
         document.getElementById('checkPwd').innerHTML = "������ ��ȣ�� �Է��ϼ���."; 
        }else{
         document.getElementById('checkPwd').style.color = "black";
         document.getElementById('checkPwd').innerHTML = "��ȣ�� Ȯ�� �Ǿ����ϴ�."; 
         
        }
        
       }

</script>

<body>
<%@include file="/common/header.jsp" %>

<!-- signup Form -->
		
		<div class="w3-display-middle">
			<div style="color:grey; text-align:center;">
				<h3><b>ȸ�� ���� ����</b></h3>
			</div>
			<br>
			<div class="wrap-table100 w3-card" >
			 <form  method="post" name="updateForm" onSubmit="return check()" action="${pageContext.request.contextPath}/member/updatePro">
				<div class="table">
						 <input type="hidden" name="email" value="${member.email}"/>	
						<div class="row header">
							<div class="cell">
								<b>${member.name}�� !</b>
							</div>
							<div class="cell" >
								<b>������ �������ּ��� !</b>	
							</div>

						</div>
	
						<div class="row">
							<div class="cell">
								�̸�
							</div>
							<div class="cell">
								${member.name}
							</div>
						</div>
						
						<div class="row">
							<div class="cell">
								�̸���
							</div>
							<div class="cell">
								${member.email}
							</div>
						</div>
						
						<div class="row">
							<div class="cell">
								��й�ȣ
							</div>
							<div class="cell">
								<c:if test="${sessionEmail ne 'admin'}">
								<input class="w3-input w3-animate-input" style="width:50%;" type="password" name="pwd" size="20" value="${member.pwd}" required="required">
								</c:if>
								<c:if test="${sessionEmail eq 'admin'}">
								<input class="w3-input w3-animate-input" style="width:50%;" type="text" name="pwd" size="20" value="${member.pwd}" required="required">
								</c:if>
							</div>
						</div>
						
						<c:if test="${sessionEmail ne 'admin'}">
							<div class="row">
								<div class="cell">
									��й�ȣ Ȯ��
								</div>
								<div class="cell">
									<input class="w3-input w3-animate-input" style="width:50%;"  type="password" name="confirmPwd" size="20" onkeyup="checkPwd()" required="required">
									<div id="checkPwd"></div>
								</div>
							</div>
						</c:if>
						
						<div class="row">
							<div class="cell">
								����
							</div>
							<div class="cell">
								${member.gender}
							</div>
						</div>
						
						<div class="row">
							<div class="cell">
								����
							</div>
							<div class="cell">
								 <input type="radio" name="age" value="10��" required="required" <c:if test="${member.age eq '10��'}">checked </c:if>>10��
								 <input type="radio" name="age" value="20��" required="required" <c:if test="${member.age eq '20��'}">checked </c:if>>20��
								 <input type="radio" name="age" value="30��" required="required" <c:if test="${member.age eq '30��'}">checked </c:if>>30��
								 <input type="radio" name="age" value="40��" required="required" <c:if test="${member.age eq '40��'}">checked </c:if>>40��
								 <input type="radio" name="age" value="50��" required="required" <c:if test="${member.age eq '50��'}">checked </c:if>>50��
								 <input type="radio" name="age" value="60��" required="required" <c:if test="${member.age eq '60��'}">checked </c:if>>60��
							</div>
						</div>
						
						<div class="row">
							<div class="cell">
								������
							</div>
							<div class="cell">
								<input class="w3-input w3-animate-input" style="width:50%;" type="text" name="loc" size="10" value="${member.loc}" required="required">	
							</div>
						</div>
						
						
						<div class="row" >
							<div class="cell">
							</div>
							<div class="cell" >
								<input class="w3-btn w3-amber w3-round-xlarge" type="submit" value="��������">
								<c:if test="${sessionEmail ne 'admin'}">
								<input class="w3-btn w3-red w3-round-xlarge" type="button" value="Ż���ϱ�" onclick="window.location.href='deleteForm?email=${member.email}'">
								<input class="w3-btn w3-amber w3-round-xlarge" type="button" value="���" onclick="window.location.href='${pageContext.request.contextPath}/index'">
								</c:if>
								<c:if test="${sessionEmail eq 'admin'}">
								<input class="w3-btn w3-amber w3-round-xlarge" type="button" value="���" onclick="window.location.href='${pageContext.request.contextPath}/admin/memberlist'">
								</c:if>
							</div>

						</div>
				</div>
			 </form>
			</div>
		</div>				

</body>
</html>