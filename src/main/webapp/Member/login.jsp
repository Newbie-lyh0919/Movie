<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
            rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
    <script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
    <title>로그인</title>
    <style>
        body {
            background-color: black;
        }

        a {
            text-decoration: none;
        }

        .contents {
            height: 500px;
        }

        /* header */

        #navLogo {
            width: 150px;
            height: 100px;
        }

        #logoImg {
            width: 100%;
            height: 100%;
        }

        /* Icon */
        #logoutIcon {
            width: 30px;
            height: 30px;
        }

        #cartIcon {
            width: 30px;
            height: 30px;
        }

        #myPageIcon {
            width: 30px;
            height: 30px;
        }

        #kakaoIcon {
            width: 30px;
            height: 30px;
        }

        #twitterIcon {
            width: 30px;
            height: 30px;
        }

        #instagramIcon {
            width: 30px;
            height: 30px;
        }

        #facebookIcon {
            width: 30px;
            height: 30px;
        }

        .snsIcon1 {
            float: left;
            margin-top: 10px;
            margin-right: 5px;
        }

        .snsIcon2 {
            float: left;
            margin-top: 10px;
            margin-right: 5px;
        }

        .snsIcon3 {
            float: left;
            margin-top: 10px;
            margin-right: 5px;
        }

        .snsIcon4 {
            float: left;
            margin-top: 10px;
        }

        /* Icon end */

        /* Footer */
        .nav-link {
            color: gray !important;
            text-decoration: none;
        }

        .nav-link:hover {
            color: white !important;
        }

        /* header 반응형 */
        @media ( max-width: 768px) {
            #navLogo {
                display: none;
            }

            #myPageIcon {
                display: none;
            }

            #cartIcon {
                display: none;
            }

            #menu {
                display: none;
            }
        }

        @media ( min-width: 768px) {
            #navibar {
                display: none;
            }
        }

        /* header 반응형 끝 */

        /* footer 반응형 시작 */
        @media ( max-width: 768px) {
            #bigFoot {
                display: none;
            }
        }

        @media ( min-width: 768px) {
            #smallFoot {
                display: none;
            }
        }
    </style>
</head>

