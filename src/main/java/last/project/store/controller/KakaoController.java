package last.project.store.controller;

import java.lang.reflect.Array;
import java.sql.Blob;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
/*
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
*/
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import last.project.store.domain.BasketVo;
import last.project.store.domain.KakaoVo;
import last.project.store.domain.OrderListVo;
import last.project.store.service.BasketService;
import last.project.store.service.KakaoLoginServiceAPI;
import last.project.store.service.KakaoService;
import last.project.store.service.OrderListService;
import last.project.store.service.StoreService;
//import last.project.store.service.OrderlistService;
import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.java.Log;

@Controller
@Log
@AllArgsConstructor
public class KakaoController {
    private KakaoService kakaoService;
    private BasketService basketService;
    private OrderListService orderListService;
    private StoreService storeService;

    @Setter(onMethod_ = @Autowired)
    private KakaoLoginServiceAPI kakaoLoginServiceAPI;

    @GetMapping("test.do")
    public String test(HttpSession session, String scode) {
        session.setAttribute("scode", scode);
        log.info("#test.do scode: " + scode);
        return "test";
    }

    @GetMapping("rdu.do")
    public String rdu(String code, HttpSession session) {
        String access_Token = kakaoLoginServiceAPI.getAccessToken(code);
        HashMap<String, Object> userInfo = kakaoLoginServiceAPI.getUserInfo(access_Token);
        log.info("#rdu.do session:" + session.getAttribute("scode"));
        log.info("#rdu.do access_Token:" + access_Token);
        log.info("#rdu.do userInfo:" + userInfo);
        log.info("#rdu.do age_range:" + userInfo.get("age_range"));
        if (userInfo.get("email") != null) {
            session.setAttribute("email", userInfo.get("email"));
            String kid = (String) session.getAttribute("email");
            String result = kakaoService.selectByKid(kid);

            if (result == null) {
                int kage = Integer.parseInt((String) userInfo.get("age_range"));
                KakaoVo kakaoVo = new KakaoVo();
                kakaoVo.setKid(kid);
                kakaoVo.setKage(kage);
                log.info("#rdu.do kage: " + kage);
                log.info("#rdu.do kakoVo.getKid: " + kakaoVo.getKid());
                log.info("#rdu.do kakoVo.getKage: " + kakaoVo.getKage());
                kakaoService.insertAll(kakaoVo);
            }
            log.info("#rdu.do kid:" + kid + ", result: " + result);
            session.setAttribute("nickname", userInfo.get("nickname"));
            session.setAttribute("access_Token", access_Token);
        }
        return "redirect:client_category.do";
    }

    @GetMapping("test2.do")
    public String test2(HttpSession session) {
        String access_Token = (String) session.getAttribute("access_Token");
        kakaoLoginServiceAPI.logout(access_Token);
        session.invalidate();
        return "redirect:/";
    }

    @GetMapping("kakaoPay.do")
    public void kakaoPayGet() {

    }

    @PostMapping("kakaoPay.do") // 결제하기
    public String kakaoPay(String kid, HttpSession session) { // basket.jsp에서 kid값 가져옴.
        log.info("kakaoPay post............................................");

        String scode = (String) session.getAttribute("scode"); // session에서 매장 코드 가져온다.
        log.info("#kakaoPay.do kid: " + kid);
        log.info("#kakaoPay.do kid: " + kid.indexOf(","));

        if (kid.indexOf(",") != -1) { // 고객이 음식을 하나만 구매 했을 경우에는 , 는 존재하지 않는다. -1이 아니라는건 , 가 존재한다는 뜻
            kid = kid.substring(0, kid.indexOf(",")); // ,를 기준으로 kid값만 가져온다.
        }

        List<BasketVo> blist = basketService.selectByKid(kid); // 해당 고객의 모든 장바구니 정보를 받아온다.
        log.info("#kakaoPay.do blist: " + blist);
        log.info("#kakaoPay.do blist.size: " + blist.size());
        String mname = blist.get(0).getMname(); // 결제 할때는 첫번째 ~~ 외 ~개수로 표시하기 위해 매뉴명의 첫번째 값만 가져옴.
        int[] bcount_list = new int[blist.size()]; // 수량 저장 공간
        int[] mprice_list = new int[blist.size()]; // 가격 저장 공간

        int bcount = 0; // 선초
        int mprice = 0; // 선초
        for (int i = 0; i < blist.size(); i++) {
            log.info("kakaoPay.do blist.get(" + i + ")" + blist.get(i));
            bcount_list[i] = blist.get(i).getBcount(); // 배열 공간에 각각의 수량을 넣는다.
            mprice_list[i] = blist.get(i).getMprice(); // 배열 공간에 각각의 가격을 넣는다.
            log.info("#kakoPay.do test[" + i + "]" + bcount_list[i]);
        }
        for (int i = 0; i < bcount_list.length; i++) {
            bcount += bcount_list[i]; // 배열 공간에있는 수량을 더해 총 주문 수량을 구한다.
        }
        for (int i = 0; i < mprice_list.length; i++) {
            mprice += mprice_list[i]; // 배열 공간에 있는 가겨을 더해 총 구문 가격을 구한다.
        }
        log.info("#kakaoPay.do bcount: " + bcount);
        log.info("#kakaoPay.do mprice: " + mprice);
        test(blist, bcount, mprice, kid, scode);
        return "redirect:" + kakaoLoginServiceAPI.pay(mname, bcount, mprice); // 결제 정보를 보내준다.
    }

