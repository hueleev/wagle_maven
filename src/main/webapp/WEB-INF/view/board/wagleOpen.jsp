<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/common/header.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link href="https://fonts.googleapis.com/css?family=Yeon+Sung" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<title>Insert title here</title>
 <link rel="stylesheet" href="//mugifly.github.io/jquery-simple-datetimepicker/jquery.simple-dtpicker.css">
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
<script src="//mugifly.github.io/jquery-simple-datetimepicker/jquery.simple-dtpicker.js"></script>

<script>
   $(function(){
       $('#datepicker').appendDtpicker({
          'locale':'ko',
          "dateOnly": true,
         "dateFormat": "YYYY-MM-DD",
         "futureOnly":true
          });
   });
   $(function(){
      $('#datepicker2').appendDtpicker({
         'locale':'ko',
          "dateOnly": true,
         "dateFormat": "YYYY-MM-DD",
         "futureOnly":true
          });
   });
   $(function(){
      $('#datepicker3').appendDtpicker({
         'locale':'ko',
         "dateFormat": "YYYY-MM-DD h:m",
         "futureOnly":true
         });
   });
   $(function(){
      $('#datepicker4').appendDtpicker({
            'locale':'ko',
            "dateFormat": "YYYY-MM-DD h:m",
            "futureOnly":true
         });
   });
</script>
<style>
   section.R{
       /* font-family: 'Yeon Sung', cursive; */
       
   }
   section.openIntro{
      height: 40vh;
      margin-bottom:8vh;
      font-family: 'Yeon Sung', cursive;
   }
   section.bottom{
        height: 20vh;
        margin-bottom:20vh;
        font-family: 'Yeon Sung', cursive;
   }
