<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/main.css" media="screen" />
        <title>Barocert JSP Example</title>
    </head>

<%@ include file="common.jsp" %>

<%@page import="com.barocert.BarocertException"%>
<%@page import="com.barocert.passcert.identity.Identity"%>
<%@page import="com.barocert.passcert.identity.IdentityReceipt"%>

<%
    /*
     * 패스 이용자에게 본인인증을 요청합니다.
     * https://developers.barocert.com/reference/pass/java/identity/api#RequestIdentity
     */

    // 이용기관코드, 파트너가 등록한 이용기관의 코드 (파트너 사이트에서 확인가능)
    String clientCode = "023070000014";

    // 본인인증 요청 정보 객체
    Identity identity = new Identity();

    // 수신자 휴대폰번호 - 11자 (하이픈 제외)
    identity.setReceiverHP(passcertService.encrypt("01012341234"));
    // 수신자 성명 - 최대 80자
    identity.setReceiverName(passcertService.encrypt("홍길동"));
    // 수신자 생년월일 - 8자 (yyyyMMdd)
    identity.setReceiverBirthday(passcertService.encrypt("19700101"));

    // 요청 메시지 제목 - 최대 40자
    identity.setReqTitle("본인인증 요청 메시지 제목");
    // 요청 메시지 - 최대 500자
    identity.setReqMessage(passcertService.encrypt("본인인증 요청 메시지"));
    // 고객센터 연락처 - 최대 12자
    identity.setCallCenterNum("1600-9854");
    // 요청 만료시간 - 최대 1,000(초)까지 입력 가능
    identity.setExpireIn(1000);
    // 서명 원문 - 최대 2,800자 까지 입력가능
    identity.setToken(passcertService.encrypt("본인인증 요청 원문"));

    // 사용자 동의 필요 여부
    identity.setUserAgreementYN(true);
    // 사용자 정보 포함 여부
    identity.setReceiverInfoYN(true);

    // AppToApp 인증요청 여부
    // true - AppToApp 인증방식, false - 푸시(Push) 인증방식
    identity.setAppUseYN(false);
    // ApptoApp 인증방식에서 사용
    // 통신사 유형('SKT', 'KT', 'LGU'), 대문자 입력(대소문자 구분)
    // identity.setTelcoType("SKT");
    // ApptoApp 인증방식에서 사용
    // 모바일장비 유형('ANDROID', 'IOS'), 대문자 입력(대소문자 구분)
    // identity.setDeviceOSType("IOS");
    
    IdentityReceipt result = null;

    try {
        
        result = passcertService.requestIdentity(clientCode, identity);
    
    } catch(BarocertException pe) {
        throw pe;
    }
%>
    <body>
        <div id="content">
            <p class="heading1">Response</p>
            <br/>
            <fieldset class="fieldset1">
                <legend>패스 본인인증 요청</legend>
                <ul>
                    <li>ReceiptID (접수아이디) : <%=result.getReceiptID()%></li>
                    <li>Scheme (앱스킴) : <%=result.getScheme()%></li>
                    <li>MarketUrl (앱다운로드URL) : <%=result.getMarketUrl()%></li>
                </ul>
            </fieldset>
        </div>
    </body>
</html>
