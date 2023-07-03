<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/main.css" media="screen" />
        <title>Barocert Service jsp Example</title>
    </head>

<%@ include file="common.jsp" %>

<%@page import="com.barocert.BarocertException"%>
<%@page import="com.barocert.passcert.sign.SignResult"%>
<%@page import="com.barocert.passcert.sign.SignVerify"%>

<%
    /*
     * 전자서명 요청시 반환된 접수아이디를 통해 서명을 검증합니다.
     */

    // 이용기관코드, 파트너가 등록한 이용기관의 코드, (파트너 사이트에서 확인가능)
    String clientCode = "023030000004";

    // 전자서명 요청시 반환된 접수아이디
    String receiptID = "02304050230300000040000000000007";
    
    // 검증 요청 정보 객체
    SignVerify request = new SignVerify();
    // 검증 요청자 휴대폰번호 - 11자 (하이픈 제외)
    request.setReceiverHP(passcertService.encrypt("01012341234")); 
    // 검증 요청자 성명
    request.setReceiverName(passcertService.encrypt("홍길동"));

    SignResult result = null;

    try {
        
        result = passcertService.verifySign(clientCode, receiptID, request);
         
    } catch(BarocertException pe) {
        throw pe;
  }
%>
    <body>
        <div id="content">
            <p class="heading1">Response</p>
            <br/>
            <fieldset class="fieldset1">
                <legend>패스 전자서명 검증</legend>
                <ul>
                    <li>접수 아이디 (ReceiptID) : <%=result.getReceiptID()%></li>
                    <li>상태 (State) : <%=result.getState()%></li>
                    <li>수신자 성명 (ReceiverName) : <%=result.getReceiverName()%></li>
                    <li>수신자 생년월일 (ReceiverBirthday) : <%=result.getReceiverBirthday()%></li>
                    <li>수신자 성별 (ReceiverGender) : <%=result.getReceiverGender()%></li>
                    <li>수신자 휴대폰번호 (ReceiverHP) : <%=result.getReceiverHP()%></li>
                    <li>통신사유형 (TelcoType) : <%=result.getTelcoType()%></li>
                    <li>전자서명 데이터 전문 (SignedData) : <%=result.getSignedData()%></li>
                    <li>연계정보 (CI) : <%=result.getCi()%></li>
                </ul>
            </fieldset>
        </div>
    </body>
</html>
