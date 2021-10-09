package last.project.store.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import last.project.store.service.ManagerService;
import lombok.AllArgsConstructor;
import lombok.extern.java.Log;

@Controller
@Log
@AllArgsConstructor
public class LoginController {
    private ManagerService managerService;

    @GetMapping("login.do") // 로그인
    public String login() {
        return "login"; // 로그인 페이지 이동
    }

    @GetMapping("logout.do") // 로그아웃
    public String logout(HttpSession session) {
        session.invalidate(); // 모든 세션 정보 삭제
        return "redirect:/"; // index 페이지로 이동
    }

    @PostMapping("login.do") // 로그인
    public String login(String maid, String mapwd, HttpSession session) {
        log.info("#login.do maid: " + maid + ", mapwd: " + mapwd);
        String maname = managerService.selectByLogin(maid, mapwd);
        if (maname != null) { // 이름이 null이 아니면 아이디 및 비밀번호 일치
            session.setAttribute("maid", maid);
            log.info("#login.do 아이디및 비밀번호 일치");

            return "redirect:store.do";
        } else {
            log.info("#login.do 아이디및 비밀번호 하지않음");
        }
        return null;
    }

}
