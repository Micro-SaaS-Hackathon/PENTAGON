package az.company.saaslocalordersystemms.logging;

import jakarta.servlet.http.HttpServletRequest;
import lombok.extern.slf4j.Slf4j;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.aspectj.lang.reflect.CodeSignature;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import java.util.Collections;
import java.util.Objects;
import java.util.stream.Collectors;

@Slf4j
@Aspect
@Configuration
public class LogInterceptor {

    @Pointcut("within(@org.springframework.web.bind.annotation.RestController *)")
    public void controller() {
    }

    @Before("controller()")
    public void logRequest(JoinPoint joinPoint) {
        ServletRequestAttributes attributes = (ServletRequestAttributes) RequestContextHolder.getRequestAttributes();
        if (Objects.isNull(attributes)) return;

        HttpServletRequest request = attributes.getRequest();
        log.info("Request URL: {} | {}", request.getMethod(), request.getRequestURI());
        log.info("Method: {}, {}", joinPoint.getSignature().getDeclaringTypeName(), joinPoint.getSignature().getName());
        log.info("Request Body: {}", getPayload(joinPoint));
        logHeaders(request);
    }

    @AfterReturning(pointcut = "controller()", returning = "response")
    public void logResponse(Object response) {
        log.info("Response: {}", response);
    }

    private void logHeaders(HttpServletRequest request) {
        log.info("Headers: {}", Collections.list(request.getHeaderNames()).stream()
                .collect(Collectors.toMap(headerName -> headerName, request::getHeader))
        );
    }

    private String getPayload(JoinPoint joinPoint) {
        CodeSignature signature = (CodeSignature) joinPoint.getSignature();
        StringBuilder builder = new StringBuilder();

        for (int i = 0; i < joinPoint.getArgs().length; i++) {
            String parameter = signature.getParameterNames()[i];
            Object value = joinPoint.getArgs()[i];
            builder.append(parameter).append(": ").
                    append(value != null ? value.toString() : "null")
                    .append("  ");
        }

        return builder.toString();
    }

}
