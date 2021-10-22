package last.project.store.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class CommentVo {
    private long coseq;
    private String cocontent;
    private long rseq;
    private String maid;
    private String scode;

}
