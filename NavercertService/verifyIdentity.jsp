<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/main.css" media="screen" />
        <title>Barocert Service jsp Example</title>
    </head>

<%@ include file="common.jsp" %>

<%@page import="com.barocert.BarocertException"%>
<%@page import="com.barocert.navercert.identity.IdentityResult"%>

<%
    /*
     * 완료된 전자서명을 검증하고 전자서명값(signedData)을 반환 받습니다.
     * 반환받은 전자서명값(signedData)과 [1. RequestIdentity] 함수 호출에 입력한 Token의 동일 여부를 확인하여 이용자의 본인인증 검증을 완료합니다.
     * 네이버 보안정책에 따라 검증 API는 1회만 호출할 수 있습니다. 재시도시 오류가 반환됩니다.
     * https://developers.barocert.com/reference/naver/java/identity/api#VerifyIdentity
     */

    // 이용기관코드, 파트너가 등록한 이용기관의 코드 (파트너 사이트에서 확인가능)
    String clientCode = "023060000088";

    // 본인인증 요청시 반환된 접수아이디
    String receiptID = "02309050230600000880000000000013";
    
    IdentityResult result = null;

    try {
        
        result = navercertService.verifyIdentity(clientCode, receiptID);
        
    } catch(BarocertException ke) {
        throw ke;
    }
%>
    <body>
        <div id="content">
            <p class="heading1">Response</p>
            <br/>
            <fieldset class="fieldset1">
                <legend>네이버 본인인증 검증</legend>
                <ul>
                    <li>ReceiptID (접수 아이디) : <%=result.getReceiptID()%></li>
                    <li>State (상태) : <%=result.getState()%></li>
                    <li>ReceiverName (수신자 성명) : <%=result.getReceiverName()%></li>
                    <li>ReceiverYear (수신자 출생년도) : <%=result.getReceiverYear()%></li>
                    <li>ReceiverDay (수신자 출생월일) : <%=result.getReceiverDay()%></li>
                    <li>ReceiverHP (수신자 휴대폰번호) : <%=result.getReceiverHP()%></li>
                    <li>ReceiverGender (수신자 성별) : <%=result.getReceiverGender()%></li>
                    <li>ReceiverEmail (수진자 이메일) : <%=result.getReceiverEmail()%></li>
                    <li>ReceiverForeign (외국인 여부) : <%=result.getReceiverForeign()%></li>
                    <li>SignedData (전자서명 데이터 전문) : <%=result.getSignedData()%></li>
                </ul>
            </fieldset>
        </div>
    </body>
</html>