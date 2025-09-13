package az.company.saaslocalordersystemms.exception;

import jakarta.validation.ConstraintViolationException;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;

import java.util.HashMap;

@RestControllerAdvice
@Slf4j
public class ErrorHandler {

    @ExceptionHandler(CommonException.class)
    public ResponseEntity<CommonExceptionResponse> handleCommonException(CommonException commonException) {
        log.error(commonException.getLocalizedMessage());
        return new ResponseEntity<>(new CommonExceptionResponse(commonException), commonException.getStatus());
    }

    @ExceptionHandler(ConstraintViolationException.class)
    public ResponseEntity<CommonExceptionResponse> handleConstrainViolationException(ConstraintViolationException exception) {
        log.error(exception.getLocalizedMessage());
        CommonException commonException = new CommonException(ExceptionEnum.CONSTRAINT_VIOLATION_EXCEPTION, exception.getMessage(), null);
        return typeOf(commonException);
    }

    @ExceptionHandler(MethodArgumentNotValidException.class)
    public ResponseEntity<CommonExceptionResponse> handleMethodArgumentNotValidException(MethodArgumentNotValidException methodArgEx) {
        log.error(methodArgEx.getLocalizedMessage());
        HashMap<String, String> params = new HashMap<>();
        for (FieldError fieldError : methodArgEx.getBindingResult().getFieldErrors()) {
            params.put(fieldError.getField(), fieldError.getDefaultMessage());
            System.out.println(fieldError.getField() + fieldError.getDefaultMessage());
        }

        CommonException commonException = new CommonException(ExceptionEnum.METHOD_ARGUMENT_NOT_VALID_EXCEPTION, params);
        return typeOf(commonException);
    }


    private ResponseEntity<CommonExceptionResponse> typeOf(CommonException commonException){
        return new ResponseEntity<>(new CommonExceptionResponse(commonException), commonException.getStatus());
    }
}
