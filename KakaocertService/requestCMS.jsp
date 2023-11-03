<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/main.css" media="screen" />
        <title>Barocert Service jsp Example</title>
    </head>

<%@ include file="common.jsp" %>

<%@page import="com.barocert.BarocertException"%>
<%@page import="com.barocert.kakaocert.cms.CMS"%>
<%@page import="com.barocert.kakaocert.cms.CMSReceipt"%>

<%
    /*
     * 카카오톡 이용자에게 자동이체 출금동의를 요청합니다.
     * https://developers.barocert.com/reference/kakao/java/cms/api#RequestCMS
     */

    // 이용기관코드, 파트너가 등록한 이용기관의 코드 (파트너 사이트에서 확인가능)
    String clientCode = "023030000004";

    // 출금동의 요청 정보 객체
    CMS cms = new CMS();
    
    // 수신자 휴대폰번호 - 11자 (하이픈 제외)
    cms.setReceiverHP(kakaocertService.encrypt("01012341234"));
    // 수신자 성명 - 80자
    cms.setReceiverName(kakaocertService.encrypt("홍길동"));
    // 수신자 생년월일 - 8자 (yyyyMMdd)
    cms.setReceiverBirthday(kakaocertService.encrypt("19700101"));

    // 인증요청 메시지 제목 - 최대 40자
    cms.setReqTitle("출금동의 요청 메시지 제목");

    // 인증요청 만료시간 - 최대 1,000(초)까지 입력 가능
    cms.setExpireIn(1000);

    // 청구기관명 - 최대 100자
    cms.setRequestCorp(kakaocertService.encrypt("청구기관명란"));
    // 출금은행명 - 최대 100자
    cms.setBankName(kakaocertService.encrypt("출금은행명란"));
    // 출금계좌번호 - 최대 32자
    cms.setBankAccountNum(kakaocertService.encrypt("9-4324-5117-58"));
    // 출금계좌 예금주명 - 최대 100자
    cms.setBankAccountName(kakaocertService.encrypt("예금주명 입력란"));
    // 출금계좌 예금주 생년월일 - 8자
    cms.setBankAccountBirthday(kakaocertService.encrypt("19930112"));
    // 출금유형
    // CMS - 출금동의용, FIRM - 펌뱅킹, GIRO - 지로용
    cms.setBankServiceType(kakaocertService.encrypt("CMS")); // CMS, FIRM, GIRO

    // AppToApp 인증요청 여부
    // true - AppToApp 인증방식, false - Talk Message 인증방식
    cms.setAppUseYN(false);

    // App to App 방식 이용시, 에러시 호출할 URL
    // cms.setReturnURL("https://www.kakaocert.com");
    
    CMSReceipt result = null;

    try {
        
        result = kakaocertService.requestCMS(clientCode, cms);
        
    } catch(BarocertException ke) {
        throw ke;
    }
%>
    <body>
        <div id="content">
            <p class="heading1">Response</p>
            <br/>
            <fieldset class="fieldset1">
                <legend>카카오 출금동의 요청</legend>
                <ul>
                    <li>ReceiptID (접수아이디) : <%=result.getReceiptID()%></li>
                    <li>Scheme (앱스킴) : <%=result.getScheme()%></li>
                </ul>
            </fieldset>
        </div>
    </body>
</html>
