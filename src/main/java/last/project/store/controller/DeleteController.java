package last.project.store.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import last.project.store.service.MenuService;
import lombok.AllArgsConstructor;

@Controller
@AllArgsConstructor
public class DeleteController {
    private MenuService menuService;

    @GetMapping("Menu_del")
    public String Menu_Del(long mseq) {
        menuService.deleteByMseq(mseq);
        return "redirect:menu";
    }
}
