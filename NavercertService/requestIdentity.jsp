<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/main.css" media="screen" />
        <title>Barocert Service jsp Example</title>
    </head>

<%@ include file="common.jsp" %>

<%@page import="com.barocert.BarocertException"%>
<%@page import="com.barocert.navercert.identity.Identity"%>
<%@page import="com.barocert.navercert.identity.IdentityReceipt"%>

<%
    /*
     * 네이버 이용자에게 본인인증을 요청합니다.
     * https://developers.barocert.com/reference/naver/java/identity/api#RequestIdentity
     */

    // 이용기관코드, 파트너가 등록한 이용기관의 코드 (파트너 사이트에서 확인가능)
    String clientCode = "023090000021";

    // 본인인증 요청 정보 객체
    Identity identity = new Identity();

    // 수신자 휴대폰번호 - 11자 (하이픈 제외)
    identity.setReceiverHP(navercertService.encrypt("01012341234"));
    // 수신자 성명 - 80자
    identity.setReceiverName(navercertService.encrypt("홍길동"));
    // 수신자 생년월일 - 8자 (yyyyMMdd)
    identity.setReceiverBirthday(navercertService.encrypt("19700101"));

    // 고객센터 연락처 - 최대 12자
    identity.setCallCenterNum("1600-9854");
    // 인증요청 만료시간 - 최대 1,000(초)까지 입력 가능
    identity.setExpireIn(1000);

    // AppToApp 인증요청 여부
    // true - AppToApp 인증방식, false - Talk Message 인증방식
    identity.setAppUseYN(false);

    // ApptoApp 인증방식에서 사용
    // 모바일장비 유형('ANDROID', 'IOS'), 대문자 입력(대소문자 구분)
    // identity.setDeviceOSType("ANDROID");

    // AppToApp 방식 이용시, 호출할 URL
    // "http", "https"등의 웹프로토콜 사용 불가
    // identity.setReturnURL("navercert://Identity");
    
    IdentityReceipt result = null;

    try {
        
        result = navercertService.requestIdentity(clientCode, identity);
        
    } catch(BarocertException ne) {
        throw ne;
    }
%>
    <body>
        <div id="content">
            <p class="heading1">Response</p>
            <br/>
            <fieldset class="fieldset1">
                <legend>네이버 본인인증 요청</legend>
                <ul>
                    <li>ReceiptID (접수아이디) : <%=result.getReceiptID()%></li>
                    <li>scheme (앱스킴) : <%=result.getScheme()%></li>
                    <li>MarketUrl (앱다운로드URL) : <%=result.getMarketUrl()%></li>
                </ul>
            </fieldset>
        </div>
    </body>
</html>
