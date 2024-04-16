<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/main.css" media="screen" />
        <title>Barocert JSP Example</title>
    </head>

<%@ include file="common.jsp" %>

<%@page import="com.barocert.BarocertException"%>
<%@page import="com.barocert.navercert.cms.CMS"%>
<%@page import="com.barocert.navercert.cms.CMSReceipt"%>

<%
    /*
     * 네이버 이용자에게 자동이체 출금동의를 요청합니다.
     * https://developers.barocert.com/reference/naver/java/cms/api#RequestCMS
     */

    // 이용기관코드, 파트너가 등록한 이용기관의 코드 (파트너 사이트에서 확인가능)
    String clientCode = "023090000021";

    // 출금동의 요청 정보 객체
    CMS cms = new CMS();

    // 수신자 휴대폰번호 - 11자 (하이픈 제외)
    cms.setReceiverHP(navercertService.encrypt("01012341234"));
    // 수신자 성명 - 80자
    cms.setReceiverName(navercertService.encrypt("홍길동"));
    // 수신자 생년월일 - 8자 (yyyyMMdd)
    cms.setReceiverBirthday(navercertService.encrypt("19700101"));

    // 인증요청 메시지 제목
    cms.setReqTitle("출금동의 요청 메시지 제목");
    // 인증요청 메시지
    cms.setReqMessage(navercertService.encrypt("출금동의 요청 메시지"));
    // 고객센터 연락처 - 최대 12자
    cms.setCallCenterNum("1600-9854");
    // 인증요청 만료시간 - 최대 1,000(초)까지 입력 가능
    cms.setExpireIn(1000);

    // 청구기관명
    cms.setRequestCorp(navercertService.encrypt("청구기관"));
    // 출금은행명
    cms.setBankName(navercertService.encrypt("출금은행"));
    // 출금계좌번호
    cms.setBankAccountNum(navercertService.encrypt("123-456-7890"));
    // 출금계좌 예금주명
    cms.setBankAccountName(navercertService.encrypt("홍길동"));
    // 출금계좌 예금주 생년월일
    cms.setBankAccountBirthday(navercertService.encrypt("19700101"));

    // AppToApp 인증요청 여부
    // true - AppToApp 인증방식, false - 푸시(Push) 인증방식
    cms.setAppUseYN(false);

    // AppToApp 인증방식에서 사용
    // 모바일장비 유형('ANDROID', 'IOS'), 대문자 입력(대소문자 구분)
    // cms.setDeviceOSType("ANDROID");

    // AppToApp 방식 이용시, 호출할 URL
    // "http", "https"등의 웹프로토콜 사용 불가
    // cms.setReturnURL("navercert://cms");
    
    CMSReceipt result = null;

    try {
        
        result = navercertService.requestCMS(clientCode, cms);
        
    } catch(BarocertException ne) {
        throw ne;
    }
%>
    <body>
        <div id="content">
            <p class="heading1">Response</p>
            <br/>
            <fieldset class="fieldset1">
                <legend>네이버 출금동의 요청 API JSP Example</legend>
                <ul>
                    <li>ReceiptID (접수아이디) : <%=result.getReceiptID()%></li>
                    <li>scheme (앱스킴) : <%=result.getScheme()%></li>
                    <li>MarketUrl (앱다운로드URL) : <%=result.getMarketUrl()%></li>
                </ul>
            </fieldset>
        </div>
    </body>
</html>
