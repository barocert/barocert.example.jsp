<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/main.css" media="screen" />
        <title>Barocert Service jsp Example</title>
    </head>

<%@ include file="common.jsp" %>

<%@page import="com.barocert.BarocertException"%>
<%@page import="com.barocert.kakaocert.login.LoginResult"%>

<%
    /*
     * 간편로그인 토큰받기 요청시 반환된 txID를 통해 서명을 검증합니다.
     * 검증하기 API는 완료된 전자서명 요청당 1회만 요청 가능하며, 사용자가 서명을 완료후 유효시간(10분)이내에만 요청가능 합니다.
     * https://developers.barocert.com/reference/kakao/java/login/api#VerifyLogin
     */

    // 이용기관코드, 파트너가 등록한 이용기관의 코드 (파트너 사이트에서 확인가능)
    String clientCode = "023030000004";

    // 간편로그인 토큰받기 요청시 반환된 txID
    String txID = "01daa94d3f-5ac9-429c-8661-40d0ad9ce3e3";
    
    LoginResult result = null;

    try {
        
        result = kakaocertService.verifyLogin(clientCode, txID);
        
    } catch(BarocertException ke) {
        throw ke;
    }
%>
    <body>
        <div id="content">
            <p class="heading1">Response</p>
            <br/>
            <fieldset class="fieldset1">
                <legend>간편로그인 검증</legend>
                <ul>
                    <li>트랜잭션 아이디 (TxID) : <%=result.getTxID()%></li>
                    <li>상태 (State) : <%=result.getState()%></li>
                    <li>전자서명 데이터 전문 (SignedData) : <%=result.getSignedData()%></li>
                    <li>연계정보 (Ci) : <%=result.getCi()%></li>
                </ul>
            </fieldset>
        </div>
    </body>
</html>
