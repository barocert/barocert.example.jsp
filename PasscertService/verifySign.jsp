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
     * 완료된 전자서명을 검증하고 전자서명값(signedData)을 반환 받습니다.
     * 검증 함수는 전자서명 요청 함수를 호출한 당일 23시 59분 59초까지만 호출 가능합니다.
     * 전자서명 요청 함수를 호출한 당일 23시 59분 59초 이후 검증 함수를 호출할 경우 오류가 반환됩니다.
     * https://developers.barocert.com/reference/pass/java/sign/api#VerifySign
     */

    // 이용기관코드, 파트너가 등록한 이용기관의 코드 (파트너 사이트에서 확인가능)
    String clientCode = "023030000004";

    // 전자서명 요청시 반환된 접수아이디
    String receiptID = "02304050230300000040000000000007";
    
    // 전자서명 검증 요청 정보
    SignVerify signVerify = new SignVerify();
    // 전자서명 검증 요청자 휴대폰번호 - 11자 (하이픈 제외)
    signVerify.setReceiverHP(passcertService.encrypt("01012341234")); 
    // 전자서명 검증 요청자 성명 - 최대 80자
    signVerify.setReceiverName(passcertService.encrypt("홍길동"));

    SignResult result = null;

    try {
        
        result = passcertService.verifySign(clientCode, receiptID, signVerify);
        
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
                    <li>수신자 출생년도 (ReceiverYear) : <%=result.getReceiverYear()%></li>
                    <li>수신자 출생월일 (ReceiverDay) : <%=result.getReceiverDay()%></li>
                    <li>수신자 휴대폰번호 (ReceiverHP) : <%=result.getReceiverHP()%></li>
                    <li>수신자 성별 (ReceiverGender) : <%=result.getReceiverGender()%></li>
                    <li>외국인 여부 (ReceiverForeign) : <%=result.getReceiverForeign()%></li>
                    <li>통신사 유형 (ReceiverTelcoType) : <%=result.getReceiverTelcoType()%></li>
                    <li>전자서명 데이터 전문 (SignedData) : <%=result.getSignedData()%></li>
                    <li>연계정보 (CI) : <%=result.getCi()%></li>
                </ul>
            </fieldset>
        </div>
    </body>
</html>
