package last.project.store.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class SalesVo {
    private String scode;
    private String mname;
    private long sacoin;
    private int sacount;
}
