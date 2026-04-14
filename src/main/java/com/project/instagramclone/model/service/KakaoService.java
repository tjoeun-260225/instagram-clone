package com.project.instagramclone.model.service;


import com.project.instagramclone.common.CookieUtil;
import com.project.instagramclone.common.JwtUtil;
import com.project.instagramclone.model.dto.User;
import jakarta.servlet.http.HttpServletResponse;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.*;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

// 팀장님이 내리고싶은 지시사항들 기능뒤에 {} 넣지않은 코드들
public interface KakaoService {
    /**
     * ㅇㅇㅇ 담당자는 로그인주소를 완성할 것
     * 1. 카카오에서 API 키를 회사것이 있는지 확인 후 회사 API 사용
     * or 회사에서 API키가 있다 -> ㅇㅇㅇ위치 ㅇㅇㅇㅇ이름으로 사용 중
     * 2. 카카오주소 확인하고 클라이언트에게서 넘어온 주소를 db에 저장한다.
     * @return
     */
    String 카카오로그인주소();

    /**
     * 소비자는 카카오톡 로그인 프론트엔드에서 클릭
     * @param 인가코드 카카오인가코드를 전달받아
     * @param response 응답에 대한 결과를 소비자에게전달한다.
     */
    void 카카오로그인(String 인가코드, HttpServletResponse response) throws IOException;

    void JWT발급후쿠키저장(String 이메일, HttpServletResponse response);

    String 엑세스토큰발급(String 인가코드);

    Map<String, String> 유저정보조회(String 카카오토큰);
}