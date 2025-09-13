package az.company.saaslocalordersystemms.service.impl;

import az.company.saaslocalordersystemms.service.QrService;
import com.google.zxing.BarcodeFormat;
import com.google.zxing.EncodeHintType;
import com.google.zxing.common.BitMatrix;
import com.google.zxing.qrcode.QRCodeWriter;
import jakarta.transaction.Transactional;
import lombok.RequiredArgsConstructor;
import lombok.SneakyThrows;
import org.springframework.core.io.Resource;
import org.springframework.stereotype.Service;

import javax.imageio.ImageIO;
import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

@Service
@RequiredArgsConstructor
public class QrServiceImpl implements QrService {

    private final FileStorageService fileStorageService;

    private static final DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyyMMdd_HHmmss_SSS");

    /**
     * Generates a unique file name with optional prefix and extension.
     * Example: "qr_20250913_164501_123_abcd1234.png"
     */
    public static String generateFileName(String prefix, String extension) {
        String timestamp = LocalDateTime.now().format(formatter);
        String uuid = UUID.randomUUID().toString().substring(0, 8); // short UUID
        return String.format("%s_%s_%s.%s", prefix, timestamp, uuid, extension);
    }

    @SneakyThrows
    @Transactional
    public String generateQr(String text) {
        int width = 300;
        int height = 300;

        Map<EncodeHintType, Object> hints = new HashMap<>();
        hints.put(EncodeHintType.CHARACTER_SET, "UTF-8");

        QRCodeWriter qrCodeWriter = new QRCodeWriter();
        BitMatrix bitMatrix = qrCodeWriter.encode(text, BarcodeFormat.QR_CODE, width, height, hints);

        BufferedImage qrImage = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
        for (int x = 0; x < width; x++) {
            for (int y = 0; y < height; y++) {
                qrImage.setRGB(x, y, bitMatrix.get(x, y) ? 0xFF000000 : 0xFFFFFFFF);
            }
        }

        ByteArrayOutputStream baos = new ByteArrayOutputStream();
        ImageIO.write(qrImage, "png", baos);
        baos.flush();

        String fileName = generateFileName("qr", "png");
        return fileStorageService.saveFile(baos.toByteArray(), fileName); // Save and return path
    }

    @Override
    @SneakyThrows
    public Resource getQrWithPath(String qrPath) {
        return fileStorageService.getFileAsResource(qrPath);
    }
}
