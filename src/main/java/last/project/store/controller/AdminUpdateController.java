package last.project.store.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import last.project.store.domain.CategoryVo;
import last.project.store.domain.MenuVo;
import last.project.store.service.CategoryService;
import last.project.store.service.MenuService;
import last.project.store.service.OrderListService;
import lombok.AllArgsConstructor;
import lombok.extern.java.Log;

@Controller
@Log
@AllArgsConstructor
public class AdminUpdateController {
    private MenuService menuService;
    private CategoryService categoryService;
    private OrderListService orderListService;

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

    @RequestMapping("receipt") // 주문 접수
    public String in(long oseq) {
        orderListService.updateByOseq(oseq);
        log.info("#receipt oseq: " + oseq);
        return "redirect:empty";
    }

    @RequestMapping("cancel") // 주문 취소
    public String cancel(long oseq) {
        orderListService.updateCancel(oseq);
        log.info("#cancel oseq: " + oseq);
        return "redirect:empty";
    }

    @RequestMapping("completion") // 조리 완료
    public String completion(long oseq) { // 3으로
        orderListService.updateCompletion(oseq);
        log.info("#completion");
        return "redirect:empty";
    }
}
