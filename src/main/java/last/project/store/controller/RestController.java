package last.project.store.controller;

import java.lang.reflect.Array;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import last.project.store.domain.BasketVo;
import last.project.store.domain.CommentVo;
import last.project.store.domain.MenuVo;
import last.project.store.domain.OrderListVo;
import last.project.store.domain.SalesVo;
import last.project.store.service.BasketService;
import last.project.store.service.CommentService;
import last.project.store.service.KakaoService;
import last.project.store.service.MenuService;
import last.project.store.service.OrderListService;
import last.project.store.service.ReviewService;
import last.project.store.service.SalesService;
import lombok.AllArgsConstructor;
import lombok.extern.java.Log;

@Controller
@Log
@AllArgsConstructor
public class RestController {

    private MenuService menuService;
    private OrderListService orderListService;
    private SalesService salesService;
    private KakaoService kakaoService;
    private BasketService basketService;
    private CommentService commentService;
    private ReviewService reviewService;

    @RequestMapping("review_seq")
    @ResponseBody
    public List<HashMap<String, Object>> review_seq(long rseq, HttpSession session) {
        String scode = (String) session.getAttribute("scode");
        HashMap<String, Object> map = new HashMap<String, Object>();
        map.put("scode", scode);
        map.put("rseq", rseq);
        List<HashMap<String, Object>> maplist = reviewService.selectByJoin(map);

        log.info("#review_seq reseq: " + rseq);
        log.info("#review_seq maplist: " + maplist);
        return maplist;
    }

    @PostMapping("rest")
    @ResponseBody
    public List<HashMap<String, Object>> request(String catgo, HttpSession session) {
        String scode = (String) session.getAttribute("scode");
        HashMap<String, Object> map = new HashMap<String, Object>();
        map.put("scode", scode);
        map.put("caseq", Long.parseLong(catgo));
        List<HashMap<String, Object>> restMlist = menuService.selectByCname(map);
        log.info("#rest resMlist:" + restMlist);
        return restMlist;
    }

    @RequestMapping("paytest")
    @ResponseBody
    public void paytest(String ostate) {

        log.info("#paytest ostate: " + ostate);
    }

    @RequestMapping("selectcategory")
    @ResponseBody
    public List<MenuVo> selectcategory(Long mseq) {
        List<MenuVo> mlist = menuService.selectByMseq(mseq);
        log.info("mseq: " + mseq);
        return mlist;
    }

    @RequestMapping("test2")
    @ResponseBody
    public boolean test2() {
        /* 1. 작년 1월 매출 실적 부터... */

        return true;
    }

}