package last.project.store.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ClientRedirectController {

    @GetMapping("creview.do") // 리뷰보기 클릭
    public String creview() {
        return "client/creview";
    }

    @GetMapping("reviewrite.do") // 리뷰작성 클릭
    public String reviewrite() {
        return "client/reviewrite";
    }
    @GetMapping("order.do")
    public String order(){
        return "client/order";
    }
}
