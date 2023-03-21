<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/main.css" media="screen" />
		<title>Barocert Kakaocert Service jsp Example.</title>
	</head>

<%@ include file="common.jsp" %>

<%@page import="com.barocert.BarocertException"%>
<%@page import="com.barocert.kakaocert.verifyauth.VerifyAuthResult"%>

<%
	/*
	 * 본인인증 요청시 반환된 접수아이디를 통해 본인인증 서명을 검증합니다.
	 * - https://verifyAuth
	 */

    // 이용기관코드, 파트너가 등록한 이용기관의 코드, (파트너 사이트에서 확인가능)
    String clientCode = "023030000003";

    // 전자서명 요청시 반환된 접수아이디
    String receiptID = "0230322082052000000000000000000000000001";
    
    VerifyAuthResult result = null;

    try {
    	
    	result = kakaocertService.verifyAuth(clientCode, receiptID);
         
    } catch(BarocertException ke) {
        throw ke;
  }
%>
    <body>
        <div id="content">
            <p class="heading1">Response</p>
            <br/>
            <fieldset class="fieldset1">
                <legend>본인인증 검증</legend>
                <ul>
                    <li>접수 아이디 (ReceiptID) : <%=result.getReceiptID()%></li>
                    <li>상태 (State) : <%=result.getState()%></li>
                    <li>전자서명 데이터 전문 (Token) : <%=result.getToken()%></li>
                </ul>
            </fieldset>
        </div>
    </body>
</html>
