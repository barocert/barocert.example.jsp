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
<%@page import="com.barocert.kakaocert.sign.MultiSignResult"%>

<%
/*
     * 완료된 전자서명을 검증하고 전자서명값(signedData)을 반환 받습니다.
     * 카카오 보안정책에 따라 검증 API는 1회만 호출할 수 있습니다. 재시도시 오류가 반환됩니다.
     * 전자서명 완료일시로부터 10분 이후에 검증 API를 호출하면 오류가 반환됩니다.
     * https://developers.barocert.com/reference/kakao/java/sign/api-multi#VerifyMultiSign
     */

    // 이용기관코드, 파트너가 등록한 이용기관의 코드 (파트너 사이트에서 확인가능)
    String clientCode = "023040000001";

    // 전자서명 요청시 반환된 접수아이디
    String receiptID = "02304050230400000010000000000006";
    
    MultiSignResult result = null;

    try {
        
        result = kakaocertService.verifyMultiSign(clientCode, receiptID);
        
    } catch(BarocertException ke) {
        throw ke;
    }
%>
    <body>
        <div id="content">
            <p class="heading1">Response</p>
            <br/>
            <fieldset class="fieldset1">
                <legend>카카오 전자서명(복수) 검증</legend>
                <ul>
                    <li>ReceiptID (접수 아이디) : <%=result.getReceiptID()%></li>
                    <li>State (상태) : <%=result.getState()%></li>
                    
                    <% if (result.getMultiSignedData() != null) {
                        List<String> multiSignedData = result.getMultiSignedData();
                            for (int i = 0; i < multiSignedData.size(); i++) { %>
                                <li>SignedData (전자서명 데이터 전문) : <%=multiSignedData.get(i)%></li>
                            <% }
                        }
                    %>
                    
                    <li>Ci (연계정보) : <%=result.getCi()%></li>
                    <li>ReceiverName (수신자 성명) : <%=result.getReceiverName()%></li>
                    <li>ReceiverYear (수신자 출생년도) : <%=result.getReceiverYear()%></li>
                    <li>ReceiverDay (수신자 출생월일) :  <%=result.getReceiverDay()%></li>
                    <li>ReceiverHP (수신자 휴대폰번호) : <%=result.getReceiverHP()%></li>
                    <li>ReceiverGender (수신자 성별) : <%=result.getReceiverGender()%></li>
                </ul>
            </fieldset>
        </div>
    </body>
</html>
