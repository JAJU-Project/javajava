package last.project.store.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
/*
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
*/
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import last.project.store.service.KakaoLoginServiceAPI;
import lombok.Setter;
import lombok.extern.java.Log;

@Controller
@Log
public class KakaoController {

    @Setter(onMethod_ = @Autowired)
    private KakaoLoginServiceAPI kakaoLoginServiceAPI;

    @GetMapping("test.do")
    public String test(HttpSession session, String scode) {
        session.setAttribute("scode", scode);
        log.info("#test.do scode: " + scode);
        return "test";
    }

    @GetMapping("rdu.do")
    public String rdu(String code, HttpSession session) {
        String access_Token = kakaoLoginServiceAPI.getAccessToken(code);
        HashMap<String, Object> userInfo = kakaoLoginServiceAPI.getUserInfo(access_Token);
        log.info("#rdu.do session:" + session.getAttribute("scode"));
        log.info("#rdu.do access_Token:" + access_Token);
        log.info("#rdu.do userInfo:" + userInfo);
        log.info("#rdu.do age_range:" + userInfo.get("age_range"));
        if (userInfo.get("email") != null) {
            session.setAttribute("email", userInfo.get("email"));
            session.setAttribute("nickname", userInfo.get("nickname"));
            session.setAttribute("access_Token", access_Token);
        }
        return "redirect:storeMain.do";
    }

    @GetMapping("test2.do")
    public String test2(HttpSession session) {
        String access_Token = (String) session.getAttribute("access_Token");
        kakaoLoginServiceAPI.logout(access_Token);
        session.invalidate();
        return "redirect:/";
    }

    @GetMapping("kakaoPay.do")
    public void kakaoPayGet() {

    }

    @PostMapping("kakaoPay.do")
    public String kakaoPay() {
        log.info("kakaoPay post............................................");

        return "redirect:" + kakaoLoginServiceAPI.pay();
    }

    @GetMapping("/kakaoPaySuccess")
    public void kakaoPaySuccess(@RequestParam("pg_token") String pg_token, Model model) {
        log.info("kakaoPaySuccess get............................................");
        log.info("kakaoPaySuccess pg_token : " + pg_token);

    }
}
