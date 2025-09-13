package az.company.saaslocalordersystemms.exception;

import lombok.Getter;
import org.springframework.http.HttpStatus;

@Getter
public enum ExceptionEnum {

    // General Exceptions
    NOT_FOUND_EXCEPTION(DEFAULT_MESSAGES.NOT_FOUND, 1001, HttpStatus.NOT_FOUND),
    JSON_PROCESSING_EXCEPTION(DEFAULT_MESSAGES.JSON_PROCESSING, 1006, HttpStatus.SERVICE_UNAVAILABLE),
    METHOD_ARGUMENT_NOT_VALID_EXCEPTION(DEFAULT_MESSAGES.METHOD_ARGUMENT_NOT_VALID, 1002, HttpStatus.BAD_REQUEST),
    CONSTRAINT_VIOLATION_EXCEPTION(null, 1003, HttpStatus.BAD_REQUEST),
    ALREADY_EXIST_EXCEPTION(DEFAULT_MESSAGES.ALREADY_EXIST, 1004, HttpStatus.BAD_REQUEST),
    INVALID_API_KEY_EXCEPTION(DEFAULT_MESSAGES.INVALID_API_KEY, 1005, HttpStatus.UNAUTHORIZED),

    PRODUCT_NOT_FOUND_WITH_PROVIDED_ID_EXCEPTION(DEFAULT_MESSAGES.PRODUCT_NOT_FOUND_WITH_PROVIDED_ID, 1101, HttpStatus.NOT_FOUND),

    ;


    private final int exceptionCode;
    private final HttpStatus status;
    private final String defaultMessage;

    ExceptionEnum(String defaultMessage, int exceptionCode, HttpStatus status) {
        this.exceptionCode = exceptionCode;
        this.status = status;
        this.defaultMessage = defaultMessage;
    }

    private static class DEFAULT_MESSAGES {
        public static final String PRODUCT_NOT_FOUND_WITH_PROVIDED_ID = "Product not found with provided id";
        public static final String JSON_PROCESSING = "Json processing exception occured";
        private final static String NOT_FOUND = "Object couldn't find with provided argument";
        public static final String METHOD_ARGUMENT_NOT_VALID = "Argument not valid";
        public static final String ALREADY_EXIST = "Argument is already exist";
        public static final String INVALID_API_KEY = "Api key is not valid";


    }
}
