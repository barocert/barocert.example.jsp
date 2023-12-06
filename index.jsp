<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/main.css" media="screen"/>

    <title>Barocert Service jsp Example</title>
</head>
<body>
<div id="content">
    <p class="heading1">Barocert Service jsp Example</p>
    <br/>
    <fieldset class="fieldset1">
        <legend>Kakaocert 본인인증 API</legend>
        <ul>
            <li><a href="KakaocertService/requestIdentity.jsp">RequestIdentity</a> - 본인인증 요청</li>
            <li><a href="KakaocertService/getIdentityStatus.jsp">getIdentityStatus</a> - 본인인증 상태확인</li>
            <li><a href="KakaocertService/verifyIdentity.jsp">VerifyIdentity</a> - 본인인증 검증</li>
        </ul>
    </fieldset>
    
    <fieldset class="fieldset1">
        <legend>Kakaocert 전자서명 API</legend>
        <ul>
            <li><a href="KakaocertService/requestSign.jsp">RequestSign</a> - 전자서명 요청(단건)</li>
            <li><a href="KakaocertService/getSignStatus.jsp">GetSignStatus</a> - 전자서명 상태확인(단건)</li>
            <li><a href="KakaocertService/verifySign.jsp">VerifySign</a> - 전자서명 검증(단건)</li>
            <li><a href="KakaocertService/requestMultiSign.jsp">RequestMultiSign</a> - 전자서명 요청(다건)</li>
            <li><a href="KakaocertService/getMultiSignStatus.jsp">GetMultiSignStatus</a> - 전자서명 상태확인(다건)</li>
            <li><a href="KakaocertService/verifyMultiSign.jsp">VerifyMultiSign</a> - 전자서명 검증(다건)</li>
        </ul>
    </fieldset>

    <fieldset class="fieldset1">
        <legend>Kakaocert 출금동의 API</legend>
        <ul>
            <li><a href="KakaocertService/requestCMS.jsp">RequestCMS</a> - 출금동의 요청</li>
            <li><a href="KakaocertService/getCMSStatus.jsp">GetCMSStatus</a> - 출금동의 상태확인</li>
            <li><a href="KakaocertService/verifyCMS.jsp">VerifyCMS</a> - 출금동의 검증</li>
        </ul>
    </fieldset>

    <fieldset class="fieldset1">
        <legend>Kakaocert 간편로그인 API</legend>
        <ul>
            <li><a href="KakaocertService/verifyLogin.jsp">VerifyLogin</a> - 간편로그인 검증</li>
        </ul>
    </fieldset>

    <fieldset class="fieldset1">
        <legend>Navercert 본인인증 API</legend>
        <ul>
            <li><a href="NavercertService/requestIdentity.jsp">RequestIdentity</a> - 본인인증 요청</li>
            <li><a href="NavercertService/getIdentityStatus.jsp">getIdentityStatus</a> - 본인인증 상태확인</li>
            <li><a href="NavercertService/verifyIdentity.jsp">VerifyIdentity</a> - 본인인증 검증</li>
        </ul>
    </fieldset>
    <fieldset class="fieldset1">
        <legend>Navercert 전자서명 API</legend>
        <ul>
            <li><a href="NavercertService/requestSign.jsp">RequestSign</a> - 전자서명 요청(단건)</li>
            <li><a href="NavercertService/getSignStatus.jsp">GetSignStatus</a> - 전자서명 상태확인(단건)</li>
            <li><a href="NavercertService/verifySign.jsp">VerifySign</a> - 전자서명 검증(단건)</li>
            <li><a href="NavercertService/requestMultiSign.jsp">RequestMultiSign</a> - 전자서명 요청(다건)</li>
            <li><a href="NavercertService/getMultiSignStatus.jsp">GetMultiSignStatus</a> - 전자서명 상태확인(다건)</li>
            <li><a href="NavercertService/verifyMultiSign.jsp">VerifyMultiSign</a> - 전자서명 검증(다건)</li>
        </ul>
    </fieldset>
    <fieldset class="fieldset1">
        <legend>Navercert 출금동의 API</legend>
        <ul>
            <li><a href="NavercertService/requestCMS.jsp">RequestCMS</a> - 출금동의 요청</li>
            <li><a href="NavercertService/getCMSStatus.jsp">getCMSStatus</a> - 출금동의 상태확인</li>
            <li><a href="NavercertService/verifyCMS.jsp">VerifyCMS</a> - 출금동의 검증</li>
        </ul>
    </fieldset>
    <br/>
    <fieldset class="fieldset1">
        <legend>Passcert 본인인증 API</legend>
        <ul>
            <li><a href="PasscertService/requestIdentity.jsp">RequestIdentity</a> - 본인인증 요청</li>
            <li><a href="PasscertService/getIdentityStatus.jsp">getIdentityStatus</a> - 본인인증 상태확인</li>
            <li><a href="PasscertService/verifyIdentity.jsp">VerifyIdentity</a> - 본인인증 검증</li>
        </ul>
    </fieldset>
    
    <fieldset class="fieldset1">
        <legend>Passcert 전자서명 API</legend>
        <ul>
            <li><a href="PasscertService/requestSign.jsp">RequestSign</a> - 전자서명 요청</li>
            <li><a href="PasscertService/getSignStatus.jsp">GetSignStatus</a> - 전자서명 상태확인</li>
            <li><a href="PasscertService/verifySign.jsp">VerifySign</a> - 전자서명 검증</li>
        </ul>
    </fieldset>

    <fieldset class="fieldset1">
        <legend>Passcert 출금동의 API</legend>
        <ul>
            <li><a href="PasscertService/requestCMS.jsp">RequestCMS</a> - 출금동의 요청</li>
            <li><a href="PasscertService/getCMSStatus.jsp">GetCMSStatus</a> - 출금동의 상태확인</li>
            <li><a href="PasscertService/verifyCMS.jsp">VerifyCMS</a> - 출금동의 검증</li>
        </ul>
    </fieldset>

    <fieldset class="fieldset1">
        <legend>Passcert 간편로그인 API</legend>
        <ul>
            <li><a href="PasscertService/requestLogin.jsp">RequestLogin</a> - 간편로그인 요청</li>
            <li><a href="PasscertService/getLoginStatus.jsp">GetLoginStatus</a> - 간편로그인 상태확인</li>
            <li><a href="PasscertService/verifyLogin.jsp">VerifyLogin</a> - 간편로그인 검증</li>
        </ul>
    </fieldset>
</div>


</body>
</html>
