<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head><title>ȸ������ ����</title></head>
<body>

	<c:if test="${chk == 1}">
		<script>
		alert("ȸ�������� �����Ǿ����ϴ�.")</script>
		<c:if test="${sessionEmail ne 'admin'}">
			<meta http-equiv="Refresh" content="0;url=updateForm?email=${member.email}">
		</c:if>
		<c:if test="${sessionEmail eq 'admin'}">
			<meta http-equiv="Refresh" content="0;url=${pageContext.request.contextPath}/admin/memberlist">
		</c:if>
	</c:if>
	
	<c:if test="${chk != 1}">
		<script>
		alert("��й�ȣ�� ���� �ʽ��ϴ�")
		history.go(-1);</script>
	</c:if>
</body>
</html>