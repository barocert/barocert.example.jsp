<%--
===================================================================================
* Barocert Service jsp Example
*
* Class Module for base module for Barocert API SDK. It include base functionality for
* RESTful web service request and parse json result. It uses Linkhub class module
* to accomplish authentication APIs.

* Update date : 2023-07-05
===================================================================================
--%>

<%@page errorPage="/exception.jsp" %>

<jsp:useBean id="passcertService" scope="application" class="com.barocert.passcert.PasscertServiceImp"/>

<%-- 링크아이디 --%>
<jsp:setProperty name="passcertService" property="linkID" value="TESTER"/>

<%-- 비밀키, 사용자 인증에 사용되는 정보이므로 유출에 주의 --%>
<jsp:setProperty name="passcertService" property="secretKey" value="SwWxqU+0TErBXy/9TVjIPEnI0VTUMMSQZtJf3Ed8q3I="/>

<%-- 개인키, 서명 검증의 응답 사용자 정보 복호화 키이므로 유출에 주의 --%>
<jsp:setProperty name="passcertService" property="decryptKey" value="MIIEvAIBADANBgkqhkiG9w0BAQEFAASCBKYwggSiAgEAAoIBAQD3RyVRxt1U0ZS5HPmo2Kxga4Q/BTMyT6FPk/DO3eOo4Cy6BG+DvDAImEVHmJRa4HQOst8RpMmt4mbhutOckKwC1oNZiTBD6Q4fN9c5vSAif83jEZ1z8DbxhTNqjXwtu5Sh/UyUs0RZFHBMKKpOGY5eQOJiGQ4cZXRzM0WaAKdoKCEZVsCUETBjsl6j0XSuoPEJp+ctt5rQvuxVmWp7wyVCKkJ42rdvjqO+Wkk5eYZz883xOAqi+h9vXcaEam5nKMX0W041/DWuhigDcJ18Zb6QA9+MRlB5O+FTi6UtROHtdL0zhofgrrzr6HbZGx27RPq2e8B7nxfn2iMMTEA6Sf73AgMBAAECggEAUvxTb/BXUyHK0Z0BxEKDBxDOHwA1wEqtDjHN/P7GamRhXkQi0IkVbaz8gxyXnS/6gvxQlHFDJdH3SQYUAlUjBQjMp/28bu4FyUBKQJxR7oIJrIy61K/nIILdUIMPC6IKLZr+WmEXLPYJAeYb0X4OI1+PGfDipXD+9bJdR2O0yuUT5mn620EessjmRAFryzqL8frhlVQXLLtXLOYHNTR6BW9ojmZX7T9tX8bacyReWkiOS6/juhkbvP8iBLTPOEGR9u77JBh5zaelv8emiCBHujZ5PsgXjs9aTjBgNORKz6M1xcDnst6HSnqfIdWyOttCZRew3sUQfCN5n6+5O0eVIQKBgQD716KntRW5GR7BqdCiJ5iNTWMH99Wm+ujURbps5TqelBLvGl0p0avh7o2iXb2vwwoHf/HXJyUWYurcaNQdUNTnRVoVnrGbu2Jqpgf0fzZJrUL/BUTCd9hprbR3HlpEpPhZePsa3dbez/5xDzAk4CblGqr0XZ0TIA5VtaLzBFu7DwKBgQD7XDhCzji8r/YwFv1DVI9NK/+89uqhNVIyIbxByAc+PJDRuuvShw53yyQV2l/Ao2ChoquWmy3qsQWViWiBH3GeMdhvbIg+23Kpp3dwTpsrqtWx4oAkcpWHFlEuUqcbyE+hehO1ObWZVLdTR4ueyGJBFwHqp2zO9/AM5nDE8lGdmQKBgDU153kVysQ0KYpzrdBFG3dnjXAGjk7cnssS/IO7nzoYQTPh1yNZ2L5A4A4ZTlXPmNPi1Z9G9xAW0FbHk2GqTYGb5p/AyvgDjJTKBc5D/p1sjUZCv7dzCPezKvksIZh1Xr/QzwVrL9YeDj2nHt37ulwX2V0OVnzO/hhf61D7b8JDAoGAUDqRIpGb/m3TkGnmEHWO/7zJddEB9s6EG8g0xHJKDY1bU/Xri1jcP1QxgmAfK+d50l2PkxSYxU4XUDF5j60voKScRoRHwHhe0tPHBauxT3DJoGuBJyEDpQh0hOqQuAdpk0rZu4Bd/EDT+trdL6MZ6ViknfcufakZj6SF3fbSIhECgYBxwuATvn2ep73G3SRSEl2N9AnpVi2kElLFtOi94BVXuehrDN0R27/NEywFUfgy5ydha61Ks7G3h8XW2919AZqLK8i1PFQywaLUZ3nEsDsBcX1QDmaVbwBjpgAmL38cqa9cazrw5by0tBGfPKTOrqQZsudOQ2prD8L2EEFCE9MhDA=="/>

<%-- 인증토큰 발급 IP 제한 On/Off, true-사용, false-미사용  기본값(true)--%>
<jsp:setProperty name="passcertService" property="IPRestrictOnOff" value="true"/>

<%-- Barocert API 서비스 고정 IP 사용여부, true-사용, false-미사용, 기본값(false) --%>
<jsp:setProperty name="passcertService" property="useStaticIP" value="false"/>

<%-- 로컬시스템 시간 사용여부 true-사용, false-미사용, 기본값(true) --%>
<jsp:setProperty name="passcertService" property="useLocalTimeYN" value="true"/>
