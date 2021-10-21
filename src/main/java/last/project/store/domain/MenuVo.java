package last.project.store.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class MenuVo {
    private long mseq;
    private String scode;
    private long caseq;
    private String mname;
    private long mprice;
    private String mintro;
    private String msoldout;
}