<body onload="noBack();" onpageshow="if(event.persisted) noBack();" onunload="">
<header class="mb-3 border-bottom">
    <div class="container">
        <!-- 접혔을 때 nav -->
        <nav id="navibar" class="navbar navbar-expand-md navbar-dark" aria-label="Main navigation">
            <div class="container-fluid">
                <!-- toggle button -->
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                        data-bs-target="#navbarNavDropdown"
                        aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <!-- 메뉴 -->
                <div class="collapse navbar-collapse justify-content-end" id="navbarNavDropdown">
                    <ul class="navbar-nav mb-2 mb-lg-0">
                        <li class="nav-item"><a class="nav-link" href="/listLookup.movie?curPage=1">영화</a></li>
                        <li class="nav-item"><a class="nav-link" href="/toReviewList.re?curPage=1">리뷰</a></li>
                        <li class="nav-item"><a class="nav-link" href="/post.po?curPage=1">자유게시판</a></li>
                        <c:choose>
                            <c:when test="${empty loginSession}">
                                <li class="nav-item"><a class="nav-link" href="/toLogin.mem">로그인</a></li>
                                <li class="nav-item"><a class="nav-link" href="/toSignUp.mem">회원가입</a></li>
                            </c:when>
                            <c:otherwise>
                                <li class="nav-item"><a class="nav-link" href="/logout.mem">로그아웃</a></li>
                                <li class="nav-item"><a class="nav-link" href="/wishlist.wish">찜한 영화</a></li>
                                <li class="nav-item"><a class="nav-link" href="/myPage.mem?curPage=1">마이페이지</a></li>
                            </c:otherwise>
                        </c:choose>


                    </ul>

                    <form class="searchForm d-flex" method="get" action="/search.movie">
                        <input class="searchInput form-control me-2" type="search" placeholder="영화 검색.."
                               aria-label="Search" name='val'> <input
                            type="hidden" name='curPage' value="1"> <input type="hidden" name='s_type' value="movieNm">
                        <button class="searchBtn btn btn-outline-success" type="submit">Search</button>
                    </form>
                </div>
            </div>
        </nav>

        <!-- 펼쳐졌을 때 nav -->
        <nav id="menu" class="navbar navbar-expand-md w-100 navbar-dark" aria-label="Main navigation">
            <div class="row w-100 align-items-center">
                <div class="col-5 d-flex justify-content-center">
                    <ul class="navbar-nav mb-2 mb-lg-0">
                        <li class="nav-item"><a class="nav-link mx-2" href="/listLookup.movie?curPage=1">영화</a></li>
                        <li class="nav-item"><a class="nav-link mx-2" href="/toReviewList.re?curPage=1">리뷰</a></li>
                        <li class="nav-item"><a class="nav-link mx-2" href="/post.po?curPage=1">자유게시판</a></li>
                    </ul>
                </div>

                <!-- logo -->
                <div class="col-2">
                    <a href="/toHome.home" id="navLogo" class="mb-2 mb-lg-0">
                        <img id="logoImg" src="/images/logo3.png">

                    </a>
                </div>

                <div class="col-5">
                    <div class="row align-items-center justify-content-center">
                        <div class="col-auto">
                            <ul class="navbar-nav mb-2 mb-lg-0 me-2">
                                <c:if test="${empty loginSession}">
                                    <li class="nav-item"><a class="nav-link" href="/toLogin.mem">로그인</a></li>
                                    <li class="nav-item"><a class="nav-link" href="/toSignUp.mem">회원가입</a></li>
                                </c:if>
                            </ul>
                        </div>

                        <div class="col-auto">
                            <c:if test="${not empty loginSession}">
                                <a href="logout.mem"><img class="img-fluid" id="logoutIcon"
                                                          src="/images/logout.png"></a>
                                <a href="/wishlist.wish" class=""> <img class="img-fluid" id="cartIcon"
                                                                        src="/images/찜.png">
                                </a>
                                <a href="/myPage.mem?curPage=1" class=""> <img class="img-fluid" id="myPageIcon"
                                                                               src="/images/마이페이지.png">
                                </a>
                            </c:if>
                        </div>

                        <div class="col-1">
                            <button id="searchBtn" class="btn" type="button" data-bs-toggle="modal"
                                    data-bs-target="#searchModal">
                                <img src="/images/searchIcon.png">
                            </button>
                        </div>
                        <form class="searchForm d-flex" method="get" action="/search.movie">
                            <div class="modal fade" id="searchModal" tabindex="-1" aria-hidden="true">
                                <div class="modal-dialog modal-dialog-centered">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title m-auto">영화 찾기</h5>
                                            <button type="button" class="btn-close m-0" data-bs-dismiss="modal"
                                                    aria-label="Close"></button>
                                        </div>
                                        <div class="modal-body">
                                            <form id="searchForm" class="searchForm">
                                                <div class="row justify-content-center">
                                                    <div class="col-11">
                                                        <input class="searchInput form-control me-2" type="search"
                                                               placeholder="영화 검색.." aria-label="Search" name='val'>
                                                        <p class="text-black-50 text-center mt-3">찾으시는 영화가 있으신가요? 검색어를
                                                            입력해보세요!</p>
                                                        <input type="hidden" name='curPage' value="1"> <input
                                                            type="hidden" name='s_type' value="movieNm">
                                                    </div>
                                                </div>
                                                <div class="row justify-content-end">
                                                    <div class="col-3">
                                                        <button class="searchBtn btn btn-outline-success" type="submit">
                                                            Search
                                                        </button>
                                                    </div>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </nav>
    </div>
