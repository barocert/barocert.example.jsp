<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/main.css" media="screen" />
        <title>Barocert Service jsp Example</title>
    </head>

<%@ include file="common.jsp" %>

<%@page import="com.barocert.BarocertException"%>
<%@page import="com.barocert.kakaocert.sign.Sign"%>
<%@page import="com.barocert.kakaocert.sign.SignReceipt"%>

<%
/*
     * 카카오톡 사용자에게 전자서명을 요청합니다.(단건)
     */

    // 이용기관코드, 파트너가 등록한 이용기관의 코드, (파트너 사이트에서 확인가능)
    String clientCode = "023030000004";

    // 전자서명 요청 정보 객체
    Sign sign = new Sign();

    // 수신자 정보
    // 휴대폰번호,성명,생년월일 또는 Ci(연계정보)값 중 택 일
    sign.setReceiverHP(kakaocertService.encrypt("01012341234"));
    sign.setReceiverName(kakaocertService.encrypt("홍길동"));
    sign.setReceiverBirthday(kakaocertService.encrypt("19700101"));
    // request.setCi(kakaocertService.encrypt(""));

    // 인증요청 메시지 제목 - 최대 40자
    sign.setReqTitle("전자서명단건테스트");
    // 인증요청 만료시간 - 최대 1,000(초)까지 입력 가능
    sign.setExpireIn(1000);
    // 서명 원문 - 원문 2,800자 까지 입력가능
    sign.setToken(kakaocertService.encrypt("전자서명단건테스트데이터"));
    // 서명 원문 유형
    // TEXT - 일반 텍스트, HASH - HASH 데이터
    sign.setTokenType("TEXT");

    // AppToApp 인증요청 여부
    // true - AppToApp 인증방식, false - Talk Message 인증방식
    sign.setAppUseYN(false);

    // App to App 방식 이용시, 호출할 URL
    // sign.setReturnURL("https://www.kakaocert.com");
    
    SignReceipt result = null;

    try {
        
        result = kakaocertService.requestSign(clientCode, sign);
         
    } catch(BarocertException ke) {
        throw ke;
  }
%>
    <body>
        <div id="content">
            <p class="heading1">Response</p>
            <br/>
            <fieldset class="fieldset1">
                <legend>카카오 전자서명 요청(단건)</legend>
                <ul>
                    <li>접수아이디 (ReceiptID) : <%=result.getReceiptID()%></li>
                    <li>앱스킴 (scheme) : <%=result.getScheme()%></li>
                </ul>
            </fieldset>
        </div>
    </body>
</html>
