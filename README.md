
# Wagle _ Community Platform
### 'Wagle' = 와글거리다; 사람들이 한 곳에 모여 떠들다.
동호회 개념의 소규모/대규모 그룹을 오픈하는 온라인 커뮤니티 플랫폼

## 기획 의도

 최근 지친 현대인들이 원데이 클래스나 동호회를 찾는 점에서 아이디어를 착안
  - 비슷한 관심사와 가치관을 나눌 수 있는 소통 공간
  - 원하는 것을 배울 수 있는 자유
  - 재능 기부 가능

## 주요 기능
  - 그룹 오픈 가능 (기간/인원수 설정)
  - 원하는 그룹에 참여 / 탈퇴 가능
  - 그룹 후기 작성
  - 쪽지 기능
  - 그룹원 채팅 가능 (로컬로 구현함)

## 본인 역할
  - Front (html / css / w3s / javascript)
    - 전체 그룹 관련 페이지 (그룹 오픈 / 수정 / 관리 / 리스트 / 내용 보기)
    - 쪽지
    - FAQ
  - Back 
    - 전체 그룹 관련 페이지 구현 (R / mapAPI 제외)
      (그룹 생성/삭제/수정/관리/가입/탈퇴)
    - 프로젝트 Maven 변환
    
## 개발환경
  - JDK : 1.8
  - IDE : Eclipse EE
  - Server :: Apache Tomcat
  - Framework : Spring MVC
  - DB : Oracle 11g / mybaits
  - Maven Project
  - [전체 소스](https://github.com/hueleev/wagle_maven)
  - [포트폴리오](https://github.com/hueleev/wagle_maven/files/2133026/WAGLE.pdf)
  - 로컬에서 동작하는 프로그램이므로 Oracle 설치, scott.sql 참고하여 테이블 생성 후 실행하여야 함.
  
## web.xml
~~~java
<?xml version="1.0" encoding="EUC-KR"?>
<web-app xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns="http://xmlns.jcp.org/xml/ns/javaee" xmlns:jsp="http://java.sun.com/xml/ns/javaee/jsp" xsi:schemaLocation="http://xmlns.jcp.org/xml/ns/javaee http://xmlns.jcp.org/xml/ns/javaee/web-app_3_1.xsd" id="WebApp_ID" version="3.1">
  <display-name>wagle_spring5555</display-name>
  <welcome-file-list>
    <welcome-file>index.html</welcome-file>
    <welcome-file>index.htm</welcome-file>
    <welcome-file>index.jsp</welcome-file>
    <welcome-file>default.html</welcome-file>
    <welcome-file>default.htm</welcome-file>
    <welcome-file>default.jsp</welcome-file>
  </welcome-file-list>
  <servlet>
    <servlet-name>wagle</servlet-name>
    <servlet-class>org.springframework.web.servlet.DispatcherServlet</servlet-class>
    <load-on-startup>1</load-on-startup>
  </servlet>
  
  
  <servlet-mapping>
    <servlet-name>wagle</servlet-name>
    <url-pattern>/</url-pattern>
  </servlet-mapping>
  
  <servlet-mapping>
    <servlet-name>default</servlet-name>
    <url-pattern>*.jpg</url-pattern>
     <url-pattern>*.css</url-pattern>
     <url-pattern>*.png</url-pattern>
  </servlet-mapping>
  
  
  <filter>
    <filter-name>encodingFilter</filter-name>
    <filter-class>org.springframework.web.filter.CharacterEncodingFilter</filter-class>
    <init-param>
      <param-name>encoding</param-name>
      <param-value>euc-kr</param-value>
    </init-param>
  </filter>
  <filter-mapping>
    <filter-name>encodingFilter</filter-name>
    <url-pattern>/*</url-pattern>
  </filter-mapping>
</web-app>
 ~~~
 
 ## wagle-servlet.xml
 ~~~java
 <?xml version="1.0" encoding="UTF-8"?>
<beans xmlns="http://www.springframework.org/schema/beans" 
xmlns:mvc="http://www.springframework.org/schema/mvc"
xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
xsi:schemaLocation="http://www.springframework.org/schema/beans 
http://www.springframework.org/schema/beans/spring-beans.xsd
http://www.springframework.org/schema/mvc
http://www.springframework.org/schema/mvc/spring-mvc.xsd">
	
		
	<mvc:annotation-driven/>
	<mvc:view-controller path="/index" view-name="index"/>
	<mvc:default-servlet-handler/>
	
	<bean class="wagle.controller.MemberController"/>
	<bean class="wagle.controller.BoardController"/>
	<bean class="wagle.controller.MessageController"/>
	<bean class="wagle.controller.AdminController"/>
	<bean class="wagle.controller.ChatController"/>
	<bean id="multipartResolver" 
         class="org.springframework.web.multipart.commons.CommonsMultipartResolver">
   	</bean> 
	
	<bean id="viewResolver" 
			class="org.springframework.web.servlet.view.InternalResourceViewResolver">
			<property name="prefix" value="/WEB-INF/view/"/>
			<property name="suffix" value=".jsp"/>
	</bean> 
</beans>
~~~



