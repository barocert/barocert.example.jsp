<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/main.css" media="screen" />
		<title>Barocert Service jsp Example</title>
	</head>

<%@ include file="common.jsp" %>

<%@page import="com.barocert.BarocertException"%>
<%@page import="com.barocert.kakaocert.identity.RequestIdentity"%>
<%@page import="com.barocert.kakaocert.identity.ResponseIdentity"%>

<%
/*
	 * 카카오톡 사용자에게 본인인증 전자서명을 요청합니다.
	 * - https://requestVerifyAuth
	 */

    // 이용기관코드, 파트너가 등록한 이용기관의 코드, (파트너 사이트에서 확인가능)
    String clientCode = "023030000004";

    // 본인인증 요청 정보 객체
    RequestIdentity verifyAuthRequest = new RequestIdentity();

    // 수신자 정보
    // 휴대폰번호,성명,생년월일 또는 Ci(연계정보)값 중 택 일
    verifyAuthRequest.setReceiverHP(kakaocertService.encrypt("01054437896"));
    verifyAuthRequest.setReceiverName(kakaocertService.encrypt("최상혁"));
    verifyAuthRequest.setReceiverBirthday(kakaocertService.encrypt("19880301"));
    // request.setCi(kakaocertService.encrypt(""));

    // 인증요청 메시지 제목 - 최대 40자
    verifyAuthRequest.setReqTitle("인증요청 메시지 제목란");
    // 인증요청 만료시간 - 최대 1,000(초)까지 입력 가능
    verifyAuthRequest.setExpireIn(1000);
    // 서명 원문 - 최대 2,800자 까지 입력가능
    verifyAuthRequest.setToken(kakaocertService.encrypt("본인인증요청토큰"));

    // AppToApp 인증요청 여부
    // true - AppToApp 인증방식, false - Talk Message 인증방식
    verifyAuthRequest.setAppUseYN(false);

    // App to App 방식 이용시, 호출할 URL
    // verifyAuthRequest.setReturnURL("https://www.kakaocert.com");
    
    ResponseIdentity result = null;

    try {
    	
    	result = kakaocertService.requestIdentity(clientCode, verifyAuthRequest);
         
    } catch(BarocertException ke) {
        throw ke;
  }
%>
    <body>
        <div id="content">
            <p class="heading1">Response</p>
            <br/>
            <fieldset class="fieldset1">
                <legend>카카오 본인인증 요청</legend>
                <ul>
                    <li>접수아이디 (ReceiptID) : <%=result.getReceiptID()%></li>
                    <li>앱스킴 (scheme) : <%=result.getScheme()%></li>
                </ul>
            </fieldset>
        </div>
    </body>
</html>