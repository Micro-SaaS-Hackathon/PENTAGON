package az.company.saaslocalordersystemms.exception;

import lombok.Getter;
import org.springframework.http.HttpStatus;

import java.util.HashMap;

@Getter
public class CommonException extends RuntimeException {

    private final int exceptionCode;
    private final HttpStatus status;
    private final String message;
    private HashMap<String, String> params;

    public CommonException(ExceptionEnum exceptionEnum, String message, HashMap<String, String> params) {
        this.exceptionCode = exceptionEnum.getExceptionCode();
        this.status = exceptionEnum.getStatus();
        this.message = message;
        this.params = params;
    }

    public CommonException(ExceptionEnum exceptionEnum, String message) {
        this.exceptionCode = exceptionEnum.getExceptionCode();
        this.status = exceptionEnum.getStatus();
        this.message = message;
        this.params = null;
    }

    public CommonException(ExceptionEnum exceptionEnum) {
        this.exceptionCode = exceptionEnum.getExceptionCode();
        this.status = exceptionEnum.getStatus();
        this.message = exceptionEnum.getDefaultMessage();
    }

    public CommonException(ExceptionEnum exceptionEnum, HashMap<String, String> params) {
        this.exceptionCode = exceptionEnum.getExceptionCode();
        this.status = exceptionEnum.getStatus();
        this.message = exceptionEnum.getDefaultMessage();
        this.params = params;
    }
}
