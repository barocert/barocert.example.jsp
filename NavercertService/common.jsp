<%--
===================================================================================
* Barocert NAVER API Java SDK JSP Example
*
* 업데이트 일자 : 2024-04-16
* 연동기술지원 연락처 : 1600-9854
* 연동기술지원 이메일 : code@linkhubcorp.com
*         
* <테스트 연동개발 준비사항>
*   1) API Key 변경 (연동신청 시 메일로 전달된 정보)
*       - LinkID : 링크허브에서 발급한 링크아이디
*       - SecretKey : 링크허브에서 발급한 비밀키
*   2) ClientCode 변경 (연동신청 시 메일로 전달된 정보)
*       - ClientCode : 이용기관코드 (파트너 사이트에서 확인가능)
*   3) SDK 환경설정 필수 옵션 설정
*       - IPRestrictOnOff : 인증토큰 IP 검증 설정, true-사용, false-미사용, (기본값:true)
*       - UseStaticIP : 통신 IP 고정, true-사용, false-미사용, (기본값:false)
*
* Class Module for base module for Barocert API SDK. It include base functionality for
* RESTful web service request and parse json result. It uses Linkhub class module
* to accomplish authentication APIs.
===================================================================================
--%>

<%@page errorPage="/exception.jsp" %>

<jsp:useBean id="navercertService" scope="application" class="com.barocert.navercert.NavercertServiceImp"/>

<%-- 링크아이디 --%>
<jsp:setProperty name="navercertService" property="linkID" value="TESTER"/>

<%-- 비밀키 --%>
<jsp:setProperty name="navercertService" property="secretKey" value="SwWxqU+0TErBXy/9TVjIPEnI0VTUMMSQZtJf3Ed8q3I="/>

<%-- 인증토큰 IP 검증 설정, ture-사용, false-미사용, (기본값:true) --%>
<jsp:setProperty name="navercertService" property="IPRestrictOnOff" value="true"/>

<%-- 통신 고정 IP, true-사용, false-미사용, (기본값:false) --%>
<jsp:setProperty name="navercertService" property="useStaticIP" value="false"/>
