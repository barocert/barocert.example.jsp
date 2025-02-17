<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/main.css" media="screen" />
        <title>Barocert JSP Example</title>
    </head>

<%@ include file="common.jsp" %>

<%@page import="com.barocert.BarocertException"%>
<%@page import="com.barocert.kakaocert.sign.Sign"%>
<%@page import="com.barocert.kakaocert.sign.SignReceipt"%>
<%@page import="com.barocert.crypto.Filez"%>

<%
    /*
     * 카카오톡 이용자에게 단건(1건) 문서의 전자서명을 요청합니다.
     * https://developers.barocert.com/reference/kakao/java/sign/api-single#RequestSign
     */

    // 이용기관코드, 파트너가 등록한 이용기관의 코드 (파트너 사이트에서 확인가능)
    String clientCode = "023040000001";

    // 전자서명 요청 정보 객체
    Sign sign = new Sign();

    // 수신자 휴대폰번호 - 11자 (하이픈 제외)
    sign.setReceiverHP(kakaocertService.encrypt("01054437896"));
    // 수신자 성명 - 80자
    sign.setReceiverName(kakaocertService.encrypt("최상혁"));
    // 수신자 생년월일 - 8자 (yyyyMMdd)
    sign.setReceiverBirthday(kakaocertService.encrypt("19880301"));

    // 서명 요청 제목 - 최대 40자
    sign.setSignTitle("전자서명(단건) 서명 요청 제목");
    // 커스텀 메시지 - 최대 500자
    sign.setExtraMessage(kakaocertService.encrypt("전자서명(단건) 커스텀 메시지"));
    // 인증요청 만료시간 - 최대 1,000(초)까지 입력 가능
    sign.setExpireIn(1000);
    // 서명 원문 유형
    // TEXT - 일반 텍스트, HASH - HASH 데이터, PDF - PDF 데이터
    sign.setTokenType("TEXT");
    // 서명 원문 - 원문 2,800자 까지 입력가능
    sign.setToken(kakaocertService.encrypt("전자서명(단건) 요청 원문"));
	// 서명 원문 유형
    // sign.setTokenType("PDF");
    // 서명 원문 유형이 PDF인 경우, 원문은 SHA-256, Base64 URL Safe No Padding을 사용
    // String file = getServletContext().getRealPath("/barocert.pdf");
    // byte[] target = Filez.fileToBytesFrom(file);
    // sign.setToken(kakaocertService.encrypt(kakaocertService.sha256_base64url_file(target)));

    
    // AppToApp 인증요청 여부
    // true - AppToApp 인증방식, false - Talk Message 인증방식
    sign.setAppUseYN(false);

    // App to App 방식 이용시, 호출할 URL
    // sign.setReturnURL("https://www.kakaocert.com");
    
    SignReceipt result = null;

    try {
        
        result = kakaocertService.requestSign(clientCode, sign);
        
    } catch(BarocertException ke) {
        throw ke;
    }
%>
    <body>
        <div id="content">
            <p class="heading1">Response</p>
            <br/>
            <fieldset class="fieldset1">
                <legend>카카오 전자서명(단건) 요청</legend>
                <ul>
                    <li>ReceiptID (접수아이디) : <%=result.getReceiptID()%></li>
                    <li>Scheme (앱스킴) : <%=result.getScheme()%></li>
                </ul>
            </fieldset>
        </div>
    </body>
</html>
