<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/main.css" media="screen" />
        <title>Barocert JSP Example</title>
    </head>

<%@ include file="common.jsp" %>

<%@page import="com.barocert.BarocertException"%>
<%@page import="com.barocert.passcert.sign.Sign"%>
<%@page import="com.barocert.passcert.sign.SignReceipt"%>
<%@page import="com.barocert.crypto.Filez"%>

<%
    /*
     * 패스 이용자에게 문서의 전자서명을 요청합니다.
     * https://developers.barocert.com/reference/pass/java/sign/api#RequestSign
     */

    // 이용기관코드, 파트너가 등록한 이용기관의 코드 (파트너 사이트에서 확인가능)
    String clientCode = "023070000014";

    // 전자서명 요청 정보 객체
    Sign sign = new Sign();

    // 수신자 휴대폰번호 - 11자 (하이픈 제외)
    sign.setReceiverHP(passcertService.encrypt("01012341234"));
    // 수신자 성명 - 최대 80자
    sign.setReceiverName(passcertService.encrypt("홍길동"));
    // 수신자 생년월일 - 8자 (yyyyMMdd)
    sign.setReceiverBirthday(passcertService.encrypt("19700101"));

    // 요청 메시지 제목 - 최대 40자
    sign.setReqTitle("전자서명 요청 메시지 제목");
    // 요청 메시지
    sign.setReqMessage(passcertService.encrypt("전자서명 요청 메시지"));
    // 고객센터 연락처
    sign.setCallCenterNum("1600-9854");
    // 요청 만료시간 - 최대 1,000(초)까지 입력 가능
    sign.setExpireIn(1000);
    // 서명 원문 유형
    // TEXT - 일반 텍스트, HASH - HASH 데이터, URL - URL 데이터, PDF - PDF 데이터
    // 원본데이터(originalTypeCode, originalURL, originalFormatCode) 입력시 'TEXT'사용 불가
    sign.setTokenType("URL");
    // 서명 원문 - 원문 2,800자 까지 입력가능
    sign.setToken(passcertService.encrypt("전자서명 요청 원문"));
	// 서명 원문 유형
    // sign.setTokenType("PDF");
    // 서명 원문 유형이 PDF인 경우, 원문은 SHA-256, Base64 URL Safe No Padding을 사용
    // String file = getServletContext().getRealPath("/barocert.pdf");
    // byte[] target = Filez.fileToBytesFrom(file);
    // sign.setToken(passcertService.encrypt(passcertService.sha256_base64url_file(target)));

    // 사용자 동의 필요 여부
    sign.setUserAgreementYN(true);
    // 사용자 정보 포함 여부
    sign.setReceiverInfoYN(true);

    // 원본유형코드
    // 'AG' - 동의서, 'AP' - 신청서, 'CT' - 계약서, 'GD' - 안내서, 'NT' - 통지서, 'TR' - 약관
    sign.setOriginalTypeCode("TR");
    // 원본조회URL
    sign.setOriginalURL("https://www.passcert.co.kr");
    // 원본형태코드
    // 'TEXT', 'HTML', 'DOWNLOAD_IMAGE', 'DOWNLOAD_DOCUMENT'
    sign.setOriginalFormatCode("HTML");

    // AppToApp 인증요청 여부
    // true - AppToApp 인증방식, false - 푸시(Push) 인증방식
    sign.setAppUseYN(false);
    // ApptoApp 인증방식에서 사용
    // 통신사 유형('SKT', 'KT', 'LGU'), 대문자 입력(대소문자 구분)
    // sign.setTelcoType("SKT");
    // ApptoApp 인증방식에서 사용
    // 모바일장비 유형('ANDROID', 'IOS'), 대문자 입력(대소문자 구분)
    // sign.setDeviceOSType("IOS");
    
    SignReceipt result = null;

    try {
        
        result = passcertService.requestSign(clientCode, sign);

    } catch(BarocertException pe) {
        throw pe;
    }
%>
    <body>
        <div id="content">
            <p class="heading1">Response</p>
            <br/>
            <fieldset class="fieldset1">
                <legend>패스 전자서명 요청</legend>
                <ul>
                    <li>ReceiptID (접수아이디) : <%=result.getReceiptID()%></li>
                    <li>scheme (앱스킴) : <%=result.getScheme()%></li>
                    <li>MarketUrl (앱다운로드URL) : <%=result.getMarketUrl()%></li>
                </ul>
            </fieldset>
        </div>
    </body>
</html>
