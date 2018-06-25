<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
 <link rel="stylesheet" href="//mugifly.github.io/jquery-simple-datetimepicker/jquery.simple-dtpicker.css">
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
<script src="//mugifly.github.io/jquery-simple-datetimepicker/jquery.simple-dtpicker.js"></script>
<script>
   $(function(){
       $('#datepicker').appendDtpicker({
          'locale':'ko',
          "dateOnly": true,
         "dateFormat": "YYYY-MM-DD",
          });
   });

   $(function(){
      $('#datepicker2').appendDtpicker({
         'locale':'ko',
          "dateOnly": true,
         "dateFormat": "YYYY-MM-DD"/* ,
         "futureOnly":true */
          });
   });

   $(function(){
      $('#datepicker3').appendDtpicker({
         'locale':'ko',
         "dateFormat": "YYYY-MM-DD h:m"/* ,
         "futureOnly":true */
         });
   });

   $(function(){
      $('#datepicker4').appendDtpicker({
         'locale':'ko',
         "dateFormat": "YYYY-MM-DD h:m"/* ,
         "futureOnly":true */
         });
   });
</script>

<title>Insert title here</title>
</head>
<body>
<%@include file="/common/header.jsp" %>
   <center>
   <div class="w3-round w3-card-4 w3-padding-large" style="width:40%; margin-top:100px; margin-bottom:110px;">
   <form method="post" enctype="multipart/form-data" action="wagleUpdatePro">
      <br>
      <input type="hidden" name="whost" value="${wagle.whost}"/>
      <input type="hidden" name="wboardid" value="${wagle.wboardid}"/>
      <input type="hidden" name="name" value="${wagle.filename}"/>
      <input type="hidden" name="size" value="${wagle.filesize}"/>
      <input type="hidden" name="pageNum"   value="${pageNum}"/>
      <h2><b>�ͱ� ����</b></h2>
      <table class="w3-table " cellspacing="20">
         
         <tr>
            <td class="w3-leftbar w3-border-yellow">�ͱ� �̸�</td>
            <td><input class="w3-input w3-animate-input" style="width:50%" name="wname" type="text" value="${wagle.wname}"></td>
         </tr>
      
         <tr>
            <td class="w3-leftbar w3-border-yellow">�ͱ� ����</td>
            <td>${wagle.whost}</td>
         </tr>
      
         <tr>
            <td class="w3-leftbar w3-border-yellow">�ͱ� ���� �Ұ�</td>
            <td><textarea class="w3-input w3-border" name="wprofile" rows="4" cols="15">${wagle.wprofile}</textarea></td>
         </tr>
         
         <tr>
         <td class="w3-leftbar w3-border-yellow">ī�װ�</td>
            <td>
            
               <select name="wcategory">
                 <option  value="������" <c:if test="${wagle.wcategory eq '������'}"> selected </c:if>> ������</option>
                 <option  value="����" <c:if test="${wagle.wcategory eq '����'}"> selected </c:if>>����</option>
                 <option  value="�丮/����" <c:if test="${wagle.wcategory eq '�丮/����'}"> selected </c:if>>�丮/����</option>
                 <option  value="�ι���/å" <c:if test="${wagle.wcategory eq '�ι���/å'}"> selected </c:if>>�ι���/å</option>
                 <option  value="��ȭ/����" <c:if test="${wagle.wcategory eq '��ȭ/����'}"> selected </c:if>>��ȭ/����</option>
                 <option  value="�米/�θ�" <c:if test="${wagle.wcategory eq '�米/�θ�'}"> selected </c:if>>�米/�θ�</option>
                 <option  value="�ܱ�/���" <c:if test="${wagle.wcategory eq '�ܱ�/���'}"> selected </c:if>>�ܱ�/���</option>
               </select>
            </td>
         </tr>
         
         
         <tr>
            <td class="w3-leftbar w3-border-yellow">�ִ� �ο�</td>
            <td>
               <b>���� ȸ����&nbsp;</b> ${all}�� /
               <select name="wmax">
                 <option  value="15" <c:if test="${wagle.wmax==15}"> selected </c:if>>15��</option>
                 <option  value="16" <c:if test="${wagle.wmax==16}"> selected </c:if>>16��</option>
                 <option  value="17" <c:if test="${wagle.wmax==17}"> selected </c:if>>17��</option>
                 <option  value="18" <c:if test="${wagle.wmax==18}"> selected </c:if>>18��</option>
                 <option  value="19" <c:if test="${wagle.wmax==19}"> selected </c:if>>19��</option>
                 <option  value="20" <c:if test="${wagle.wmax==20}"> selected </c:if>>20��</option>
               </select>
            </td>
         </tr>
      
            
         <tr>
            <td class="w3-leftbar w3-border-yellow">����</td>   
            <td>
               <input type="radio" class="w3-radio" name="wloc" value="����Ư���� ������ �����źϷ� 21"
               <c:if test="${wagle.wloc eq '����Ư���� ������ �����źϷ� 21'}">checked</c:if>>&nbsp;���� &nbsp;&nbsp;
                 <input type="radio" class="w3-radio" name="wloc" value="����Ư���� ������ ������� 132 �ѵ���ǰ���� 8�� �ֿ뱳������"
                 <c:if test="${wagle.wloc eq '����Ư���� ������ ������� 132 �ѵ���ǰ���� 8�� �ֿ뱳������'}">checked</c:if>>&nbsp;����
            </td>
         </tr>
            

         <tr>
            <c:if test="${today > wagle.wend}">
            <td class="w3-panel w3-leftbar w3-border-red" style="color:red"><b>�Ⱓ</b></td>
            </c:if>
            <c:if test="${today <= wagle.wend}">
            <td class="w3-panel w3-leftbar w3-border-yellow">�Ⱓ</td>
            </c:if>
            <td>
            <input type="text" name="wstart" id="datepicker" value="${wagle.wstart}">&nbsp;&nbsp;~&nbsp;&nbsp;
            <input type="text" name="wend" id="datepicker2" value="${wagle.wend}">
            </td>
         </tr>
            
            
            
            <c:if test="${today > wagle.wend}">
            <tr>
            <td></td>
            <td style="color:red">�Ⱓ�� �������ּ��� !</td>
            </tr>
            </c:if>
               
            <tr>
            <c:if test="${today > wagle.weventdate1 || today > wagle.weventdate2}">
            <td class="w3-leftbar w3-border-red" style="color:red;"><b>�ٰ����� ����</b></td></c:if>
            
            <c:if test="${today <= wagle.weventdate1 && today <= wagle.weventdate2}">
            <td class="w3-leftbar w3-border-yellow">�ٰ����� ����</td></c:if>
            <td>
            
            <c:if test="${today > wagle.weventdate1}"><a style="color:red;"></c:if>
            <c:if test="${today <= wagle.weventdate1}"><a></c:if>

            <b>1 : </b></a>
            <input style="width:50%; border-top:0; border-left:0; border-right:0;" type="text" name="wevent1" value="${wagle.wevent1}">
            <input type="text" name="weventdate1" id="datepicker3" value="${wagle.weventdate1}"><br>
            <br>
            <c:if test="${today > wagle.weventdate2}"><a style="color:red;"></c:if>
            <c:if test="${today <= wagle.weventdate2}"><a></c:if>
            <b>2 : </b></a>
            <input style="width:50%; border-top:0; border-left:0; border-right:0;" type="text" name="wevent2"  value="${wagle.wevent2}">
            <input type="text" name="weventdate2" id="datepicker4" value="${wagle.weventdate2}">
            </td>
            </tr>
            
            <c:if test="${today > wagle.weventdate1 || today > wagle.weventdate2}">
            <tr>
            <td></td>
            <td style="color:red">������ �������ּ��� !</td>
            </tr>
            </c:if>
            
            
            <tr style="width:200px; height:200px">
               <td class="w3-leftbar w3-border-yellow">�ͱ� �Ұ�</td>
               <td><textarea class="w3-input w3-border w3-margin-bottom" name="wintro" rows="4" cols="15">${wagle.wintro}</textarea></td>
            </tr>
            
            <tr>
               <td class="w3-leftbar w3-border-yellow">�׷��̹���<br/>���ε�</td>
               <td>
               <img src="${pageContext.request.contextPath}/wagleimg/${wagle.filename}" style="height:300px; width:300px;">
               <br><br>
               <input class="w3-input w3-border" name="uploadfile" type="file"></td>
            </tr>
            
            <tr>
            <td colspan="2" class="w3-center">
            <button class="w3-btn w3-yellow w3-round w3-padding" type="submit">����</button>
            <a class="w3-btn w3-red w3-round w3-padding" href="wagleDelete?wboardid=${wagle.wboardid}">����</a>
            <a class="w3-btn w3-yellow w3-round w3-padding" href="mylist" style="size:auto;">���</a>
            </td>
            </tr>
         </table>
   </form>
   </div>
   </center>
</body>
</html>