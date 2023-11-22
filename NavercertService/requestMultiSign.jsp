<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/main.css" media="screen" />
        <title>Barocert Service jsp Example</title>
    </head>

<%@page import="java.util.ArrayList"%>

<%@ include file="common.jsp" %>

<%@page import="com.barocert.BarocertException"%>
<%@page import="com.barocert.navercert.sign.Sign"%>
<%@page import="com.barocert.navercert.sign.MultiSignReceipt"%>
<%@page import="com.barocert.navercert.sign.MultiSign"%>
<%@page import="com.barocert.navercert.sign.MultiSignTokens"%>

<%
    /*
     * 네이버 이용자에게 복수(최대 50건) 문서의 전자서명을 요청합니다.
     * https://developers.barocert.com/reference/naver/java/sign/api-multi#RequestMultiSign
     */

    // 이용기관코드, 파트너가 등록한 이용기관의 코드 (파트너 사이트에서 확인가능)
    String clientCode = "023060000088";

    // 전자서명 요청 정보 객체
    MultiSign multiSign = new MultiSign();

    // 수신자 휴대폰번호 - 11자 (하이픈 제외)
    multiSign.setReceiverHP(navercertService.encrypt("01012341234"));
    // 수신자 성명 - 80자
    multiSign.setReceiverName(navercertService.encrypt("홍길동"));
    // 수신자 생년월일 - 8자 (yyyyMMdd)
    multiSign.setReceiverBirthday(navercertService.encrypt("19700101"));

    // 인증요청 메시지 제목 - 최대 40자
    multiSign.setReqTitle("전자서명(복수) 요청 메시지 제목");
    // 고객센터 연락처 - 최대 12자
    multiSign.setCallCenterNum("1600-9854");
    // 인증요청 만료시간 - 최대 1,000(초)까지 입력
    multiSign.setExpireIn(1000);
    // 인증요청 메시지 - 최대 500자
    multiSign.setReqMessage(navercertService.encrypt("전자서명(복수) 요청 메시지"));

    // 개별문서 등록 - 최대 50 건
    // 개별 요청 정보 객체
    MultiSignTokens token = new MultiSignTokens();
    // 서명 원문 - 원문 2,800자 까지 입력가능
    token.setToken(navercertService.encrypt("전자서명(복수) 요청 원문 1"));
    // 서명 원문 유형
    // 'TEXT' - 일반 텍스트, 'HASH' - HASH 데이터
    token.setTokenType("TEXT");

    multiSign.addToken(token);

    // 개별 요청 정보 객체
    MultiSignTokens token2 = new MultiSignTokens();
    // 서명 원문 - 원문 2,800자 까지 입력가능
    token2.setToken(navercertService.encrypt("전자서명(복수) 요청 원문 2"));
    // 서명 원문 유형
    // 'TEXT' - 일반 텍스트, 'HASH' - HASH 데이터
    token2.setTokenType("TEXT");

    multiSign.addToken(token2);

    // AppToApp 인증요청 여부
    // true - AppToApp 인증방식, false - Talk Message 인증방식
    multiSign.setAppUseYN(false);

    // AppToApp 인증방식에서 사용
    // 모바일장비 유형('ANDROID', 'IOS'), 대문자 입력(대소문자 구분)
    // multiSign.setDeviceOSType("ANDROID");

    // AppToApp 방식 이용시, 에러시 호출할 URL
    // multiSign.setReturnURL("navercert://Sign");
    
    MultiSignReceipt result = null;

    try {
        
        result = navercertService.requestMultiSign(clientCode, multiSign);
        
    } catch(BarocertException ke) {
        throw ke;
    }
%>
    <body>
        <div id="content">
            <p class="heading1">Response</p>
            <br/>
            <fieldset class="fieldset1">
                <legend>네이버 전자서명 요청(복수)</legend>
                <ul>
                    <li>ReceiptID (접수아이디) : <%=result.getReceiptID()%></li>
                    <li>scheme (앱스킴) : <%=result.getScheme()%></li>
                    <li>MarketUrl (앱다운로드URL) : <%=result.getMarketUrl()%></li>
                </ul>
            </fieldset>
        </div>
    </body>
</html>
