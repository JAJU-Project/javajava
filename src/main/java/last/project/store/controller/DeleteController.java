package last.project.store.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import last.project.store.service.CategoryService;
import last.project.store.service.MenuService;
import lombok.AllArgsConstructor;

@Controller
@AllArgsConstructor
public class DeleteController {

    private MenuService menuService;
    private CategoryService categoryService;

    @GetMapping("Menu_del")
    public String menu_Del(long mseq) {
        menuService.deleteByMseq(mseq);
        return "redirect:menu";
    }

    @GetMapping("catego_del")
    public String catego_det(String cname, HttpSession session) {
        String scode = (String) session.getAttribute("scode");
        categoryService.deleteByCname(scode, cname);
        return "redirect:menu";
    }
}