    @GetMapping("/kakaoPaySuccess") // 결제 완료시.
    public void kakaoPaySuccess(@RequestParam("pg_token") String pg_token, Model model, HttpSession session) {
        // 매장코드, 메뉴명, 주문수량, 장소, 매장명, 메뉴 가격, 주문 상태, 주문 일시, 아이디
        String kid = (String) session.getAttribute("email"); // 아이디 세션에서 받아옴
        String scode = (String) session.getAttribute("scode"); // 매장 코드 세션에서 받아옴
        String otspot = "S";
        String sname = storeService.selectByScode(scode); // 매장명
        log.info("#kakaoPaySuccess kid: " + kid + ", scode: " + scode);

        log.info("kakaoPaySuccess get............................................");
        log.info("kakaoPaySuccess pg_token : " + pg_token);

        List<BasketVo> blist = basketService.selectByKid(kid);
        String[] mname = new String[blist.size()];
        int[] bcount = new int[blist.size()];
        long[] mprice = new long[blist.size()];
        int blist_size = blist.size();
        log.info("#kakaoPaySuccess blist_size: " + blist_size);

        for (int i = 0; i < blist.size(); i++) {
            log.info("#kakaoPaySuccdess blist(" + i + "): " + blist.get(i));
            mname[i] = blist.get(i).getMname();
            bcount[i] = blist.get(i).getBcount();
            mprice[i] = blist.get(i).getMprice();
        }
        for (int i = 0; i < mname.length; i++) {
            // log.info("#kakaoPaySuccess mname(" + i + "): " + mname[i]);
            log.info("#kakaoPaySuccess bcount(" + i + "): " + bcount[i]);
            log.info("#kakaoPaySuccess mprice(" + i + "): " + mprice[i]);
        }

        OrderListVo orderListVo = new OrderListVo();

        orderListVo.setMname(mname);
        log.info("#kakaoPaySuccess toString(): " + mname.toString());

        log.info("#kakaoPaySuccess getMname:" + orderListVo.getMname()[0]);

        for (int i = 0; i < blist_size; i++) {
            log.info("#kakaoPaySuccess getMnames:" + orderListVo.getMname()[i]);
        }

        // ordetestVo.setMname1(mname[0]);
        // ordetestVo.setMname2(mname[1]);
        // ordetestVo.setOtcount1(bcount[0]);
        // ordetestVo.setOtcount2(bcount[1]);
        orderListVo.setOlcount(bcount);
        orderListVo.setScode(scode);
        orderListVo.setKid(kid);
        orderListVo.setOspot(otspot);
        orderListVo.setSname(sname);
        // log.info("#kakaoPaySuccess setMname:" + ordetestVo.getMname()[0]);
        long sum = 0;
        orderListVo.setMprice(mprice);
        orderListVo.setOstate("1");

        log.info("#kakaoPaySuccess sum : " + sum);
        log.info("#kakaoPaySuccess getMname:" + orderListVo.getMname()[0]);
        log.info("#kakaoPaySuccess getMname:" + orderListVo.getMname()[1]);
        // ordeService.insertBy2(ordetestVo);
        orderListService.insertByTest(orderListVo);
        // basketService.deleteBykid(kid);
    }

    public void test(List<BasketVo> blist, int bcount, int mprice, String kid, String scode) {

        log.info("#testM blist: " + blist + ", kid: " + kid);
        log.info("#testM scode: " + scode);
        String[] mname = new String[blist.size()];
        String mname_sum = "";
        int[] olcount = new int[blist.size()];
        int[] mprice_sum = new int[blist.size()];

        for (int i = 0; i < blist.size(); i++) {
            log.info("#testM blist(" + i + ")" + blist.get(i));
            mname[i] = blist.get(i).getMname();
            olcount[i] = blist.get(i).getBcount();
            mprice_sum[i] = blist.get(i).getMprice();
        }
        for (int i = 0; i < mname.length; i++) {
            log.info("#testM mname[" + i + "]" + mname[i]);
            log.info("#testM olcount[" + i + "]" + olcount[i]);
            log.info("#testM mprice_sum[" + i + "]" + mprice_sum[i]);
            mname_sum += mname[i] + ",";
        }
        log.info("#test mname_sum:" + mname_sum);

    }
}
