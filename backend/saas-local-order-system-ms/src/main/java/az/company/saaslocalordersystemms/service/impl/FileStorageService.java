package az.company.saaslocalordersystemms.service.impl;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

@Service
public class FileStorageService {

    private final String storageDir = "qr-images"; // Directory to save QR codes

    public FileStorageService() throws IOException {
        // Ensure directory exists
        Path path = Paths.get(storageDir);
        if (!Files.exists(path)) {
            Files.createDirectories(path);
        }
    }

    /**
     * Saves a MultipartFile to the storage directory.
     *
     * @param file     MultipartFile to save
     * @param fileName Desired file name
     * @return The absolute path of the saved file
     * @throws IOException if saving fails
     */
    public String saveFile(MultipartFile file, String fileName) throws IOException {
        Path filePath = Paths.get(storageDir, fileName);
        file.transferTo(filePath.toFile());
        return filePath.toAbsolutePath().toString();
    }
}

