<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/main.css" media="screen" />
		<title>Barocert Kakaocert Service jsp Example.</title>
	</head>

<%@ include file="common.jsp" %>

<%@page import="com.barocert.BarocertException"%>
<%@page import="com.barocert.kakaocert.esign.RequestESign"%>
<%@page import="com.barocert.kakaocert.esign.ResultESign"%>

<%
	/*
	 * 카카오톡 사용자에게 전자서명을 요청합니다.(단건)
	 * - https://requestESign
	 */

    // 이용기관코드, 파트너가 등록한 이용기관의 코드, (파트너 사이트에서 확인가능)
    String clientCode = "023030000003";

    // AppToApp 인증요청 여부
    // true - AppToApp 인증방식, false - Talk Message 인증방식
    boolean isAppUseYN = false;

    // 전자서명 요청 정보 Object
    RequestESign eSignRequest = new RequestESign();
    
    // 수신자 정보(휴대폰번호, 성명, 생년월일)와 Ci 값 중 택일
    eSignRequest.setReceiverHP(kakaocertService.AES256Encrypt("01087674117"));
    eSignRequest.setReceiverName(kakaocertService.AES256Encrypt("이승환"));
    eSignRequest.setReceiverBirthday(kakaocertService.AES256Encrypt("19930112"));
    // eSignRequest.setCi(kakaocertService.AES256Encrypt(""));

    eSignRequest.setReqTitle("전자서명단건테스트");
    eSignRequest.setExpireIn(1000);
    
    eSignRequest.setToken(kakaocertService.AES256Encrypt("전자서명단건테스트데이터"));
    
    eSignRequest.setTokenType("TEXT"); // TEXT, HASH

    // App to App 방식 이용시, 에러시 호출할 URL
    // eSignRequest.setReturnURL("https://kakao.barocert.com");
    
    ResultESign result = null;

    try {
    	
    	result = kakaocertService.requestESign(clientCode, eSignRequest, isAppUseYN);
         
    } catch(BarocertException ke) {
        throw ke;
  }
%>
    <body>
        <div id="content">
            <p class="heading1">Response</p>
            <br/>
            <fieldset class="fieldset1">
                <legend>전자서명 요청(단건)</legend>
                <ul>
                    <li>접수아이디 (ReceiptID) : <%=result.getReceiptID()%></li>
                    <li>앱스킴 (scheme)[AppToApp 앱스킴 호출용] : <%=result.getScheme()%></li>
                </ul>
            </fieldset>
        </div>
    </body>
</html>
