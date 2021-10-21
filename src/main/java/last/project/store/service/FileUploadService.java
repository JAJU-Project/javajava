package last.project.store.service;

import org.springframework.web.multipart.MultipartFile;

public interface FileUploadService {
    String saveStore(MultipartFile file);

    String saveMenu(MultipartFile file);

    String saveReview(MultipartFile file);

    boolean writeFile(MultipartFile file, String saveFileName);

    boolean menuFile(MultipartFile file, String saveFileName);

    boolean menuReview(MultipartFile file, String saveFileName);
}
