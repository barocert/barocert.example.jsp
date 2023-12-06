<%--
===================================================================================
* Barocert Service jsp Example
*
* Class Module for base module for Barocert API SDK. It include base functionality for
* RESTful web service request and parse json result. It uses Linkhub class module
* to accomplish authentication APIs.

* Update date : 2023-12-06
===================================================================================
--%>

<%@page errorPage="/exception.jsp" %>

<jsp:useBean id="navercertService" scope="application" class="com.barocert.navercert.NavercertServiceImp"/>

<%-- 링크아이디 --%>
<jsp:setProperty name="navercertService" property="linkID" value="TESTER"/>

<%-- 비밀키, 사용자 인증에 사용되는 정보이므로 유출에 주의 --%>
<jsp:setProperty name="navercertService" property="secretKey" value="SwWxqU+0TErBXy/9TVjIPEnI0VTUMMSQZtJf3Ed8q3I="/>

<%-- 인증토큰 발급 IP 제한 On/Off, true-사용, false-미사용  기본값(true)--%>
<jsp:setProperty name="navercertService" property="IPRestrictOnOff" value="true"/>

<%-- Barocert API 서비스 고정 IP 사용여부, true-사용, false-미사용, 기본값(false) --%>
<jsp:setProperty name="navercertService" property="useStaticIP" value="false"/>
