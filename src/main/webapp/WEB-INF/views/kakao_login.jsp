<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>

<!DOCTYPE html>
<html>
<meta charset="utf-8">
<head>
    <title>Page Title</title>
</head>
<body style="text-align: center">
    <a href="javascript:kakaoLogin();"><img src="https://www.gb.go.kr/Main/Images/ko/member/certi_kakao_login.png"
    style="height:50px;width:auto;"></a>
    <a href="javascript:Logout()">로그아웃!</a>
    <a href="javascript:test()">test!</a>


    <a id="custom-login-btn" href="javascript:loginWithKakao()">
    <img
        src="//k.kakaocdn.net/14/dn/btqCn0WEmI3/nijroPfbpCa4at5EIsjyf0/o.jpg"
        width="222"
    />
    </a>
    <p id="token-result"></p>

    <script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
    <script type="text/javascript">
        
        window.Kakao.init("b559bc8cc6f160c8fc79949d1d6bcde2");
        function kakaoLogin() {
            window.Kakao.Auth.login({
                scope:'profile_nickname, account_email, age_range',
                //redirectUri: 'http://localhost:8000/storeMain.do',
                success: function(authObj){
                    console.log(authObj);
                    window.Kakao.API.request({
                        url:'/v2/user/me',
                        success: res => {
                            const kakao_account = res.kakao_account;
                            console.log(kakao_account);
                            console.log(kakao_account.email);
                            console.log(kakao_account.profile.nickname);
                            console.log(kakao_account.age_range);
                            Kakao.API.request({
                                url: '/v1/user/update_profile',
                                data: {
                                    properties: {
                                        nickname: kakao_account.profile.nickname
                                    },
                                },
                                success: function(response) {
                                    console.log(response);
                                },
                                fail: function(error) {
                                    console.log(error);
                                }
                            });
                        }
                    });
                }
            });
        }

        
        function Logout(){ 
           // Kakao.init("b559bc8cc6f160c8fc79949d1d6bcde2");
            Kakao.isInitialized();

            if (!Kakao.Auth.getAccessToken()) {
                console.log('Not logged in.');
                return;
            }

            Kakao.Auth.logout(function () {
                console.log(Kakao.Auth.getAccessToken());
            })
            }

            function test() {
                Kakao.API.request({
                    url: '/v1/user/unlink',
                    success: function(response) {
                        console.log(response);
                    },
                    fail: function(error) {
                        console.log(error);
                    },
                    });
            }

            function loginWithKakao() {
                Kakao.Auth.authorize({
                        redirectUri: 'http://localhost:8000/kakao.do'
                        })
                    }
                    // 아래는 데모를 위한 UI 코드입니다.
                    displayToken()
                    function displayToken() {
                        const token = getCookie('authorize-access-token')
                        if(token) {
                        Kakao.Auth.setAccessToken(token)
                        Kakao.Auth.getStatusInfo(({ status }) => {
                            if(status === 'connected') {
                            document.getElementById('token-result').innerText = 'login success. token: ' + Kakao.Auth.getAccessToken()
                            } else {
                            Kakao.Auth.setAccessToken(null)
                            }
                        })
                        }
                    }
                    function getCookie(name) {
                        const value = "; " + document.cookie;
                        const parts = value.split("; " + name + "=");
                        if (parts.length === 2) return parts.pop().split(";").shift();
            }
    </script>


</body>
</html>