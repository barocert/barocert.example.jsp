<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/main.css" media="screen" />
        <title>Barocert Service jsp Example</title>
    </head>

<%@ include file="common.jsp" %>

<%@page import="com.barocert.BarocertException"%>
<%@page import="com.barocert.passcert.login.LoginResult"%>
<%@page import="com.barocert.passcert.login.LoginVerify"%>

<%
    /*
     * 간편로그인 요청시 반환된 접수아이디를 통해 검증합니다.
     */

    // 이용기관코드, 파트너가 등록한 이용기관의 코드 (파트너 사이트에서 확인가능)
    String clientCode = "023030000004";

    // 간편로그인 요청시 반환된 접수아이디
    String receiptID = "02307060230600000440000000000010";
    
    // 검증 요청 정보
    LoginVerify loginVerify = new LoginVerify();
    // 간편로그인 검증 요청 휴대폰번호 - 11자 (하이픈 제외)
    loginVerify.setReceiverHP(passcertService.encrypt("01012341234")); 
    // 간편로그인 검증 요청 성명 - 최대 80자
    loginVerify.setReceiverName(passcertService.encrypt("홍길동")); 

    LoginResult result = null;

    try {
        
        result = passcertService.verifyLogin(clientCode, receiptID, loginVerify);
        result.setReceiverName(result.getReceiverName());
        result.setReceiverBirthday(result.getReceiverBirthday());
        result.setReceiverGender(result.getReceiverGender());
        result.setReceiverTelcoType(result.getReceiverTelcoType());
        
    } catch(BarocertException pe) {
        throw pe;
    }
%>
    <body>
        <div id="content">
            <p class="heading1">Response</p>
            <br/>
            <fieldset class="fieldset1">
                <legend>패스 간편로그인 검증</legend>
                <ul>
                    <li>접수 아이디 (ReceiptID) : <%=result.getReceiptID()%></li>
                    <li>상태 (State) : <%=result.getState()%></li>
                    <li>수신자 성명 (ReceiverName) : <%=result.getReceiverName()%></li>
                    <li>수신자 생년월일 (ReceiverBirthday) : <%=result.getReceiverBirthday()%></li>
                    <li>수신자 성별 (ReceiverGender) : <%=result.getReceiverGender()%></li>
                    <li>통신사 유형 (ReceiverTelcoType) : <%=result.getReceiverTelcoType()%></li>
                    <li>전자서명 데이터 전문 (SignedData) : <%=result.getSignedData()%></li>
                    <li>연계정보 (CI) : <%=result.getCi()%></li>
                </ul>
            </fieldset>
        </div>
    </body>
</html>
