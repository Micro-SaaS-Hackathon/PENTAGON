package az.company.saaslocalordersystemms.service.impl;

import org.springframework.core.io.ByteArrayResource;
import org.springframework.core.io.Resource;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.io.OutputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

@Service
public class FileStorageService {

    // Base folder where all QR images will be saved
    private final String storageDir = "qr-images"; // can be externalized via application.properties

    /**
     * Save byte array as file inside storageDir and return relative path
     */
    public String saveFile(byte[] data, String fileName) throws IOException {
        Path filePath = Paths.get(storageDir, fileName);
        Files.createDirectories(filePath.getParent()); // ensure directory exists
        try (OutputStream os = Files.newOutputStream(filePath)) {
            os.write(data);
        }
        // Return only relative path
        return fileName;
    }

    /**
     * Save MultipartFile as file inside storageDir and return relative path
     */
    public String saveFile(MultipartFile file, String fileName) throws IOException {
        return saveFile(file.getBytes(), fileName);
    }

    /**
     * Get file as byte array by relative path
     */
    public byte[] getFileAsBytes(String fileName) throws IOException {
        Path filePath = Paths.get(storageDir, fileName);
        if (!Files.exists(filePath)) {
            throw new IOException("File not found: " + fileName);
        }
        return Files.readAllBytes(filePath);
    }

    /**
     * Get file as Spring Resource (for sending in HTTP response)
     */
    public Resource getFileAsResource(String fileName) throws IOException {
        byte[] data = getFileAsBytes(fileName);
        return new ByteArrayResource(data);
    }

    /**
     * Generate a unique file name with prefix and extension
     * Example: qr_20250913_183744_052_54ee1c6f.png
     */
    public static String generateFileName(String prefix, String extension) {
        String timestamp = java.time.LocalDateTime.now()
                .format(java.time.format.DateTimeFormatter.ofPattern("yyyyMMdd_HHmmss_SSS"));
        String uuid = java.util.UUID.randomUUID().toString().substring(0, 8);
        return String.format("%s_%s_%s.%s", prefix, timestamp, uuid, extension);
    }
}
