package last.project.store.domain;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class AddressVo {
    private int seq;
    private String name;
    private String addr;
    private Date rdate;
}
