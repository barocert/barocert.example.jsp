<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/main.css" media="screen" />
        <title>Barocert Service jsp Example</title>
    </head>

<%@ include file="common.jsp" %>

<%@page import="com.barocert.BarocertException"%>
<%@page import="com.barocert.kakaocert.cms.RequestCMS"%>
<%@page import="com.barocert.kakaocert.cms.ResponseCMS"%>

<%
    // 카카오톡 사용자에게 출금동의 전자서명을 요청합니다.

    // 이용기관코드, 파트너가 등록한 이용기관의 코드, (파트너 사이트에서 확인가능)
    String clientCode = "023030000004";

    // AppToApp 인증요청 여부
    // true - AppToApp 인증방식, false - Talk Message 인증방식
    boolean isAppUseYN = false;

    // 출금동의 요청 정보 객체
    RequestCMS cmsRequest = new RequestCMS();
    
    // 수신자 정보
    // 휴대폰번호,성명,생년월일 또는 Ci(연계정보)값 중 택 일
    cmsRequest.setReceiverHP(kakaocertService.encrypt("01054437896"));
    cmsRequest.setReceiverName(kakaocertService.encrypt("최상혁"));
    cmsRequest.setReceiverBirthday(kakaocertService.encrypt("19880301"));
    // cmsRequest.setCi(kakaocertService.encrypt("");

    // 인증요청 메시지 제목 - 최대 40자
    cmsRequest.setReqTitle("인증요청 메시지 제공란");

    // 인증요청 만료시간 - 최대 1,000(초)까지 입력 가능
    cmsRequest.setExpireIn(1000);

    // 청구기관명 - 최대 100자
    cmsRequest.setRequestCorp(kakaocertService.encrypt("청구기관명란"));
    // 출금은행명 - 최대 100자
    cmsRequest.setBankName(kakaocertService.encrypt("출금은행명란"));
    // 출금계좌번호 - 최대 32자
    cmsRequest.setBankAccountNum(kakaocertService.encrypt("9-4324-5117-58"));
    // 출금계좌 예금주명 - 최대 100자
    cmsRequest.setBankAccountName(kakaocertService.encrypt("예금주명 입력란"));
    // 출금계좌 예금주 생년월일 - 8자
    cmsRequest.setBankAccountBirthday(kakaocertService.encrypt("19930112"));
    // 출금유형
    // CMS - 출금동의용, FIRM - 펌뱅킹, GIRO - 지로용
    cmsRequest.setBankServiceType(kakaocertService.encrypt("CMS")); // CMS, FIRM, GIRO

    // AppToApp 인증요청 여부
    // true - AppToApp 인증방식, false - Talk Message 인증방식
    cmsRequest.setAppUseYN(false);

    // App to App 방식 이용시, 에러시 호출할 URL
    // request.setReturnURL("https://www.kakaocert.com");
    
    ResponseCMS result = null;

    try {
        
        result = kakaocertService.requestCMS(clientCode, cmsRequest);
         
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
                    <li>접수아이디 (ReceiptID) : <%=result.getReceiptID()%></li>
                    <li>앱스킴 (scheme) : <%=result.getScheme()%></li>
                </ul>
            </fieldset>
        </div>
    </body>
</html>
