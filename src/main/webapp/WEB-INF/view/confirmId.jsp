<%@page import="wagle.members.MemberDBMybatis"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>�̸��� �ߺ�Ȯ��</title>
</head>
<body>
<c:if test="${result}">
 	<center>
 	<br/><br/>
 	<h4>${email}�� �̹� ������� �̸����Դϴ�.</h4>
 	</center>
</c:if>

<c:if test="${!result}">
	<center>
	<br/><br/>
	<h4>�Է��Ͻ�  ${email}�� ����� �� �ִ� �̸����Դϴ�.</h4>
	</center>

</c:if>

</body>
</html>