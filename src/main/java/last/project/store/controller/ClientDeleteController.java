package last.project.store.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import last.project.store.service.BasketService;
import lombok.AllArgsConstructor;
import lombok.extern.java.Log;

@AllArgsConstructor
@Log
@Controller
public class ClientDeleteController {

    private BasketService basketService;

    @GetMapping("basket_delete")
    public String basket_delete(HttpSession session) {
        String kid = (String) session.getAttribute("email");
        basketService.deleteBykid(kid);
        return "redirect:client_category.do";
    }

    @GetMapping("basket_deleteBybaseq")
    public String basket_deleteBybaseq(HttpSession session, long baseq) {
        HashMap<String, Object> map = new HashMap<String, Object>();
        String kid = (String) session.getAttribute("email");

        map.put("kid", kid);
        map.put("baseq", baseq);
        basketService.deleteBybaseq(map);
        return "redirect:client_category.do";
    }

}
