<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/main.css" media="screen" />
        <title>Barocert JSP Example</title>
    </head>

<%@ include file="common.jsp" %>

<%@page import="com.barocert.BarocertException"%>
<%@page import="com.barocert.navercert.identity.IdentityStatus"%>

<%
    /*
     * 본인인증 요청 후 반환받은 접수아이디로 본인인증 진행 상태를 확인합니다.
     * https://developers.barocert.com/reference/naver/java/identity/api#GetIdentityStatus
     */

    // 이용기관코드, 파트너가 등록한 이용기관의 코드 (파트너 사이트에서 확인가능)
    String clientCode = "023090000021";

    // 본인인증 요청시 반환된 접수아이디
    String receiptID = "02309050230900000210000000000013";
    
    IdentityStatus result = null;

    try {
        
        result = navercertService.getIdentityStatus(clientCode, receiptID);
        
    } catch(BarocertException ne) {
        throw ne;
    }
%>
    <body>
        <div id="content">
            <p class="heading1">Response</p>
            <br/>
            <fieldset class="fieldset1">
                <legend>네이버 본인인증 상태확인 API JSP Example</legend>
                <ul>
                    <li>ReceiptID (접수 아이디) : <%=result.getReceiptID()%></li>
                    <li>ClientCode (이용기관 코드) : <%=result.getClientCode()%></li>
                    <li>State (상태) : <%=result.getState()%></li>
                    <li>ExpireDT (서명만료일시) : <%=result.getExpireDT()%></li>
                </ul>
            </fieldset>
        </div>
    </body>
</html>
