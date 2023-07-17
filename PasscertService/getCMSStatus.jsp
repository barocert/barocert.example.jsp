<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/main.css" media="screen" />
        <title>Barocert Service jsp Example</title>
    </head>

<%@ include file="common.jsp" %>

<%@page import="com.barocert.BarocertException"%>
<%@page import="com.barocert.passcert.cms.CMSStatus"%>

<%
    /*
     * 패스 출금동의 요청시 반환된 접수아이디를 통해 서명 상태를 확인합니다.
     */

    // 이용기관코드, 파트너가 등록한 이용기관의 코드 (파트너 사이트에서 확인가능)
    String clientCode = "023030000004";

    // 패스 출금동의 요청시 반환된 접수아이디
    String receiptID = "02304050230300000040000000000008";
    
    CMSStatus result = null;

    try {
        
        result = passcertService.getCMSStatus(clientCode, receiptID);
        
    } catch(BarocertException ke) {
        throw ke;
    }
%>
    <body>
        <div id="content">
            <p class="heading1">Response</p>
            <br/>
            <fieldset class="fieldset1">
                <legend>패스 출금동의 상태확인</legend>
                <ul>
                    <li>이용기관 코드 (ClientCode) : <%=result.getClientCode()%></li>
                    <li>접수 아이디 (ReceiptID) : <%=result.getReceiptID()%></li>
                    <li>상태 (State) : <%=result.getState()%></li>
                    <li>요청 만료시간 (ExpireIn) : <%=result.getExpireIn()%></li>
                    <li>이용기관 명 (CallCenterName) : <%=result.getCallCenterName()%></li>
                    <li>이용기관 연락처 (CallCenterNum) : <%=result.getCallCenterNum()%></li>
                    <li>요청 메시지 제목 (ReqTitle) : <%=result.getReqTitle()%></li>
                    <li>요청 메시지 (ReqMessage) : <%=result.getReqMessage()%></li>
                    <li>서명요청일시 (RequestDT) : <%=result.getRequestDT()%></li>
                    <li>서명완료일시 (CompleteDT) : <%=result.getCompleteDT()%></li>
                    <li>서명만료일시 (ExpireDT) : <%=result.getExpireDT()%></li>
                    <li>서명거절일시 (RejectDT) : <%=result.getRejectDT()%></li>
                    <li>원문 구분 (TokenType) : <%=result.getTokenType()%></li>
                    <li>사용자동의필요여부 (UserAgreementYN) : <%=result.getUserAgreementYN()%></li>
                    <li>사용자정보포함여부 (ReceiverInfoYN) : <%=result.getReceiverInfoYN()%></li>
                    <li>통신사 유형 (TelcoType) : <%=result.getTelcoType()%></li>
                    <li>모바일장비 유형 (DeviceOSType) : <%=result.getDeviceOSType()%></li>
                    <li>앱스킴 (Scheme) : <%=result.getScheme()%></li>
                    <li>앱사용유무 (AppUseYN) : <%=result.getAppUseYN()%></li>
                </ul>
            </fieldset>
        </div>
    </body>
</html>
