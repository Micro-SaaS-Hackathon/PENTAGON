package az.company.saaslocalordersystemms.model.qr;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class QrDetails {

    private Long orderId;
    private String qrUrl;
}
