package last.project.store.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.AllArgsConstructor;

@Controller
@AllArgsConstructor
public class RedirectController { // 페이지 이동 담당.

    @GetMapping("/")
    public String index() { // Test용 index 페이지
        return "index";
    }

    @GetMapping("sign_up.do") // 회원가입
    public String sign_up() {
        return "sign_up"; // 회원가입 페이지 이동.
    }

    @GetMapping("login.do") // 로그인
    public String login() {
        return "login"; // 로그인 페이지 이동
    }

    @GetMapping("logout.do") // 로그아웃
    public String logout(HttpSession session) {
        session.invalidate(); // 모든 세션 정보 삭제
        return "redirect:/"; // index 페이지로 이동
    }

    @GetMapping("store_create.do") // 매장생성
    public String store_create() {
        return "store_create"; // 매장 생성 페이지 이동
    }

    @GetMapping("category_in.do") // 카테고리생성
    public String category_in() {
        return "category_in"; // 카테고리 생성 페이지 이동
    }

}
