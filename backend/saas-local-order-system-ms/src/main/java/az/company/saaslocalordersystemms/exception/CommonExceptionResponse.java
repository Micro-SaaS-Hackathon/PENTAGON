package az.company.saaslocalordersystemms.exception;

import lombok.Getter;
import lombok.Setter;

import java.util.HashMap;

@Getter
@Setter
public class CommonExceptionResponse {
    private int exceptionCode;
    private int status;
    private String message;
    private HashMap<String, String> params;

    public CommonExceptionResponse(CommonException commonException) {
        this.exceptionCode = commonException.getExceptionCode();
        this.status = commonException.getStatus().value();
        this.message = commonException.getMessage();
        this.params = commonException.getParams();
    }
}
