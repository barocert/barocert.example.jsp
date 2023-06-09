<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/main.css" media="screen" />
        <title>Barocert Service jsp Example</title>
    </head>

<%@ include file="common.jsp" %>

<%@page import="com.barocert.BarocertException"%>
<%@page import="com.barocert.passcert.cms.CMS"%>
<%@page import="com.barocert.passcert.cms.CMSReceipt"%>

<%
    /*
     * 패스 사용자에게 출금동의 전자서명을 요청합니다.
     */ 

    // 이용기관코드, 파트너가 등록한 이용기관의 코드 (파트너 사이트에서 확인가능)
    String clientCode = "023030000004";

    // 패스 출금동의 요청 정보 객체
    CMS cms = new CMS();
    
    // 수신자 휴대폰번호 - 11자 (하이픈 제외)
    cms.setReceiverHP(passcertService.encrypt("01012341234"));
    // 수신자 성명 - 최대 80자
    cms.setReceiverName(passcertService.encrypt("홍길동"));
    // 수신자 생년월일 - 8자 (yyyyMMdd)
    cms.setReceiverBirthday(passcertService.encrypt("19700101"));

    // 요청 메시지 제목 - 최대 40자
    cms.setReqTitle("패스써트 출금동의 인증요청 타이틀");
    // 요청 메시지 - 최대 500자
    cms.setReqMessage(passcertService.encrypt("패스써트 출금동의 인증요청 내용"));

    // 고객센터 연락처 - 최대 12자
    cms.setCallCenterNum("1600-9854");
    // 요청 만료시간 - 최대 1,000(초)까지 입력 가능
    cms.setExpireIn(1000);
    // 사용자 동의 필요 여부
    cms.setUserAgreementYN(true);

    // 출금은행명 - 최대 100자
    cms.setBankName(passcertService.encrypt("국민은행"));
    // 출금계좌번호 - 최대 31자
    cms.setBankAccountNum(passcertService.encrypt("9-****-5117-58"));
    // 출금계좌 예금주명 - 최대 100자
    cms.setBankAccountName(passcertService.encrypt("홍길동"));
    // 출금유형 
    // CMS - 출금동의, OPEN_BANK - 오픈뱅킹
    cms.setBankServiceType(passcertService.encrypt("CMS"));
    // 출금액
    cms.setBankWithdraw(passcertService.encrypt("1,000,000원"));

    // AppToApp 인증요청 여부
    // true - AppToApp 인증방식, false - Talk Message 인증방식
    cms.setAppUseYN(false);
    // ApptoApp 인증방식에서 사용
    // 통신사 유형('SKT', 'KT', 'LGU'), 대문자 입력(대소문자 구분)
    // cms.setTelcoType("SKT");
    // ApptoApp 인증방식에서 사용
    // 모바일장비 유형('ANDROID', 'IOS'), 대문자 입력(대소문자 구분)
    // cms.setDeviceOSType("IOS");
    
    CMSReceipt result = null;

    try {
        
        result = passcertService.requestCMS(clientCode, cms);
    
    } catch(BarocertException ke) {
        throw ke;
    }
%>
    <body>
        <div id="content">
            <p class="heading1">Response</p>
            <br/>
            <fieldset class="fieldset1">
                <legend>패스 출금동의 요청</legend>
                <ul>
                    <li>접수아이디 (ReceiptID) : <%=result.getReceiptID()%></li>
                    <li>앱스킴 (scheme) : <%=result.getScheme()%></li>
                    <li>앱다운로드 URL (MarketUrl) : <%=result.getMarketUrl()%></li>
                </ul>
            </fieldset>
        </div>
    </body>
</html>
