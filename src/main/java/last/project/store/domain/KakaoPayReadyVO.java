package last.project.store.domain;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class KakaoPayReadyVO {

    // response
    private String tid, next_redirect_pc_url;
    private Date created_at;

}
