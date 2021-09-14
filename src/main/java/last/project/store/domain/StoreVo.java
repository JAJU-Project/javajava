package last.project.store.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class StoreVo {
    private String scode; // 매장 코드
    private String sname; // 매장 이름
    private String sintro; // 매장 소개
    private String sphone; // 매장 번호
    private String maid; // 관리자 아이디
}
