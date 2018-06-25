<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en" >

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
  <!-- sidebar-->
  	<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  
  <!-- parallax effect -->
  	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/parallax.css">
  
  <!-- wordeffect -->
  	<link href="https://fonts.googleapis.com/css?family=Shrikhand" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/letter.css">

  <!-- image slide -->
  	<link href='https://fonts.googleapis.com/css?family=Roboto:100,400,300,500,700' rel='stylesheet' type='text/css'>
  	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/slide.css">  
   
   <!-- word cloud -->
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.0/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/jquery.awesomeCloud-0.2.js"></script>
	<link href="http://www.jqueryscript.net/css/jquerysctipttop.css" rel="stylesheet" type="text/css">  
</head>
<body>
  
  <section class="background">
     <div class="content-wrapper">
 
	<!-- side nav -->
	
		<div class="w3-container w3-display-left" style="margin-top: 0px;top: 180px;">
		  <div class="w3-dropdown-hover">
		    <button class="w3-button" style="background-color:#FCB043;">
		    	<i class="fa fa-reorder" style="font-size:36px" onclick="document.location.href='#about'"></i>
		    </button>
		    <div class="w3-dropdown-content w3-bar-block w3-card-4 w3-opacity">
		      <a href="#about" class="w3-bar-item w3-button">About Wagle</a>
		      <a href="${pageContext.request.contextPath}/board/wagleOpen" class="w3-bar-item w3-button">�ͱۿ���</a>
		      <a href="${pageContext.request.contextPath}/board/waglelist" class="w3-bar-item w3-button">�ͱۿͱ�</a>
		      
		    <div class="w3-bar-item w3-button" onclick="myAccFunc()">
				  My Page <i class="fa fa-caret-down"></i></div>
				  <div id="mypage" class="w3-hide w3-white w3-card-4">
				  <c:if test="${sessionEmail == null}">  
				    <a href="${pageContext.request.contextPath}/member/joinForm" class="w3-bar-item w3-button">Login</a>
				  </c:if>
				  <c:if test="${sessionEmail != null}">
				    
				    <label class="w3-right w3-small" style="margin:10px 10px 0px 0px;"> <b>${name}</b> �� ȯ���մϴ�.</label>
				    <c:if test="${count1 != 0 && count1 != null}"> 
			         <div class="w3-right w3-small" style="margin:10px 10px 0px 0px;"><a href="${pageContext.request.contextPath}/message/messagelist">����&nbsp;${count1}<strong><font color="red">N</font></strong></a></div>
			     	 </c:if>
			         <c:if test="${count1 == 0 || count1 == null}">
			         <div class="w3-right w3-small" style="margin:10px 10px 0px 0px;"><a href="${pageContext.request.contextPath}/message/sendmessageForm">����</a></div>
			         </c:if>
				   
				    <a href="${pageContext.request.contextPath}/board/mylist" class="w3-bar-item w3-button">�ͱ۰���</a>
				    <a href="${pageContext.request.contextPath}/member/updateForm?email=${sessionEmail}" class="w3-bar-item w3-button">ȸ������</a>
				   	<c:if test="${sessionEmail ne 'admin'}">
				   	<a href="${pageContext.request.contextPath}/member/logout" class="w3-bar-item w3-button">Logout</a>
				   	</c:if>
				  </c:if>
			</div>
			
			<!-- ������ �߰�  -->
				<c:if test="${sessionEmail eq 'admin'}">
				<div class="w3-bar-item w3-button" onclick="myAdminFunc()">
					Admin Page <i class="fa fa-caret-down"></i></div>
				<div id="adminpage" class="w3-hide w3-white w3-card-4">
				  	<a href="${pageContext.request.contextPath}/admin/memberlist" class="w3-bar-item w3-button">ȸ������</a>
				  	<a href="${pageContext.request.contextPath}/admin/waglelist_ad" class="w3-bar-item w3-button">�׷����</a>
				  	<a href="${pageContext.request.contextPath}/member/logout" class="w3-bar-item w3-button">Logout</a>
				</div>
				</c:if>
				<!--  -->
		      <a href="${pageContext.request.contextPath}/board/faqlist" class="w3-bar-item w3-button">FAQ</a>
		      
		      
		    </div>
		  </div>
		</div>

      <h1>
      	<br>Wagle
		  <br>&nbsp;Wagle
	  </h1>
		<i class="fa fa-angle-double-down" style="font-size:48px; color:#eb4a2c;"></i>
		
    </div>
  </section>
  
  
  <section class="background">
    <div class="content-wrapper" id="about">
      <p class="content-title w3-display-topmiddle" style="margin-top: 200px;font-size: 7vh;"><b>together is better</b></p>
		     <div class="w3-display-middle" style="width:40%; max-width:500px; margin-top:80px;">
		    	<img src="${pageContext.request.contextPath}/img/together.jpg" alt="Norway" style="width:100%;">
			 </div>
	  	   <p class="content-subtitle w3-display-bottommiddle" style="margin-bottom:100px;">
	  	   		����� ���ɻ�� ��ġ���� ���� �� �ִ� ������ ����<br/><br>
	  	   		���ϴ� ���� ��� �� �ִ� ����<br/><br>
	  	   		�Բ� ������ Ŀ�´�Ƽ </p>
	      <button class="w3-btn w3-display-bottommiddle w3-large w3-border w3-border-grey w3-round-xxlarge" onclick="document.location.href='${pageContext.request.contextPath}/member/joinForm'"
	      style="width: 20%;"><b>�ͱ�</b>�� �Բ� �ϽǷ���?</button>

    </div>
  </section>
  
  <section class="background">
    <div class="content-wrapper">
      <p class="content-title">&nbsp;</p>
      <!-- <p class="content-subtitle" style="font-size: 6vh; margin-top: 64px;"><b>���ϴ� �ͱ��� ���ٸ� ?</b></p> -->
      <div id="wordcloud" style="height:650px; width:100%; margin-top: 80px;">
     		 <c:forEach var="word" items="${wordcloud}">
				<c:if test="${today <= word.wend}">
					<c:if test="${word.wreadcount > 50 }">
	                    <span data-weight="${word.wreadcount * 5 / 2}">${word.wname}</span>
	                </c:if>
	                <c:if test="${word.wreadcount < 50 }">
	                    <span data-weight="${word.wreadcount * 5}">${word.wname}</span>
	                </c:if>
                </c:if>
                  <%-- <span data-weight="${word.wreadcount * 5}">${word.wname}</span> --%>

				<%-- ${Math.random() * 100} <- ����  ||  ${word.wreadcount * 5} <= ��ȸ�� --%>
			 </c:forEach>
      </div>
      <div class="w3-center">
     	 <button class="w3-btn w3-display-bottommiddle w3-large w3-border w3-border-grey w3-round-xxlarge" onclick="document.location.href='${pageContext.request.contextPath}/board/wagleOpen'"
     	 style="width: 20%; margin-top: 240px;"><b>�ͱ� ����</b>�� �Ǿ��ּ���!</button>
      </div>
    </div>
  </section>
  

  
  
  <section class="background">
    <div class="content-wrapper">
      <!-- image slide-  -->
      <div align="center" class="fond">
          <div class="contener_slideshow" style="margin-top: 200px; height:400px;">
           
          <div class="contener_slide" 
          		style="animation-duration: 10s;-moz-animation-duration: 10s; -webkit-animation-duration: 10s;-ms-animation-duration: 10s; height:400px;">
           <c:forEach var="imgslide" items="${imgslide}">
              <div class="slid_${number}"><a style="cursor:pointer; height:400px;" onclick="document.location.href='wagleContent?wboardid=${imgslide.wboardid}&wname='+encodeURI('${imgslide.wname}')">
              <c:set var="number" value="${number-1}"/>
              <img src="${pageContext.request.contextPath}/wagleimg/${imgslide.filename}" style="width:610px; height:400px;">
              <div  class="w3-display-topleft w3-large w3-container w3-padding-16 w3-black">${imgslide.wname}</div>
              </a></div>
          </c:forEach> 
          </div>
         </div>
         <button class="w3-btn w3-display-topmiddle w3-large w3-white w3-border w3-border-grey w3-round-xxlarge" onclick="document.location.href='${pageContext.request.contextPath}/board/waglelist'" 
      	style="width:20%;color:grey; margin-top:850px;">�� ���� <b>�ͱ�</b>�� �������Ƿ���?</button>
                                                                                                                                      
      </div>
    </div>
  </section>



  	<script src='https://cdnjs.cloudflare.com/ajax/libs/lodash.js/3.10.1/lodash.min.js'></script>
	<!-- <script src='https://code.jquery.com/jquery-2.1.4.min.js'></script> -->
    <script  src="${pageContext.request.contextPath}/js/parallax.js"></script>
	<script>
	function myAccFunc() {
	    var x = document.getElementById("mypage");
	    if (x.className.indexOf("w3-show") == -1) {
	        x.className += " w3-show";
	        x.previousElementSibling.className += " w3-green";
	    } else { 
	        x.className = x.className.replace(" w3-show", "");
	        x.previousElementSibling.className = 
	        x.previousElementSibling.className.replace(" w3-green", "");
	    }
	}
	
	/* ������ ��ư */
	function myAdminFunc() {
	    var x = document.getElementById("adminpage");
	    if (x.className.indexOf("w3-show") == -1) {
	        x.className += " w3-show";
	        x.previousElementSibling.className += " w3-green";
	    } else { 
	        x.className = x.className.replace(" w3-show", "");
	        x.previousElementSibling.className = 
	        x.previousElementSibling.className.replace(" w3-green", "");
	    }
	}
	</script>
	
	<!-- wordcloud -->
	<script>
      $(document).ready(function() {
         $("#wordcloud").awesomeCloud({
            "size" : {
               "grid" : 20,
               "factor" : 1
            },
            "options" : {
               "color" : "random-dark",
               "rotationRatio" : 0.35
            },
            "font" : "'Helvetica Neue', Times, sans-serif",
            "shape" : "circle"
         });
      });
   </script>
   
   <script type="text/javascript">
      var _gaq = _gaq || [];
      _gaq.push([ '_setAccount', 'UA-36251023-1' ]);
      _gaq.push([ '_setDomainName', 'jqueryscript.net' ]);
      _gaq.push([ '_trackPageview' ]);
      (function() {
         var ga = document.createElement('script');
         ga.type = 'text/javascript';
         ga.async = true;
         ga.src = ('https:' == document.location.protocol ? 'https://ssl'
               : 'http://www')
               + '.google-analytics.com/ga.js';
         var s = document.getElementsByTagName('script')[0];
         s.parentNode.insertBefore(ga, s);
      })();
   </script>
   <!-- end. wordcloud -->
</body>

</html>