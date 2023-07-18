<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/main.css" media="screen" />
        <title>Barocert Service jsp Example</title>
    </head>

<%@ include file="common.jsp" %>

<%@page import="com.barocert.BarocertException"%>
<%@page import="com.barocert.passcert.login.Login"%>
<%@page import="com.barocert.passcert.login.LoginReceipt"%>

<%
    /*
     * 패스 사용자에게 간편로그인 전자서명을 요청합니다.
     */

    // 이용기관코드, 파트너가 등록한 이용기관의 코드 (파트너 사이트에서 확인가능)
    String clientCode = "023030000004";

    // 간편로그인 요청 정보 객체
    Login login = new Login();

    // 수신자 휴대폰번호 - 11자 (하이픈 제외)
    login.setReceiverHP(passcertService.encrypt("01012341234"));
    // 수신자 성명 - 최대 80자
    login.setReceiverName(passcertService.encrypt("홍길동"));
    // 수신자 생년월일 - 8자 (yyyyMMdd)
    login.setReceiverBirthday(passcertService.encrypt("19700101"));

    // 요청 메시지 제목 - 최대 40자
    login.setReqTitle("패스써트 간편로그인 요청 타이틀");
    // 요청 메시지 - 최대 500자
    login.setReqMessage(passcertService.encrypt("패스써트 간편로그인 요청 내용"));
    // 고객센터 연락처 - 최대 12자
    login.setCallCenterNum("1600-9854");
    // 요청 만료시간 - 최대 1,000(초)까지 입력 가능
    login.setExpireIn(1000);
    // 서명 원문 - 최대 2,800자 까지 입력가능
    login.setToken(passcertService.encrypt("패스써트 간편로그인 요청 원문"));

    // 사용자 동의 필요 여부
    login.setUserAgreementYN(true);
    // 사용자 정보 포함 여부
    login.setReceiverInfoYN(true);

    // AppToApp 인증요청 여부
    // true - AppToApp 인증방식, false - Talk Message 인증방식
    login.setAppUseYN(false);
    // ApptoApp 인증방식에서 사용
    // 통신사 유형('SKT', 'KT', 'LGU'), 대문자 입력(대소문자 구분)
    // login.setTelcoType("SKT");
    // ApptoApp 인증방식에서 사용
    // 모바일장비 유형('ANDROID', 'IOS'), 대문자 입력(대소문자 구분)
    // login.setDeviceOSType("IOS");
    
    LoginReceipt result = null;

    try {
        
        result = passcertService.requestLogin(clientCode, login);
    
    } catch(BarocertException pe) {
        throw pe;
    }
%>
    <body>
        <div id="content">
            <p class="heading1">Response</p>
            <br/>
            <fieldset class="fieldset1">
                <legend>패스 간편로그인 요청</legend>
                <ul>
                    <li>접수아이디 (ReceiptID) : <%=result.getReceiptID()%></li>
                    <li>앱스킴 (Scheme) : <%=result.getScheme()%></li>
                    <li>앱다운로드 URL (MarketUrl) : <%=result.getMarketUrl()%></li>
                </ul>
            </fieldset>
        </div>
    </body>
</html>
