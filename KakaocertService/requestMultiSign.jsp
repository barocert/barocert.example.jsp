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
<%@page import="com.barocert.kakaocert.sign.Sign"%>
<%@page import="com.barocert.kakaocert.sign.MultiSignReceipt"%>
<%@page import="com.barocert.kakaocert.sign.MultiSign"%>
<%@page import="com.barocert.kakaocert.sign.MultiSignTokens"%>

<%
    /*
     * 카카오톡 이용자에게 복수(최대 20건) 문서의 전자서명을 요청합니다.
     * https://developers.barocert.com/reference/kakao/java/sign/api-multi#RequestMultiSign
     */

    // 이용기관코드, 파트너가 등록한 이용기관의 코드 (파트너 사이트에서 확인가능)
    String clientCode = "023030000004";

    // 전자서명 요청 정보 객체
    MultiSign multiSign = new MultiSign();

    // 수신자 휴대폰번호 - 11자 (하이픈 제외)
    multiSign.setReceiverHP(kakaocertService.encrypt("01012341234"));
    // 수신자 성명 - 80자
    multiSign.setReceiverName(kakaocertService.encrypt("홍길동"));
    // 수신자 생년월일 - 8자 (yyyyMMdd)
    multiSign.setReceiverBirthday(kakaocertService.encrypt("19700101"));

    // 인증요청 메시지 제목 - 최대 40자
    multiSign.setReqTitle("전자서명복수테스트");
    // 인증요청 만료시간 - 최대 1,000(초)까지 입력 가능
    multiSign.setExpireIn(1000);

    // 개별문서 등록 - 최대 20 건
    // 개별 요청 정보 객체
    MultiSignTokens token = new MultiSignTokens();
    // 인증요청 메시지 제목 - 최대 40자
    token.setReqTitle("전자서명복수문서테스트1");
    // 서명 원문 - 원문 2,800자 까지 입력가능
    token.setToken(kakaocertService.encrypt("전자서명복수테스트데이터1"));
    multiSign.addToken(token);

    // 개별 요청 정보 객체
    MultiSignTokens token2 = new MultiSignTokens();
    // 인증요청 메시지 제목 - 최대 40자
    token2.setReqTitle("전자서명복수문서테스트2");
    // 서명 원문 - 원문 2,800자 까지 입력가능
    token2.setToken(kakaocertService.encrypt("전자서명복수테스트데이터2"));
    multiSign.addToken(token2);

    // 서명 원문 유형
    // TEXT - 일반 텍스트, HASH - HASH 데이터
    multiSign.setTokenType("TEXT");

    // AppToApp 인증요청 여부
    // true - AppToApp 인증방식, false - Talk Message 인증방식
    multiSign.setAppUseYN(false);

    // App to App 방식 이용시, 에러시 호출할 URL
    // multiSign.setReturnURL("https://www.kakaocert.com");
    
    MultiSignReceipt result = null;

    try {
        
        result = kakaocertService.requestMultiSign(clientCode, multiSign);
        
    } catch(BarocertException ke) {
        throw ke;
    }
%>
    <body>
        <div id="content">
            <p class="heading1">Response</p>
            <br/>
            <fieldset class="fieldset1">
                <legend>카카오 전자서명 요청(복수)</legend>
                <ul>
                    <li>접수아이디 (ReceiptID) : <%=result.getReceiptID()%></li>
                    <li>앱스킴 (scheme) : <%=result.getScheme()%></li>
                </ul>
            </fieldset>
        </div>
    </body>
</html>
