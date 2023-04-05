<%--
===================================================================================
* Barocert Service jsp Example
*
* Class Module for base module for Barocert API SDK. It include base functionality for
* RESTful web service request and parse json result. It uses Linkhub class module
* to accomplish authentication APIs.

* Update date : 2023-04-05
===================================================================================
--%>

<%@page errorPage="/exception.jsp" %>

<jsp:useBean id="kakaocertService" scope="application" class="com.barocert.kakaocert.KakaocertServiceImp"/>

<%-- 링크아이디 --%>
<jsp:setProperty name="kakaocertService" property="linkID" value="LINKHUB_BC"/>

<%-- 비밀키, 사용자 인증에 사용되는 정보이므로 유출에 주의 --%>
<jsp:setProperty name="kakaocertService" property="secretKey" value="npCAl0sHPpJqlvMbrcBmNagrxkQ74w9Sl0A+M++kMCE="/>

<%-- 인증토큰 발급 IP 제한 On/Off, true-사용, false-미사용  기본값(true)--%>
<jsp:setProperty name="kakaocertService" property="IPRestrictOnOff" value="true"/>

<%-- 인증토큰 발급 IP 제한 On/Off, true-사용, false-미사용  기본값(true)--%>
<jsp:setProperty name="kakaocertService" property="IPRestrictOnOff" value="true"/>

<%-- 로컬시스템 시간 사용여부 true-사용, false-미사용, 기본값(true) --%>
<jsp:setProperty name="kakaocertService" property="useLocalTimeYN" value="true"/>
