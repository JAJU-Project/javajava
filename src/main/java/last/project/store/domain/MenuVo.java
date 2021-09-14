package last.project.store.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class MenuVo {
    private String scode;
    private String cname;
    private String mname;
    private long mprice;
    private String mintro;
    private String mimage;
    private String msoldout;
}
