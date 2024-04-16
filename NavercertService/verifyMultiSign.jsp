<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/main.css" media="screen" />
        <title>Barocert JSP Example</title>
    </head>

<%@page import="java.util.List" %>

<%@ include file="common.jsp" %>

<%@page import="com.barocert.BarocertException"%>
<%@page import="com.barocert.navercert.sign.MultiSignResult"%>

<%
/*
     * 완료된 전자서명을 검증하고 전자서명값(signedData)을 반환 받습니다.
     * 네이버 보안정책에 따라 검증 API는 1회만 호출할 수 있습니다. 재시도시 오류가 반환됩니다.
     * https://developers.barocert.com/reference/naver/java/sign/api-multi#VerifyMultiSign
     */

    // 이용기관코드, 파트너가 등록한 이용기관의 코드 (파트너 사이트에서 확인가능)
    String clientCode = "023090000021";

    // 전자서명 요청시 반환된 접수아이디
    String receiptID = "02309050230900000210000000000012";
    
    MultiSignResult result = null;

    try {
        
        result = navercertService.verifyMultiSign(clientCode, receiptID);
        
    } catch(BarocertException ne) {
        throw ne;
    }
%>
    <body>
        <div id="content">
            <p class="heading1">Response</p>
            <br/>
            <fieldset class="fieldset1">
                <legend>네이버 전자서명(복수) 검증 API JSP Example</legend>
                <ul>
                    <li>접수 아이디 (ReceiptID) : <%=result.getReceiptID()%></li>
                    <li>상태 (State) : <%=result.getState()%></li>
                    <li>ReceiverName (수신자 성명) : <%=result.getReceiverName()%></li>
                    <li>ReceiverYear (수신자 출생년도) : <%=result.getReceiverYear()%></li>
                    <li>ReceiverDay (수신자 출생월일) : <%=result.getReceiverDay()%></li>
                    <li>ReceiverHP (수신자 휴대폰번호) : <%=result.getReceiverHP()%></li>
                    <li>ReceiverGender (수신자 성별) : <%=result.getReceiverGender()%></li>
                    <li>ReceiverEmail (수진자 이메일) : <%=result.getReceiverEmail()%></li>
                    <li>ReceiverForeign (외국인 여부) : <%=result.getReceiverForeign()%></li>
                    
                    <% if (result.getMultiSignedData() != null) {
                        List<String> multiSignedData = result.getMultiSignedData();
                            for (int i = 0; i < multiSignedData.size(); i++) { %>
                                <li>전자서명 데이터 전문 (SignedData) : <%=multiSignedData.get(i)%></li>
                            <% }
                        }
                    %>
                    
                    <li>Ci (연계정보) : <%=result.getCi()%></li>
                </ul>
            </fieldset>
        </div>
    </body>
</html>
