package az.company.saaslocalordersystemms.service;

import org.springframework.web.multipart.MultipartFile;

public interface QrService {

    MultipartFile generateQr(String text);
}
