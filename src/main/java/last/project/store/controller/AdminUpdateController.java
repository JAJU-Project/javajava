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
public class AdminUpdateController {
    private MenuService menuService;
    private CategoryService categoryService;

    @PostMapping("update_menu") // 메뉴 업데이트
    public String menuUpdate(MenuVo menuVo) {
        log.info("menuUpdate: menuVo" + menuVo);
        menuService.updateByMseq(menuVo);

        return "redirect:menu";
    }

    @PostMapping("categoUpdate") // 카테고리 업데이트
    public String categoUpdate(CategoryVo categoryVo) {
        categoryService.updateByCname(categoryVo);
        return null;
    }
}