</header>
<!-- Contents -->
<div class="container">
    <div class="row justify-content-center">
        <div class="col-lg-6 col-md-11">
            <form id="loginForm" action="/loginProc.mem" method="post">
                <div class="card card-custom">
                    <div class="card-header">
                        <h4>로그인</h4>
                    </div>
                    <div class="card-body">
                        <div class="form-group p-2">
                            <p>ID*</p>
                            <div>
                                <input type="text" class="form-control" id="user_id"
                                       name="user_id" placeholder="ID">
                            </div>
                        </div>
                        <div class="form-group p-2">
                            <p>PW*</p>
                            <div>
                                <input type="password" class="form-control " id="user_pw"
                                       name="user_pw" placeholder="PW">
                            </div>
                        </div>
                        <div class="row p-3 justify-content-center">
                            <div class="col-5 d-flex justify-content-end">
                                <button type="button" class="btn btn-dark w-100" id="loginBtn">로그인</button>
                            </div>
                            <div class="col-5 flex justify-content-start">
                                <img id="kakaoLogin" src="/resources/images/kakao_login.png">
                            </div>
                        </div>
                        <div class="row p-3">
                            <div class="col text-center">
                                <p class="m-0">
                                    계정이 없으신가요? <a href="/toSignUp.mem"
                                                  class="text-decoration-none"><strong>회원가입</strong></a>을해보세요
                                </p>
                                <br>
                                <p class="m-0">
                                    아이디를 잊으셨나요? <a href="/toFindId.mem"
                                                   class="text-decoration-none"><strong>아이디찾기</strong></a>
                                </p>
                                <br>
                                <p class="m-0">
                                    비밀번호를 잊으셨나요? <a href="/toFindPw.mem"
                                                    class="text-decoration-none"><strong>비밀번호찾기</strong></a>
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
<footer class="py-5 text-light">
    <div class="container">
        <div class="row" id="bigFoot">
            <div class="col-2">
                <h5>장르</h5>
                <ul class="nav flex-column">
                    <li class="nav-item mb-2"><a href="/search.movie?s_type=genreAlt&curPage=1&val=코미디"
                                                 class="nav-link p-0">코미디</a></li>
                    <li class="nav-item mb-2"><a href="/search.movie?s_type=genreAlt&curPage=1&val=액션"
                                                 class="nav-link p-0">액션</a></li>
                    <li class="nav-item mb-2"><a href="/search.movie?s_type=genreAlt&curPage=1&val=멜로"
                                                 class="nav-link p-0">멜로</a></li>
                    <li class="nav-item mb-2"><a href="/search.movie?s_type=genreAlt&curPage=1&val=SF"
                                                 class="nav-link p-0">SF</a></li>
                    <li class="nav-item mb-2"><a href="/search.movie?s_type=genreAlt&curPage=1&val=호러"
                                                 class="nav-link p-0">호러</a></li>
                </ul>
            </div>

            <c:choose>
                <c:when test="${not empty loginSession}">
                    <div class="col-2">
                        <h5>계정</h5>
                        <ul class="nav flex-column">
                            <li class="nav-item mb-2"><a href="/logout.mem" class="nav-link p-0">로그아웃</a></li>
                            <li class="nav-item mb-2"><a href="/myPage.mem?curPage=1" class="nav-link p-0">마이페이지</a>
                            </li>
                            <li class="nav-item mb-2"><a href="/wishlist.wish" class="nav-link p-0">찜 목록</a></li>
                            <c:if test="${loginSession.grade == 'admin'}">
                                <li class="nav-item mb-2"><a href="/lookupMem.admin?curPage=1" class="nav-link p-0">관리자
                                    페이지</a></li>
                            </c:if>

                        </ul>
                    </div>
                </c:when>
                <c:otherwise>
                    <div class="col-2">
                        <h5>계정</h5>
                        <ul class="nav flex-column">
                            <li class="nav-item mb-2"><a href="/toLogin.mem" class="nav-link p-0">로그인</a></li>
                            <li class="nav-item mb-2"><a href="/signup.mem" class="nav-link p-0">회원가입</a></li>
                            <li class="nav-item mb-2"><a href="/toFindId.mem" class="nav-link p-0">아이디 찾기</a></li>
                            <li class="nav-item mb-2"><a href="/toFindPw.mem" class="nav-link p-0">비밀번호 찾기</a></li>
                        </ul>
                    </div>
                </c:otherwise>
            </c:choose>

            <div class="col-2">
                <h5>기타</h5>
                <ul class="nav flex-column">
                    <li class="nav-item mb-2"><a href="/toReviewList.re?curPage=1" class="nav-link p-0">리뷰</a></li>
                    <li class="nav-item mb-2"><a href="/post.po?curPage=1" class="nav-link p-0">자유게시판</a></li>
                </ul>
            </div>

            <div class="col-4 offset-1">
                <form>
                    <h5>영화 리뷰 플랫폼 - 영화 추천이</h5>
                    <p>
                        지금 영화를 리뷰하고,<br> 내 취향에 딱 맞는 영화를 추천받아 보세요!
                    </p>
                    <div class="d-flex w-100 gap-2">
                        <label for="newsletter1" class="visually-hidden">Email
                            address</label> <input id="newsletter1" type="text" class="form-control"
                                                   placeholder="Email address">
                        <button class="btn btn-primary" type="button">영화 추천받기</button>
                    </div>
                </form>

                <div class="snsBox">
                    <div class="snsIcon1">
                        <a href="https://www.kakaocorp.com/"
                           class="d-flex align-items-center mb-2 mb-lg-0"> <img
                                id="kakaoIcon" src="/images/kakaotalk.png">
                        </a>
                    </div>
                    <div class="snsIcon2">
                        <a href="https://twitter.com/"
                           class="d-flex align-items-center mb-2 mb-lg-0"> <img
                                id="twitterIcon" src="/images/twitter.png">
                        </a>
                    </div>
                    <div class="snsIcon3">
                        <a href="https://www.instagram.com/"
                           class="d-flex align-items-center mb-2 mb-lg-0"> <img
                                id="instagramIcon" src="/images/instagram.png">
                        </a>
                    </div>
                    <div class="snsIcon4">
                        <a href="https://www.facebook.com/"
                           class="d-flex align-items-center mb-2 mb-lg-0"> <img
                                id="facebookIcon" src="/images/facebook.png">
                        </a>
                    </div>
                </div>
            </div>
        </div>

        <div class="row justify-content-center" id="smallFoot">
            <div class="col-4">
                <h5>장르</h5>
                <ul class="nav flex-column">
                    <li class="nav-item mb-2"><a href="/search.movie?s_type=genreAlt&curPage=1&val=코미디"
                                                 class="nav-link p-0">코미디</a></li>
                    <li class="nav-item mb-2"><a href="/search.movie?s_type=genreAlt&curPage=1&val=액션"
                                                 class="nav-link p-0">액션</a></li>
                    <li class="nav-item mb-2"><a href="/search.movie?s_type=genreAlt&curPage=1&val=멜로"
                                                 class="nav-link p-0">멜로</a></li>
                    <li class="nav-item mb-2"><a href="/search.movie?s_type=genreAlt&curPage=1&val=SF"
                                                 class="nav-link p-0">SF</a></li>
                    <li class="nav-item mb-2"><a href="/search.movie?s_type=genreAlt&curPage=1&val=호러"
                                                 class="nav-link p-0">호러</a></li>
                </ul>
            </div>

            <c:choose>
                <c:when test="${not empty loginSession}">
                    <div class="col-4">
                        <h5>계정</h5>
                        <ul class="nav flex-column">
                            <li class="nav-item mb-2"><a href="/logout.mem" class="nav-link p-0">로그아웃</a></li>
                            <li class="nav-item mb-2"><a href="/myPage.mem?curPage=1" class="nav-link p-0">마이페이지</a>
                            </li>
                            <li class="nav-item mb-2"><a href="/wishlist.wish" class="nav-link p-0">찜 목록</a></li>
                            <c:if test="${loginSession.grade == 'admin'}">
                                <li class="nav-item mb-2"><a href="/lookupMem.admin?curPage=1" class="nav-link p-0">관리자
                                    페이지</a></li>
                            </c:if>
                        </ul>
                    </div>
                </c:when>
                <c:otherwise>
                    <div class="col-4">
                        <h5>계정</h5>
                        <ul class="nav flex-column">
                            <li class="nav-item mb-2"><a href="/toLogin.mem" class="nav-link p-0">로그인</a></li>
                            <li class="nav-item mb-2"><a href="/signup.mem" class="nav-link p-0">회원가입</a></li>
                            <li class="nav-item mb-2"><a href="/toFindId.mem" class="nav-link p-0">아이디 찾기</a></li>
                            <li class="nav-item mb-2"><a href="/toFindPw.mem" class="nav-link p-0">비밀번호 찾기</a></li>
                        </ul>
                    </div>
                </c:otherwise>
            </c:choose>

            <div class="col-4">
                <h5>기타</h5>
                <ul class="nav flex-column">
                    <li class="nav-item mb-2"><a href="/toReviewList.re?curPage=1" class="nav-link p-0">리뷰</a></li>
                    <li class="nav-item mb-2"><a href="/post.po?curPage=1" class="nav-link p-0">자유게시판</a></li>
                </ul>
            </div>

            <div class="col-12 mt-4">
                <form>
                    <h5>영화 리뷰 플랫폼 - 영화 추천이</h5>
                    <p>
                        지금 영화를 리뷰하고,<br> 내 취향에 딱 맞는 영화를 추천받아 보세요!
                    </p>
                    <div class="d-flex w-100 gap-2">
                        <label for="newsletter1" class="visually-hidden">Email
                            address</label> <input id="newsletter1" type="text" class="form-control"
                                                   placeholder="Email address">
                        <button class="btn btn-primary" type="button">영화 추천받기</button>
                    </div>
                </form>

                <div class="snsBox">
                    <div class="snsIcon1">
                        <a href="https://www.kakaocorp.com/"
                           class="d-flex align-items-center mb-2 mb-lg-0"> <img
                                id="kakaoIcon" src="/images/kakaotalk.png">
                        </a>
                    </div>
                    <div class="snsIcon2">
                        <a href="https://twitter.com/"
                           class="d-flex align-items-center mb-2 mb-lg-0"> <img
                                id="twitterIcon" src="/images/twitter.png">
                        </a>
                    </div>
                    <div class="snsIcon3">
                        <a href="https://www.instagram.com/"
                           class="d-flex align-items-center mb-2 mb-lg-0"> <img
                                id="instagramIcon" src="/images/instagram.png">
                        </a>
                    </div>
                    <div class="snsIcon4">
                        <a href="https://www.facebook.com/"
                           class="d-flex align-items-center mb-2 mb-lg-0"> <img
                                id="facebookIcon" src="/images/facebook.png">
                        </a>
                    </div>
                </div>
            </div>
        </div>

        <div class="d-flex justify-content-center py-4 my-4 border-top">
            <p>&copy; 영화 리뷰 플랫폼, 영화 추천이 All rights reserved.</p>
        </div>
    </div>
