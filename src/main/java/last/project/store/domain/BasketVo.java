package last.project.store.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class BasketVo {
    private String mname;
    private int bcount;
    private int mprice;
    private String kid;
    private long baseq;
}
