package az.company.saaslocalordersystemms.service;

import org.springframework.core.io.Resource;

public interface QrService {

    String generateQr(String text);

    Resource getQrWithPath(String qrPath);
}