</footer>
<script>
    window.history.forward();
    function noBack(){
        window.history.forward();
    }

    const searchForm = $(".searchForm");
    searchForm.on("submit", function (event) {
        if ($(this).children(".searchInput").val() === "") {
            event.preventDefault();
            alert("검색어를 입력하세요");
        }
    });

    // 일반 로그인
    let regexId = /^[a-zA-Z][\w]+@[a-zA-Z]+\.(com|net|co\.kr|or\.kr)$/;
    let regexPw = /[a-zA-Z0-9~!@#$%^&*]{6,12}/;

    $("#loginBtn").on("click", function () {
        if ($("#user_id").val() === "") {
            alert("아이디를 입력해 주세요.");
            $('#user_id').focus();
            return;
        }
        /**/ else if (!regexId.test($("#user_id").val())) {
            alert("아이디를 정확히 입력해 주세요.")
            $('#user_id').focus();
            return;
        } /**/
        else if ($("#user_pw").val() === "") {
            alert("비밀번호를 입력해 주세요.");
            $('#user_pw').focus();
            return;
        }
        /**/ else if (!regexPw.test($("#user_pw").val())) {
            alert("비밀번호를 정확히 입력해 주세요.")
            $('#user_id').focus();
            return;
        }
        $("#loginForm").submit();
        
    })

    // 카카오 로그인
    $("#kakaoLogin").on("click", function () {
        kakaoLogin();
    })

    // 카카오 로그인
    Kakao.init('23a01cb0d87a6404d4df1ec97cf82ec7');

    function kakaoLogin() {

        Kakao.Auth.login({
            success: function (response) {
                Kakao.API.request({ // 사용자 정보 가져오기
                    url: '/v2/user/me',
                    success: function (response) {
                        $.ajax({
                            url: '/kakaoTokenCheck.ka', // ID중복체크를 통해 회원가입 유무를 결정한다.
                            type: "post",
                            data: {"user_k": response.id},
                            dataType: "json",
                            success: function (data) {
                                for (let dto of data) {
                                    console.log(dto.user_k);
                                    console.log(response.id);
                                    if (response.id == dto.user_k && dto.user_k != null && response.properties.nickname == dto.user_name) {
                                        // 존재하는 경우 로그인 처리
                                        createHiddenLoginForm(response.id, response.properties.nickname);
                                        break;
                                    } else if (response.id == dto.user_k && dto.user_k != null && response.properties.nickname != dto.user_name) {
                                        // 정보 미일치시
                                        alert("잘못된 정보입니다. 일반 로그인 또는 회원가입을 진행해 주세요.");
                                        location.href = "/toLogin.mem";
                                        break;
                                    } else {
                                        // 회원가입
                                        createHiddenSignupForm(response.id, response.properties.nickname);
                                    }
                                }
                            },
                            error: function (request, status, error) {
                                console.log(error);
                            }
                        });
                    }
                });
            },
            fail: function (error) {
                alert(error);
            }
        });
    }

    // 로그인
    function createHiddenLoginForm(user_k, user_name) {
        var frm = document.createElement('form');
        frm.setAttribute('method', 'post');
        frm.setAttribute('action', '/kakaoLogin.ka');
        var token = document.createElement('input');
        token.setAttribute('type', 'hidden');
        token.setAttribute('name', 'user_k');
        token.setAttribute('value', user_k);
        var name = document.createElement('input');
        name.setAttribute('type', 'hidden');
        name.setAttribute('name', 'user_name');
        name.setAttribute('value', user_name);
        frm.append(token, name);
        document.body.append(frm);
        frm.submit();
    }

    // 회원가입
    function createHiddenSignupForm(user_k, user_name) {
        var frm = document.createElement('form');
        frm.setAttribute('method', 'post');
        frm.setAttribute('action', '/kakaoSignup.ka');
        var token = document.createElement('input');
        token.setAttribute('type', 'hidden');
        token.setAttribute('name', 'user_k');
        token.setAttribute('value', user_k);
        var name = document.createElement('input');
        name.setAttribute('type', 'hidden');
        name.setAttribute('name', 'user_name');
        name.setAttribute('value', user_name);
        frm.append(token, name);
        document.body.append(frm);
        frm.submit();
    }
</script>
<c:if test="${black_rs eq false}">
	<script>
    	alert("해당 계정은 블랙리스트로 등록되어 접속이 불가합니다.");
	</script>
</c:if>
<c:if test="${rs eq false}">
    <script>
        alert("로그인에 실패했습니다.");
    </script>
</c:if>
</body>

</html>