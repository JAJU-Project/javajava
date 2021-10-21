package last.project.store.service;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import last.project.store.filesetting.Path;
import lombok.extern.java.Log;

@Log
@Service
public class FileUploadServiceImpl implements FileUploadService {

    @Override
    public String saveStore(MultipartFile file) {
        String ofname = file.getOriginalFilename();
        int idx = ofname.lastIndexOf(".");
        String ofheader = ofname.substring(0, idx);
        String ext = ofname.substring(idx);

        long ms = System.currentTimeMillis();
        StringBuilder sb = new StringBuilder();
        sb.append(ofheader);
        sb.append("_");
        sb.append(ms);
        sb.append(ext);
        String saveFileName = sb.toString();
        boolean flag = writeFile(file, saveFileName);
        if (flag) {
            log.info("#업로드 성공");
        } else {
            log.info("#업로드 실패");
        }
        return saveFileName;
    }

    @Override
    public boolean writeFile(MultipartFile file, String saveFileName) {
        File rDir = new File(Path.STORE_IMG);
        if (!rDir.exists())
            rDir.mkdirs();
        FileOutputStream fos = null;
        try {
            byte data[] = file.getBytes();
            fos = new FileOutputStream(Path.STORE_IMG + saveFileName);
            fos.write(data);
            fos.flush();
            return true;
        } catch (Exception e) {
            return false;
        } finally {
            try {
                if (fos != null)
                    fos.close();
            } catch (IOException ie) {
            }
        }
    }

    @Override
    public String saveMenu(MultipartFile file) {
        String ofname = file.getOriginalFilename();
        int idx = ofname.lastIndexOf(".");
        String ofheader = ofname.substring(0, idx);
        String ext = ofname.substring(idx);

        long ms = System.currentTimeMillis();
        StringBuilder sb = new StringBuilder();
        sb.append(ofheader);
        sb.append("_");
        sb.append(ms);
        sb.append(ext);
        String saveFileName = sb.toString();
        boolean flag = menuFile(file, saveFileName);
        if (flag) {
            log.info("#업로드 성공");
        } else {
            log.info("#업로드 실패");
        }
        return saveFileName;
    }

    @Override
    public boolean menuFile(MultipartFile file, String saveFileName) {
        File rDir = new File(Path.MENU_IMG);
        if (!rDir.exists())
            rDir.mkdirs();
        FileOutputStream fos = null;
        try {
            byte data[] = file.getBytes();
            fos = new FileOutputStream(Path.MENU_IMG + saveFileName);
            fos.write(data);
            fos.flush();
            return true;
        } catch (Exception e) {
            return false;
        } finally {
            try {
                if (fos != null)
                    fos.close();
            } catch (IOException ie) {
            }
        }
    }

    @Override
    public String saveReview(MultipartFile file) {
        String ofname = file.getOriginalFilename();
        int idx = ofname.lastIndexOf(".");
        String ofheader = ofname.substring(0, idx);
        String ext = ofname.substring(idx);

        long ms = System.currentTimeMillis();
        StringBuilder sb = new StringBuilder();
        sb.append(ofheader);
        sb.append("_");
        sb.append(ms);
        sb.append(ext);
        String saveFileName = sb.toString();
        boolean flag = menuReview(file, saveFileName);
        if (flag) {
            log.info("#업로드 성공");
        } else {
            log.info("#업로드 실패");
        }
        return saveFileName;
    }

    @Override
    public boolean menuReview(MultipartFile file, String saveFileName) {
        File rDir = new File(Path.REVIEW_IMG);
        if (!rDir.exists())
            rDir.mkdirs();
        FileOutputStream fos = null;
        try {
            byte data[] = file.getBytes();
            fos = new FileOutputStream(Path.REVIEW_IMG + saveFileName);
            fos.write(data);
            fos.flush();
            return true;
        } catch (Exception e) {
            return false;
        } finally {
            try {
                if (fos != null)
                    fos.close();
            } catch (IOException ie) {
            }
        }
    }
}
