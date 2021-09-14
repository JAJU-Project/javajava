package last.project.store.domain;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class OrderlistVo {
    private long qseq;
    private String scode;
    private String mname;
    private int olcount;
    private Date oldate;
    private String ospot;
    private String sname;
    private long mprice;
    private int ostate;
    private Date odate;
    private String kid;

}
