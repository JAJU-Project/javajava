package last.project.store.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;

import last.project.store.domain.ReviewVo;
import last.project.store.domain.ReviewimgVo;
import last.project.store.service.FileUploadService;
import last.project.store.service.ReviewService;
import last.project.store.service.ReviewimgService;
import lombok.AllArgsConstructor;
import lombok.extern.java.Log;

@Log
@Controller
@AllArgsConstructor
public class ClientInsertController {

    private FileUploadService fileUploadService;
    private ReviewService reviewService;
    private ReviewimgService reviewimgService;

    @PostMapping("review_in")
    public String review_in(String rtitle, String rcontent, MultipartFile file, HttpSession session) {
        ReviewVo reviewVo = new ReviewVo();
        ReviewimgVo reviewimgVo = new ReviewimgVo();

        String scode = (String) session.getAttribute("scode");
        String kid = (String) session.getAttribute("email");
        String ofname = file.getOriginalFilename();
        String rimg = "";

        if (ofname != null)
            ofname = ofname.trim();
        if (ofname.length() != 0) {
            rimg = fileUploadService.saveReview(file);
            log.info("#simg: " + rimg);
        }
        reviewVo.setKid(kid);
        reviewVo.setRcontent(rcontent);
        reviewVo.setRtitle(rtitle);
        reviewVo.setScode(scode);
        reviewService.insertAll(reviewVo);

        HashMap<String, Object> map = new HashMap<String, Object>();
        map.put("scode", scode);
        map.put("kid", kid);
        map.put("rtitle", rtitle);

        long rseq = reviewService.selectRseq(map);
        reviewimgVo.setRseq(rseq);
        reviewimgVo.setRimg("reviewimg/" + rimg);

        reviewimgService.insertAll(reviewimgVo);

        log.info("review_in rtitle: " + rtitle);
        log.info("review_in rcontent " + rcontent);
        log.info("file: " + file.getOriginalFilename());

        return "redirect:creview.do";
    }
}
