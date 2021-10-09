package last.project.store.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;

import last.project.store.domain.CategoryVo;
import last.project.store.domain.MenuVo;
import last.project.store.service.CategoryService;
import last.project.store.service.MenuService;
import lombok.AllArgsConstructor;
import lombok.extern.java.Log;

@Controller
@Log
@AllArgsConstructor
public class UpdateController { // 수정 부분

    private MenuService menuService;
    private CategoryService categoryService;

    @PostMapping("update_menu")
    public String menuUpdate(MenuVo menuVo) {
        // long mprice = menuVo.getMprice();
        // menuVo.setMprice(mprice);
        log.info("menuUpdate: menuVo" + menuVo);
        menuService.updateByMseq(menuVo);

        return "redirect:menu";
    }

    @PostMapping("categoUpdate")
    public String categoUpdate(CategoryVo categoryVo) {
        categoryService.updateByCname(categoryVo);
        return null;
    }

}
