<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/main.css" media="screen" />
        <title>Barocert JSP Example</title>
    </head>

<%@ include file="common.jsp" %>

<%@page import="com.barocert.BarocertException"%>
<%@page import="com.barocert.kakaocert.identity.Identity"%>
<%@page import="com.barocert.kakaocert.identity.IdentityReceipt"%>

<%
    /*
     * 카카오톡 이용자에게 본인인증을 요청합니다.
     * https://developers.barocert.com/reference/kakao/java/identity/api#RequestIdentity
     */

    // 이용기관코드, 파트너가 등록한 이용기관의 코드 (파트너 사이트에서 확인가능)
    String clientCode = "023040000001";

    // 본인인증 요청 정보 객체
    Identity identity = new Identity();

    // 수신자 휴대폰번호 - 11자 (하이픈 제외)
    identity.setReceiverHP(kakaocertService.encrypt("01012341234"));
    // 수신자 성명 - 80자
    identity.setReceiverName(kakaocertService.encrypt("홍길동"));
    // 수신자 생년월일 - 8자 (yyyyMMdd)
    identity.setReceiverBirthday(kakaocertService.encrypt("19700101"));

    // 인증요청 메시지 제목 - 최대 40자
    identity.setReqTitle("본인인증 요청 메시지 제목");
    // 커스텀 메시지 - 최대 500자
    identity.setExtraMessage(kakaocertService.encrypt("본인인증 커스텀 메시지"));
    // 인증요청 만료시간 - 최대 1,000(초)까지 입력 가능
    identity.setExpireIn(1000);
    // 서명 원문 - 최대 40자 까지 입력가능
    identity.setToken(kakaocertService.encrypt("본인인증 요청 원문"));

    // AppToApp 인증요청 여부
    // true - AppToApp 인증방식, false - Talk Message 인증방식
    identity.setAppUseYN(false);

    // App to App 방식 이용시, 호출할 URL
    // identity.setReturnURL("https://www.kakaocert.com");
    
    IdentityReceipt result = null;

    try {
        
        result = kakaocertService.requestIdentity(clientCode, identity);
        
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
                    <li>ReceiptID (접수아이디) : <%=result.getReceiptID()%></li>
                    <li>Scheme (앱스킴) : <%=result.getScheme()%></li>
                </ul>
            </fieldset>
        </div>
    </body>
</html>
