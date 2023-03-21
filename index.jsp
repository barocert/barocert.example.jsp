<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/main.css" media="screen"/>

    <title>Barocert Kakaocert Service jsp Example.</title>
</head>
<body>
<div id="content">
    <p class="heading1">Barocert Kakaocert Service jsp Example.</p>
    <br/>
    <fieldset class="fieldset1">
        <legend>전자서명 API</legend>
        <ul>
            <li><a href="KakaocertService/resultESign.jsp">RequestESign</a> - 전자서명 요청(단건)</li>
            <li><a href="KakaocertService/bulkResultESign.jsp">BulkRequestESign</a> - 전자서명 요청(다건)</li>
            <li><a href="KakaocertService/getESignState.jsp">GetESignState</a> - 전자서명 상태확인(단건)</li>
            <li><a href="KakaocertService/getBulkESignState.jsp">GetBulkESignState</a> - 전자서명 상태확인(다건)</li>
            <li><a href="KakaocertService/verifyESign.jsp">VerifyESign</a> - 전자서명 검증(단건)</li>
            <li><a href="KakaocertService/bulkVerifyESign.jsp">BulkVerifyESign</a> - 전자서명 검증(다건)</li>
        </ul>
    </fieldset>

    <fieldset class="fieldset1">
        <legend>본인인증 API</legend>
        <ul>
            <li><a href="KakaocertService/requestVerifyAuth.jsp">RequestVerifyAuth</a> - 본인인증 요청</li>
            <li><a href="KakaocertService/getVerifyAuthState.jsp">GetVerifyAuthState</a> - 본인인증 상태확인</li>
            <li><a href="KakaocertService/verifyAuth.jsp">VerifyAuth</a> - 본인인증 검증</li>
        </ul>
    </fieldset>

    <fieldset class="fieldset1">
        <legend>출금동의 API</legend>
        <ul>
            <li><a href="KakaocertService/requestCMS.jsp">RequestCMS</a> - 출금동의 요청</li>
            <li><a href="KakaocertService/getCMSState.jsp">GetCMSState</a> - 출금동의 상태확인</li>
            <li><a href="KakaocertService/verifyCMS.jsp">VerifyCMS</a> - 출금동의 검증</li>
        </ul>
    </fieldset>
</div>
</body>
</html>
