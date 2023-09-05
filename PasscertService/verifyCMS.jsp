<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/main.css" media="screen" />
        <title>Barocert Service jsp Example</title>
    </head>

<%@ include file="common.jsp" %>

<%@page import="com.barocert.BarocertException"%>
<%@page import="com.barocert.passcert.cms.CMSResult"%>
<%@page import="com.barocert.passcert.cms.CMSVerify"%>

<%
    /*
     * 완료된 전자서명을 검증하고 전자서명값(signedData)을 반환 받습니다.
     * 검증 함수는 자동이체 출금동의 요청 함수를 호출한 당일 23시 59분 59초까지만 호출 가능합니다.
     * 자동이체 출금동의 요청 함수를 호출한 당일 23시 59분 59초 이후 검증 함수를 호출할 경우 오류가 반환됩니다.
     * https://developers.barocert.com/reference/pass/java/cms/api#VerifyCMS
     */

    // 이용기관코드, 파트너가 등록한 이용기관의 코드 (파트너 사이트에서 확인가능)
    String clientCode = "023030000004";

    // 출금동의 요청시 반환된 접수아이디
    String receiptID = "02304050230300000040000000000008";
    
    // 출금동의 검증 요청 정보
    CMSVerify cmsVerify = new CMSVerify(); 
    // 출금동의 검증 요청자 휴대폰번호 - 11자 (하이픈 제외)
    cmsVerify.setReceiverHP(passcertService.encrypt("01012341234")); 
    // 출금동의 검증 요청자 성명 - 최대 80자
    cmsVerify.setReceiverName(passcertService.encrypt("홍길동"));

    CMSResult result = null;

    try {
        
        result = passcertService.verifyCMS(clientCode, receiptID, cmsVerify);
        
    } catch(BarocertException pe) {
        throw pe;
    }
%>
    <body>
        <div id="content">
            <p class="heading1">Response</p>
            <br/>
            <fieldset class="fieldset1">
                <legend>패스 출금동의 검증</legend>
                <ul>
                    <li>ReceiptID (접수 아이디) : <%=result.getReceiptID()%></li>
                    <li>State (상태) : <%=result.getState()%></li>
                    <li>ReceiverName (수신자 성명) : <%=result.getReceiverName()%></li>
                    <li>ReceiverYear (수신자 출생년도) : <%=result.getReceiverYear()%></li>
                    <li>ReceiverDay (수신자 출생월일) : <%=result.getReceiverDay()%></li>
                    <li>ReceiverHP (수신자 휴대폰번호) : <%=result.getReceiverHP()%></li>
                    <li>ReceiverGender (수신자 성별) : <%=result.getReceiverGender()%></li>
                    <li>ReceiverForeign (외국인 여부) : <%=result.getReceiverForeign()%></li>
                    <li>ReceiverTelcoType (통신사 유형) : <%=result.getReceiverTelcoType()%></li>
                    <li>SignedData (전자서명 데이터 전문) : <%=result.getSignedData()%></li>
                    <li>CI (연계정보) : <%=result.getCi()%></li>
                </ul>
            </fieldset>
        </div>
    </body>
</html>
