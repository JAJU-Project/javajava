package last.project.store.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import last.project.store.domain.BasketVo;
import last.project.store.domain.KakaoVo;
import last.project.store.domain.OrderListVo;
import last.project.store.domain.SalesVo;
import last.project.store.service.BasketService;
import last.project.store.service.KakaoLoginServiceAPI;
import last.project.store.service.KakaoService;
import last.project.store.service.OrderListService;
import last.project.store.service.SalesService;
import last.project.store.service.StoreService;
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
    private SalesService salesService;

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
    /*
     * @GetMapping("kakaoPay.do") public void kakaoPayGet() {
     * 
     * }
     */

    @RequestMapping("kakaoPay.do") // ????????????
    public String kakaoPay(HttpSession session, String ospot) { // basket.jsp?????? kid??? ?????????.
        log.info("kakaoPay post............................................");

        String kid = (String) session.getAttribute("email");
        log.info("#kakaoPay.do kid: " + kid);
        session.setAttribute("ospot", ospot);
        String scode = (String) session.getAttribute("scode"); // session?????? ?????? ?????? ????????????.
        log.info("#kakaoPay.do ospot: " + ospot);
        log.info("#kakaoPay.do kid: " + kid);
        log.info("#kakaoPay.do kid: " + kid.indexOf(","));

        if (kid.indexOf(",") != -1) { // ????????? ????????? ????????? ?????? ?????? ???????????? , ??? ???????????? ?????????. -1??? ??????????????? , ??? ??????????????? ???
            kid = kid.substring(0, kid.indexOf(",")); // ,??? ???????????? kid?????? ????????????.
        }

        List<BasketVo> blist = basketService.selectByKid(kid); // ?????? ????????? ?????? ???????????? ????????? ????????????.
        log.info("#kakaoPay.do blist: " + blist);
        log.info("#kakaoPay.do blist.size: " + blist.size());
        String mname = blist.get(0).getMname(); // ?????? ????????? ????????? ~~ ??? ~????????? ???????????? ?????? ???????????? ????????? ?????? ?????????.
        log.info("kakaoPay.do mname: " + mname);
        int[] bcount_list = new int[blist.size()]; // ?????? ?????? ??????
        int[] mprice_list = new int[blist.size()]; // ?????? ?????? ??????

        int bcount = 0; // ??????
        int mprice = 0; // ??????
        for (int i = 0; i < blist.size(); i++) {
            log.info("kakaoPay.do blist.get(" + i + ")" + blist.get(i));
            bcount_list[i] = blist.get(i).getBcount(); // ?????? ????????? ????????? ????????? ?????????.
            mprice_list[i] = blist.get(i).getMprice(); // ?????? ????????? ????????? ????????? ?????????.
            log.info("#kakoPay.do test[" + i + "]" + bcount_list[i]);
        }
        for (int i = 0; i < bcount_list.length; i++) {
            bcount += bcount_list[i]; // ?????? ??????????????? ????????? ?????? ??? ?????? ????????? ?????????.
        }
        for (int i = 0; i < mprice_list.length; i++) {
            mprice += mprice_list[i]; // ?????? ????????? ?????? ????????? ?????? ??? ?????? ????????? ?????????.
        }
        log.info("#kakaoPay.do bcount: " + bcount);
        log.info("#kakaoPay.do mprice: " + mprice);

        return "redirect:" + kakaoLoginServiceAPI.pay(mname, bcount, mprice); // ?????? ????????? ????????????.
    }

    @GetMapping("/kakaoPaySuccess") // ?????? ?????????.
    public String kakaoPaySuccess(@RequestParam("pg_token") String pg_token, Model model, HttpSession session) {
        // ????????????, ?????????, ????????????, ??????, ?????????, ?????? ??????, ?????? ??????, ?????? ??????, ?????????
        String kid = (String) session.getAttribute("email"); // ????????? ???????????? ?????????
        String scode = (String) session.getAttribute("scode"); // ?????? ?????? ???????????? ?????????
        String ospot = (String) session.getAttribute("ospot");
        session.removeAttribute("ospot");
        // log.info("test session: " + session.getAttribute("ospot"));
        String sname = storeService.selectByScode(scode); // ?????????
        log.info("#kakaoPaySuccess kid: " + kid + ", scode: " + scode + ", otspot:" + ospot);

        log.info("kakaoPaySuccess get............................................");
        log.info("kakaoPaySuccess pg_token : " + pg_token);

        List<BasketVo> blist = basketService.selectByKid(kid);
        log.info("#kakaoPaySuccess blist: " + blist);

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
            log.info("#kakaoPaySuccess mname(" + i + "): " + mname[i]);
            log.info("#kakaoPaySuccess bcount(" + i + "): " + bcount[i]);
            log.info("#kakaoPaySuccess mprice(" + i + "): " + mprice[i]);
        }

        OrderListVo orderListVo = new OrderListVo();

        orderListVo.setScode(scode);
        orderListVo.setKid(kid);
        orderListVo.setOspot(ospot);
        orderListVo.setSname(sname);
        orderListVo.setMname(mname);
        orderListVo.setOlcount(bcount);
        orderListVo.setMprice(mprice);
        // orderListVo.setOstate(1);
        long totalprice = 0l;
        switch (blist_size) {
        case 1:
            for (int i = 0; i < mprice.length; i++) {
                totalprice += mprice[i];
            }
            orderListVo.setMname1(mname[0]);
            orderListVo.setOlcount1(bcount[0]);
            orderListVo.setMprice1(mprice[0]);
            orderListVo.setTotalprice(totalprice);
            orderListService.insertBy1(orderListVo);
            log.info("???????????");
            break;
        case 2:
            for (int i = 0; i < mprice.length; i++) {
                totalprice += mprice[i];
            }
            orderListVo.setMname1(mname[0]);
            orderListVo.setOlcount1(bcount[0]);
            orderListVo.setMprice1(mprice[0]);
            orderListVo.setMname2(mname[1]);
            orderListVo.setOlcount2(bcount[1]);
            orderListVo.setMprice2(mprice[1]);
            orderListVo.setTotalprice(totalprice);
            orderListService.insertBy2(orderListVo);
            break;
        case 3:
            for (int i = 0; i < mprice.length; i++) {
                totalprice += mprice[i];
            }
            orderListVo.setMname1(mname[0]);
            orderListVo.setOlcount1(bcount[0]);
            orderListVo.setMprice1(mprice[0]);
            orderListVo.setMname2(mname[1]);
            orderListVo.setOlcount2(bcount[1]);
            orderListVo.setMprice2(mprice[1]);
            orderListVo.setMname3(mname[2]);
            orderListVo.setOlcount3(bcount[2]);
            orderListVo.setMprice3(mprice[2]);
            orderListVo.setTotalprice(totalprice);
            orderListService.insertBy3(orderListVo);
            break;
        case 4:
            for (int i = 0; i < mprice.length; i++) {
                totalprice += mprice[i];
            }
            orderListVo.setMname1(mname[0]);
            orderListVo.setOlcount1(bcount[0]);
            orderListVo.setMprice1(mprice[0]);
            orderListVo.setMname2(mname[1]);
            orderListVo.setOlcount2(bcount[1]);
            orderListVo.setMprice2(mprice[1]);
            orderListVo.setMname3(mname[2]);
            orderListVo.setOlcount3(bcount[2]);
            orderListVo.setMprice3(mprice[2]);
            orderListVo.setMname4(mname[3]);
            orderListVo.setOlcount4(bcount[3]);
            orderListVo.setMprice4(mprice[3]);
            orderListVo.setTotalprice(totalprice);
            orderListService.insertBy4(orderListVo);
            break;
        case 5:
            for (int i = 0; i < mprice.length; i++) {
                totalprice += mprice[i];
            }
            orderListVo.setMname1(mname[0]);
            orderListVo.setOlcount1(bcount[0]);
            orderListVo.setMprice1(mprice[0]);
            orderListVo.setMname2(mname[1]);
            orderListVo.setOlcount2(bcount[1]);
            orderListVo.setMprice2(mprice[1]);
            orderListVo.setMname3(mname[2]);
            orderListVo.setOlcount3(bcount[2]);
            orderListVo.setMprice3(mprice[2]);
            orderListVo.setMname4(mname[3]);
            orderListVo.setOlcount4(bcount[3]);
            orderListVo.setMprice4(mprice[3]);
            orderListVo.setMname5(mname[4]);
            orderListVo.setOlcount5(bcount[4]);
            orderListVo.setMprice5(mprice[4]);
            orderListVo.setTotalprice(totalprice);
            break;
        case 6:
            for (int i = 0; i < mprice.length; i++) {
                totalprice += mprice[i];
            }
            orderListVo.setMname1(mname[0]);
            orderListVo.setOlcount1(bcount[0]);
            orderListVo.setMprice1(mprice[0]);
            orderListVo.setMname2(mname[1]);
            orderListVo.setOlcount2(bcount[1]);
            orderListVo.setMprice2(mprice[1]);
            orderListVo.setMname3(mname[2]);
            orderListVo.setOlcount3(bcount[2]);
            orderListVo.setMprice3(mprice[2]);
            orderListVo.setMname4(mname[3]);
            orderListVo.setOlcount4(bcount[3]);
            orderListVo.setMprice4(mprice[3]);
            orderListVo.setMname5(mname[4]);
            orderListVo.setOlcount5(bcount[4]);
            orderListVo.setMprice5(mprice[4]);
            orderListVo.setMname6(mname[5]);
            orderListVo.setOlcount6(bcount[5]);
            orderListVo.setMprice6(mprice[5]);
            orderListVo.setTotalprice(totalprice);
            orderListService.insertBy6(orderListVo);
            break;
        case 7:
            for (int i = 0; i < mprice.length; i++) {
                totalprice += mprice[i];
            }
            orderListVo.setMname1(mname[0]);
            orderListVo.setOlcount1(bcount[0]);
            orderListVo.setMprice1(mprice[0]);
            orderListVo.setMname2(mname[1]);
            orderListVo.setOlcount2(bcount[1]);
            orderListVo.setMprice2(mprice[1]);
            orderListVo.setMname3(mname[2]);
            orderListVo.setOlcount3(bcount[2]);
            orderListVo.setMprice3(mprice[2]);
            orderListVo.setMname4(mname[3]);
            orderListVo.setOlcount4(bcount[3]);
            orderListVo.setMprice4(mprice[3]);
            orderListVo.setMname5(mname[4]);
            orderListVo.setOlcount5(bcount[4]);
            orderListVo.setMprice5(mprice[4]);
            orderListVo.setMname6(mname[5]);
            orderListVo.setOlcount6(bcount[5]);
            orderListVo.setMprice6(mprice[5]);
            orderListVo.setMname7(mname[6]);
            orderListVo.setOlcount7(bcount[6]);
            orderListVo.setMprice7(mprice[6]);
            orderListVo.setTotalprice(totalprice);
            orderListService.insertBy7(orderListVo);
            break;
        case 8:
            for (int i = 0; i < mprice.length; i++) {
                totalprice += mprice[i];
            }
            orderListVo.setMname1(mname[0]);
            orderListVo.setOlcount1(bcount[0]);
            orderListVo.setMprice1(mprice[0]);
            orderListVo.setMname2(mname[1]);
            orderListVo.setOlcount2(bcount[1]);
            orderListVo.setMprice2(mprice[1]);
            orderListVo.setMname3(mname[2]);
            orderListVo.setOlcount3(bcount[2]);
            orderListVo.setMprice3(mprice[2]);
            orderListVo.setMname4(mname[3]);
            orderListVo.setOlcount4(bcount[3]);
            orderListVo.setMprice4(mprice[3]);
            orderListVo.setMname5(mname[4]);
            orderListVo.setOlcount5(bcount[4]);
            orderListVo.setMprice5(mprice[4]);
            orderListVo.setMname6(mname[5]);
            orderListVo.setOlcount6(bcount[5]);
            orderListVo.setMprice6(mprice[5]);
            orderListVo.setMname7(mname[6]);
            orderListVo.setOlcount7(bcount[6]);
            orderListVo.setMprice7(mprice[6]);
            orderListVo.setMname8(mname[7]);
            orderListVo.setOlcount8(bcount[7]);
            orderListVo.setMprice8(mprice[7]);
            orderListVo.setTotalprice(totalprice);
            orderListService.insertBy8(orderListVo);
            break;
        case 9:
            for (int i = 0; i < mprice.length; i++) {
                totalprice += mprice[i];
            }
            orderListVo.setMname1(mname[0]);
            orderListVo.setOlcount1(bcount[0]);
            orderListVo.setMprice1(mprice[0]);
            orderListVo.setMname2(mname[1]);
            orderListVo.setOlcount2(bcount[1]);
            orderListVo.setMprice2(mprice[1]);
            orderListVo.setMname3(mname[2]);
            orderListVo.setOlcount3(bcount[2]);
            orderListVo.setMprice3(mprice[2]);
            orderListVo.setMname4(mname[3]);
            orderListVo.setOlcount4(bcount[3]);
            orderListVo.setMprice4(mprice[3]);
            orderListVo.setMname5(mname[4]);
            orderListVo.setOlcount5(bcount[4]);
            orderListVo.setMprice5(mprice[4]);
            orderListVo.setMname6(mname[5]);
            orderListVo.setOlcount6(bcount[5]);
            orderListVo.setMprice6(mprice[5]);
            orderListVo.setMname7(mname[6]);
            orderListVo.setOlcount7(bcount[6]);
            orderListVo.setMprice7(mprice[6]);
            orderListVo.setMname8(mname[7]);
            orderListVo.setOlcount8(bcount[7]);
            orderListVo.setMprice8(mprice[7]);
            orderListVo.setMname9(mname[8]);
            orderListVo.setOlcount9(bcount[8]);
            orderListVo.setMprice9(mprice[8]);
            orderListVo.setTotalprice(totalprice);
            orderListService.insertBy9(orderListVo);
            break;
        case 10:
            for (int i = 0; i < mprice.length; i++) {
                totalprice += mprice[i];
            }
            orderListVo.setMname1(mname[0]);
            orderListVo.setOlcount1(bcount[0]);
            orderListVo.setMprice1(mprice[0]);
            orderListVo.setMname2(mname[1]);
            orderListVo.setOlcount2(bcount[1]);
            orderListVo.setMprice2(mprice[1]);
            orderListVo.setMname3(mname[2]);
            orderListVo.setOlcount3(bcount[2]);
            orderListVo.setMprice3(mprice[2]);
            orderListVo.setMname4(mname[3]);
            orderListVo.setOlcount4(bcount[3]);
            orderListVo.setMprice4(mprice[3]);
            orderListVo.setMname5(mname[4]);
            orderListVo.setOlcount5(bcount[4]);
            orderListVo.setMprice5(mprice[4]);
            orderListVo.setMname6(mname[5]);
            orderListVo.setOlcount6(bcount[5]);
            orderListVo.setMprice6(mprice[5]);
            orderListVo.setMname7(mname[6]);
            orderListVo.setOlcount7(bcount[6]);
            orderListVo.setMprice7(mprice[6]);
            orderListVo.setMname8(mname[7]);
            orderListVo.setOlcount8(bcount[7]);
            orderListVo.setMprice8(mprice[7]);
            orderListVo.setMname9(mname[8]);
            orderListVo.setOlcount9(bcount[8]);
            orderListVo.setMprice9(mprice[8]);
            orderListVo.setMname10(mname[9]);
            orderListVo.setOlcount10(bcount[9]);
            orderListVo.setMprice10(mprice[9]);
            orderListVo.setTotalprice(totalprice);
            orderListService.insertBy10(orderListVo);
            break;
        default:
            break;
        }

        long[] sales_sacoin = new long[blist_size];
        int[] sales_sacount = new int[blist_size];
        long sacoin[] = new long[blist_size];
        int sacount[] = new int[blist_size];
        for (int i = 0; i < blist_size; i++) {
            sales_sacoin[i] = salesService.selectSacoin(scode, mname[i]);
            sales_sacount[i] = salesService.selectSacount(scode, mname[i]);
        }
        for (int i = 0; i < blist_size; i++) {
            sacoin[i] = sales_sacoin[i] + mprice[i];
            sacount[i] = sales_sacount[i] + bcount[i];
            log.info("#kakaoPaysuccess sales_sacoin[" + i + "]: " + sales_sacoin[i]);
            log.info("#kakaoPaysuccess sales_sacount[" + i + "]: " + sales_sacount[i]);
        }
        SalesVo salesVo = new SalesVo();
        for (int i = 0; i < blist_size; i++) {
            salesVo.setSacoin(sacoin[i]);
            salesVo.setSacount(sacount[i]);
            salesVo.setMname(mname[i]);
            salesVo.setScode(scode);
            salesService.updateBySales(salesVo);
        }

        basketService.deleteBykid(kid);
        return "redirect:client_category.do";

    }

}
