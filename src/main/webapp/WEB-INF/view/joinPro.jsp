<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<title>Insert title here</title>
</head>
<body>
	<c:if test="${!result}">
 		<script language="JavaScript">
		alert("Wagle�� ȸ���� �ǽŰ� ȯ���մϴ�!! �α������ּ��� !")
		</script>
		<meta http-equiv="Refresh" content="0;url=${pageContext.request.contextPath}/member/joinForm">
	</c:if> 
	<c:if test="${result}">
		<script>
		alert("�̸����� �ߺ��˴ϴ�. �ٸ� �̸����� �Է����ּ���.")
		history.go(-1);
		</script>
	</c:if>

</body>
</html>