<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <header class="head">
            <a href="mainpage" class="title">RUNAWAY</a>
            <div class="header-buttons">
                <div class="mypage">
                    <a href="mypage" class="mypage_text">
                        <img src=" ${pageContext.request.contextPath}/uimg/${member.user_photo}" style="border-radius: 50%; width: 30px; height: 30px;">
                        ${member.user_nickname }
                    </a>
                </div>
                <div class="logout">
                    <a href="logout" class="logout_text">
                        <i class="fa-solid fa-right-from-bracket"></i>&nbsp; 로그아웃
                    </a>
                </div>
            </div>
        </header>