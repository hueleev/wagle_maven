<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
	<style>
  		body{
  			background-color: rgb(252, 176, 67, 0.9);			
  		}
  		
  	</style>
  	
	<title>Insert title here</title>
</head>
<body>
<div class="w3-container w3-display-middle">

	<div class="w3-round w3-card-4 w3-bar w3-amber">
		<div class="w3-bar w3-orange">
		<a class="w3-bar-item"><b>��й�ȣ</b>&nbsp;ã��</a>
		</div>
	<form class="w3-white" method="post" name="findPwd" action="${pageContext.request.contextPath}/member/findPro">
		<div class="w3-container w3-border">
		<table>
		<tr>
		<td>�̸���&nbsp;</td>
		<td><input type="text" name="email" class="w3-input" style="display: inline-block; "></td>
		</tr>
		
		<tr>
		<td>����&nbsp;</td>
		<td><select class="w3-select w3-border" style="width:70%; display: inline-block; width:100%;" name="pwdQ" >
				<option value="" disabled selected>��й�ȣ ������ �����ϼ���.</option>
	   			<option value="1">����� �¾ ������?</option>
	   			<option value="2">����� ������ �ʵ��б���?</option>
	   			<option value="3">����� ������ ���б���?</option>
	   			<option value="4">����� ������ ����б���?</option>
	     		<option value="5">����� ��Ӵ��� ������?</option>
	      		<option value="6">����� �ƹ����� ������?</option>
	      		<option value="7">����� ģ�Ҿƹ����� ������?</option>
	      		<option value="8">����� ģ�Ҿƹ����� ������?</option>
	      		<option value="9">����� ���Ҿƹ����� ������?</option>
	      		<option value="10">����� ���ҸӴ��� ������?</option>
      		</select></td>
		</tr>
		
		<tr>
		<td>��&nbsp;</td>
		<td><input class="w3-input w3-border" style="width:62%; display: inline-block; width:100%;" name="pwdA">
		</tr>
		
		<tr>
		
		<td colspan="2"><input type="submit" value="Ȯ��" class="w3-button w3-yellow w3-round w3-right"></td>
		</tr>
		
		
		</table>
	
	    </div>
	    </form>
		
	</div>
	

</div> 
</body>
</html>