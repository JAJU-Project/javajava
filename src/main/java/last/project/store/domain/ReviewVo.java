package last.project.store.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ReviewVo {
    private long rseq;
    private String rcontent;
    private String kid;
    private String scode;
    private String rtitle;
}
