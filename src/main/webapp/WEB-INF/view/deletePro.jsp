<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<title>ȸ�� Ż��</title>
</head>
<body>
	<c:if test="${check == 1}">
 		<c:if test="${sessionEmail ne 'admin'}">
 		<script language="JavaScript">
		alert("Ż�� �Ϸ�Ǿ����ϴ�.")
		</script>	
			<meta http-equiv="Refresh" content="0;url=${pageContext.request.contextPath}/index">	
		</c:if>
		<c:if test="${sessionEmail eq 'admin'}">
		<script language="JavaScript">
		alert("������ �Ϸ�Ǿ����ϴ�.")
		</script>	
			<meta http-equiv="Refresh" content="0;url=${pageContext.request.contextPath}/admin/memberlist">
		</c:if>
	</c:if> 
	<c:if test="${check != 1}">
		<script>
		alert("��й�ȣ�� ���� �ʽ��ϴ�")
		history.go(-1);</script>
	</c:if>

</body>
</html>