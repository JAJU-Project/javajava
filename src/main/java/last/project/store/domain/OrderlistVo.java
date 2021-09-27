package last.project.store.domain;

import java.sql.Date;
import java.time.LocalDate;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class OrderListVo {

    private long oseq;
    private String scode;
    private String mname[];
    private String mname1;
    private String mname2;
    private String mname3;
    private String mname4;
    private String mname5;
    private String mname6;
    private String mname7;
    private String mname8;
    private String mname9;
    private String mname10;
    private int olcount[];
    private int olcount1;
    private int olcount2;
    private int olcount3;
    private int olcount4;
    private int olcount5;
    private int olcount6;
    private int olcount7;
    private int olcount8;
    private int olcount9;
    private int olcount10;
    private Date oldate;
    private String ospot;
    private String sname;
    private long mprice[];
    private long mprice1;
    private long mprice2;
    private long mprice3;
    private long mprice4;
    private long mprice5;
    private long mprice6;
    private long mprice7;
    private long mprice8;
    private long mprice9;
    private long mprice10;
    private String ostate;
    private String kid;

}