</style>
</head>
<body>
   <section class="openIntro">
    <div class="w3-display-topmiddle w3-container" style="top:150px;">
   <a style="font-size:3.4rem;"> 
    �ͱ� ���Ⱑ �Ƿ��� ?</a><br>
    <a style="font-size:2.5rem;">
    1. ����� �� ���Ѿ� �ؿ�  - <br>
    2. �������� �������� �ȵſ� - <br>
    3. �� ������ �����ֽø� �� �� �־�� :)
    </a>
    </div>
    </section>
    
    <section class="R" style="height:40vh;">
    <hr style="border-top:1px dotted #FCB043; width: 60%; margin-left:300px;">
    <p style="font-size:1.5rem; text-align:center;">���ɺ� ī�װ��� �α��ִ� �ͱ� ������Ȳ</p><br>
     <%@include file="RScript.jsp" %>
   </section>
    
    <section class="bottom">
       <div class="w3-display-bottommiddle" style="top:950px;">
       <p style="font-size:2.8rem; text-align:center;">�ͱ� ���Ⱑ �� �غ� �Ǽ̳��� ?</p><br>
       <a class="fa fa-angle-double-down w3-display-bottommiddle" style="font-size:48px;color:#eb4a2c;top:100px;"></a>
      </div>
   </section>

   
   <c:if test="${sessionEmail==null}">
      <section style="height: 40vh;background-color:#FCB043;">
         <center>
         <button class="w3-btn w3-yellow w3-round w3-hover w3-hover-white" onclick="document.location.href='${pageContext.request.contextPath}/member/joinForm'"
               style="margin-top:10vh;">Login</button>
         </center>
      </section>
   </c:if>
   

   <c:if test="${sessionEmail!=null}">
   <section class="openForm" style="background-color:#FCB043; padding-top:100px; padding-bottom:50px;">
      <center>
      <div class="w3-round w3-card-4 w3-padding-large w3-white" style="width:40%;">
         <form method="post" enctype="multipart/form-data" action="wagleOpenPro">
         <input type="hidden" name="whost" value="${whost}"/>
         <input type="hidden" name="whostemail" value="${whostemail}"/>
         <br>
         <h2><b>WAGLE OPEN</b></h2><br>
         <table class="w3-table " cellspacing="20">
         
         <tr>
         <td class="w3-leftbar w3-border-yellow">�ͱ� �̸�</td>
         <td><input class="w3-input w3-animate-input" style="width:50%" name="wname" type="text"></td>
         </tr>
         
         <tr>
         <td class="w3-leftbar w3-border-yellow">�ͱ� ����</td>
         <td>${whost}</td>
         </tr>
         
         <tr>
         <td class="w3-leftbar w3-border-yellow">�ͱ� ���� �Ұ�</td>
         <td><textarea class="w3-input w3-border" name="wprofile" rows="4" cols="15"></textarea></td>
         </tr>
         
         <tr>
         <td class="w3-leftbar w3-border-yellow">ī�װ�</td>
         <td>
            <select  name="wcategory">
                 <option  value="������">������</option>
                 <option  value="����">����</option>
                 <option  value="�丮/����">�丮/����</option>
                 <option  value="�ι���/å">�ι���/å</option>
                 <option  value="��ȭ/����">��ȭ/����</option>
                 <option  value="�米/�θ�">�米/�θ�</option>
                 <option  value="�ܱ�/���">�ܱ�/���</option>
            </select>       
         </td>
         </tr>
         
         <tr>
         <td class="w3-leftbar w3-border-yellow">�ִ� �ο�</td>
         <td>
            <select name="wmax">
                 <option  value="15">15��</option>
                 <option  value="16">16��</option>
                 <option  value="17">17��</option>
                 <option  value="18">18��</option>
                 <option  value="19">19��</option>
                 <option  value="20">20��</option>
            </select>
         </td>
         </tr>
         
         <tr>
         <td class="w3-leftbar w3-border-yellow">����</td>
         <td>
            <input type="radio" class="w3-radio" name="wloc" value="����Ư���� ������ �����źϷ� 21" checked>&nbsp;���� &nbsp;&nbsp;
              <input type="radio" class="w3-radio" name="wloc" value="����Ư���� ������ ������� 132 �ѵ���ǰ���� 8�� �ֿ뱳������">&nbsp;����
         </td>
         </tr>
         
         <tr>
         <td class="w3-leftbar w3-border-yellow">�ͱ� �Ⱓ</td>
         <td>
            <input type="text" name="wstart" id="datepicker" value="">&nbsp;&nbsp;~&nbsp;&nbsp;
            <input type="text" name="wend" id="datepicker2" value="">
         </td>
         </tr>   
         
         
         <tr>
            
            <td class="w3-leftbar w3-border-yellow">�ٰ����� ����</td>
            <td>
            <input style="width:50%; border-top:0; border-left:0; border-right:0;" type="text" name="wevent1" placeholder="���� 1 : �� ���� ������ �����ּ���!">
            <input type="text" name="weventdate1" id="datepicker3" value=""><br><br>
            <input style="width:50%; border-top:0; border-left:0; border-right:0;" type="text" name="wevent2" placeholder="���� 2 : �� ���� ������ �����ּ���!">
            <input type="text" name="weventdate2" id="datepicker4" value="">
            </td>
         </tr>
         
         <tr>
            <td class="w3-leftbar w3-border-yellow">�ͱ� �Ұ�</td>
            <td><textarea class="w3-input w3-border w3-margin-bottom" name="wintro" rows="4" cols="15"></textarea></td>
         </tr>
         
         <tr>
            <td class="w3-leftbar w3-border-yellow">�׷��̹���<br/>���ε�</td>
            <td><input class="w3-input w3-border" name="uploadfile" type="file"></td>
         </tr>
         
         <tr>
            <td colspan="2" class="w3-center">
            <br>
            <input class="w3-btn w3-round w3-yellow" type="submit" value="Open">
            <br><br>
            </td>
         </tr>
         
         </table>
         </form>
      </div>
   
      
   </center>
   </section></c:if>

</body>
</html>