<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/main.css" media="screen" />
		<title>Barocert Service jsp Example</title>
	</head>

<%@page import="java.util.List" %>

<%@ include file="common.jsp" %>

<%@page import="com.barocert.BarocertException"%>
<%@page import="com.barocert.kakaocert.sign.ResponseVerifyMultiSign"%>

<%
	/*
	 * 전자서명 요청시 반환된 접수아이디를 통해 서명을 검증합니다. (복수)
     * 검증하기 API는 완료된 전자서명 요청당 1회만 요청 가능하며, 사용자가 서명을 완료후 유효시간(10분)이내에만 요청가능 합니다.
	 */

    // 이용기관코드, 파트너가 등록한 이용기관의 코드, (파트너 사이트에서 확인가능)
    String clientCode = "023030000004";

    // 전자서명 요청시 반환된 접수아이디
    String receiptID = "02304050230300000040000000000006";
    
    ResponseVerifyMultiSign result = null;

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
                <legend>카카오 전자서명 검증(복수)</legend>
                <ul>
                    <li>접수 아이디 (ReceiptID) : <%=result.getReceiptID()%></li>
                    <li>상태 (State) : <%=result.getState()%></li>
                    
                    <% if (result.getMultiSignedData() != null) {
		                List<String> multiSignedData = result.getMultiSignedData();
		                    for (int i = 0; i < multiSignedData.size(); i++) { %>
			            		<li>전자서명 데이터 전문 (SignedData) : <%=multiSignedData.get(i)%></li>
			            	<% }
			            }
		            %>
		            
                    <li>연계정보 (Ci) : <%=result.getCi()%></li>
                </ul>
            </fieldset>
        </div>
    </body>
</html>