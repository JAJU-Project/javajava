package last.project.store.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ManagerVo {
    private String maid;
    private String maname;
    private String mapwd;
    private String maphone;
}
