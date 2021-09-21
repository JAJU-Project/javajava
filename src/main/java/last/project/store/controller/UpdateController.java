package last.project.store.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.AllArgsConstructor;
import lombok.extern.java.Log;

@Controller
@Log
@AllArgsConstructor
public class UpdateController { // 수정 부분

    @GetMapping("menuUpdate.do")
    public String menuUpdate(long seq) {
        log.info("menuUpdate");
        return null;
    }

}
