<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/main.css" media="screen" />
        <title>Barocert JSP Example</title>
    </head>

<%@ include file="common.jsp" %>

<%@page import="com.barocert.BarocertException"%>
<%@page import="com.barocert.passcert.sign.SignStatus"%>

<%
    /*
     * 전자서명 요청 후 반환받은 접수아이디로 인증 진행 상태를 확인합니다.
     * 상태확인 함수는 전자서명 요청 함수를 호출한 당일 23시 59분 59초까지만 호출 가능합니다. 
     * 전자서명 요청 함수를 호출한 당일 23시 59분 59초 이후 상태확인 함수를 호출할 경우 오류가 반환됩니다.
     * https://developers.barocert.com/reference/pass/java/sign/api#GetSignStatus
     */

    // 이용기관코드, 파트너가 등록한 이용기관의 코드 (파트너 사이트에서 확인가능)
    String clientCode = "023070000014";

    // 전자서명 요청시 반환된 접수아이디
    String receiptID = "02304050230700000140000000000007";
    
    SignStatus result = null;

    try {
        
        result = passcertService.getSignStatus(clientCode, receiptID);
        
    } catch(BarocertException pe) {
        throw pe;
    }
%>
    <body>
        <div id="content">
            <p class="heading1">Response</p>
            <br/>
            <fieldset class="fieldset1">
                <legend>패스 전자서명 상태요청 API JSP Example</legend>
                <ul>
                    <li>ClientCode (이용기관 코드) : <%=result.getClientCode()%></li>
                    <li>ReceiptID (접수 아이디) : <%=result.getReceiptID()%></li>
                    <li>State (상태) : <%=result.getState()%></li>
                    <li>RequestDT (서명요청일시) : <%=result.getRequestDT()%></li>
                    <li>CompleteDT (서명완료일시) : <%=result.getCompleteDT()%></li>
                    <li>ExpireDT (서명만료일시) : <%=result.getExpireDT()%></li>
                    <li>RejectDT (서명거절일시) : <%=result.getRejectDT()%></li>
                </ul>
            </fieldset>
        </div>
    </body>
</html>
